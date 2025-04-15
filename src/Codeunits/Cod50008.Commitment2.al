namespace ALProjectLIWPA.ALProjectLIWPA;
using Microsoft.Purchases.Document;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Purchases.History;
using Microsoft.Finance.Dimension;
using Microsoft.Sales.Customer;
using Microsoft.Purchases.Vendor;
using Microsoft.FixedAssets.FixedAsset;
using Microsoft.Inventory.Item;
codeunit 50008 "Committment2"
{

    trigger OnRun()
    begin
    end;

    var
        UncommittmentDate: Date;
        Text000: label 'The imprest is not fully approved';
        Text001: label 'Please insert the imprest date';
        Text002: label 'Line No %1 has been commited';
        Text003: label 'You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4';
        Text004: label 'Items Committed Successfully and the balance is %1';
        Text005: label 'Payment Voucher No %1 has been successfully created';
        Text006: label 'Petty Cash No %1 has been successfully created';
        Text007: label 'Please insert the petty cash date';


    procedure LPOCommittment(var PurchHeader: Record "Purchase Header")
    var
        PurchaseLines: Record "Purchase Line";
        Committments: Record "Committment Entries";
        Item: Record Item;
        GLAccount: Record "G/L Account";
        FixedAsset: Record "Fixed Asset";
        EntryNo: Integer;
        InventoryPostingSetup: Record "Inventory Posting Setup";
        FixedAssetPG: Record "FA Posting Group";
        GenLedSetup: Record "General Ledger Setup";
        InventoryAccount: Code[20];
        AcquisitionAccount: Code[20];
        BudgetAmount: Decimal;
        Expenses: Decimal;
        BudgetAvailable: Decimal;
        CommitmentEntries: Record "Committment Entries";
        CommittedAmount: Decimal;
        Vendor: Record Vendor;
        CashMgt: Record "Cash Management Setup";
    begin

        PurchaseLines.Reset;
        PurchaseLines.SetRange(PurchaseLines."Document No.", PurchHeader."No.");
        PurchaseLines.SetRange(PurchaseLines."Document Type", PurchaseLines."document type"::Order);
        if PurchaseLines.FindFirst then begin
            if Committments.FindLast then
                EntryNo := Committments."Entry No";
            repeat
                Committments.Init;
                Committments."Commitment No" := PurchHeader."No.";
                Committments."Commitment Type" := Committments."commitment type"::Committed;
                PurchHeader.Validate("Order Date");
                if PurchHeader."Order Date" = 0D then
                    Error('Please enter the order date');
                Committments."Commitment Date" := PurchHeader."Order Date";
                Committments."Global Dimension 1" := PurchaseLines."Shortcut Dimension 1 Code";
                Committments."Global Dimension 2" := PurchaseLines."Shortcut Dimension 2 Code";
                //Case of G/L Account,Item,Fixed Asset
                case PurchaseLines.Type of
                    PurchaseLines.Type::Item:
                        begin
                            Item.Reset;
                            if Item.Get(PurchaseLines."No.") then
                                if Item."Inventory Posting Group" = '' then
                                    Error('Assign Posting Group to Item No %1', Item."No.");
                            InventoryPostingSetup.Get(PurchaseLines."Location Code", Item."Inventory Posting Group");
                            InventoryAccount := InventoryPostingSetup."Inventory Account";
                            Committments.Account := InventoryAccount;
                        end;
                    PurchaseLines.Type::"G/L Account":
                        begin
                            Committments.Account := PurchaseLines."No.";
                        end;
                    PurchaseLines.Type::"Fixed Asset":
                        begin
                            if FixedAssetPG.Get(PurchaseLines."Posting Group") then begin
                                FixedAssetPG.TestField("Acquisition Cost Account");
                                AcquisitionAccount := FixedAssetPG."Acquisition Cost Account";
                                Committments.Account := AcquisitionAccount;
                            end;
                        end;
                end;
                Committments."Committed Amount" := PurchaseLines."Line Amount";
                //Confirm the Amount to be issued does not exceed the budget and amount Committed
                //Get Budget for the G/L
                CashMgt.Get;
                GLAccount.SetFilter(GLAccount."Budget Filter", CashMgt."Current Budget");
                case PurchaseLines.Type of
                    PurchaseLines.Type::Item:
                        begin
                            GLAccount.SetRange(GLAccount."No.", InventoryAccount);
                        end;
                    PurchaseLines.Type::"G/L Account":
                        begin
                            GLAccount.SetRange(GLAccount."No.", PurchaseLines."No.");
                        end;
                    PurchaseLines.Type::"Fixed Asset":
                        GLAccount.SetRange(GLAccount."No.", AcquisitionAccount);
                end;

                GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                //Get budget amount avaliable
                GLAccount.SetRange(GLAccount."Date Filter", CashMgt."Current Budget Start Date", PurchHeader."Order Date");
                if GLAccount.Find('-') then begin
                    GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                    BudgetAmount := GLAccount."Budgeted Amount";
                    Expenses := GLAccount."Net Change";
                    BudgetAvailable := GLAccount."Budgeted Amount" - GLAccount."Net Change";
                end;
                //Get committed Amount
                CommittedAmount := 0;
                CommitmentEntries.Reset;
                CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
                if PurchaseLines.Type = PurchaseLines.Type::Item then
                    CommitmentEntries.SetRange(CommitmentEntries.Account, InventoryAccount);
                if PurchaseLines.Type = PurchaseLines.Type::"G/L Account" then
                    CommitmentEntries.SetRange(CommitmentEntries.Account, PurchaseLines."No.");
                if PurchaseLines.Type = PurchaseLines.Type::"Fixed Asset" then
                    CommitmentEntries.SetRange(CommitmentEntries.Account, AcquisitionAccount);
                CommitmentEntries.SetRange(CommitmentEntries."Commitment Date", CashMgt."Current Budget Start Date",
                                           PurchHeader."Order Date");
                CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
                CommittedAmount := CommitmentEntries."Committed Amount";
                if LineCommitted(PurchHeader."No.", PurchaseLines."No.", PurchaseLines."Line No.") then
                    Message('Line No %1 has been commited', PurchaseLines."Line No.")
                else

                    if CommittedAmount + PurchaseLines."Line Amount" > BudgetAvailable then
                        Error('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
                        , Committments.Account,
                        Abs(BudgetAvailable - (CommittedAmount + PurchaseLines."Line Amount")), BudgetAvailable, CommittedAmount);

                Committments.User := UserId;
                Committments."Document No" := PurchHeader."No.";
                Committments.No := PurchaseLines."No.";
                Committments."Line No." := PurchaseLines."Line No.";
                Committments."Account Type" := Committments."account type"::Vendor;
                Committments."Account No." := PurchaseLines."Buy-from Vendor No.";
                if Vendor.Get(PurchaseLines."Buy-from Vendor No.") then
                    Committments."Account Name" := Vendor.Name;
                Committments.Description := PurchaseLines.Description;

                //Check whether line is committed.
                if not LineCommitted(PurchHeader."No.", PurchaseLines."No.", PurchaseLines."Line No.") then begin
                    EntryNo := EntryNo + 1;
                    Committments."Entry No" := EntryNo;
                    Committments.Insert;
                    //PurchaseLines.Committed:=TRUE;
                    PurchaseLines.Modify;
                end;
            until PurchaseLines.Next = 0;
        end;
        Message('Items Committed Successfully and the balance is %1',
        Abs(BudgetAvailable - (CommittedAmount + PurchaseLines."Line Amount")));
    end;


    procedure LineCommitted(var CommittmentNo: Code[20]; var No: Code[20]; var LineNo: Integer) Exists: Boolean
    var
        Committed: Record "Committment Entries";
    begin
        Exists := false;
        Committed.Reset;
        Committed.SetRange(Committed."Commitment No", CommittmentNo);
        Committed.SetRange(Committed.No, No);
        Committed.SetRange(Committed."Line No.", LineNo);
        if Committed.Find('-') then
            Exists := true;
    end;


    procedure ImprestCommittment(var ImprestHeader: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        Committments: Record "Committment Entries";
        EntryNo: Integer;
        BudgetAmount: Decimal;
        Expenses: Decimal;
        BudgetAvailable: Decimal;
        CommittedAmount: Decimal;
        CommitmentEntries: Record "Committment Entries";
        GenLedSetup: Record "General Ledger Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        CashMgt: Record "Cash Management Setup";
    begin

        if ImprestHeader.Status <> ImprestHeader.Status::Released then
            Error(Text000);
        ImprestLines.SetRange(ImprestLines.No, ImprestHeader."No.");
        if ImprestLines.FindFirst then begin
            if Committments.FindLast then
                EntryNo := Committments."Entry No";
            repeat
                Committments.Init;
                Committments."Commitment No" := ImprestHeader."No.";
                Committments."Commitment Type" := Committments."commitment type"::Committed;
                ImprestHeader.TestField(Date);
                Committments."Commitment Date" := ImprestHeader.Date;
                Committments."Global Dimension 1" := ImprestLines."Global Dimension 1 Code";
                Committments."Global Dimension 2" := ImprestLines."Global Dimension 2 Code";
                Committments.Account := ImprestLines."Account No.";
                Committments."Committed Amount" := ImprestLines.Amount;

                //Confirm the Amount to be issued does not exceed the budget and amount Committed
                //Get Budget for the G/L
                CashMgt.Get;
                GLAccount.SetFilter(GLAccount."Budget Filter", CashMgt."Current Budget");
                GLAccount.SetRange(GLAccount."No.", ImprestLines."Account No.");
                //Get budget amount avaliable
                GLAccount.SetRange(GLAccount."Date Filter", CashMgt."Current Budget Start Date", ImprestHeader.Date);
                if GLAccount.Find('-') then begin
                    GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                    BudgetAmount := GLAccount."Budgeted Amount";
                    Expenses := GLAccount."Net Change";
                    BudgetAvailable := GLAccount."Budgeted Amount" - GLAccount."Net Change";
                end;
                //Get committed Amount
                CommittedAmount := 0;
                CommitmentEntries.Reset;
                CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
                CommitmentEntries.SetRange(CommitmentEntries.Account, ImprestLines."Account No.");
                if ImprestHeader.Date = 0D then
                    Error(Text001);
                CommitmentEntries.SetRange(CommitmentEntries."Commitment Date", CashMgt."Current Budget Start Date",
                                           ImprestHeader.Date);
                CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
                CommittedAmount := CommitmentEntries."Committed Amount";
                if LineCommitted(ImprestHeader."No.", ImprestLines."Account No.", ImprestLines."Line No") then
                    Message(Text002, ImprestLines."Line No")
                else begin
                    CashMgt.Get;
                    if CashMgt."Check for Committment" then
                        if CommittedAmount + ImprestLines.Amount > BudgetAvailable then
                            Error(Text003
                           , Committments.Account,
                            Abs(BudgetAvailable - (CommittedAmount + ImprestLines.Amount)), BudgetAvailable, CommittedAmount);
                end;
                Committments.User := UserId;
                Committments."Document No" := ImprestHeader."No.";
                Committments.No := ImprestLines."Account No.";
                Committments."Line No." := ImprestLines."Line No";
                Committments."Account Type" := Committments."account type"::Customer;
                Committments."Account No." := ImprestHeader."Account No.";
                if Customer.Get(ImprestHeader."Account No.") then
                    Committments."Account Name" := Customer.Name;
                CommitmentEntries.Description := ImprestLines.Description;
                //Check whether line is committed.
                if not LineCommitted(ImprestHeader."No.", ImprestLines."Account No.", ImprestLines."Line No") then begin
                    EntryNo := EntryNo + 1;
                    Committments."Entry No" := EntryNo;
                    Committments.Insert;
                    ImprestLines.Committed := true;
                    ImprestLines.Modify;
                end;
            until ImprestLines.Next = 0;
        end;
        Message(Text004,
        Abs(BudgetAvailable - (CommittedAmount + ImprestLines.Amount)));
        CreatePV(ImprestHeader);
    end;


    procedure ReverseLPOCommittment(var PurchHeader: Record "Purchase Header")
    var
        Committment: Record "Committment Entries";
        PurchLine: Record "Purchase Line";
        EntryNo: Integer;
        Item: Record Item;
        InventoryPostingSetup: Record "Inventory Posting Setup";
        FixedAssetPG: Record "FA Posting Group";
        GenLedSetup: Record "General Ledger Setup";
        InventoryAccount: Code[20];
        AcquisitionAccount: Code[20];
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
    begin
        if Confirm('Are you sure you want to reverse the committed entries for Order no ' + PurchHeader."No." + '?', false) = true then begin
            Committment.Reset;
            Committment.SetRange(Committment."Commitment No", PurchHeader."No.");
            if Committment.Find('-') then begin
                Committment.DeleteAll;
            end;
            PurchLine.Reset;
            PurchLine.SetRange(PurchLine."Document Type", PurchLine."document type"::Order);
            PurchLine.SetRange(PurchLine."Document No.", PurchHeader."No.");
            if PurchLine.FindFirst then begin
                repeat

                    //Insert Reversal entries in the committment entries table
                    if Committment.Find('+') then
                        EntryNo := Committment."Entry No";
                    EntryNo := EntryNo + 1;
                    if LineCommitted(PurchHeader."No.", PurchLine."No.", PurchLine."Line No.") then begin
                        Committment.Init;
                        Committment."Entry No" := EntryNo;
                        Committment."Commitment No" := PurchHeader."No.";
                        Committment."Commitment Type" := Committment."commitment type"::Reversal;
                        Committment."Commitment Date" := PurchLine."Order Date";
                        //Dimensions
                        Committment."Global Dimension 1" := PurchLine."Shortcut Dimension 1 Code";
                        Committment."Global Dimension 2" := PurchLine."Shortcut Dimension 2 Code";
                        //Dimensions
                        //Case of G/L Account,Item,Fixed Asset
                        case PurchLine.Type of
                            PurchLine.Type::Item:
                                begin
                                    Item.Reset;
                                    if Item.Get(PurchLine."No.") then
                                        if Item."Inventory Posting Group" = '' then
                                            Error('Assign Posting Group to Item No %1', Item."No.");
                                    InventoryPostingSetup.Get(PurchLine."Location Code", Item."Inventory Posting Group");
                                    InventoryAccount := InventoryPostingSetup."Inventory Account";
                                    Committment.Account := InventoryAccount;
                                end;
                            PurchLine.Type::"G/L Account":
                                begin
                                    Committment.Account := PurchLine."No.";
                                end;
                            PurchLine.Type::"Fixed Asset":
                                begin
                                    FixedAsset.Reset;
                                    FixedAsset.Get(PurchLine."No.");
                                    FixedAssetPG.Get(FixedAsset."FA Posting Group");
                                    AcquisitionAccount := FixedAssetPG."Acquisition Cost Account";
                                    Committment.Account := AcquisitionAccount;
                                end;
                        end;
                        Committment."Committed Amount" := -PurchLine."Line Amount";

                        Committment.User := UserId;
                        Committment."Document No" := PurchHeader."No.";
                        Committment.No := PurchLine."No.";
                        Committment."Account Type" := Committment."account type"::Vendor;
                        Committment."Account No." := PurchLine."Buy-from Vendor No.";
                        if Vendor.Get(PurchLine."Buy-from Vendor No.") then
                            Committment."Account Name" := Vendor.Name;
                        Committment.Description := PurchLine.Description;

                        Committment.Insert;

                        //Mark entries as uncommited
                        //PurchLine.Committed:=FALSE;
                        PurchLine.Modify;
                    end;

                until PurchLine.Next = 0;
            end;
            Message('Committed entries for Order No %1 Have been reversed Successfully', PurchHeader."No.");
        end;
    end;


    procedure ReverseImprestCommittment(var ImprestHeader: Record Payments)
    var
        Committment: Record "Committment Entries";
        ImprestLine: Record "Imprest Lines";
        EntryNo: Integer;
    begin
        if Confirm('Are you sure you want to reverse the committed entries for Imprest no ' + ImprestHeader."No." + '?', false) = true then begin
            Committment.Reset;
            Committment.SetRange(Committment."Commitment No", ImprestHeader."No.");
            if Committment.Find('-') then begin
                Committment.DeleteAll;
            end;
            ImprestLine.Reset;
            ImprestLine.SetRange(ImprestLine.No, ImprestHeader."No.");
            if ImprestLine.FindFirst then begin
                if Committment.FindLast then
                    EntryNo := Committment."Entry No";
                repeat

                    //Insert reversal entries into the committment table
                    if LineCommitted(ImprestHeader."No.", ImprestLine."Account No.", ImprestLine."Line No") then begin
                        Committment.Init;
                        Committment."Commitment No" := ImprestHeader."No.";
                        Committment."Commitment Type" := Committment."commitment type"::Reversal;
                        Committment."Commitment Date" := ImprestHeader.Date;
                        Committment."Global Dimension 1" := ImprestLine."Global Dimension 1 Code";
                        Committment."Global Dimension 2" := ImprestLine."Global Dimension 2 Code";
                        Committment.Account := ImprestLine."Account No.";
                        Committment."Committed Amount" := -ImprestLine.Amount;
                        Committment.User := UserId;
                        Committment."Document No" := ImprestHeader."No.";
                        Committment.No := ImprestLine."Account No.";
                        Committment."Line No." := ImprestLine."Line No";
                        EntryNo := EntryNo + 1;
                        Committment."Entry No" := EntryNo;
                        Committment.Insert;


                        //Mark imprest lines entries as uncommited
                        ImprestLine.Committed := false;
                        ImprestLine.Modify;
                    end;
                until ImprestLine.Next = 0;
            end;
            Message('Committed entries for Imprest No %1 Have been reversed Successfully', ImprestHeader."No.");
        end;
    end;


    procedure UncommitLPO(var PurchHeader: Record "Purchase Header")
    var
        Committment: Record "Committment Entries";
        PurchLine: Record "Purchase Line";
        EntryNo: Integer;
        Item: Record Item;
        InventoryPostingSetup: Record "Inventory Posting Setup";
        FixedAssetPG: Record "FA Posting Group";
        GenLedSetup: Record "General Ledger Setup";
        InventoryAccount: Code[20];
        AcquisitionAccount: Code[20];
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
    begin
        //Post Reversals to committment entries
        PurchLine.Reset;
        PurchLine.SetRange(PurchLine."Document Type", PurchLine."document type"::Order);
        PurchLine.SetRange(PurchLine."Document No.", PurchHeader."No.");
        if PurchLine.Find('-') then begin
            if Committment.Find('+') then
                EntryNo := Committment."Entry No";
            EntryNo := EntryNo + 1;

            Committment.Reset;
            Committment.SetRange(Committment."Commitment No", PurchHeader."No.");
            Committment.SetRange(Committment."Commitment Type", Committment."commitment type"::Committed);
            if Committment.Find('-') then
                UncommittmentDate := Committment."Commitment Date";

            repeat
                if LineCommitted(PurchHeader."No.", PurchLine."No.", PurchLine."Line No.") then begin
                    Committment.Init;
                    Committment."Entry No" := EntryNo;
                    Committment."Commitment No" := PurchHeader."No.";
                    Committment."Commitment Type" := Committment."commitment type"::Reversal;
                    //Insert the same
                    Committment."Commitment Date" := UncommittmentDate;
                    Committment."Uncommittment Date" := PurchLine."Order Date";
                    //Dimensions
                    Committment."Global Dimension 1" := PurchLine."Shortcut Dimension 1 Code";
                    Committment."Global Dimension 2" := PurchLine."Shortcut Dimension 2 Code";
                    //Dimensions
                    //Case of G/L Account,Item,Fixed Asset
                    case PurchLine.Type of
                        PurchLine.Type::Item:
                            begin
                                Item.Reset;
                                if Item.Get(PurchLine."No.") then
                                    if Item."Inventory Posting Group" = '' then
                                        Error('Assign Posting Group to Item No %1', Item."No.");
                                InventoryPostingSetup.Get(PurchLine."Location Code", Item."Inventory Posting Group");
                                InventoryAccount := InventoryPostingSetup."Inventory Account";
                                Committment.Account := InventoryAccount;
                            end;
                        PurchLine.Type::"G/L Account":
                            begin
                                Committment.Account := PurchLine."No.";
                            end;
                        PurchLine.Type::"Fixed Asset":
                            begin
                                FixedAsset.Reset;
                                FixedAsset.Get(PurchLine."No.");
                                FixedAssetPG.Get(FixedAsset."FA Posting Group");
                                AcquisitionAccount := FixedAssetPG."Acquisition Cost Account";
                                Committment.Account := AcquisitionAccount;
                            end;
                    end;
                    Committment."Committed Amount" := -PurchLine."Line Amount";
                    Committment.User := UserId;
                    Committment."Document No" := PurchHeader."No.";
                    Committment.No := PurchLine."No.";
                    Committment."Line No." := PurchLine."Line No.";
                    Committment."Account Type" := Committment."account type"::Vendor;
                    Committment."Account No." := PurchLine."Buy-from Vendor No.";
                    if Vendor.Get(PurchLine."Buy-from Vendor No.") then
                        Committment."Account Name" := Vendor.Name;
                    Committment.Description := PurchLine.Description;

                    Committment.Insert;
                end;
            until PurchLine.Next = 0;
        end;
        //End Post Reversal to Committment entries

        //Note LPO Uncommittment.
    end;


    procedure UncommitImprest(var ImprestHeader: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        Committments: Record "Committment Entries";
        EntryNo: Integer;
        CSetup: Record "Cash Management Setup";
    begin
        ImprestLines.SetRange(ImprestLines.No, ImprestHeader."No.");
        if ImprestLines.FindFirst then begin
            if Committments.FindLast then
                EntryNo := Committments."Entry No";

            Committments.Reset;
            Committments.SetRange(Committments."Commitment No", ImprestHeader."No.");
            Committments.SetRange(Committments."Commitment Type", Committments."commitment type"::Committed);
            if Committments.Find('-') then
                UncommittmentDate := Committments."Commitment Date";

            repeat
                if LineCommitted(ImprestHeader."No.", ImprestLines."Account No.", ImprestLines."Line No") then begin
                    Committments.Init;
                    Committments."Commitment No" := ImprestHeader."No.";
                    Committments."Commitment Type" := Committments."commitment type"::Reversal;
                    //Insert same Commitment Date
                    Committments."Commitment Date" := UncommittmentDate;
                    Committments."Uncommittment Date" := ImprestHeader.Date;

                    Committments."Global Dimension 1" := ImprestLines."Global Dimension 1 Code";
                    Committments."Global Dimension 2" := ImprestLines."Global Dimension 2 Code";
                    Committments.Account := ImprestLines."Account No.";
                    Committments."Committed Amount" := -LastCommittment(ImprestHeader."No.", ImprestLines."Account No.", ImprestLines."Line No");
                    Committments.User := UserId;
                    Committments."Document No" := ImprestHeader."No.";
                    Committments.No := ImprestLines."Account No.";
                    Committments."Line No." := ImprestLines."Line No";
                    EntryNo := EntryNo + 1;
                    Committments."Entry No" := EntryNo;
                    Committments.Insert;
                end;
            until ImprestLines.Next = 0;
        end;
    end;


    procedure CreatePV(var ImprestHeader: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        PVLines: Record "PV Lines";
        LineNo: Integer;
        CSetup: Record "Cash Management Setup";
        PettyCashLines: Record "Petty Cash Lines";
    begin
        //Check whether the petty cash Limt has been exceeded or not
        CSetup.Get;
        CSetup.TestField("Imprest Limit");
        ImprestHeader.CalcFields("Imprest Amount");
        if ImprestHeader."Imprest Amount" > CSetup."Imprest Limit" then begin
            //Create a PV
            ImprestLines.SetRange(ImprestLines.No, ImprestHeader."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    PVLines.Init;
                    PVLines.No := ImprestHeader."No.";
                    PVLines."Line No" := ImprestLines."Line No";
                    PVLines.Date := ImprestHeader.Date;
                    PVLines."Account Type" := ImprestLines."Account Type";
                    PVLines."Account No" := ImprestLines."Account No.";
                    PVLines."Account Name" := ImprestLines."Account Name";
                    PVLines.Description := ImprestLines.Description;
                    PVLines.Amount := ImprestLines.Amount;
                    PVLines.Validate(Amount);
                    PVLines."Shortcut Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                    PVLines."Shortcut Dimension 2 Code" := ImprestLines."Global Dimension 2 Code";
                    if not PVLines.Get(PVLines.No, PVLines."Line No") then
                        PVLines.Insert;
                until
                 ImprestLines.Next = 0;
            end;
            ImprestHeader."Payment Type" := ImprestHeader."payment type"::"Payment Voucher";
            ImprestHeader."Original Document" := ImprestHeader."original document"::Imprest;
            ImprestHeader.Status := ImprestHeader.Status::Released;
            ImprestHeader."PV Creation DateTime" := CreateDatetime(Today, Time);
            ImprestHeader."PV Creator ID" := UserId;
            ImprestHeader.Modify(true);
            Message(Text005, ImprestHeader."No.");
        end else begin
            //Create a petty cash
            ImprestLines.SetRange(ImprestLines.No, ImprestHeader."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    PettyCashLines.Init;
                    PettyCashLines.No := ImprestHeader."No.";
                    PettyCashLines."Line No" := ImprestLines."Line No";
                    PettyCashLines."Account Type" := ImprestLines."Account Type";
                    PettyCashLines."Account No" := ImprestLines."Account No.";
                    PettyCashLines."Account Name" := ImprestLines."Account Name";
                    PettyCashLines.Description := ImprestLines.Description;
                    PettyCashLines.Amount := ImprestLines.Amount;
                    PettyCashLines."Global Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                    PettyCashLines."Global Dimension 2 Code" := ImprestLines."Global Dimension 2 Code";
                    if not PettyCashLines.Get(PettyCashLines.No, PettyCashLines."Line No") then
                        PettyCashLines.Insert;
                until
                 ImprestLines.Next = 0;
            end;
            ImprestHeader."Payment Type" := ImprestHeader."payment type"::"Petty Cash";
            ImprestHeader."Original Document" := ImprestHeader."original document"::Imprest;
            ImprestHeader.Status := ImprestHeader.Status::Released;
            ImprestHeader."PV Creation DateTime" := CreateDatetime(Today, Time);
            ImprestHeader."PV Creator ID" := UserId;
            ImprestHeader.Modify(true);
            Message(Text006, ImprestHeader."No.");
        end;
    end;


    procedure LastCommittment(var CommittmentNo: Code[20]; var No: Code[20]; var LineNo: Integer) CommittmentAmt: Decimal
    var
        Committed: Record "Committment Entries";
    begin
        Committed.Reset;
        Committed.SetRange(Committed."Commitment No", CommittmentNo);
        Committed.SetRange(Committed.No, No);
        Committed.SetRange(Committed."Line No.", LineNo);
        if Committed.Find('-') then
            exit(Committed."Committed Amount");
    end;


    procedure PettyCashCommittment(PettyCash: Record Payments)
    var
        PettyCashLines: Record "Petty Cash Lines";
        Committments: Record "Committment Entries";
        EntryNo: Integer;
        BudgetAmount: Decimal;
        Expenses: Decimal;
        BudgetAvailable: Decimal;
        CommittedAmount: Decimal;
        CommitmentEntries: Record "Committment Entries";
        GenLedSetup: Record "General Ledger Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        CashMgt: Record "Cash Management Setup";
    begin
        /*
        IF PettyCash.Status<>PettyCash.Status::Released THEN
            ERROR('The petty cash voucher is not fully approved');
        */
        PettyCashLines.Reset;
        PettyCashLines.SetRange(No, PettyCash."No.");
        PettyCashLines.SetRange("Account Type", PettyCashLines."account type"::"G/L Account");
        if PettyCashLines.FindFirst then begin
            if Committments.FindLast then
                EntryNo := Committments."Entry No";
            repeat
                Committments.Init;
                Committments."Commitment No" := PettyCash."No.";
                Committments."Commitment Type" := Committments."commitment type"::Committed;
                PettyCash.TestField(Date);
                Committments."Commitment Date" := PettyCash.Date;
                Committments."Global Dimension 1" := PettyCashLines."Global Dimension 1 Code";
                Committments."Global Dimension 2" := PettyCashLines."Global Dimension 2 Code";
                Committments.Account := PettyCashLines."Account No";
                Committments."Committed Amount" := PettyCashLines.Amount;

                //Confirm the Amount to be issued does not exceed the budget and amount Committed
                //Get Budget for the G/L
                CashMgt.Get;
                GLAccount.SetFilter(GLAccount."Budget Filter", CashMgt."Current Budget");
                GLAccount.SetRange(GLAccount."No.", PettyCashLines."Account No");
                //Get budget amount avaliable
                GLAccount.SetRange(GLAccount."Date Filter", CashMgt."Current Budget Start Date", PettyCash.Date);
                if GLAccount.Find('-') then begin
                    GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                    BudgetAmount := GLAccount."Budgeted Amount";
                    Expenses := GLAccount."Net Change";
                    BudgetAvailable := GLAccount."Budgeted Amount" - GLAccount."Net Change";
                end;
                //Get committed Amount
                CommittedAmount := 0;
                CommitmentEntries.Reset;
                CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
                CommitmentEntries.SetRange(CommitmentEntries.Account, PettyCashLines."Account No");
                if PettyCash.Date = 0D then
                    Error(Text007);
                CommitmentEntries.SetRange(CommitmentEntries."Commitment Date", CashMgt."Current Budget Start Date",
                                           PettyCash.Date);
                CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
                CommittedAmount := CommitmentEntries."Committed Amount";
                if LineCommitted(PettyCash."No.", PettyCashLines."Account No", PettyCashLines."Line No") then
                    Message(Text002, PettyCashLines."Line No")
                else
                    if CommittedAmount + PettyCashLines.Amount > BudgetAvailable then
                        Error(Text003
                       , Committments.Account,
                        Abs(BudgetAvailable - (CommittedAmount + PettyCashLines.Amount)), BudgetAvailable, CommittedAmount);

                Committments.User := UserId;
                Committments."Document No" := PettyCash."No.";
                Committments.No := PettyCashLines."Account No";
                Committments."Line No." := PettyCashLines."Line No";
                Committments."Account Type" := Committments."account type"::Customer;
                Committments."Account No." := PettyCash."Account No.";
                if GLAccount.Get(PettyCash."Account No.") then
                    Committments."Account Name" := GLAccount.Name;
                CommitmentEntries.Description := PettyCashLines.Description;
                //Check whether line is committed.
                if not LineCommitted(PettyCash."No.", PettyCashLines."Account No", PettyCashLines."Line No") then begin
                    EntryNo := EntryNo + 1;
                    Committments."Entry No" := EntryNo;
                    Committments.Insert;
                    PettyCashLines.Committed := true;
                    PettyCashLines.Modify;
                end;
            until PettyCashLines.Next = 0;
        end;
        Message(Text004,
        Abs(BudgetAvailable - (CommittedAmount + PettyCashLines.Amount)));

    end;


    procedure ReversePettyCashCommittment(var PettyCash: Record Payments)
    var
        Committment: Record "Committment Entries";
        PettyCashLine: Record "Petty Cash Lines";
        EntryNo: Integer;
    begin
        if Confirm('Are you sure you want to reverse the committed entries for Petty Cash no ' + PettyCash."No." + '?', false) = true then begin
            Committment.Reset;
            Committment.SetRange(Committment."Commitment No", PettyCash."No.");
            if Committment.Find('-') then begin
                Committment.DeleteAll;
            end;
            PettyCashLine.Reset;
            PettyCashLine.SetRange(No, PettyCash."No.");
            if PettyCashLine.FindFirst then begin
                if Committment.FindLast then
                    EntryNo := Committment."Entry No";
                repeat

                    //Insert reversal entries into the committment table
                    if LineCommitted(PettyCash."No.", PettyCashLine."Account No", PettyCashLine."Line No") then begin
                        Committment.Init;
                        Committment."Commitment No" := PettyCash."No.";
                        Committment."Commitment Type" := Committment."commitment type"::Reversal;
                        Committment."Commitment Date" := PettyCash.Date;
                        Committment."Global Dimension 1" := PettyCashLine."Global Dimension 1 Code";
                        Committment."Global Dimension 2" := PettyCashLine."Global Dimension 2 Code";
                        Committment.Account := PettyCashLine."Account No";
                        Committment."Committed Amount" := -PettyCashLine.Amount;
                        Committment.User := UserId;
                        Committment."Document No" := PettyCash."No.";
                        Committment.No := PettyCashLine."Account No";
                        Committment."Line No." := PettyCashLine."Line No";
                        EntryNo := EntryNo + 1;
                        Committment."Entry No" := EntryNo;
                        Committment.Insert;


                        //Mark imprest lines entries as uncommited
                        PettyCashLine.Committed := false;
                        PettyCashLine.Modify;
                    end;
                until PettyCashLine.Next = 0;
            end;
            Message('Committed entries for Petty Cash No %1 Have been reversed Successfully', PettyCash."No.");
        end;
    end;


    procedure UncommitPettyCash(var PettyCash: Record Payments)
    var
        PettyCashLines: Record "Petty Cash Lines";
        Committments: Record "Committment Entries";
        EntryNo: Integer;
        CSetup: Record "Cash Management Setup";
    begin
        PettyCashLines.SetRange(No, PettyCash."No.");
        if PettyCashLines.FindFirst then begin
            if Committments.FindLast then
                EntryNo := Committments."Entry No";

            Committments.Reset;
            Committments.SetRange(Committments."Commitment No", PettyCash."No.");
            Committments.SetRange(Committments."Commitment Type", Committments."commitment type"::Committed);
            if Committments.Find('-') then
                UncommittmentDate := Committments."Commitment Date";

            repeat
                if LineCommitted(PettyCash."No.", PettyCashLines."Account No", PettyCashLines."Line No") then begin
                    Committments.Init;
                    Committments."Commitment No" := PettyCash."No.";
                    Committments."Commitment Type" := Committments."commitment type"::Reversal;
                    //Insert same Commitment Date
                    Committments."Commitment Date" := UncommittmentDate;
                    Committments."Uncommittment Date" := PettyCash.Date;

                    Committments."Global Dimension 1" := PettyCashLines."Global Dimension 1 Code";
                    Committments."Global Dimension 2" := PettyCashLines."Global Dimension 2 Code";
                    Committments.Account := PettyCashLines."Account No";
                    Committments."Committed Amount" := -LastCommittment(PettyCash."No.", PettyCashLines."Account No", PettyCashLines."Line No");
                    Committments.User := UserId;
                    Committments."Document No" := PettyCash."No.";
                    Committments.No := PettyCashLines."Account No";
                    Committments."Line No." := PettyCashLines."Line No";
                    EntryNo := EntryNo + 1;
                    Committments."Entry No" := EntryNo;
                    Committments.Insert;
                end;
            until PettyCashLines.Next = 0;
        end;
    end;

    procedure CheckPVCommittment(PV: Record Payments)
    var
        PVLines: Record "PV Lines";
        Committments: Record "Committment Entries";
        EntryNo: Integer;
        BudgetAmount: Decimal;
        Expenses: Decimal;
        BudgetAvailable: Decimal;
        CommittedAmount: Decimal;
        CommitmentEntries: Record "Committment Entries";
        GenLedSetup: Record "General Ledger Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        CashMgt: Record "Cash Management Setup";
    begin
        PVLines.Reset;
        PVLines.SetRange(No, PV."No.");
        PVLines.SetRange("Account Type", PVLines."account type"::"G/L Account");
        if PVLines.Find('-') then begin
            repeat
                //Confirm the Amount to be issued does not exceed the budget and amount Committed
                //Get Budget for the G/L
                CashMgt.Get;
                GLAccount.SetFilter(GLAccount."Budget Filter", CashMgt."Current Budget");
                GLAccount.SetRange(GLAccount."No.", PVLines."Account No");
                //Get budget amount avaliable
                GLAccount.SetRange(GLAccount."Date Filter", CashMgt."Current Budget Start Date", PV.Date);
                if GLAccount.Find('-') then begin
                    GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                    BudgetAmount := GLAccount."Budgeted Amount";
                    Expenses := GLAccount."Net Change";
                    BudgetAvailable := GLAccount."Budgeted Amount" - GLAccount."Net Change";
                end;
                //Get committed Amount
                CommittedAmount := 0;
                CommitmentEntries.Reset;
                CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
                CommitmentEntries.SetRange(CommitmentEntries.Account, PVLines."Account No");
                if PV.Date = 0D then
                    Error('Please insert the payment voucher date');
                CommitmentEntries.SetRange(CommitmentEntries."Commitment Date", CashMgt."Current Budget Start Date",
                                           PV.Date);
                CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
                CommittedAmount := CommitmentEntries."Committed Amount";
                if GLAccount.Get(PVLines."Account No") then;
                //IF GLAccount."Check Budget" THEN BEGIN
                if CommittedAmount + PVLines.Amount > BudgetAvailable then
                    Error('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
                   , Committments.Account,
                    Abs(BudgetAvailable - (CommittedAmount + PVLines.Amount)), BudgetAvailable, CommittedAmount);
            //END;
            until PVLines.Next = 0;
        end;
    end;

    procedure CommitExpenditureRequisition(var EXR: Record "Expense Requisition")
    var
        CommitmentEntries: Record "Commitment Entries";
        EXRLines: Record "Expense Requisition Line";
        EntryNo: Integer;
        ExpReqAllocation: Record "Expense Req. Allocation";
    begin
        if EXR.Status = EXR.Status::Committed then
            exit;

        CommitmentEntries.LockTable();
        CommitmentEntries.Reset();
        if CommitmentEntries.FindLast() then
            EntryNo := CommitmentEntries."Entry No";

        EXRLines.Reset();
        EXRLines.SetRange("Document No.", EXR."No.");
        if EXRLines.FindSet() then begin
            repeat
                EntryNo += 1;
                CommitmentEntries.Init();
                CommitmentEntries."Entry No" := EntryNo;
                CommitmentEntries."EXR No." := EXR."No.";
                CommitmentEntries."EXR Line No." := EXRLines."Line No.";
                CommitmentEntries."Source RecordID" := EXR.RecordId;
                CommitmentEntries."Account Type" := CommitmentEntries."Account Type"::"G/L Account";
                CommitmentEntries."Account No." := EXRLines."G/L Account";
                CommitmentEntries."Account Name" := EXRLines."G/L Account Name";
                CommitmentEntries.Account := EXRLines."G/L Account";
                CommitmentEntries."Budget Code" := EXRLines."Budget Code";
                CommitmentEntries.Amount := EXRLines."Total Amount";
                CommitmentEntries."Commitment Date" := EXR.Date;
                CommitmentEntries."Committed Amount" := EXRLines."Total Amount";
                CommitmentEntries."Global Dimension 1 Code" := EXRLines."Global Dimension 1 Code";
                CommitmentEntries."Global Dimension 2 Code" := EXRLines."Global Dimension 2 Code";
                CommitmentEntries."Shortcut Dimension 3 Code" := EXRLines."Shortcut Dimension 3 Code";
                CommitmentEntries."Shortcut Dimension 4 Code" := EXRLines."Shortcut Dimension 4 Code";
                CommitmentEntries."Shortcut Dimension 5 Code" := EXRLines."Shortcut Dimension 5 Code";
                CommitmentEntries."Shortcut Dimension 6 Code" := EXRLines."Shortcut Dimension 6 Code";
                CommitmentEntries."Shortcut Dimension 7 Code" := EXRLines."Shortcut Dimension 7 Code";
                CommitmentEntries."Shortcut Dimension 8 Code" := EXRLines."Shortcut Dimension 8 Code";
                CommitmentEntries."Commitment Type" := CommitmentEntries."Commitment Type"::Committmemt;
                CommitmentEntries.Insert();
                EXRLines.validate(Status, EXRLines.Status::Committed);
                EXRLines.Modify();

                ExpReqAllocation.Reset;
                ExpReqAllocation.SetRange("Document No.", EXR."No.");
                ExpReqAllocation.SetRange("Source Line No.", EXRLines."Line No.");
                if ExpReqAllocation.FindSet() then
                    ExpReqAllocation.ModifyAll(Status, ExpReqAllocation.Status::Committed);

            until EXRLines.Next() = 0;
        end;

        EXRLines.Reset;
        EXRLines.SetRange("Document No.", EXR."No.");
        EXRLines.SetFilter(Status, '<>%1', EXRLines.Status::Committed);
        if EXRLines.IsEmpty() then begin
            EXR.Status := EXR.Status::Committed;
            EXR.validate(Status);
            EXR.Modify();
        end;
    end;

    procedure ReverseExpenditureRequisitionCommit(var EXR: Record "Expense Requisition")
    var
        CommitmentEntries: Record "Commitment Entries";
        EXRLines: Record "Expense Requisition Line";
        EntryNo: Integer;
        ExpReqAllocation: Record "Expense Req. Allocation";
    begin
        if EXR.Status <> EXR.Status::Committed then
            exit;

        CommitmentEntries.LockTable();
        CommitmentEntries.Reset();
        if CommitmentEntries.FindLast() then
            EntryNo := CommitmentEntries."Entry No";

        EXRLines.Reset();
        EXRLines.SetRange("Document No.", EXR."No.");
        if EXRLines.FindSet() then begin
            repeat
                EntryNo += 1;
                CommitmentEntries.Init();
                CommitmentEntries."Entry No" := EntryNo;
                CommitmentEntries."EXR No." := EXR."No.";
                CommitmentEntries."EXR Line No." := EXRLines."Line No.";
                CommitmentEntries."Source RecordID" := EXR.RecordId;
                CommitmentEntries."Account Type" := CommitmentEntries."Account Type"::"G/L Account";
                CommitmentEntries."Account No." := EXRLines."G/L Account";
                CommitmentEntries."Account Name" := EXRLines."G/L Account Name";
                CommitmentEntries.Account := EXRLines."G/L Account";
                CommitmentEntries."Budget Code" := EXRLines."Budget Code";
                CommitmentEntries.Amount := -EXRLines."Total Amount";
                CommitmentEntries."Commitment Date" := EXR.Date;
                CommitmentEntries."Committed Amount" := -EXRLines."Total Amount";
                CommitmentEntries."Global Dimension 1 Code" := EXRLines."Global Dimension 1 Code";
                CommitmentEntries."Global Dimension 2 Code" := EXRLines."Global Dimension 2 Code";
                CommitmentEntries."Shortcut Dimension 3 Code" := EXRLines."Shortcut Dimension 3 Code";
                CommitmentEntries."Shortcut Dimension 4 Code" := EXRLines."Shortcut Dimension 4 Code";
                CommitmentEntries."Shortcut Dimension 5 Code" := EXRLines."Shortcut Dimension 5 Code";
                CommitmentEntries."Shortcut Dimension 6 Code" := EXRLines."Shortcut Dimension 6 Code";
                CommitmentEntries."Shortcut Dimension 7 Code" := EXRLines."Shortcut Dimension 7 Code";
                CommitmentEntries."Shortcut Dimension 8 Code" := EXRLines."Shortcut Dimension 8 Code";
                CommitmentEntries."Commitment Type" := CommitmentEntries."Commitment Type"::"Committment Reversal";
                CommitmentEntries.Insert();
                EXRLines.validate(Status, EXRLines.Status::New);
                EXRLines.Modify();

                ExpReqAllocation.Reset;
                ExpReqAllocation.SetRange("Document No.", EXR."No.");
                ExpReqAllocation.SetRange("Source Line No.", EXRLines."Line No.");
                if ExpReqAllocation.FindSet() then
                    ExpReqAllocation.ModifyAll(Status, ExpReqAllocation.Status::New);

            until EXRLines.Next() = 0;
        end;

        EXRLines.Reset;
        EXRLines.SetRange("Document No.", EXR."No.");
        EXRLines.SetFilter(Status, '<>%1', EXRLines.Status::New);
        if EXRLines.IsEmpty() then begin
            EXR.Status := EXR.Status::New;
            EXR.validate(Status);
            EXR.Modify();
        end;
    end;

    procedure RecallExpRequisition(RecId: RecordId)
    var
        RecRef: RecordRef;
        ExpReq: Record "Expense Requisition";
        ExpReqLine: Record "Expense Requisition Line";
        ExpReqAllocLines: Record "Expense Req. Allocation";
        CommitmentEntries: Record "Commitment Entries";
        ReceiptHeader: Record "Receipts Header1";
        Lines: Record "Receipt Lines1";
        EntryNo: Integer;
        Dimmgt: Codeunit DimensionManagement;
        ShortcutDimCode: array[8] of Code[20];
        totalAmountReleased: Decimal;
    begin
        if RecRef.Get(RecID) then;
        case
            RecRef.Number of
            Database::"Expense Requisition":
                begin
                    RecRef.Settable(ExpReq);
                    if ExpReq.Status = ExpReq.Status::Recalled then
                        exit;
                    CheckforApprovedandPostedDocuments(ExpReq);
                    CommitmentEntries.LockTable();
                    if CommitmentEntries.FindLast() then
                        EntryNo := CommitmentEntries."Entry No";

                    //Get the lines to Recall
                    ExpReqLine.Reset;
                    ExpReqLine.SetRange("Document No.", ExpReq."No.");
                    ExpReqLine.SetRange(Status, ExpReqLine.Status::Committed);
                    if ExpReqLine.FindSet() then begin
                        repeat
                            totalAmountReleased := calculateReleasedAmount(ExpReqLine."Line No.", ExpReqLine."Document No.");
                            EntryNo += 1;
                            CommitmentEntries.Init();
                            CommitmentEntries."Entry No" := EntryNo;
                            CommitmentEntries."EXR No." := ExpReqLine."Document No.";
                            CommitmentEntries."EXR Line No." := ExpReqLine."Line No.";
                            CommitmentEntries."Source RecordID" := ExpReq.RecordId;
                            CommitmentEntries."Commitment Type" := CommitmentEntries."Commitment Type"::"Committment Reversal";
                            CommitmentEntries."Account Type" := CommitmentEntries."Account Type"::"G/L Account";
                            CommitmentEntries."Account No." := ExpReqLine."G/L Account";
                            CommitmentEntries."Account Name" := ExpReqLine."G/L Account Name";
                            CommitmentEntries.Account := ExpReqLine."G/L Account";
                            CommitmentEntries."Budget Code" := ExpReqLine."Budget Code";
                            CommitmentEntries.Amount := ((ExpReqLine."Total Amount") * -1) - totalAmountReleased;
                            CommitmentEntries."Commitment Date" := ExpReq.Date;
                            CommitmentEntries."Committed Amount" := ExpReqLine."Total Amount" - totalAmountReleased; //Alter to capture the remaining amount
                            CommitmentEntries."Global Dimension 1 Code" := ExpReqLine."Global Dimension 1 Code";
                            CommitmentEntries."Global Dimension 2 Code" := ExpReqLine."Global Dimension 2 Code";
                            CommitmentEntries."Shortcut Dimension 3 Code" := ExpReqLine."Shortcut Dimension 3 Code";
                            CommitmentEntries."Shortcut Dimension 4 Code" := ExpReqLine."Shortcut Dimension 4 Code";
                            CommitmentEntries."Shortcut Dimension 5 Code" := ExpReqLine."Shortcut Dimension 5 Code";
                            CommitmentEntries."Shortcut Dimension 6 Code" := ExpReqLine."Shortcut Dimension 6 Code";
                            CommitmentEntries."Shortcut Dimension 7 Code" := ExpReqLine."Shortcut Dimension 7 Code";
                            CommitmentEntries."Shortcut Dimension 8 Code" := ExpReqLine."Shortcut Dimension 8 Code";
                            CommitmentEntries.Insert();
                            ExpReqLine.validate(Status, ExpReqLine.Status::Recalled);
                            ExpReqLine.Modify();

                            //Update Lines as Recalled
                            ExpReqAllocLines.Reset;
                            ExpReqAllocLines.SetRange("Document No.", ExpReq."No.");
                            ExpReqAllocLines.SetRange("Source Line No.", ExpReqLine."Line No.");
                            ExpReqAllocLines.Setrange(Status, ExpReqAllocLines.Status::Committed);
                            if ExpReqAllocLines.FindSet() then
                                ExpReqAllocLines.ModifyAll(Status, ExpReqAllocLines.Status::Recalled);

                        until ExpReqLine.Next = 0;
                    end;

                    ExpReqLine.Reset;
                    ExpReqLine.SetRange("Document No.", ExpReq."No.");
                    ExpReqLine.SetFilter(Status, '%1', ExpReqLine.Status::Committed);
                    if ExpReqLine.IsEmpty() then begin
                        ExpReq.Status := ExpReq.Status::Recalled;
                        ExpReq."Recalled By" := UserId;
                        ExpReq."Approval Status" := ExpReq."Approval Status"::Archived;
                        ExpReq.validate(Status);
                        ExpReq.Modify();
                    end;
                end;

            Database::"Expense Requisition Line":
                begin
                    RecRef.Settable(ExpReqAllocLines);
                    ExpReq.Get(ExpReqAllocLines."Document No.");
                    if (ExpReq.Status = ExpReq.Status::Recalled) or (ExpReqLine.Status = ExpReqLine.Status::Recalled) then
                        exit;

                    CommitmentEntries.LockTable();
                    if CommitmentEntries.FindLast() then
                        EntryNo := CommitmentEntries."Entry No";
                    totalAmountReleased := calculateReleasedAmount(ExpReqLine."Line No.", ExpReqLine."Document No.");

                    EntryNo += 1;
                    CommitmentEntries.Init();
                    CommitmentEntries."Entry No" := EntryNo;
                    CommitmentEntries."EXR No." := ExpReqLine."Document No.";
                    CommitmentEntries."EXR Line No." := ExpReqLine."Line No.";
                    CommitmentEntries."Source RecordID" := ExpReq.RecordId;
                    CommitmentEntries."Account Type" := CommitmentEntries."Account Type"::"G/L Account";
                    CommitmentEntries."Account No." := ExpReqLine."G/L Account";
                    CommitmentEntries."Account Name" := ExpReqLine."G/L Account Name";
                    CommitmentEntries.Account := ExpReqLine."G/L Account";
                    CommitmentEntries."Budget Code" := ExpReqLine."Budget Code";
                    CommitmentEntries.Amount := ((ExpReqLine."Total Amount") * -1) - totalAmountReleased;
                    CommitmentEntries."Commitment Date" := ExpReq.Date;
                    CommitmentEntries."Committed Amount" := ExpReqLine."Total Amount" - totalAmountReleased; //Alter to capture the remaining amount
                    CommitmentEntries."Global Dimension 1 Code" := ExpReqLine."Global Dimension 1 Code";
                    CommitmentEntries."Global Dimension 2 Code" := ExpReqLine."Global Dimension 2 Code";
                    CommitmentEntries."Shortcut Dimension 3 Code" := ExpReqLine."Shortcut Dimension 3 Code";
                    CommitmentEntries."Shortcut Dimension 4 Code" := ExpReqLine."Shortcut Dimension 4 Code";
                    CommitmentEntries."Shortcut Dimension 5 Code" := ExpReqLine."Shortcut Dimension 5 Code";
                    CommitmentEntries."Shortcut Dimension 6 Code" := ExpReqLine."Shortcut Dimension 6 Code";
                    CommitmentEntries."Shortcut Dimension 7 Code" := ExpReqLine."Shortcut Dimension 7 Code";
                    CommitmentEntries."Shortcut Dimension 8 Code" := ExpReqLine."Shortcut Dimension 8 Code";
                    CommitmentEntries.Insert();
                    ExpReqLine.validate(Status, ExpReqLine.Status::Recalled);
                    ExpReqLine.Modify();

                    //Update Lines as Recalled
                    ExpReqAllocLines.Reset;
                    ExpReqAllocLines.SetRange("Document No.", ExpReq."No.");
                    ExpReqAllocLines.SetRange("Source Line No.", ExpReqLine."Line No.");
                    ExpReqAllocLines.Setrange(Status, ExpReqAllocLines.Status::Committed);
                    if ExpReqAllocLines.FindSet() then
                        ExpReqAllocLines.ModifyAll(Status, ExpReqAllocLines.Status::Recalled);

                    ExpReqLine.Reset;
                    ExpReqLine.SetRange("Document No.", ExpReq."No.");
                    ExpReqLine.SetFilter(Status, '%1', ExpReqLine.Status::Committed);
                    if ExpReqLine.IsEmpty() then begin
                        ExpReq.Status := ExpReq.Status::Recalled;
                        ExpReq."Recalled By" := UserId;
                        ExpReq."Approval Status" := ExpReq."Approval Status"::Archived;
                        ExpReq.validate(Status);
                        ExpReq.Modify();
                    end;
                end;
            Database::"Expense Req. Allocation":
                begin
                    RecRef.Settable(ExpReqAllocLines);
                    if ExpReqAllocLines.Get(ExpReqAllocLines."Document No.") then;
                    if ExpReqAllocLines.Get(ExpReqAllocLines."Document No.", ExpReqAllocLines."Source Line No.") then;

                    if (ExpReq.Status = ExpReq.Status::Recalled) or (ExpReqLine.Status = ExpReqLine.Status::Recalled) or (ExpReqAllocLines.Status = ExpReqAllocLines.Status::Recalled) then
                        exit;

                    checkType(ExpReqAllocLines."Document No.");
                    checkForSinglePaymentStatus(ExpReqAllocLines."imprest No");
                    CommitmentEntries.LockTable();
                    if CommitmentEntries.FindLast() then
                        EntryNo := CommitmentEntries."Entry No";


                    EntryNo += 1;
                    CommitmentEntries.Init();
                    CommitmentEntries."Entry No" := EntryNo;
                    CommitmentEntries."EXR No." := ExpReqAllocLines."Document No.";
                    CommitmentEntries."EXR Line No." := ExpReqAllocLines."Line No.";
                    CommitmentEntries."Source RecordID" := ExpReqAllocLines.RecordId;
                    CommitmentEntries."Account Type" := CommitmentEntries."Account Type"::"G/L Account";
                    CommitmentEntries."Account No." := ExpReqAllocLines."G/L Account";
                    // CommitmentEntries."Account Name" := ExpReqAllocLines."G/L Account Name";
                    CommitmentEntries.Account := ExpReqAllocLines."G/L Account";
                    CommitmentEntries."Budget Code" := ExpReqAllocLines."Budget Code";
                    CommitmentEntries.Amount := (ExpReqAllocLines.Total) * -1;
                    CommitmentEntries."Commitment Date" := Today;
                    CommitmentEntries."Committed Amount" := ExpReqAllocLines.Total; //Alter to capture the remaining amount
                    CommitmentEntries."Global Dimension 1 Code" := ExpReqAllocLines."Global Dimension 1 Code";
                    CommitmentEntries."Global Dimension 2 Code" := ExpReqAllocLines."Global Dimension 2 Code";
                    CommitmentEntries."Shortcut Dimension 3 Code" := ExpReqAllocLines."Shortcut Dimension 3 Code";
                    CommitmentEntries."Shortcut Dimension 4 Code" := ExpReqAllocLines."Shortcut Dimension 4 Code";
                    CommitmentEntries."Shortcut Dimension 5 Code" := ExpReqAllocLines."Shortcut Dimension 5 Code";
                    CommitmentEntries."Shortcut Dimension 6 Code" := ExpReqAllocLines."Shortcut Dimension 6 Code";
                    CommitmentEntries."Shortcut Dimension 7 Code" := ExpReqAllocLines."Shortcut Dimension 7 Code";
                    CommitmentEntries."Shortcut Dimension 8 Code" := ExpReqAllocLines."Shortcut Dimension 8 Code";
                    ExpReqAllocLines."Recalled By" := UserId;
                    if CommitmentEntries.Insert() then begin
                        autoArchiveRecalledPayment(ExpReqAllocLines."imprest No");
                        ExpReqAllocLines.validate(Status, ExpReqAllocLines.Status::Recalled);
                        if ExpReqAllocLines.Modify() then begin
                            Message('The Expenditure No for %1 of line No %2 has been recalled successfully', ExpReqAllocLines."Document No.", ExpReqAllocLines."Line No.");
                        end;
                    end;


                    //Update Lines as Recalled
                    // ExpReqAllocLines.Reset;
                    // ExpReqAllocLines.SetRange("Document No.", ExpReq."No.");
                    // ExpReqAllocLines.SetRange("Source Line No.", ExpReqLine."Line No.");
                    // ExpReqAllocLines.Setrange(Status, ExpReqAllocLines.Status::Committed);
                    // if ExpReqAllocLines.FindSet() then
                    //     ExpReqAllocLines.ModifyAll(Status, ExpReqAllocLines.Status::Recalled);

                    // ExpReqLine.Reset;
                    // ExpReqLine.SetRange("Document No.", ExpReq."No.");
                    // ExpReqLine.SetFilter(Status, '%1', ExpReqLine.Status::Committed);
                    // if ExpReqLine.IsEmpty() then begin
                    //     ExpReq.Status := ExpReq.Status::Recalled;
                    //     ExpReq.validate(Status);
                    //     ExpReq."Approval Status" := ExpReq."Approval Status"::Archived;
                    //     ExpReq."Recalled By" := UserId;
                    //     ExpReq.Modify();
                    // end;
                end;
            Database::"Receipts Header1":
                begin
                    RecRef.Settable(ReceiptHeader);
                    if ReceiptHeader."Receipt Type" <> ReceiptHeader."Receipt Type"::Surrender then
                        exit;
                    ReceiptHeader.CalcFields(Amount, "Amount(LCY)");
                    Lines.Reset();
                    Lines.SetRange("Receipt No.", ReceiptHeader."No.");
                    if Lines.FindSet() then begin
                        CommitmentEntries.LockTable();
                        if CommitmentEntries.FindLast() then
                            EntryNo := CommitmentEntries."Entry No";
                        Dimmgt.GetShortcutDimensions(ReceiptHeader."Dimension Set ID", ShortcutDimCode);
                        repeat

                            EntryNo += 1;
                            CommitmentEntries.Init();
                            CommitmentEntries."Entry No" := EntryNo;
                            CommitmentEntries."EXR No." := ReceiptHeader."No.";
                            CommitmentEntries."Source RecordID" := Lines.RecordId;
                            CommitmentEntries."Account Type" := CommitmentEntries."Account Type"::"G/L Account";
                            CommitmentEntries."Account No." := Lines."Surrender Gl Account";
                            //CommitmentEntries."Account Name" := ExpReqLine."G/L Account Name";
                            CommitmentEntries.Account := Lines."Surrender Gl Account";
                            CommitmentEntries."Budget Code" := Lines."Surrender Gl Account";
                            CommitmentEntries.Amount := (Lines.Amount) * -1;
                            CommitmentEntries."Commitment Date" := ReceiptHeader.Date;
                            CommitmentEntries."Global Dimension 1 Code" := ReceiptHeader."Global Dimension 1 Code";
                            CommitmentEntries."Global Dimension 2 Code" := ReceiptHeader."Global Dimension 2 Code";
                            CommitmentEntries."Shortcut Dimension 3 Code" := ShortcutDimCode[3];
                            CommitmentEntries."Shortcut Dimension 4 Code" := ShortcutDimCode[4];
                            CommitmentEntries."Shortcut Dimension 5 Code" := ShortcutDimCode[5];
                            CommitmentEntries."Shortcut Dimension 6 Code" := ShortcutDimCode[6];
                            CommitmentEntries."Shortcut Dimension 7 Code" := ShortcutDimCode[7];
                            CommitmentEntries."Shortcut Dimension 8 Code" := ShortcutDimCode[8];
                            CommitmentEntries.Insert();
                        until Lines.Next() = 0;
                    end;
                end;
        end;
    end;

    local procedure calculateReleasedAmount(exrLineNo: integer; docNo: Code[20]): decimal
    var
        exrAllocationLine: Record "Expense Req. Allocation";
        totalAmount: Decimal;

    begin
        totalAmount := 0;
        exrAllocationLine.reset();
        exrAllocationLine.setRange("Document No.", docNo);
        exrAllocationLine.setRange("Source Line No.", exrLineNo);
        exrAllocationLine.setRange(Status, exrAllocationLine.Status::Recalled);
        if exrAllocationLine.findSet() then begin
            // repeat
            //     totalAmount += exrAllocationLine.Total;
            // until exrAllocationLine.next() = 0;
            exrAllocationLine.CalcSums(Total);
            totalAmount := exrAllocationLine.Total;
        end;
        exit(totalAmount)

    end;


    local procedure checkForSinglePaymentStatus(docNo: Code[20])

    var
        payments: Record Payments;

    begin
        if (docNo = '') then
            Error('Cannot Recall payment: The payment is a historical: %1', docNo);
        payments.Reset();
        payments.SetRange("No.", docNo);
        if payments.FindFirst() then begin
            if (payments.status <> payments.Status::Open) then
                Error('Cannot Recall payment: The payment %1 has progressed in approval stages', docNo);

        end
        else begin
            Error('Error Recalling: Payment %1  Not Found', docNo);

        end;



    end;


    local procedure autoArchiveRecalledPayment(docNo: Code[20])
    var
        payments: Record Payments;
    begin

        payments.Reset();
        payments.SetRange("No.", docNo);
        if payments.FindFirst() then begin
            if (payments.status = payments.Status::Open) then begin
                payments."Archive Document" := true;
                payments.Modify();
            end
            else
                Error('Cannot Archive payment: The payment %1 has not progressed in approval stages', docNo);
        end
        else begin
            Error('Payment %1  Not Found', docNo);
        end;

    end;

    local procedure checkType(docNo: Code[20])

    var
        expenditureReq: Record "Expense Requisition";

    begin
        expenditureReq.reset();
        expenditureReq.SetRange("No.", docNo);
        expenditureReq.SetRange("Requires PRN", true);
        if expenditureReq.FindFirst() then begin
            Error('Cannot Recall payment: The payment of type prn are restricted + ', docNo);
        end;

    end;

    local procedure CheckforApprovedandPostedDocuments(ExpReq: Record "Expense Requisition")
    var
        Payments: Record "Payments";
        PurchHeader: Record "Purchase Header";
        PostedInv: Record "Purch. Inv. Header";
        Text000: Label 'The Expenditure Requisition cannot be recalled because the following documents have already progressed in processing: \';
        Body: Text;
        Exists: Boolean;
    begin
        Body := Text000;
        Exists := false;

        //Check for Staff claim,safari imprest,special imprest,standing imprest
        Payments.Reset();
        Payments.SetRange("Expenditure Requisition Code", ExpReq."No.");
        Payments.SetFilter(Status, '<>%1', Payments.Status::Open);
        if Payments.FindSet() then begin
            Exists := true;
            repeat
                Body += Payments."No." + ' ' + Format(Payments.Status) + '\';
            until Payments.Next() = 0;
        end;
        ///Check for purchase requisition
        PurchHeader.Reset();
        PurchHeader.SetRange("Source RecordID", ExpReq.RecordId);
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::"Purchase Requisition");
        //PurchHeader.SetFilter(Status, '<>%1', PurchHeader.Status::Open);
        if PurchHeader.FindSet() then begin
            repeat
                Exists := true;
                Body += PurchHeader."No." + ' ' + Format(PurchHeader.Status) + '\';
            until PurchHeader.Next() = 0;
        end;

        ///Check for posted invoices
        PostedInv.Reset();
        PostedInv.SetRange("Source RecordID", ExpReq.RecordId);
        if PostedInv.FindSet() then begin
            repeat
                Exists := true;
                Body += PostedInv."No." + 'Posted \';
            until PostedInv.Next() = 0;
        end;
        if Exists then
            Error(Body);
    end;
}

