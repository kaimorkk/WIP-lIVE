Codeunit 52193475 Committment
{

    trigger OnRun()
    begin
    end;

    var
        PartialImprest: Record "Partial Imprest Issue";


    procedure LPOCommittment(var PurchHeader: Record "Purchase Header")
    var
        PurchaseLines: Record "Purchase Line";
        Committments: Record "Commitment Register";
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
        CommitmentEntries: Record "Commitment Register";
        CommittedAmount: Decimal;
        Vendor: Record Vendor;
    begin

           PurchaseLines.Reset;
           PurchaseLines.SetRange(PurchaseLines."Document No.",PurchHeader."No.");
           PurchaseLines.SetRange(PurchaseLines."Document Type",PurchaseLines."document type"::Order);
            if PurchaseLines.FindFirst then begin
              if Committments.FindLast then
                EntryNo:=Committments."Entry No";
              repeat
                Committments.Init;
                Committments."Commitment No":=PurchHeader."No.";
                Committments."Commitment Type":=Committments."commitment type"::Committed;
                //PurchHeader.VALIDATE("Order Date");
                if PurchHeader."Order Date"=0D then
                Error('Please enter the order date');
                Committments."Commitment Date":=PurchHeader."Order Date";
                Committments."Global Dimension 1":=PurchaseLines."Shortcut Dimension 1 Code";
                Committments."Global Dimension 2":=PurchaseLines."Shortcut Dimension 2 Code";
                //Case of G/L Account,Item,Fixed Asset
                case PurchaseLines.Type of
                PurchaseLines.Type::Item:
                begin
                Item.Reset;
                 if Item.Get(PurchaseLines."No.") then
                   if Item."Inventory Posting Group"='' then
                       Error('Assign Posting Group to Item No %1',Item."No.")
                       else begin
                        InventoryPostingSetup.Get(PurchaseLines."Location Code",Item."Inventory Posting Group");
                        InventoryAccount:=InventoryPostingSetup."Inventory Account";
                        Committments.Account:=InventoryAccount;
                      end;
                end;
                PurchaseLines.Type::"G/L Account":
                begin
                 Committments.Account:=PurchaseLines."No.";
                end;
                PurchaseLines.Type::"Fixed Asset":
                begin
                  if FixedAssetPG.Get(PurchaseLines."Posting Group") then begin
                     FixedAssetPG.TestField("Acquisition Cost Account");
                  AcquisitionAccount:=FixedAssetPG."Acquisition Cost Account";
                  Committments.Account:=AcquisitionAccount;
                  end;
                end;
                end;
               Committments."Committed Amount":=PurchaseLines."Line Amount";
               //Confirm the Amount to be issued does not exceed the budget and amount Committed
                //Get Budget for the G/L
                GenLedSetup.Get;
                GLAccount.SetFilter(GLAccount."Budget Filter",GenLedSetup."Current Budget");
                case PurchaseLines.Type of
                PurchaseLines.Type::Item:
                begin
                     GLAccount.SetRange(GLAccount."No.",InventoryAccount);
                end;
                PurchaseLines.Type::"G/L Account":
                begin
                  GLAccount.SetRange(GLAccount."No.",PurchaseLines."No.");
                end;
                PurchaseLines.Type::"Fixed Asset":
                  GLAccount.SetRange(GLAccount."No.",AcquisitionAccount);
                end;

                GLAccount.CalcFields(GLAccount."Budgeted Amount",GLAccount."Net Change");
                //Get budget amount avaliable
               GLAccount.SetRange(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",GenLedSetup."Current Budget End Date");
                if GLAccount.Find('-') then begin
                 GLAccount.CalcFields(GLAccount."Budgeted Amount",GLAccount."Net Change");
                 BudgetAmount:=GLAccount."Budgeted Amount";
                 Expenses:=GLAccount."Net Change";
                 BudgetAvailable:=GLAccount."Budgeted Amount"-GLAccount."Net Change";
                end;
             //Get committed Amount
             CommittedAmount:=0;
             CommitmentEntries.Reset;
             CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
             if PurchaseLines.Type=PurchaseLines.Type::Item then
              CommitmentEntries.SetRange(CommitmentEntries.Account,InventoryAccount);
             if PurchaseLines.Type=PurchaseLines.Type::"G/L Account" then
              CommitmentEntries.SetRange(CommitmentEntries.Account,PurchaseLines."No.");
             if PurchaseLines.Type=PurchaseLines.Type::"Fixed Asset" then
              CommitmentEntries.SetRange(CommitmentEntries.Account,AcquisitionAccount);
             CommitmentEntries.SetRange(CommitmentEntries."Commitment Date",GenLedSetup."Current Budget Start Date",
                                        PurchHeader."Order Date");
             CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
             CommittedAmount:=CommitmentEntries."Committed Amount";
             if LineCommitted(PurchHeader."No.",PurchaseLines."No.",PurchaseLines."Line No.")then
                Message('Line No %1 has been commited',PurchaseLines."Line No.")
             else

             if CommittedAmount+PurchaseLines."Line Amount">BudgetAvailable then begin
                if Confirm(StrSubstNo('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
                ,Committments.Account,
                Abs(BudgetAvailable-(CommittedAmount+PurchaseLines."Line Amount")),BudgetAvailable,CommittedAmount))=false then
                Error('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
                ,Committments.Account,
                Abs(BudgetAvailable-(CommittedAmount+PurchaseLines."Line Amount")),BudgetAvailable,CommittedAmount);
                 end;
               Committments.User:=UserId;
               Committments."Document No":=PurchHeader."No.";
               Committments.No:=PurchaseLines."No.";
               Committments."Line No.":=PurchaseLines."Line No.";
               Committments."Account Type":=Committments."account type"::Vendor;
               Committments."Account No.":=PurchaseLines."Buy-from Vendor No.";
               if Vendor.Get(PurchaseLines."Buy-from Vendor No.") then
               Committments."Account Name":=Vendor.Name;
               Committments.Description:=PurchaseLines.Description;

               //Check whether line is committed.
              if not LineCommitted(PurchHeader."No.",PurchaseLines."No.",PurchaseLines."Line No.")then begin
                   EntryNo:=EntryNo+1;
                   Committments."Entry No":=EntryNo;
                   Committments.Insert;
                   PurchaseLines.Committed:=true;
                   PurchaseLines.Modify;
               end;
              until PurchaseLines.Next=0;
              end;

              PurchHeader.Committed:=true;
              PurchHeader.CommittedBy:=UserId;
              PurchHeader.Modify;

              Message('Items Committed Successfully and the balance is %1',
              Abs(BudgetAvailable-(CommittedAmount+PurchaseLines."Line Amount")));
    end;


    procedure LineCommitted(var CommittmentNo: Code[20];var No: Code[20];var LineNo: Integer) Exists: Boolean
    var
        Committed: Record "Commitment Register";
    begin
               Exists:=false;
               Committed.Reset;
               Committed.SetRange(Committed."Commitment No",CommittmentNo);
               Committed.SetRange(Committed.No,No);
               Committed.SetRange(Committed."Line No.",LineNo);
               if Committed.Find('-') then
               Exists:=true;
    end;


    procedure ReverseLPOCommittment(var PurchHeader: Record "Purchase Header")
    var
        Committment: Record "Commitment Register";
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
        if Confirm('Are you sure you want to reverse the committed entries for Order no '+PurchHeader."No."+'?',false)=true then begin
           Committment.Reset;
           Committment.SetRange(Committment."Commitment No",PurchHeader."No.");
           if Committment.Find('-') then begin
              Committment.DeleteAll;
           end;
           PurchLine.Reset;
           PurchLine.SetRange(PurchLine."Document Type",PurchLine."document type"::Order);
           PurchLine.SetRange(PurchLine."Document No.",PurchHeader."No.");
           if PurchLine.FindFirst then begin
            repeat

            //Insert Reversal entries in the committment entries table
            if Committment.Find('+') then
               EntryNo:=Committment."Entry No";
               EntryNo:=EntryNo+1;
             if LineCommitted(PurchHeader."No.",PurchLine."No.",PurchLine."Line No.")then begin
                Committment.Init;
                Committment."Entry No":=EntryNo;
                Committment."Commitment No":=PurchHeader."No.";
                Committment."Commitment Type":=Committment."commitment type"::Reversal;
                Committment."Commitment Date":=PurchLine."Order Date";
                //Dimensions
                Committment."Global Dimension 1":=PurchLine."Shortcut Dimension 1 Code";
                Committment."Global Dimension 2":=PurchLine."Shortcut Dimension 2 Code";
                //Dimensions
                //Case of G/L Account,Item,Fixed Asset
                case PurchLine.Type of
                PurchLine.Type::Item:
                begin
                Item.Reset;
                 if Item.Get(PurchLine."No.") then
                   if Item."Inventory Posting Group"='' then
                       Error('Assign Posting Group to Item No %1',Item."No.");
                      InventoryPostingSetup.Get(PurchLine."Location Code",Item."Inventory Posting Group");
                      InventoryAccount:=InventoryPostingSetup."Inventory Account";
                      Committment.Account:=InventoryAccount;
                end;
                PurchLine.Type::"G/L Account":
                begin
                 Committment.Account:=PurchLine."No.";
                end;
                PurchLine.Type::"Fixed Asset":
                begin
                  FixedAsset.Reset;
                  FixedAsset.Get(PurchLine."No.");
                  FixedAssetPG.Get(FixedAsset."FA Posting Group");
                  AcquisitionAccount:=FixedAssetPG."Acquisition Cost Account";
                  Committment.Account:=AcquisitionAccount;
                end;
                end;
               Committment."Committed Amount":=-PurchLine."Line Amount";

               Committment.User:=UserId;
               Committment."Document No":=PurchHeader."No.";
               Committment.No:=PurchLine."No.";
               Committment."Account Type":=Committment."account type"::Vendor;
               Committment."Account No.":=PurchLine."Buy-from Vendor No.";
               if Vendor.Get(PurchLine."Buy-from Vendor No.") then
               Committment."Account Name":=Vendor.Name;
               Committment.Description:=PurchLine.Description;

               Committment.Insert;

            //Mark entries as uncommited
            PurchLine.Committed:=false;
            PurchLine.Modify;
            end;

            until PurchLine.Next=0;
            end;

              PurchHeader.Committed:=false;
              PurchHeader.CommittedBy:=UserId;
              PurchHeader.Modify;


           Message('Committed entries for Order No %1 Have been reversed Successfully',PurchHeader."No.");
        end;
    end;


    procedure UncommitLPO(var PurchHeader: Record "Purchase Header")
    var
        Committment: Record "Commitment Register";
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
           PurchLine.SetRange(PurchLine."Document Type",PurchLine."document type"::Order);
           PurchLine.SetRange(PurchLine."Document No.",PurchHeader."No.");
           if PurchLine.Find('-') then begin
            if Committment.Find('+') then
               EntryNo:=Committment."Entry No";
               EntryNo:=EntryNo+1;
              repeat
              if LineCommitted(PurchHeader."No.",PurchLine."No.",PurchLine."Line No.") then begin
                Committment.Init;
                Committment."Entry No":=EntryNo;
                Committment."Commitment No":=PurchHeader."No.";
                Committment."Commitment Type":=Committment."commitment type"::Reversal;
                Committment."Commitment Date":=PurchLine."Order Date";
                //Dimensions
                Committment."Global Dimension 1":=PurchLine."Shortcut Dimension 1 Code";
                Committment."Global Dimension 2":=PurchLine."Shortcut Dimension 2 Code";
                //Dimensions
                //Case of G/L Account,Item,Fixed Asset
                case PurchLine.Type of
                PurchLine.Type::Item:
                begin
                Item.Reset;
                 if Item.Get(PurchLine."No.") then
                   if Item."Inventory Posting Group"='' then
                       Error('Assign Posting Group to Item No %1',Item."No.");
                      InventoryPostingSetup.Get(PurchLine."Location Code",Item."Inventory Posting Group");
                      InventoryAccount:=InventoryPostingSetup."Inventory Account";
                      Committment.Account:=InventoryAccount;
                end;
                PurchLine.Type::"G/L Account":
                begin
                 Committment.Account:=PurchLine."No.";
                end;
                PurchLine.Type::"Fixed Asset":
                begin
                  FixedAsset.Reset;
                  FixedAsset.Get(PurchLine."No.");
                  FixedAssetPG.Get(FixedAsset."FA Posting Group");
                  AcquisitionAccount:=FixedAssetPG."Acquisition Cost Account";
                  Committment.Account:=AcquisitionAccount;
                end;
                end;
               Committment."Committed Amount":=-PurchLine."Line Amount";

               Committment.User:=UserId;
               Committment."Document No":=PurchHeader."No.";
               Committment.No:=PurchLine."No.";
               Committment."Line No.":=PurchLine."Line No.";
               Committment."Account Type":=Committment."account type"::Vendor;
               Committment."Account No.":=PurchLine."Buy-from Vendor No.";
               if Vendor.Get(PurchLine."Buy-from Vendor No.") then
               Committment."Account Name":=Vendor.Name;
               Committment.Description:=PurchLine.Description;

               Committment.Insert;
            end;
            until PurchLine.Next=0;
          end;
          //End Post Reversal to Committment entries
    end;


    procedure LastCommittment(var CommittmentNo: Code[20];var No: Code[20];var LineNo: Integer) CommittmentAmt: Decimal
    var
        Committed: Record "Commitment Register";
    begin
               Committed.Reset;
               Committed.SetRange(Committed."Commitment No",CommittmentNo);
               Committed.SetRange(Committed.No,No);
               Committed.SetRange(Committed."Line No.",LineNo);
               if Committed.Find('-') then
               exit(Committed."Committed Amount");
    end;


    procedure CreatePV(var ImprestHeader: Record "Request Header1")
    var
        ImprestHeaderRec: Record "Request Header1";
        ImprestLines: Record "Request Lines1";
        PVLines: Record "PV Lines1";
        LineNo: Integer;
        PVHeader: Record Payments;
        PVPost: Codeunit "Payment- Post";
        CustLedge: Record "Cust. Ledger Entry";
        Text000: label 'The Imprest Account Holder no %1, has %2 yet to be Surrendered. The Transaction will therefore Terminate!';
        ImpNo: Integer;
    begin

        // ImprestHeaderRec.Posted := TRUE;
        if ImprestHeader.Partial = true then
        Error('The imprest has been issued partially, hence you should use the Partial Issue button');

        if Confirm('Are you sure you want to post the Imprest no '+ImprestHeader."No."+' using posting date '+Format(ImprestHeader."Request Date")+' ?')=true then begin

            //Error For Unserrendered Imprests
            ImprestHeaderRec.Reset;
            ImprestHeaderRec.SetRange(Posted,true);
            ImprestHeaderRec.SetRange(Surrendered,false);
            ImprestHeaderRec.SetRange("Customer A/C",ImprestHeader."Customer A/C");
            ImprestHeaderRec.SetFilter(Type,'=%1',ImprestHeaderRec.Type::Imprest);
            ImprestHeaderRec.SetFilter("Deadline for Imprest Return",'<%1',Today);
            if ImprestHeaderRec.Find('-') then begin
            //Message(format(ImprestHeaderRec."No."));
            ImpNo:=0;
              repeat
              CustLedge.Reset;
              CustLedge.SetRange(Open,true);
              CustLedge.SetRange("Document No.",ImprestHeaderRec."No.");
              CustLedge.SetRange("Customer No.",ImprestHeaderRec."Customer A/C");
              CustLedge.SetRange("Due Date",ImprestHeaderRec."Deadline for Imprest Return");
              if CustLedge.Find('-') then
              ImpNo:=ImpNo+1;
              until ImprestHeaderRec.Next = 0;
              if ImpNo > 0 then
              Error(Text000,ImprestHeader."Customer A/C",ImpNo);
            end;
            //Error End


            ImprestHeader.CalcFields("Imprest Amount");
            PVHeader.Init;
            PVHeader.No:=ImprestHeader."No.";
            PVHeader.Date:=ImprestHeader."Request Date";
            //PVHeader."Payment Type":=PVHeader."payment type"::"24";
            PVHeader."Paying Bank Account":=ImprestHeader."Bank Account";
            PVHeader.Remarks:='Imprest';
           // PVHeader.Posted:=TRUE;
            PVHeader.Amount := ImprestHeader."Imprest Amount";
            PVHeader.Status:=PVHeader.Status::Released;
            PVHeader."Created From Mprest":=true;
            PVHeader.Source:=PVHeader.Source::Imprest;
            PVHeader.Payee:=ImprestHeader."Employee Name";
            PVHeader."Pay Mode":=ImprestHeader."Pay Mode";
            PVHeader."Cheque No":=ImprestHeader."Cheque No";
            PVHeader."Imprest Deadline":=ImprestHeader."Deadline for Imprest Return";
            PVHeader."Global Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
            PVHeader.Validate("Global Dimension 1 Code");
            PVHeader."Global Dimension 2 Code":=ImprestHeader."Global Dimension 2 Code";
            PVHeader.Validate("Global Dimension 2 Code");
             if not PVHeader.Get(ImprestHeader."No.") then
              PVHeader.Insert
            else begin
             PVHeader.No:=ImprestHeader."No.";
             PVHeader.Date:=ImprestHeader."Request Date";
             PVHeader.Amount := ImprestHeader."Imprest Amount";
             //PVHeader."Payment Type":=PVHeader."payment type"::"24";
             PVHeader."Paying Bank Account":=ImprestHeader."Bank Account";
             PVHeader.Remarks:='Imprest';
            // PVHeader.Posted:=TRUE;
             PVHeader.Status:=PVHeader.Status::Released;
             PVHeader.Source:=PVHeader.Source::Imprest;
             PVHeader."Created From Mprest":=true;
             PVHeader.Payee:=ImprestHeader."Employee Name";
             PVHeader."Pay Mode":=ImprestHeader."Pay Mode";
             PVHeader."Cheque No":=ImprestHeader."Cheque No";
             PVHeader."Imprest Deadline":=ImprestHeader."Deadline for Imprest Return";
             PVHeader."Global Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
             PVHeader.Validate("Global Dimension 1 Code");
             PVHeader."Global Dimension 2 Code":=ImprestHeader."Global Dimension 2 Code";
             PVHeader.Validate("Global Dimension 2 Code");
             PVHeader.Modify;
            end;
            ImprestLines.SetRange("Document No",ImprestHeader."No.");
            if ImprestLines.FindFirst then begin
               repeat
                PVLines.Init;
                PVLines."PV No":=ImprestHeader."No.";
                PVLines."Line No":=ImprestLines."Line No.";
                case ImprestLines."Expense Type" of
                 ImprestLines."expense type"::"Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::Customer;
                   PVLines."Account No":=ImprestHeader."Customer A/C";
                  end;
                 ImprestLines."expense type"::"Non-Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::"G/L Account";
                   PVLines."Account No":=ImprestLines."Account No";
                  end;
                end;
                PVLines.Description:=ImprestLines.Description;
                PVLines.Amount:=ImprestLines.Amount;
                PVLines.Validate(Amount);
                PVLines."Shortcut Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
                PVLines.Validate("Shortcut Dimension 1 Code");
                PVLines."Shortcut Dimension 2 Code":=ImprestHeader."Global Dimension 2 Code";
                PVLines.Validate("Shortcut Dimension 2 Code");
                if not PVLines.Get(PVLines."PV No",PVLines."Line No") then
                PVLines.Insert
                else begin
                PVLines.Init;
                PVLines."PV No":=ImprestHeader."No.";
                PVLines."Line No":=ImprestLines."Line No.";
                case ImprestLines."Expense Type" of
                 ImprestLines."expense type"::"Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::Customer;
                   PVLines."Account No":=ImprestHeader."Customer A/C";
                  end;
                 ImprestLines."expense type"::"Non-Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::"G/L Account";
                   PVLines."Account No":=ImprestLines."Account No";
                  end;
                end;
                PVLines.Description:=ImprestLines.Description;
                PVLines.Amount:=ImprestLines.Amount;
                PVLines.Validate(Amount);
                PVLines."Shortcut Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
                PVLines.Validate("Shortcut Dimension 1 Code");
                PVLines."Shortcut Dimension 2 Code":=ImprestHeader."Global Dimension 2 Code";
                PVLines.Validate("Shortcut Dimension 2 Code");
                PVLines.Modify;
                end;
               until
                ImprestLines.Next=0;
              end;
             PVPost.PostPayment(PVHeader);
            PVHeader.Init;
           PVHeader.Posted:=true;

             if not PVHeader.Get(ImprestHeader."No.") then
              PVHeader.Insert
            else begin

            PVHeader.Posted:=true;

             PVHeader.Modify;
            end;

         //MESSAGE('Payment Voucher No %1 has been successfully created and posted',ImprestHeader."No.");
        end;
    end;


    procedure PostPartialImprest(var PartialHeader: Record "Partial Imprest Issue")
    var
        ImprestLines: Record "Request Lines1";
        PVLines: Record "PV Lines1";
        LineNo: Integer;
        PVHeader: Record Payments;
        PVPost: Codeunit "Payment- Post";
        ImprestHeader: Record "Request Header1";
        IssuedAmnToDate: Decimal;
        Text000: label 'The imprest partial payment No.%1 has already been posted';
        Text001: label 'Imprest No.%1 has fully been issued';
    begin
        if ImprestHeader.Get(PartialHeader."Imprest No") then begin

        if PartialHeader.Posted then
        Error(Text000,PartialHeader."Line No");

        if Confirm('Are you sure you want to post the Imprest no '+PartialHeader."Imprest No"+' using posting date '+Format(PartialHeader.Date)+' ?')=true then begin

        PartialHeader.CalcFields("Amount Issued to date");
        if PartialHeader."Approved Amount" = PartialHeader."Amount Issued to date" then
        Error(Text001,PartialHeader."Imprest No");
            ImprestHeader.CalcFields("Imprest Amount");
            PVHeader.Init;
            PVHeader.No:=ImprestHeader."No."+'-'+Format(PartialHeader."Line No");
            PVHeader.Date:=PartialHeader.Date;//ImprestHeader."Request Date";
            //PVHeader."Payment Type":=PVHeader."payment type"::"24";
            PVHeader."Paying Bank Account":=ImprestHeader."Bank Account";
            PVHeader.Remarks:='Imprest';
            PVHeader.Status:=PVHeader.Status::Released;
            PVHeader.Source:=PVHeader.Source::Imprest;
            PVHeader.Payee:=ImprestHeader."Employee Name";
            PVHeader."Pay Mode":=ImprestHeader."Pay Mode";
            PVHeader."Cheque No":=ImprestHeader."Cheque No";
            PVHeader."Global Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
            PVHeader.Validate("Global Dimension 1 Code");
            PVHeader."Global Dimension 2 Code":=ImprestHeader."Global Dimension 2 Code";
            PVHeader.Validate("Global Dimension 2 Code");
            PVHeader."Partial No.":=ImprestHeader."No.";
            PVHeader."Partial Line No.":=PartialHeader."Line No";
             if not PVHeader.Get(ImprestHeader."No."+Format(PartialHeader."Line No")) then
              PVHeader.Insert
            else begin
             PVHeader.No:=ImprestHeader."No."+'-'+Format(PartialHeader."Line No");
             PVHeader.Date:=PartialHeader.Date;//ImprestHeader."Request Date";
             //PVHeader."Payment Type":=PVHeader."payment type"::"24";
             PVHeader."Paying Bank Account":=ImprestHeader."Bank Account";
             PVHeader.Remarks:='Imprest';
             PVHeader.Status:=PVHeader.Status::Released;
             PVHeader.Source:=PVHeader.Source::Imprest;
             PVHeader.Payee:=ImprestHeader."Employee Name";
             PVHeader."Pay Mode":=PartialHeader."Pay Mode";
             PVHeader."Cheque No":=ImprestHeader."Cheque No";
             PVHeader."Global Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
             PVHeader.Validate("Global Dimension 1 Code");
             PVHeader."Global Dimension 2 Code":=ImprestHeader."Global Dimension 2 Code";
             PVHeader.Validate("Global Dimension 2 Code");
             PVHeader."Partial No.":=ImprestHeader."No.";
             PVHeader."Partial Line No.":=PartialHeader."Line No";
             PVHeader.Modify;
            end;
            //MESSAGE('Partial No %1','Line  No %2',PVHeader."Partial No.",PVHeader."Partial Line No.");
            ImprestLines.SetRange("Document No",ImprestHeader."No.");
            if ImprestLines.FindFirst then begin
               repeat
                PVLines.Init;
                PVLines."PV No":=ImprestHeader."No."+'-'+Format(PartialHeader."Line No");
                PVLines."Line No":=ImprestLines."Line No.";
                case ImprestLines."Expense Type" of
                 ImprestLines."expense type"::"Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::Customer;
                   PVLines."Account No":=ImprestHeader."Customer A/C";
                  end;
                 ImprestLines."expense type"::"Non-Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::"G/L Account";
                   PVLines."Account No":=ImprestLines."Account No";
                  end;
                end;
                //MESSAGE(FORMAT(ImprestHeader."No."));
                PVLines.Description:=ImprestLines.Description;
                PVLines.Amount:=PartialHeader."Amount to Issue";
                PVLines.Validate(Amount);
                PVLines."Shortcut Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
                PVLines.Validate("Shortcut Dimension 1 Code");
                PVLines."Shortcut Dimension 2 Code":=ImprestHeader."Global Dimension 2 Code";
                PVLines.Validate("Shortcut Dimension 2 Code");
                if not PVLines.Get(PVLines."PV No",PVLines."Line No") then
                PVLines.Insert
                else begin
                PVLines.Init;
                PVLines."PV No":=ImprestHeader."No."+'-'+Format(PartialHeader."Line No");
                PVLines."Line No":=ImprestLines."Line No.";
                case ImprestLines."Expense Type" of
                 ImprestLines."expense type"::"Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::Customer;
                   PVLines."Account No":=ImprestHeader."Customer A/C";
                  end;
                 ImprestLines."expense type"::"Non-Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::"G/L Account";
                   PVLines."Account No":=ImprestLines."Account No";
                  end;
                end;
                PVLines.Description:=ImprestLines.Description;
                PVLines.Amount:=PartialHeader."Amount to Issue";
                PVLines.Validate(Amount);
                PVLines."Shortcut Dimension 1 Code":=ImprestLines."Global Dimension 1 Code";
                PVLines."Shortcut Dimension 2 Code":=ImprestLines."Global Dimension 2 Code";
                PVLines.Modify;
                end;
               until
                ImprestLines.Next=0;
              end;

         //Posting PV
         PVPost.PostPayment(PVHeader);
        end;
         //MESSAGE('Payment Voucher No %1 has been successfully created and posted',ImprestHeader."No.");
         end;
    end;


    procedure ImprestPaidWithPV(var ImprestHeader: Record "Request Header1")
    var
        ImprestLines: Record "Request Lines1";
        PVLines: Record "PV Lines1";
        LineNo: Integer;
        PVHeader: Record Payments;
        PVPost: Codeunit "Payment- Post";
    begin
        if ImprestHeader.Partial = true then
        Error('The imprest has been issued partially, hence you should use the Partial Issue button');

        if not ImprestHeader."PV Created" then begin
            ImprestHeader.CalcFields("Imprest Amount");
            PVHeader.Init;
            PVHeader.No:=ImprestHeader."No.";
            PVHeader.Date:=ImprestHeader."Request Date";
            //PVHeader."Payment Type":=PVHeader."payment type"::"24";
            PVHeader."Paying Bank Account":=ImprestHeader."Bank Account";
            PVHeader.Remarks:='Imprest';
            PVHeader.Status:=PVHeader.Status::Open;
            PVHeader.Source:=PVHeader.Source::Imprest;
            PVHeader.Payee:=ImprestHeader."Employee Name";
            PVHeader."Pay Mode":=ImprestHeader."Pay Mode";
            PVHeader."Cheque No":=ImprestHeader."Cheque No";
             if not PVHeader.Get(ImprestHeader."No.") then
              PVHeader.Insert
            else begin
             PVHeader.No:=ImprestHeader."No.";
             PVHeader.Date:=ImprestHeader."Request Date";
             //PVHeader."Payment Type":=PVHeader."payment type"::"24";
             PVHeader."Paying Bank Account":=ImprestHeader."Bank Account";
             PVHeader.Remarks:='Imprest';
             PVHeader.Status:=PVHeader.Status::Open;
             PVHeader.Source:=PVHeader.Source::Imprest;
             PVHeader.Payee:=ImprestHeader."Employee Name";
             PVHeader."Pay Mode":=ImprestHeader."Pay Mode";
             PVHeader."Cheque No":=ImprestHeader."Cheque No";
             PVHeader.Modify;
            end;
            ImprestLines.SetRange("Document No",ImprestHeader."No.");
            if ImprestLines.FindFirst then begin
               repeat
                PVLines.Init;
                PVLines."PV No":=ImprestHeader."No.";
                PVLines."Line No":=ImprestLines."Line No.";
                case ImprestLines."Expense Type" of
                 ImprestLines."expense type"::"Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::Customer;
                   PVLines."Account No":=ImprestHeader."Customer A/C";
                  end;
                 ImprestLines."expense type"::"Non-Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::"G/L Account";
                   PVLines."Account No":=ImprestLines."Account No";
                  end;
                end;
                PVLines.Description:=ImprestLines.Description;
                PVLines.Amount:=ImprestLines.Amount;
                PVLines.Validate(Amount);
                PVLines."Shortcut Dimension 1 Code":=ImprestLines."Global Dimension 1 Code";
                PVLines."Shortcut Dimension 2 Code":=ImprestLines."Global Dimension 2 Code";
                if not PVLines.Get(PVLines."PV No",PVLines."Line No") then
                PVLines.Insert
                else begin
                PVLines.Init;
                PVLines."PV No":=ImprestHeader."No.";
                PVLines."Line No":=ImprestLines."Line No.";
                case ImprestLines."Expense Type" of
                 ImprestLines."expense type"::"Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::Customer;
                   PVLines."Account No":=ImprestHeader."Customer A/C";
                  end;
                 ImprestLines."expense type"::"Non-Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::"G/L Account";
                   PVLines."Account No":=ImprestLines."Account No";
                  end;
                end;
                PVLines.Description:=ImprestLines.Description;
                PVLines.Amount:=ImprestLines.Amount;
                PVLines.Validate(Amount);
                PVLines."Shortcut Dimension 1 Code":=ImprestLines."Global Dimension 1 Code";
                PVLines."Shortcut Dimension 2 Code":=ImprestLines."Global Dimension 2 Code";
                PVLines.Modify;
                end;
               until
                ImprestLines.Next=0;
              end;
             //PVPost.PostPayment(PVHeader);

         ImprestHeader."Issued Amount":=ImprestHeader."Imprest Amount";
         ImprestHeader.Posted:=true;
         ImprestHeader."PV Created":=true;
         ImprestHeader.Modify(true);
         Message('Payment Voucher No %1 has been successfully created',ImprestHeader."No.");

        end else if PVHeader.Get(ImprestHeader."No.") then
        Error('Payment Voucher No %1 already Exists',ImprestHeader."No.");
    end;


    procedure PostPartialImprestWithPV(var PartialHeader: Record "Partial Imprest Issue")
    var
        ImprestLines: Record "Request Lines1";
        PVLines: Record "PV Lines1";
        LineNo: Integer;
        PVHeader: Record Payments;
        PVPost: Codeunit "Payment- Post";
        ImprestHeader: Record "Request Header1";
        IssuedAmnToDate: Decimal;
        Text000: label 'The imprest partial payment No.%1 has already been posted';
        Text001: label 'Imprest No.%1 has fully been issued';
    begin
        if ImprestHeader.Get(PartialHeader."Imprest No") then begin
        
        if not PartialHeader."PV Created" then begin
        
        if PartialHeader.Posted then
        Error(Text000,PartialHeader."Line No");
        
        PartialHeader.CalcFields("Amount Issued to date");
        if PartialHeader."Approved Amount" = PartialHeader."Amount Issued to date" then
        Error(Text001,PartialHeader."Imprest No");
        
            ImprestHeader.CalcFields("Imprest Amount");
            PVHeader.Init;
            PVHeader.No:=ImprestHeader."No."+'-'+Format(PartialHeader."Line No");
            PVHeader.Date:=ImprestHeader."Request Date";
            //PVHeader."Payment Type":=PVHeader."payment type"::"24";
            PVHeader."Paying Bank Account":=ImprestHeader."Bank Account";
            PVHeader.Remarks:='Imprest';
            PVHeader.Status:=PVHeader.Status::Open;
            PVHeader.Source:=PVHeader.Source::Imprest;
            PVHeader.Payee:=ImprestHeader."Employee Name";
            PVHeader."Pay Mode":=ImprestHeader."Pay Mode";
            PVHeader."Cheque No":=ImprestHeader."Cheque No";
            PVHeader."Partial No.":=ImprestHeader."No.";
            PVHeader."Partial Line No.":=PartialHeader."Line No";
             if not PVHeader.Get(ImprestHeader."No."+Format(PartialHeader."Line No")) then
              PVHeader.Insert
            else begin
             PVHeader.No:=ImprestHeader."No."+'-'+Format(PartialHeader."Line No");
             PVHeader.Date:=ImprestHeader."Request Date";
             //PVHeader."Payment Type":=PVHeader."payment type"::"24";
             PVHeader."Paying Bank Account":=ImprestHeader."Bank Account";
             PVHeader.Remarks:='Imprest';
             PVHeader.Status:=PVHeader.Status::Open;
             PVHeader.Source:=PVHeader.Source::Imprest;
             PVHeader.Payee:=ImprestHeader."Employee Name";
             PVHeader."Pay Mode":=PartialHeader."Pay Mode";
             PVHeader."Cheque No":=ImprestHeader."Cheque No";
             PVHeader."Partial No.":=ImprestHeader."No.";
             PVHeader."Partial Line No.":=PartialHeader."Line No";
        
             PVHeader.Modify;
            end;
            ImprestLines.SetRange("Document No",ImprestHeader."No.");
            if ImprestLines.FindFirst then begin
               repeat
                PVLines.Init;
                PVLines."PV No":=ImprestHeader."No."+'-'+Format(PartialHeader."Line No");
                PVLines."Line No":=ImprestLines."Line No.";
                case ImprestLines."Expense Type" of
                 ImprestLines."expense type"::"Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::Customer;
                   PVLines."Account No":=ImprestHeader."Customer A/C";
                  end;
                 ImprestLines."expense type"::"Non-Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::"G/L Account";
                   PVLines."Account No":=ImprestLines."Account No";
                  end;
                end;
                PVLines.Description:=ImprestLines.Description;
                PVLines.Amount:=PartialHeader."Amount to Issue";
                PVLines.Validate(Amount);
                PVLines."Shortcut Dimension 1 Code":=ImprestLines."Global Dimension 1 Code";
                PVLines."Shortcut Dimension 2 Code":=ImprestLines."Global Dimension 2 Code";
                if not PVLines.Get(PVLines."PV No",PVLines."Line No") then
                PVLines.Insert
                else begin
                PVLines.Init;
                PVLines."PV No":=ImprestHeader."No."+'-'+Format(PartialHeader."Line No");
                PVLines."Line No":=ImprestLines."Line No.";
                case ImprestLines."Expense Type" of
                 ImprestLines."expense type"::"Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::Customer;
                   PVLines."Account No":=ImprestHeader."Customer A/C";
                  end;
                 ImprestLines."expense type"::"Non-Accountable Expenses":
                  begin
                   PVLines."Account Type":=PVLines."account type"::"G/L Account";
                   PVLines."Account No":=ImprestLines."Account No";
                  end;
                end;
                PVLines.Description:=ImprestLines.Description;
                PVLines.Amount:=PartialHeader."Amount to Issue";
                PVLines.Validate(Amount);
                PVLines."Shortcut Dimension 1 Code":=ImprestLines."Global Dimension 1 Code";
                PVLines."Shortcut Dimension 2 Code":=ImprestLines."Global Dimension 2 Code";
                PVLines.Modify;
                end;
               until
                ImprestLines.Next=0;
              end;
        
         //Posting PV
        //--PVPost.PostPayment(PVHeader);
        
         //IssuedAmnToDate:=PartialHeader."Amount Issued to date"+PartialHeader."Amount to Issue";
        
         //ImprestHeader."Remaining Imprest Amount" := PartialHeader."Approved Amount" - (IssuedAmnToDate+PartialHeader."Amount to Issue");
        
        
         /*IF (ImprestHeader."Remaining Imprest Amount" = 0)  OR (ImprestHeader."Remaining Imprest Amount" < 0)  THEN
         ImprestHeader.Posted:=TRUE;*/
         ImprestHeader.Partial := true;
         //ImprestHeader."Issued Amount":=PartialHeader."Amount Issued to date" + PartialHeader."Amount to Issue";
         ImprestHeader.Modify(true);
         /*MESSAGE('Payment Voucher No %1 has been successfully created and posted',ImprestHeader."No.");*/
        
        PartialHeader."PV Created":=true;
        PartialHeader.Modify(true);
        
        
        end else
        Error('Payment Voucher No %1 already Exists',ImprestHeader."No."+'-'+Format(PartialHeader."Line No"));
        
        end;

    end;
}

