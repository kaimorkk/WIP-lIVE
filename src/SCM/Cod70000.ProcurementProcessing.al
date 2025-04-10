
/// <summary>
/// Codeunit Procurement Processing (ID 70000).
/// </summary>
codeunit 70000 "Procurement Processing"
{

    trigger OnRun()
    begin
    end;

    var
        Text000: label 'Purchases Setup doesn''''nt exist';
        PrequalificationEntry: Record "Vendor Prequalification Entry";
        ProcurementCat: Record "Procurement Category";
        //IFP: Record "Request For Information";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        IFPResponseL: Record "IFP Response Line";
        ConfirmManagement: Codeunit "Confirm Management";
        ProctSetup: Record "Procurement Setup";
        FeedbackValue: Boolean;
        Text002: label 'Record No  %1 has been Created';
        conftxt: Boolean;
        optionselected: Integer;
        // NoSeriesManagement: Codeunit NoSeriesManagement;
        // MyItem: Record Item;
        //  MyVendor: Record Vendor;
        //GiftGiven: Record "Legal Declarations Register";
        noalines: Record "Bid Tabulation Line";
        StandardPurchaseLine: Record "Standard Purchase Line";
        Text001: label 'Are you sure you want to Post?';
        nobids: Integer;
        InsuranceReg: Record "Purchase Line";
        Window: Dialog;
        MyItem: Record Item;
        MyVendor: Record Vendor;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        SenderAddress: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];

    local procedure PurchHeaderExist(CostComparisonSheet: Record "Cost Comparison Sheet") PurchaseH: Code[20]
    var
        PurchaseHd: Record "Purchase Header";
    begin
        PurchaseHd.Reset;
        PurchaseHd.SetRange("Document Type", PurchaseHd."document type"::Order);
        PurchaseHd.SetRange(Status, PurchaseHd.Status::Open);
        PurchaseHd.SetRange("Invitation For Supply No", CostComparisonSheet."IFS Code");
        PurchaseHd.SetRange("Buy-from Vendor No.", CostComparisonSheet."Buy-from Vendor No.");
        if PurchaseHd.FindSet then begin
            PurchaseH := PurchaseHd."No.";
        end;
        exit(PurchaseH);
    end;

    procedure PostNoticeOfAWard(NOA: Record "Bid Tabulation Header")
    var
        PurchaseH: Record "Purchase Header";
        PurchaseHead: Record "Purchase Header";
        Procurement: Codeunit "Procurement Processing";
        IFSList: Record "Standard Purchase Code";
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        Purch: Record "Purchase Header";
        CopyPurchDoc: Report "Copy Purchase Document";
        Purch2: Record "Purchase Header";
        PurchLines: Record "Purchase Line";
        PurchLines1: Record "Purchase Line";
        Purch3: Record "Purchase Header";
        IFS: Record "Standard Purchase Code";
        CompanyInfo: Record "Company Information";
        IFSLines: Record "Purchase Line";
        ContractSecurity: Record "Bid_Contract Security Register";
        BidContractSecurity: Record "Bid_Contract Security Register";
        UserSetup22: Record "User Setup";
        Employee22: Record Employee;
        PurchaseContractEntries: Record "Purchase Contract Entries";
        PurchaseContractEntries2: Record "Purchase Contract Entries";
        IFSE: Record "Standard Purchase Code";
    begin
        //IF NOT ConfirmManagement.ConfirmProcess(Text001,TRUE) THEN
        //  EXIT;
        //if Contract
        //mtr
        conftxt := Confirm('Are you sure you want to Generate LPO/LSO or Contracts?');
        if Format(conftxt) = 'Yes' then begin
            optionselected := Dialog.StrMenu('Contract,LPO/LSO', 1, 'Do you want to Generate LPO or a Contract?');
            if optionselected = 2 then begin

                Vendor.Reset;
                Vendor.SetRange("No.", NOA."Awarded Bidder No.");
                if Vendor.FindSet then begin
                    Purch.Init;
                    Purch."Document Type" := Purch."document type"::Order;
                    Purch."Awarded Bid No" := NOA."Awarded Bid No";
                    Purch."Buy-from Vendor No." := NOA."Awarded Bidder No.";
                    Purch."Award Tender Sum Inc Taxes" := NOA."Award Tender Sum Inc Taxes";
                    Purch."Invitation For Supply No" := NOA."IFS Code";
                    Purch.Validate("Buy-from Vendor No.", NOA."Awarded Bidder No.");
                    Purch."Building/House No" := Vendor."Building/House No";
                    Purch."Plot No" := Vendor."Plot No";
                    Purch.Street := Vendor.Street;
                    Purch."Nature of Business" := Vendor."Nature of Business";
                    Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
                    Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
                    Purch."Max Value of Business" := Vendor."Max Value of Business";
                    Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
                    Purch."Business Type" := Vendor."Business Type";
                    Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
                    Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
                    ///
                    //           noalines.Reset;
                    //           noalines.SetRange("Tabulation ID",NOA.Code);
                    //           if noalines.FindSet then begin
                    //        Purch."AGPO Category":=noalines."AGPO Category";
                    //   Purch.Manufacturer:=noalines.Manufacturer;
                    //   Purch."AGPO Certficate Number":=noalines."AGPO Certficate Number";
                    //   Purch.Classification:=noalines.Classification;
                    //   Purch.Country:=noalines.Country;
                    //           end;

                    IFS.Reset;
                    IFS.SetRange(Code, NOA."IFS Code");
                    if IFS.FindSet then begin
                        //Purch.INIT;


                        Purch."Bid Envelope Type" := IFS."Bid Envelop Type";
                        Purch."Requisition No" := IFS."PRN No.";
                        Purch."Purchaser Code" := IFS."Purchaser Code";
                        // Purch.Validate("Purchaser Code", IFS."Purchaser Code");
                        Purch."Procurement Plan ID" := IFS."Procurement Plan ID";
                        Purch."Procurement Plan Entry No" := IFS."Procurement Plan Entry No";
                        Purch."Tender Description" := IFS."Tender Summary";
                        Purch."Responsibility Center" := IFS."Responsibility Center";
                        Purch.Validate("Location Code", IFS."Location Code");
                        Purch."Language Code" := IFS."Language Code";
                        Purch."Purchaser Code2" := IFS."Purchaser Code";
                        // Purch.validate("Purchaser Code2");
                        Purch."Currency Code" := IFS."Currency Code";
                        Purch."IFS Code" := NOA."IFS Code";
                        Purch."Bid Charge Code" := IFS."Bid Charge Code";
                        // Purch."Shortcut Dimension 1 Code":=IFS."Bid Charge (LCY)";
                        // Purch."Shortcut Dimension 1 Code":=IFS."Bid Charge (LCY)";
                        Purch."Bid Charge (LCY)" := IFS."Bid Charge (LCY)";
                        Purch."Works Category" := IFS."Works Category";
                        Purch."Road Code" := IFS."Road Code";
                        Purch."Link Name" := IFS."Road Link Name";
                        Purch.Consitituency := IFS."Constituency ID";
                        Purch."Engineer Estimate (LCY)" := IFS."Engineer Estimate (LCY)";
                        //Purch."Max Works Completion Duration":=IFS."Max Works Completion Duration";
                        Purch."Max Works Kickoff Duration" := IFS."Max Works Kickoff Duration";
                        Purch."Max Works Charter Duration" := IFS."Max Works Charter Duration";
                        Purch.Validate("Payment Terms Code", IFS."Payment Terms Code");
                        //Purch."Defects Liability Period":=IFS."Defects Liability Period";
                        Purch."Daily Liquidated Dam Unit Cost" := IFS."Daily Liquidated Dam Unit Cost";
                        Purch."Liquidated Damages Limit %" := IFS."Liquidated Damages Limit %";
                        Purch."Payment Retention %" := IFS."Payment Retention %";
                        Purch."Retention Amount Limit %" := IFS."Retention Amount Limit %";
                        Purch."Min Interim Certificate Amount" := IFS."Min Interim Certificate Amount";
                    end;
                    CompanyInfo.Get;
                    Purch."Procuring Entity (PE) Name" := CompanyInfo.Name;


                    Purch."Contract Description" := NOA."Tender Name";
                    Purch."Contract Start Date" := NOA."Document Date";
                    Purch."Tender Name" := NOA."Tender Name";
                    Purch."Notice of Award No." := NOA.Code;



                    Purch.Insert(true);

                    /*Purch2.RESET;
                    Purch2.SETRANGE("No.",NOA."Awarded Bid No");
                    IF Purch2.FINDSET THEN BEGIN
                    Purch.COPY(NOA);
                     //Purch.VALIDATE("Invitation For Supply No",NOA."IFS Code");
                      Purch.MODIFY;
                      END;*/

                    PurchaseContractEntries.Reset;
                    PurchaseContractEntries.SetRange("NOA No", NOA.Code);
                    PurchaseContractEntries.SetRange(Archived, false);
                    if PurchaseContractEntries.FindSet then begin
                        PurchaseContractEntries.Archived := true;
                        PurchaseContractEntries."Archived By" := UserId;
                        PurchaseContractEntries."Archived On" := CreateDatetime(Today, Time);
                        PurchaseContractEntries.Modify(true);
                    end else begin
                        PurchaseContractEntries2.Reset;
                        if PurchaseContractEntries2.FindLast then
                            PurchaseContractEntries.Init;
                        PurchaseContractEntries."Entry No" := PurchaseContractEntries2."Entry No" + 1;
                        PurchaseContractEntries."NOA No" := NOA.Code;
                        PurchaseContractEntries."Created By" := UserId;
                        PurchaseContractEntries."Created On" := CreateDatetime(Today, Time);
                        PurchaseContractEntries."Professional Opinion No" := NOA."Professional Opinion ID";
                        PurchaseContractEntries."Evaluation Report No" := NOA."Final Evaluation Report ID";
                        PurchaseContractEntries."IFS Code" := NOA."IFS Code";
                        PurchaseContractEntries."Awarded Bidder No" := NOA."Awarded Bidder No.";
                        PurchaseContractEntries."Awarded Bidder Name" := NOA."Awarded Bidder Name";
                        PurchaseContractEntries."Awarded Bid Sum" := NOA."Award Tender Sum Inc Taxes";
                        PurchaseContractEntries."Awarded Bid No" := NOA."Awarded Bid No";
                        PurchaseContractEntries."Tender Name" := NOA."Tender Name";
                        PurchaseContractEntries."Purchase Agreement Type" := PurchaseContractEntries."purchase agreement type"::"LPO/LSO";
                        PurchaseContractEntries."Purchase Agreement No" := Purch."No.";
                        IFSE.Reset;
                        IFSE.SetRange(Code, NOA."IFS Code");
                        if IFSE.FindSet then begin
                            PurchaseContractEntries."PRN No" := IFSE."PRN No.";
                        end;
                        PurchaseContractEntries.Insert(true);
                    end;

                    PurchLines.Reset;
                    PurchLines.SetRange("Document No.", Purch."No.");
                    if PurchLines.FindSet then begin
                        PurchLines.DeleteAll;
                    end;
                    IFSLines.Reset;
                    IFSLines.SetRange("Document No.", NOA."Awarded Bid No");
                    if IFSLines.FindSet then begin
                        repeat

                            PurchLines.Init;
                            PurchLines.TransferFields(IFSLines);
                            PurchLines."Document Type" := PurchLines."document type"::Order;
                            //update
                            PurchLines."Qty. to Invoice" := IFSLines.Quantity;
                            PurchLines."Qty. Invoiced (Base)" := IFSLines.Quantity;
                            PurchLines."Quantity (Base)" := IFSLines.Quantity;
                            PurchLines."Outstanding Qty. (Base)" := IFSLines.Quantity;
                            PurchLines."Qty. to Invoice (Base)" := IFSLines.Quantity;
                            PurchLines."Qty. to Receive (Base)" := IFSLines.Quantity;
                            PurchLines."Qty. Rcd. Not Invoiced (Base)" := IFSLines.Quantity;
                            PurchLines."Qty. Received (Base)" := IFSLines.Quantity;
                            PurchLines."Qty. Received (Base)" := IFSLines.Quantity;
                            PurchLines."Qty. to Receive" := IFSLines.Quantity;
                            PurchLines."Pay-to Vendor No." := NOA."Awarded Bidder No.";
                            PurchLines."Buy-from Vendor No." := NOA."Awarded Bidder No.";

                            ///
                            //    noalines.Reset;
                            //   noalines.SetRange("Tabulation ID",NOA.Code);
                            //   if noalines.FindSet then begin
                            //   PurchLines.Country:=noalines.Country;
                            //   PurchLines.Manufacturer:=noalines.Manufacturer;
                            //   PurchLines."AGPO Category":=noalines."AGPO Category";
                            //   PurchLines."AGPO Certficate Number":=noalines."AGPO Certficate Number";
                            //   PurchLines.Classification:=noalines.Classification;
                            //   end;

                            // PurchLines.Description:=IFSLines.Description+' ' +IFSLines."Technical Specifications";
                            PurchLines."Document No." := Purch."No.";
                            //posting groups
                            MyItem.Reset;
                            MyItem.SetRange("No.", PurchLines."No.");
                            if MyItem.FindSet then begin
                                PurchLines."Gen. Prod. Posting Group" := MyItem."Gen. Prod. Posting Group";
                            end;
                            MyVendor.Reset;
                            MyVendor.SetRange("No.", NOA."Awarded Bidder No.");
                            if MyVendor.FindSet then begin
                                PurchLines."Gen. Bus. Posting Group" := MyVendor."Gen. Bus. Posting Group";
                            end;
                            //posting groups
                            if UserSetup22.Get(UserId) then begin
                                Employee22.Reset;
                                Employee22.SetRange("No.", UserSetup22."Employee No.");
                                if Employee22.FindSet then begin
                                    PurchLines."Shortcut Dimension 1 Code" := Employee22."Global Dimension 1 Code";
                                    PurchLines."Shortcut Dimension 2 Code" := Employee22."Global Dimension 2 Code";
                                end;
                            end;
                            PurchLines.Insert(true);


                        until IFSLines.Next = 0;
                    end;



                    Page.Run(50, Purch);

                end;
                /////
                //     IFSList.Reset;
                // IFSList.SetRange(Code,NOA."IFS Code");
                // if IFSList.FindSet then begin
                // PurchaseHead.Reset;
                // PurchaseHead.SetRange("No.",IFSList."PRN No.");
                // if PurchaseHead.FindSet then begin
                // FnUncommitPRN(PurchaseHead);
                // end;
                // end;
                // PurchaseH.Reset;
                // PurchaseH.SetRange("No.",Purch."No.");
                // if PurchaseH.FindSet then begin
                // //REPEAT
                // FnLPOCommittment(PurchaseH);
                // //UNTIL PurchaseH.NEXT=0
                // end;
                ///
            end;
            if optionselected = 1 then begin
                //Mtr
                //if purchase order
                if NOA.Appealed = true then begin
                    Error('You cannot generate a contract, There is an ongoing Appeal Process');
                end;
                if (NOA."Award Acceptance Response" > Today) or (NOA."Award Acceptance Response" = Today) then begin
                    Error('Acceptance Period has not lapsed, You can only generate a contract after the acceptance deadline');
                end;
                //fnchecktendersecurity(NOA);
                Vendor.Reset;
                Vendor.SetRange("No.", NOA."Awarded Bidder No.");
                if Vendor.FindSet then begin
                    Purch.Init;
                    Purch."Document Type" := Purch."document type"::"Blanket Order";
                    Purch."Awarded Bid No" := NOA."Awarded Bid No";
                    Purch."Buy-from Vendor No." := NOA."Awarded Bidder No.";
                    Purch."Award Tender Sum Inc Taxes" := NOA."Award Tender Sum Inc Taxes";
                    Purch."Invitation For Supply No" := NOA."IFS Code";
                    Purch.Validate("Buy-from Vendor No.", NOA."Awarded Bidder No.");
                    Purch."Building/House No" := Vendor."Building/House No";
                    Purch."Plot No" := Vendor."Plot No";
                    Purch.Street := Vendor.Street;
                    Purch."Nature of Business" := Vendor."Nature of Business";
                    Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
                    Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
                    Purch."Max Value of Business" := Vendor."Max Value of Business";
                    Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
                    Purch."Business Type" := Vendor."Business Type";
                    Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
                    Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
                    IFS.Reset;
                    IFS.SetRange(Code, NOA."IFS Code");
                    if IFS.FindSet then begin
                        //Purch.INIT;


                        Purch."Bid Envelope Type" := IFS."Bid Envelop Type";
                        Purch."Tender Description" := IFS."Tender Summary";
                        Purch."Responsibility Center" := IFS."Responsibility Center";
                        Purch.Validate("Location Code", IFS."Location Code");
                        Purch."Language Code" := IFS."Language Code";
                        Purch.Validate("Purchaser Code", IFS."Purchaser Code");
                        Purch."Currency Code" := IFS."Currency Code";
                        Purch."IFS Code" := NOA."IFS Code";
                        Purch."Bid Charge Code" := IFS."Bid Charge Code";
                        Purch."Bid Charge (LCY)" := IFS."Bid Charge (LCY)";
                        Purch."Works Category" := IFS."Works Category";
                        Purch."Road Code" := IFS."Road Code";
                        Purch."Link Name" := IFS."Road Link Name";
                        Purch.Consitituency := IFS."Constituency ID";
                        Purch."Engineer Estimate (LCY)" := IFS."Engineer Estimate (LCY)";
                        //Purch."Max Works Completion Duration":=IFS."Max Works Completion Duration";
                        Purch."Max Works Kickoff Duration" := IFS."Max Works Kickoff Duration";
                        Purch."Max Works Charter Duration" := IFS."Max Works Charter Duration";
                        Purch.Validate("Payment Terms Code", IFS."Payment Terms Code");
                        //Purch."Defects Liability Period":=IFS."Defects Liability Period";
                        Purch."Daily Liquidated Dam Unit Cost" := IFS."Daily Liquidated Dam Unit Cost";
                        Purch."Liquidated Damages Limit %" := IFS."Liquidated Damages Limit %";
                        Purch."Payment Retention %" := IFS."Payment Retention %";
                        Purch."Retention Amount Limit %" := IFS."Retention Amount Limit %";
                        Purch."Min Interim Certificate Amount" := IFS."Min Interim Certificate Amount";
                    end;
                    CompanyInfo.Get;
                    Purch."Procuring Entity (PE) Name" := CompanyInfo.Name;


                    Purch."Contract Description" := NOA."Tender Name";
                    Purch."Contract Start Date" := NOA."Document Date";
                    Purch."Tender Name" := NOA."Tender Name";
                    Purch."Notice of Award No." := NOA.Code;



                    Purch.Insert(true);

                    /*Purch2.RESET;
                    Purch2.SETRANGE("No.",NOA."Awarded Bid No");
                    IF Purch2.FINDSET THEN BEGIN
                    Purch.COPY(NOA);
                     //Purch.VALIDATE("Invitation For Supply No",NOA."IFS Code");
                      Purch.MODIFY;
                      END;*/
                    PurchaseContractEntries.Reset;
                    PurchaseContractEntries.SetRange("NOA No", NOA.Code);
                    PurchaseContractEntries.SetRange(Archived, false);
                    if PurchaseContractEntries.FindSet then begin
                        PurchaseContractEntries.Archived := true;
                        PurchaseContractEntries."Archived By" := UserId;
                        PurchaseContractEntries."Archived On" := CreateDatetime(Today, Time);
                        PurchaseContractEntries.Modify(true);
                    end else begin
                        PurchaseContractEntries2.Reset;
                        if PurchaseContractEntries2.FindLast then
                            PurchaseContractEntries.Init;
                        PurchaseContractEntries."Entry No" := PurchaseContractEntries2."Entry No" + 1;
                        PurchaseContractEntries."NOA No" := NOA.Code;
                        PurchaseContractEntries."Created By" := UserId;
                        PurchaseContractEntries."Created On" := CreateDatetime(Today, Time);
                        PurchaseContractEntries."Professional Opinion No" := NOA."Professional Opinion ID";
                        PurchaseContractEntries."Evaluation Report No" := NOA."Final Evaluation Report ID";
                        PurchaseContractEntries."IFS Code" := NOA."IFS Code";
                        PurchaseContractEntries."Awarded Bidder No" := NOA."Awarded Bidder No.";
                        PurchaseContractEntries."Awarded Bidder Name" := NOA."Awarded Bidder Name";
                        PurchaseContractEntries."Awarded Bid Sum" := NOA."Award Tender Sum Inc Taxes";
                        PurchaseContractEntries."Awarded Bid No" := NOA."Awarded Bid No";
                        PurchaseContractEntries."Tender Name" := NOA."Tender Name";
                        PurchaseContractEntries."Purchase Agreement Type" := PurchaseContractEntries."purchase agreement type"::Contract;
                        PurchaseContractEntries."Purchase Agreement No" := Purch."No.";
                        IFSE.Reset;
                        IFSE.SetRange(Code, NOA."IFS Code");
                        if IFSE.FindSet then begin
                            PurchaseContractEntries."PRN No" := IFSE."PRN No.";
                        end;
                        PurchaseContractEntries.Insert(true);
                    end;



                    PurchLines.Reset;
                    PurchLines.SetRange("Document No.", Purch."No.");
                    if PurchLines.FindSet then begin
                        PurchLines.DeleteAll;
                    end;
                    IFSLines.Reset;
                    IFSLines.SetRange("Document No.", NOA."Awarded Bid No");
                    if IFSLines.FindSet then begin
                        repeat

                            PurchLines.Init;
                            PurchLines.TransferFields(IFSLines);
                            PurchLines."Document Type" := PurchLines."document type"::"Blanket Order";
                            // PurchLines.Description:=IFSLines.Description+' ' +IFSLines."Technical Specifications";
                            PurchLines."Document No." := Purch."No.";

                            PurchLines."Pay-to Vendor No." := NOA."Awarded Bidder No.";
                            PurchLines."Buy-from Vendor No." := NOA."Awarded Bidder No.";
                            //posting groups
                            MyItem.Reset;
                            MyItem.SetRange("No.", PurchLines."No.");
                            if MyItem.FindSet then begin
                                PurchLines."Gen. Prod. Posting Group" := MyItem."Gen. Prod. Posting Group";
                            end;
                            MyVendor.Reset;
                            MyVendor.SetRange("No.", NOA."Awarded Bidder No.");
                            if MyVendor.FindSet then begin
                                PurchLines."Gen. Bus. Posting Group" := MyVendor."Gen. Bus. Posting Group";
                            end;
                            //posting groups
                            if UserSetup22.Get(UserId) then begin
                                Employee22.Reset;
                                Employee22.SetRange("No.", UserSetup22."Employee No.");
                                if Employee22.FindSet then begin
                                    PurchLines."Shortcut Dimension 1 Code" := Employee22."Global Dimension 1 Code";
                                    PurchLines."Shortcut Dimension 2 Code" := Employee22."Global Dimension 2 Code";
                                end;
                            end;
                            PurchLines.Insert(true);
                        /*PurchLines.VALIDATE("Document Type",PurchLines."Document Type"::"Blanket Order");
                        PurchLines.VALIDATE("Document No.",Purch."No.");
                        PurchLines.VALIDATE("Line No.",IFSLines."Line No.");
                        PurchLines.VALIDATE(Type,IFSLines.Type);
                        PurchLines.VALIDATE("No.",IFSLines."No.");
                        PurchLines.VALIDATE(Description,IFSLines.Description);
                        PurchLines.VALIDATE(Quantity,IFSLines.Quantity);
                        PurchLines.VALIDATE("Unit of Measure Code",IFSLines."Unit of Measure Code");
                        PurchLines.VALIDATE("Shortcut Dimension 1 Code",IFSLines."Shortcut Dimension 1 Code");
                        PurchLines.VALIDATE("Shortcut Dimension 2 Code",IFSLines."Shortcut Dimension 2 Code");
                        //PurchLines.VALIDATE("Variant Code",IFSLines."Variant Code");
                        PurchLines.VALIDATE("Dimension Set ID",IFSLines."Dimension Set ID");
                        PurchLines.VALIDATE("Item Category",IFSLines."Item Category");
                        IF PurchLines.INSERT(TRUE) THEN BEGIN
                        PurchLines.VALIDATE("No.",IFSLines."No.");
                        PurchLines.MODIFY;
              END;*/

                        /* PurchLines.INIT;
                        PurchLines."Document Type":=PurchLines."Document Type"::"Blanket Order";
                         PurchLines."Document No.":=Purch."No.";
                         PurchLines."Line No.":=IFSLines."Line No.";
                         PurchLines."Buy-from Vendor No.":=Purch."Buy-from Vendor No.";
                         PurchLines.Type:=IFSLines.Type;
                         PurchLines."No.":=IFSLines."No.";
                         //PurchLines."Location Code":=IFSLines.
                         //PurchLines."Posting Group":=IFSLines
                         PurchLines.VALIDATE(Description,IFSLines.Description);
                         PurchLines."Description 2":=IFSLines.Description;
                         //PurchLines."Unit of Measure":=IFSLines."Unit of Measure Code";
                         //PurchLines.VALIDATE(PurchLines.Quantity,IFSLines.Quantity);
                         PurchLines.Quantity:=IFSLines.Quantity;
                         PurchLines.Amount:=IFSLines."Amount Excl. VAT";
                         PurchLines."Unit of Measure Code":=IFSLines."Unit of Measure Code";
                         PurchLines."Shortcut Dimension 1 Code":=IFSLines."Shortcut Dimension 2 Code";
                         PurchLines."Shortcut Dimension 2 Code":=IFSLines."Shortcut Dimension 2 Code";
                         PurchLines."Variant Code":=IFSLines."Variant Code";
                         PurchLines."Dimension Set ID":=IFSLines."Dimension Set ID";
                         PurchLines."Item Category":=IFSLines."Item Category";
                         PurchLines.INSERT(TRUE);*/

                        until IFSLines.Next = 0;
                    end;
                    //committments......................



                    //committments.......................
                    //Contract securities
                    /*BidContractSecurity.RESET;
                    BidContractSecurity.SETRANGE("No.",NOA."Awarded Bid No");
                    IF BidContractSecurity.FINDSET THEN BEGIN
                    REPEAT
                    ContractSecurity.INIT;
                    ContractSecurity.TRANSFERFIELDS(BidContractSecurity);
                    ContractSecurity."No.":=Purch."No.";
                    ContractSecurity.INSERT(TRUE);
                    UNTIL BidContractSecurity.NEXT=0;
                    END;*/




                    //END;

                    Page.Run(75284, Purch);
                end;
                //   IFSList.Reset;
                // IFSList.SetRange(Code,NOA."IFS Code");
                // if IFSList.FindSet then begin
                // PurchaseHead.Reset;
                // PurchaseHead.SetRange("No.",IFSList."PRN No.");
                // if PurchaseHead.FindSet then begin
                // FnUncommitPRN(PurchaseHead);
                // end;
                // end;
                // PurchaseH.Reset;
                // PurchaseH.SetRange("No.",Purch."No.");
                // if PurchaseH.FindSet then begin
                // FnLPOCommittment(PurchaseH);
                // end;
            end;
        end;
        Message(Text002, Purch."No.");

    end;

    procedure FnSendSpecialRFQInvitation(IFS: Record "Standard Purchase Code"; ObjVend: Record Vendor)
    var
        IFSList: Record "Standard Purchase Code";
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectoryQ: Text[100];
        FileNameQ: Text[100];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        CustQ: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        ////DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmailQ: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];

        Password: Text[50];
        ActivationDetails: Text[1000];
        RFQReqVendors: Record "Standard Vendor Purchase Code";
        StandardPurchaseCode: Record "Standard Purchase Code";
        RFQReqVendors1: Record "Standard Vendor Purchase Code";
        FileDirectoryX: Text[100];
        FileNameX: Text[100];
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        ///Notifying Procurement Team on supplier Request


        IFS.TestField("Bid Scoring Template");
        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;
        RFQReqVendors.Reset;
        RFQReqVendors.SetRange(RFQReqVendors.Code, IFS.Code);
        RFQReqVendors.SetRange("Invitation Email Sent", false);
        if RFQReqVendors.FindSet then begin
            repeat
                RFQReqVendors.TestField("Primary Email");
                RequesterEmail := RFQReqVendors."Primary Email";
                RequesterName := RFQReqVendors."Vendor Name";

                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := PPayableSetup."Default Proc Email Contact";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'Dear: ' + RequesterName;
                SenderMessage := '<BR>You are hereby invited to submit your Bid Response for the Request for Quotation: ' + IFS.Code + ' That is summarized as follows:</BR>';
                SupplierDetails := '<BR>RFQ Invitation Notice Number: ' + IFS.Code + '</BR>' + '<BR> Description: ' + IFS.Description + '</BR>' +
                '<BR>Submission Due Date: ' + Format(IFS."Submission End Date") + '</BR>' +
                '<BR>Submission Due Time: ' + Format(IFS."Submission End Time") + '</BR>' +
                '<BR>Procuring Entity Name: ' + IFS."Procuring Entity Name/Contact" + '</BR>';
                LoginDetails := 'Kindly find the attached request for quotation for your action+' + '</BR>' +
                ' Your response should be DROPPED IN THE QUOTATION BOX  before the deadline as indicated on the instructions.' + '</BR>' +
                'Please acknowledge receipt of this quotation.' + '</BR>';
                ProcNote := '<BR> If you require any assistance, please contact our Supply Chain Management Team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";
                //   FileDirectory :='C:\DOCS\RFQ.pdf';
                //   FileName := 'RFQ.pdf';
                //   FileDirectoryX:='\\41.89.47.11\CUENAV_BACKUP\CUENAV_Documents\'+COMPANYNAME+'\Request For Quotation (RFQ) Card\'+IFS.Code+'\';
                //   FileNameX:='Appendix.pdf';

                //   IFSList.Reset;
                //   IFSList.SetRange(Code,IFS.Code);
                //   if IFSList.FindSet then begin
                //    RFQReqVendors1.Reset;
                //    RFQReqVendors1.SetRange(Code,IFSList.Code);
                //    RFQReqVendors1.SetRange("Vendor No.",RFQReqVendors."Vendor No.");
                //    if RFQReqVendors1.FindSet then begin

                //          Report.SaveAsPdf(70140,FileDirectory,RFQReqVendors1);
                //    end;
                //   end;
                if CustEmail = '' then
                    exit;
                //REPEAT
                //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                emailhdr := 'Invitation Notice for Request for Quotation(RFQ) Reference No: (' + IFS.Code + ')';


                EmailMessage.Create(RequesterEmail, emailhdr,
                CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                // cu400.AddCC(SenderAddress);
                // cu400.AddAttachment(FileDirectory,FileName);
                // if IFS."Has an Email Attachment ?"=true then begin
                // cu400.AddAttachment(FileDirectoryX+FileNameX,FileNameX);
                //   end;
                // cu400.AppendBody(ProcNote);


                // cu400.Send;
                SendingDate := Today;
                SendingTime := Time;
                RFQReqVendors."Invitation Email Sent" := true;
                RFQReqVendors."Date/Time Notified" := CurrentDatetime;
                RFQReqVendors.Modify(true);


            //SLEEP(1000);
            //Window.CLOSE;
            // UNTIL RFQReqVendors.NEXT=0;
            until RFQReqVendors.Next = 0;
        end;
        //END;
        Message('RFQ Sent Successfully');
    end;

    procedure PostNoticeOfAWardIndividualWards1(NOA: Record "Bid Tabulation Header")
    var
        PurchaseHd: Record "Purchase Header";
        PurchaseH: Record "Purchase Header";
        PurchaseHead: Record "Purchase Header";
        Procurement: Codeunit "Procurement Processing";
        IFSList: Record "Standard Purchase Code";
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        Purch: Record "Purchase Header";
        CopyPurchDoc: Report "Copy Purchase Document";
        Purch2: Record "Purchase Header";
        PurchLines: Record "Purchase Line";
        PurchLines1: Record "Purchase Line";
        Purch3: Record "Purchase Header";
        IFS: Record "Standard Purchase Code";
        CompanyInfo: Record "Company Information";
        IFSLines: Record "Purchase Line";
        ContractSecurity: Record "Bid_Contract Security Register";
        BidContractSecurity: Record "Bid_Contract Security Register";
        PurchaseContractEntries: Record "Purchase Contract Entries";
        PurchaseContractEntries2: Record "Purchase Contract Entries";
        IFSE: Record "Standard Purchase Code";
        CostComparisonSheet1: Record "Cost Comparison Sheet";
        CostComparisonSheet: Record "Cost Comparison Sheet";
        Value: Code[20];
        PayablesSetup: Record "Purchases & Payables Setup";
    begin


        if Confirm('Are you sure you want to Generate LPO/LSO or Contracts?', true) then begin
            //CostComparisonSheet.SETCURRENTKEY();
            CostComparisonSheet.Reset;
            CostComparisonSheet.SetRange("Bid Evaluation Register", NOA."Finance Bid Evaluation Registe");
            CostComparisonSheet.SetRange("IFS Code", NOA."IFS Code");
            CostComparisonSheet.SetRange(Awarded, true);
            CostComparisonSheet.SetRange("Order Created", false);
            if CostComparisonSheet.FindSet then begin
                repeat

                    Value := PurchHeaderExist(CostComparisonSheet);
                    // MESSAGE('Value is %1',Value);
                    if Value <> '' then begin
                        // MESSAGE('%1',Value);
                        PurchaseHd.Reset;
                        PurchaseHd.SetRange("Document Type", PurchaseHd."document type"::Order);
                        PurchaseHd.SetRange(Status, PurchaseHd.Status::Open);
                        PurchaseHd.SetRange("Invitation For Supply No", NOA."IFS Code");
                        PurchaseHd.SetRange("Buy-from Vendor No.", CostComparisonSheet."Buy-from Vendor No.");
                        PurchaseHd.SetRange("No.", Value);
                        if PurchaseHd.FindSet then
                            //daudi
                            /* CostComparisonSheet1.RESET;
                             CostComparisonSheet1.SETRANGE("Buy-from Vendor No.",PurchaseHd."Buy-from Vendor No.");
                             CostComparisonSheet1.SETRANGE("IFS Code",PurchaseHd."Invitation For Supply No");
                             CostComparisonSheet1.SETRANGE(Awarded,TRUE);
                             CostComparisonSheet1.SETRANGE("Order Created",FALSE);
                             IF CostComparisonSheet1.FINDSET THEN BEGIN
                               REPEAT*/
                            //Add Lines
                            PurchLines.Init;
                        //PurchLines.TRANSFERFIELDS(IFSLines);
                        PurchLines."Document Type" := PurchLines."document type"::Order;
                        // PurchLines.Description:=IFSLines.Description+' ' +IFSLines."Technical Specifications";
                        PurchLines."Document No." := PurchaseHd."No.";
                        PurchLines."Line No." := CostComparisonSheet."Line No.";
                        PurchLines.Type := CostComparisonSheet.Type;
                        PurchLines."No." := CostComparisonSheet."No.";
                        PurchLines."Pay-to Vendor No." := CostComparisonSheet."Buy-from Vendor No.";
                        PurchLines."Buy-from Vendor No." := CostComparisonSheet."Buy-from Vendor No.";
                        PurchLines.Description := CostComparisonSheet.Description;
                        PurchLines."Technical Specifications" := CostComparisonSheet."Technical Specifications";
                        //  PurchLines."Location Code":=CostComparisonSheet."Location Code";
                        PurchLines."Unit of Measure" := CostComparisonSheet."Unit of Measure";
                        PurchLines."Unit of Measure Code" := CostComparisonSheet."Unit of Measure Code";
                        PurchLines.Quantity := CostComparisonSheet.Quantity;
                        PurchLines."Qty. to Invoice" := CostComparisonSheet.Quantity;
                        PurchLines."Qty. to Receive" := CostComparisonSheet.Quantity;
                        PurchLines.Validate(Quantity);
                        PurchLines."Direct Unit Cost" := CostComparisonSheet."Direct Unit Cost";
                        PurchLines."Amount Including VAT" := CostComparisonSheet."Amount Including VAT";
                        PurchLines."Line Amount" := CostComparisonSheet."Amount Including VAT";
                        //posting groups
                        MyItem.Reset;
                        MyItem.SetRange("No.", CostComparisonSheet."No.");
                        if MyItem.FindSet then begin
                            PurchLines."Gen. Prod. Posting Group" := MyItem."Gen. Prod. Posting Group";
                        end;
                        MyVendor.Reset;
                        MyVendor.SetRange("No.", CostComparisonSheet."Buy-from Vendor No.");
                        if MyVendor.FindSet then begin
                            PurchLines."Gen. Bus. Posting Group" := MyVendor."Gen. Bus. Posting Group";
                        end;
                        //posting groups
                        PurchLines."VAT %" := CostComparisonSheet."VAT %";
                        PurchLines."Line Discount %" := CostComparisonSheet."Line Discount %";
                        PurchLines."Line Discount Amount" := CostComparisonSheet."Line Discount Amount";
                        PurchLines."Shortcut Dimension 1 Code" := CostComparisonSheet."Shortcut Dimension 1 Code";
                        PurchLines."Shortcut Dimension 2 Code" := CostComparisonSheet."Shortcut Dimension 2 Code";
                        PurchLines."Procurement Plan ID" := CostComparisonSheet."Procurement Plan ID";
                        PurchLines."PP Planning Category" := CostComparisonSheet."PP Planning Category";
                        PurchLines."PP Funding Source ID" := CostComparisonSheet."PP Funding Source ID";
                        PurchLines."PP Preference/Reservation Code" := CostComparisonSheet."PP Preference/Reservation Code";
                        PurchLines."PP Procurement Method" := CostComparisonSheet."PP Procurement Method";
                        PurchLines."PP Solicitation Type" := CostComparisonSheet."PP Solicitation Type";
                        PurchLines."PP Total Actual Costs" := CostComparisonSheet."PP Total Actual Costs";
                        PurchLines."PP Total Available Budget" := CostComparisonSheet."PP Total Available Budget";
                        PurchLines."PP Total Budget" := CostComparisonSheet."PP Total Budget";
                        PurchLines."PP Total Commitments" := CostComparisonSheet."PP Total Commitments";
                        PurchLines."Procurement Plan Entry No" := CostComparisonSheet."Procurement Plan Entry No";
                        PurchLines."Job No." := CostComparisonSheet."Job No";
                        PurchLines."Job Task No." := CostComparisonSheet."Job Task No";
                        PurchLines.Amount := CostComparisonSheet.Amount;
                        PurchLines."Unit Cost (LCY)" := CostComparisonSheet."Unit Cost (LCY)";
                        if PurchLines.Insert(true) then begin
                            CostComparisonSheet."Order Created" := true;
                            //insert contract
                            //  PurchLines.VALIDATE(Quantity);
                            PurchaseContractEntries2.Reset;
                            if PurchaseContractEntries2.FindLast then
                                PurchaseContractEntries.Init;
                            PurchaseContractEntries."Entry No" := PurchaseContractEntries2."Entry No" + 1;
                            PurchaseContractEntries."NOA No" := NOA.Code;
                            PurchaseContractEntries."Created By" := UserId;
                            PurchaseContractEntries."Created On" := CreateDatetime(Today, Time);
                            PurchaseContractEntries."Professional Opinion No" := NOA."Professional Opinion ID";
                            PurchaseContractEntries."Evaluation Report No" := NOA."Final Evaluation Report ID";
                            PurchaseContractEntries."IFS Code" := NOA."IFS Code";
                            PurchaseContractEntries."Awarded Bidder No" := CostComparisonSheet1."Buy-from Vendor No.";
                            PurchaseContractEntries."Awarded Bidder Name" := CostComparisonSheet1."Bidder Name";
                            PurchaseContractEntries."Awarded Bid Sum" := CostComparisonSheet1.Amount;
                            //PurchaseContractEntries."Awarded Bid No":=NOA."Awarded Bid No";
                            PurchaseContractEntries."Tender Name" := NOA."Tender Name" + '(' + CostComparisonSheet1.Description + ')';
                            PurchaseContractEntries."Purchase Agreement Type" := PurchaseContractEntries."purchase agreement type"::"LPO/LSO";
                            PurchaseContractEntries."Purchase Agreement No" := PurchaseHd."No.";
                            IFSE.Reset;
                            IFSE.SetRange(Code, NOA."IFS Code");
                            if IFSE.FindSet then begin
                                PurchaseContractEntries."PRN No" := IFSE."PRN No.";
                            end;
                            PurchaseContractEntries.Insert(true);

                        end;
                        //UNTIL CostComparisonSheet1.NEXT=0;
                        //END;

                    end else begin
                        //Insert Po

                        Purch.Init;
                        Purch."Document Type" := Purch."document type"::Order;
                        PayablesSetup.Get;
                        Purch."No." := NoSeriesManagement.GetNextNo(PayablesSetup."Order Nos.", Today, true);
                        Purch.Validate("Buy-from Vendor No.", CostComparisonSheet."Buy-from Vendor No.");
                        // MESSAGE('Item No%1 LPO%2',CostComparisonSheet."No.",Purch."No.");
                        Purch."Awarded Bid No" := CostComparisonSheet."Buy-from Vendor No.";
                        //Purch."Awarded Bid No":=NOA."Awarded Bidder No.";
                        // Purch."Award Tender Sum Inc Taxes":=NOA."Award Tender Sum Inc Taxes";
                        Purch."Invitation For Supply No" := NOA."IFS Code";
                        Vendor.Reset;
                        Vendor.SetRange("No.", CostComparisonSheet."Buy-from Vendor No.");
                        if Vendor.FindSet then
                            Purch."Building/House No" := Vendor."Building/House No";
                        Purch."Plot No" := Vendor."Plot No";
                        Purch.Street := Vendor.Street;
                        Purch."Nature of Business" := Vendor."Nature of Business";
                        Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
                        Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
                        Purch."Max Value of Business" := Vendor."Max Value of Business";
                        Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
                        Purch."Business Type" := Vendor."Business Type";
                        Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
                        Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
                        IFS.Reset;
                        IFS.SetRange(Code, NOA."IFS Code");
                        if IFS.FindSet then begin
                            Purch."Bid Envelope Type" := IFS."Bid Envelop Type";
                            Purch."Requisition No" := IFS."PRN No.";
                            Purch."Purchaser Code" := IFS."Purchaser Code";
                            Purch.Validate("Purchaser Code", IFS."Purchaser Code");
                            Purch."Procurement Plan ID" := IFS."Procurement Plan ID";
                            Purch."Procurement Plan Entry No" := IFS."Procurement Plan Entry No";
                            Purch."Tender Description" := IFS."Tender Summary";
                            Purch."Responsibility Center" := IFS."Responsibility Center";
                            Purch.Validate("Location Code", IFS."Location Code");
                            Purch."Language Code" := IFS."Language Code";
                            Purch.Validate("Purchaser Code", IFS."Purchaser Code");
                            Purch."Currency Code" := IFS."Currency Code";
                            Purch."IFS Code" := NOA."IFS Code";
                            Purch."Bid Charge Code" := IFS."Bid Charge Code";
                            Purch."Bid Charge (LCY)" := IFS."Bid Charge (LCY)";
                            Purch."Works Category" := IFS."Works Category";
                            Purch."Road Code" := IFS."Road Code";
                            Purch."Link Name" := IFS."Road Link Name";
                            Purch.Consitituency := IFS."Constituency ID";
                            Purch."Engineer Estimate (LCY)" := IFS."Engineer Estimate (LCY)";
                            //Purch."Max Works Completion Duration":=IFS."Max Works Completion Duration";
                            Purch."Max Works Kickoff Duration" := IFS."Max Works Kickoff Duration";
                            Purch."Max Works Charter Duration" := IFS."Max Works Charter Duration";
                            Purch.Validate("Payment Terms Code", IFS."Payment Terms Code");
                            //Purch."Defects Liability Period":=IFS."Defects Liability Period";
                            Purch."Daily Liquidated Dam Unit Cost" := IFS."Daily Liquidated Dam Unit Cost";
                            Purch."Liquidated Damages Limit %" := IFS."Liquidated Damages Limit %";
                            Purch."Payment Retention %" := IFS."Payment Retention %";
                            Purch."Retention Amount Limit %" := IFS."Retention Amount Limit %";
                            Purch."Min Interim Certificate Amount" := IFS."Min Interim Certificate Amount";
                        end;
                        CompanyInfo.Get;
                        Purch."Procuring Entity (PE) Name" := CompanyInfo.Name;


                        Purch."Contract Description" := NOA."Tender Name";
                        Purch."Contract Start Date" := NOA."Document Date";
                        Purch."Tender Name" := NOA."Tender Name";
                        Purch."Notice of Award No." := NOA.Code;

                        if Purch.Insert(true) then begin

                            PurchLines.Init;
                            //PurchLines.TRANSFERFIELDS(IFSLines);
                            PurchLines."Document Type" := PurchLines."document type"::Order;
                            // PurchLines.Description:=IFSLines.Description+' ' +IFSLines."Technical Specifications";
                            PurchLines."Document No." := Purch."No.";
                            PurchLines."Line No." := CostComparisonSheet."Line No.";
                            PurchLines."Pay-to Vendor No." := CostComparisonSheet."Buy-from Vendor No.";
                            PurchLines."Buy-from Vendor No." := CostComparisonSheet."Buy-from Vendor No.";
                            PurchLines.Type := CostComparisonSheet.Type;
                            PurchLines."No." := CostComparisonSheet."No.";
                            PurchLines.Description := CostComparisonSheet.Description;
                            PurchLines."Technical Specifications" := CostComparisonSheet."Technical Specifications";
                            PurchLines."Location Code" := CostComparisonSheet."Location Code";
                            PurchLines."Unit of Measure" := CostComparisonSheet."Unit of Measure";
                            PurchLines."Unit of Measure Code" := CostComparisonSheet."Unit of Measure Code";
                            PurchLines.Quantity := CostComparisonSheet.Quantity;
                            PurchLines.Validate(Quantity);
                            PurchLines."Direct Unit Cost" := CostComparisonSheet."Direct Unit Cost";
                            //posting groups
                            MyItem.Reset;
                            MyItem.SetRange("No.", CostComparisonSheet."No.");
                            if MyItem.FindSet then begin
                                PurchLines."Gen. Prod. Posting Group" := MyItem."Gen. Prod. Posting Group";
                            end;
                            MyVendor.Reset;
                            MyVendor.SetRange("No.", CostComparisonSheet."Buy-from Vendor No.");
                            if MyVendor.FindSet then begin
                                PurchLines."Gen. Bus. Posting Group" := MyVendor."Gen. Bus. Posting Group";
                            end;
                            //posting groups

                            PurchLines."Amount Including VAT" := CostComparisonSheet."Amount Including VAT";
                            PurchLines."Line Amount" := CostComparisonSheet."Amount Including VAT";
                            PurchLines."VAT %" := CostComparisonSheet."VAT %";
                            PurchLines."Line Discount %" := CostComparisonSheet."Line Discount %";
                            PurchLines."Line Discount Amount" := CostComparisonSheet."Line Discount Amount";
                            PurchLines."Shortcut Dimension 1 Code" := CostComparisonSheet."Shortcut Dimension 1 Code";
                            PurchLines."Shortcut Dimension 2 Code" := CostComparisonSheet."Shortcut Dimension 2 Code";
                            PurchLines."Procurement Plan ID" := CostComparisonSheet."Procurement Plan ID";
                            PurchLines."PP Planning Category" := CostComparisonSheet."PP Planning Category";
                            PurchLines."PP Funding Source ID" := CostComparisonSheet."PP Funding Source ID";
                            PurchLines."PP Preference/Reservation Code" := CostComparisonSheet."PP Preference/Reservation Code";
                            PurchLines."PP Procurement Method" := CostComparisonSheet."PP Procurement Method";
                            PurchLines."PP Solicitation Type" := CostComparisonSheet."PP Solicitation Type";
                            PurchLines."PP Total Actual Costs" := CostComparisonSheet."PP Total Actual Costs";
                            PurchLines."PP Total Available Budget" := CostComparisonSheet."PP Total Available Budget";
                            PurchLines."PP Total Budget" := CostComparisonSheet."PP Total Budget";
                            PurchLines."PP Total Commitments" := CostComparisonSheet."PP Total Commitments";
                            PurchLines."Procurement Plan Entry No" := CostComparisonSheet."Procurement Plan Entry No";
                            PurchLines."Job No." := CostComparisonSheet."Job No";
                            PurchLines."Job Task No." := CostComparisonSheet."Job Task No";
                            PurchLines.Amount := CostComparisonSheet.Amount;
                            PurchLines."Unit Cost (LCY)" := CostComparisonSheet."Unit Cost (LCY)";
                            if PurchLines.Insert(true) then begin
                                CostComparisonSheet."Order Created" := true;
                                //insert contract
                                PurchaseContractEntries2.Reset;
                                if PurchaseContractEntries2.FindLast then
                                    PurchaseContractEntries.Init;
                                PurchaseContractEntries."Entry No" := PurchaseContractEntries2."Entry No" + 1;
                                PurchaseContractEntries."NOA No" := NOA.Code;
                                PurchaseContractEntries."Created By" := UserId;
                                PurchaseContractEntries."Created On" := CreateDatetime(Today, Time);
                                PurchaseContractEntries."Professional Opinion No" := NOA."Professional Opinion ID";
                                PurchaseContractEntries."Evaluation Report No" := NOA."Final Evaluation Report ID";
                                PurchaseContractEntries."IFS Code" := NOA."IFS Code";
                                PurchaseContractEntries."Awarded Bidder No" := CostComparisonSheet."Buy-from Vendor No.";
                                PurchaseContractEntries."Awarded Bidder Name" := CostComparisonSheet."Bidder Name";
                                PurchaseContractEntries."Awarded Bid Sum" := CostComparisonSheet.Amount;
                                //PurchaseContractEntries."Awarded Bid No":=NOA."Awarded Bid No";
                                PurchaseContractEntries."Tender Name" := NOA."Tender Name" + '(' + CostComparisonSheet.Description + ')';
                                PurchaseContractEntries."Purchase Agreement Type" := PurchaseContractEntries."purchase agreement type"::"LPO/LSO";
                                PurchaseContractEntries."Purchase Agreement No" := PurchaseHd."No.";
                                IFSE.Reset;
                                IFSE.SetRange(Code, NOA."IFS Code");
                                if IFSE.FindSet then begin
                                    PurchaseContractEntries."PRN No" := IFSE."PRN No.";
                                end;
                                PurchaseContractEntries.Insert(true);

                            end;
                        end;
                    end;
                    CostComparisonSheet.Modify(true);
                until CostComparisonSheet.Next = 0;
            end;


        end;
        Message('LPO Generated Successfully');
        /////
        // IFSList.Reset;
        // IFSList.SetRange(Code, NOA."IFS Code");
        // if IFSList.FindSet then begin
        //     PurchaseHead.Reset;
        //     PurchaseHead.SetRange("No.", IFSList."PRN No.");
        //     if PurchaseHead.FindSet then begin
        //         FnUncommitPRN(PurchaseHead);
        //     end;
        // end;
        // PurchaseH.Reset;
        // PurchaseH.SetRange("No.", Purch."No.");
        // if PurchaseH.FindSet then begin
        //     //REPEAT
        //     FnLPOCommittment(PurchaseH);
        //     //UNTIL PurchaseH.NEXT=0
        // end;
        // ///

    end;

    procedure FnNotifyTenderRegretsWhereNoAward(BidTabulation: Record "Bid Tabulation Header")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        ///FileDialog: Codeunit "SMTP Test Mail";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        // cu400: Codeunit "SMTP Mail";
        ////DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        ////PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        IFSPrebidAttendees: Record "Bid Opening Bidder Attendance";
        BidTabulationLine: Record "Bid Tabulation Line";
        BidLines: Record "Bid Tabulation Line";
        BlobInStream: InStream;
        BlobOutStream: OutStream;
        Base64Convert: Codeunit "Base64 Convert";
        RecRef: RecordRef;
    begin
        ///Notifying Procurement Team on supplier Request
        BidTabulationLine.Reset;
        BidTabulationLine.SetRange("Tabulation ID", BidTabulation.Code);
        BidTabulationLine.SetRange("Evaluation Committee Recomm", BidTabulationLine."evaluation committee recomm"::Unsuccesful);
        if BidTabulationLine.FindSet then begin
            repeat

                vend.Reset;
                vend.SetRange("No.", BidTabulationLine."Bidder No");
                if vend.FindSet then begin
                    /*BidopeningRegister.RESET;
                    BidopeningRegister.SETRANGE(Code,BidOpening.Code);*/

                    CompInfo.Get;
                    HRSetup.Get;
                    PPayableSetup.Get;

                    vend.TestField("E-Mail");
                    RequesterEmail := vend."E-Mail";
                    RequesterName := vend.Name;

                    Window.Open('Notifying the Sender...');

                    WindowisOpen := true;


                    Counter := Counter + 1;

                    //Create message
                    if HRSetup."E-Mail" = '' then
                        Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                    SenderAddress := PPayableSetup."Default Proc Email Contact";

                    if PPayableSetup."Default Proc Email Contact" = '' then
                        Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                    CustEmail := PPayableSetup."Default Proc Email Contact";

                    CompanyDetails := 'Dear,  ' + RequesterName + '<BR>' + vend."No.";
                    SenderMessage := '<BR>Thank You for participating in the Tender (Reference No:' + BidTabulation.Code + ') Submitted on ' + Format(BidTabulation."Bid Opening Date") +
                    'as summarized below: </BR>';
                    SupplierDetails := '<BR>Tender invitation Notice No:' + BidTabulation."IFS Code" + '</BR>' + '<BR> Tender Name:' + BidTabulation."Tender Name" + '</BR>';
                    LoginDetails := '<BR> This is to notify you that the above mentioned tender was not successful and you have, Attached is the E-Regret Letter </BR>';


                    ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";
                    BidLines.Reset;
                    BidLines.SetRange("Tabulation ID", BidTabulation.Code);
                    BidLines.SetRange("Bidder No", BidTabulationLine."Bidder No");
                    if BidLines.FindSet then
                        FileDirectory := 'C:\DOCS\';
                    FileName := 'RegretLetter_' + BidTabulation.Code + '.pdf';
                    Report.SaveAs(70115, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                    // Report.SaveAsPdf(70115, FileDirectory + FileName, BidLines);


                    if CustEmail = '' then
                        exit;

                    //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                    emailhdr := 'Regret Letter (Reference No: ' + BidTabulation.Code + ')';

                    // cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
                    // CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);
                    // cu400.AddAttachment(FileDirectory+FileName,FileName);
                    /*IFSPrebidAttendees.RESET;
                    IFSPrebidAttendees.SETRANGE("Vendor No.",vend."No.");
                    IFSPrebidAttendees.SETRANGE(Code,BidOpening.Code);
                    IF IFSPrebidAttendees.FINDSET THEN BEGIN
                      REPEAT
                      cu400.AddCC(IFSPrebidAttendees."Representative Email");
                     IFSPrebidAttendees."Notified By Email":=TRUE;
                    IFSPrebidAttendees."Date/Time Notified":=TODAY;
                    IFSPrebidAttendees.MODIFY(TRUE);
                      UNTIL IFSPrebidAttendees.NEXT=0;
                      END;*/
                    // cu400.AddCC(CustEmail);

                    // cu400.AppendBody(ProcNote);


                    // cu400.Send;
                    SendingDate := Today;
                    SendingTime := Time;
                    /*BidTabulation.Notified:=TRUE;
                    BidTabulation."Date/Time Notified":=TODAY;
                    BidTabulation.MODIFY(TRUE);*/



                    Sleep(1000);
                    Window.Close;

                    //UNTIL vend.NEXT=0;
                end;

            until BidTabulationLine.Next = 0;
        end;
        Message('Sent');

    end;

    // procedure LPOCommittment(var PurchHeader: Record "Purchase Header")
    // var
    //     PurchaseLines: Record "Purchase Line";
    //     Committments: Record "Commitment Entries1";
    //     Item: Record Item;
    //     GLAccount: Record "G/L Account";
    //     FixedAsset: Record "Fixed Asset";
    //     EntryNo: Integer;
    //     InventoryPostingSetup: Record "Inventory Posting Setup";
    //     FixedAssetPG: Record "FA Posting Group";
    //     GenLedSetup: Record "General Ledger Setup";
    //     InventoryAccount: Code[20];
    //     AcquisitionAccount: Code[20];
    //     BudgetAmount: Decimal;
    //     Expenses: Decimal;
    //     BudgetAvailable: Decimal;
    //     CommitmentEntries: Record "Commitment Entries1";
    //     CommittedAmount: Decimal;
    //     Vendor: Record Vendor;
    //     Procurementplan: Record "Procurement Plan1";
    // begin


    //     PurchaseLines.Reset;
    //     PurchaseLines.SetRange(PurchaseLines."Document No.", PurchHeader."No.");
    //     //PurchaseLines.SETRANGE(PurchaseLines."Document Type",PurchaseLines."Document Type"::Order);
    //     if PurchaseLines.FindFirst then begin
    //         if Committments.FindLast then
    //             EntryNo := Committments."Entry No";
    //         repeat
    //             Committments.Init;
    //             Committments."Commitment No" := PurchHeader."No.";
    //             Committments.Type := Committments.Type::Committed;
    //             // PurchHeader.VALIDATE("Order Date");
    //             if PurchHeader."Order Date" = 0D then
    //                 Error('Please enter the order date');
    //             Committments."Commitment Date" := PurchHeader."Order Date";
    //             Committments."Global Dimension 1 Code" := PurchaseLines."Shortcut Dimension 1 Code";
    //             Committments."Global Dimension 2 Code" := PurchaseLines."Shortcut Dimension 2 Code";
    //             //Case of G/L Account,Item,Fixed Asset
    //             case PurchaseLines.Type of
    //                 PurchaseLines.Type::Item:
    //                     begin
    //                         Item.Reset;
    //                         if Item.Get(PurchaseLines."No.") then
    //                             if Item."Inventory Posting Group" = '' then
    //                                 Error('Assign Posting Group to Item No %1', Item."No.");
    //                         InventoryPostingSetup.Get(PurchaseLines."Location Code", Item."Inventory Posting Group");
    //                         InventoryAccount := InventoryPostingSetup."Inventory Account";
    //                         Committments.GLAccount := InventoryAccount;
    //                     end;
    //                 PurchaseLines.Type::"G/L Account":
    //                     begin
    //                         Committments.GLAccount := PurchaseLines."No.";
    //                     end;
    //                 PurchaseLines.Type::"Fixed Asset":
    //                     begin
    //                         if FixedAssetPG.Get(PurchaseLines."Posting Group") then begin
    //                             FixedAssetPG.TestField("Acquisition Cost Account");
    //                             AcquisitionAccount := FixedAssetPG."Acquisition Cost Account";
    //                             Committments.GLAccount := AcquisitionAccount;
    //                         end;
    //                     end;
    //             end;
    //             Committments.Amount := PurchaseLines."Line Amount";
    //             Committments."Procurement Plan" := PurchaseLines."Procurement Plan";
    //             Committments."Vote Item" := PurchaseLines."Procurement Plan Item";

    //             //Confirm the Amount to be issued does not exceed the budget and amount Committed
    //             //Get Budget for the G/L
    //             /*GenLedSetup.GET;
    //             GLAccount.SETFILTER(GLAccount."Budget Filter",GenLedSetup."Current Budget");
    //             CASE PurchaseLines.Type OF
    //             PurchaseLines.Type::Item:
    //             BEGIN
    //                  GLAccount.SETRANGE(GLAccount."No.",InventoryAccount);
    //             END;
    //             PurchaseLines.Type::"G/L Account":
    //             BEGIN
    //               GLAccount.SETRANGE(GLAccount."No.",PurchaseLines."No.");
    //             END;
    //             PurchaseLines.Type::"Fixed Asset":
    //               GLAccount.SETRANGE(GLAccount."No.",AcquisitionAccount);
    //             END;

    //             GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");


    //             //Get budget amount avaliable
    //           // GLAccount.SETRANGE(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",PurchHeader."Order Date");
    //             IF GLAccount.FIND('-') THEN BEGIN
    //              GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
    //              BudgetAmount:=GLAccount."Budgeted Amount";
    //              Expenses:=GLAccount."Net Change";
    //              BudgetAvailable:=GLAccount."Budgeted Amount"-GLAccount."Net Change";
    //             END;*/
    //             //Get Budget for the G/L
    //             // MESSAGE('Hie');
    //             Procurementplan.Reset;
    //             Procurementplan.SetRange("Plan Year", PurchaseLines."Procurement Plan");
    //             Procurementplan.SetRange("Plan Item No", PurchaseLines."Procurement Plan Item");
    //             if Procurementplan.FindSet then begin
    //                 Procurementplan.CalcFields(Actual, Commitment);
    //                 BudgetAmount := Procurementplan."Estimated Cost";
    //                 Expenses := Procurementplan.Actual;
    //                 BudgetAvailable := Procurementplan."Estimated Cost" - Procurementplan.Actual;
    //                 CommittedAmount := Procurementplan.Commitment;
    //             end;

    //             /*//Get committed Amount
    //             CommittedAmount:=0;
    //             CommitmentEntries.RESET;
    //             CommitmentEntries.SETCURRENTKEY(CommitmentEntries.GLAccount);
    //             IF PurchaseLines.Type=PurchaseLines.Type::Item THEN
    //              CommitmentEntries.SETRANGE(CommitmentEntries.GLAccount,InventoryAccount);
    //             IF PurchaseLines.Type=PurchaseLines.Type::"G/L Account" THEN
    //              CommitmentEntries.SETRANGE(CommitmentEntries.GLAccount,PurchaseLines."No.");
    //             IF PurchaseLines.Type=PurchaseLines.Type::"Fixed Asset" THEN
    //              CommitmentEntries.SETRANGE(CommitmentEntries.GLAccount,AcquisitionAccount);
    //             {CommitmentEntries.SETRANGE(CommitmentEntries."Commitment Date",GenLedSetup."Current Budget Start Date",
    //                                        PurchHeader."Order Date");}
    //             CommitmentEntries.CALCSUMS(CommitmentEntries.Amount);
    //             CommittedAmount:=CommitmentEntries.Amount;*/

    //             if LineCommitted(PurchHeader."No.", PurchaseLines."No.", PurchaseLines."Line No.") then
    //                 Message('Line No %1 has been commited', PurchaseLines."Line No.")
    //             else

    //                 if CommittedAmount + PurchaseLines."Line Amount" > BudgetAvailable then
    //                     Error('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
    //                     , Committments.GLAccount,
    //                     Abs(BudgetAvailable - (CommittedAmount + PurchaseLines."Line Amount")), BudgetAvailable, CommittedAmount);

    //             Committments."User ID" := UserId;
    //             Committments."Document No." := PurchHeader."No.";
    //             Committments.No := PurchaseLines."No.";
    //             Committments."Line No." := PurchaseLines."Line No.";
    //             Committments."Account Type" := Committments."account type"::Vendor;
    //             Committments."Commitment Type" := Committments."commitment type"::LPO;
    //             Committments."Account No." := PurchaseLines."Buy-from Vendor No.";
    //             if Vendor.Get(PurchaseLines."Buy-from Vendor No.") then
    //                 Committments."Account Name" := Vendor.Name;
    //             Committments.Description := PurchaseLines.Description;

    //             //Check whether line is committed.
    //             if not LineCommitted(PurchHeader."No.", PurchaseLines."No.", PurchaseLines."Line No.") then begin
    //                 EntryNo := EntryNo + 1;
    //                 Committments."Entry No" := EntryNo;
    //                 Committments.Insert;
    //                 PurchaseLines.Committed := true;
    //                 PurchaseLines.Modify;
    //             end;
    //         until PurchaseLines.Next = 0;
    //     end;
    //     Message('Items Committed Successfully and the balance is %1',
    //     Abs(BudgetAvailable - (CommittedAmount + PurchaseLines."Line Amount")));


    // end;


    // procedure LineCommitted(var CommittmentNo: Code[20]; var No: Code[20]; var LineNo: Integer) Exists: Boolean
    // var
    //     Committed: Record "Commitment Entries1";
    // begin

    //     Exists := false;
    //     Committed.Reset;
    //     Committed.SetRange(Committed."Commitment No", CommittmentNo);
    //     Committed.SetRange(Committed.No, No);
    //     Committed.SetRange(Committed."Line No.", LineNo);
    //     if Committed.Find('-') then
    //         Exists := true;
    // end;


    // procedure ReverseLPOCommittment(var PurchHeader: Record "Purchase Header")
    // var
    //     Committment: Record "Commitment Entries1";
    //     PurchLine: Record "Purchase Line";
    //     EntryNo: Integer;
    //     Item: Record Item;
    //     InventoryPostingSetup: Record "Inventory Posting Setup";
    //     FixedAssetPG: Record "FA Posting Group";
    //     GenLedSetup: Record "General Ledger Setup";
    //     InventoryAccount: Code[20];
    //     AcquisitionAccount: Code[20];
    //     Vendor: Record Vendor;
    //     FixedAsset: Record "Fixed Asset";
    // begin

    //     if Confirm('Are you sure you want to reverse the committed entries for Document no ' + PurchHeader."No." + '?', false) = true then begin
    //         Committment.Reset;
    //         Committment.SetRange(Committment."Commitment No", PurchHeader."No.");
    //         if Committment.Find('-') then begin
    //             Committment.DeleteAll;
    //         end;
    //         PurchLine.Reset;
    //         //PurchLine.SETRANGE(PurchLine."Document Type",PurchLine."Document Type"::Order);
    //         PurchLine.SetRange(PurchLine."Document No.", PurchHeader."No.");
    //         if PurchLine.FindFirst then begin
    //             repeat

    //                 //Insert Reversal entries in the committment entries table
    //                 if Committment.Find('+') then
    //                     EntryNo := Committment."Entry No";
    //                 EntryNo := EntryNo + 1;
    //                 if LineCommitted(PurchHeader."No.", PurchLine."No.", PurchLine."Line No.") then begin
    //                     Committment.Init;
    //                     Committment."Entry No" := EntryNo;
    //                     Committment."Commitment No" := PurchHeader."No.";
    //                     Committment.Type := Committment.Type::Reversal;
    //                     Committment."Commitment Date" := PurchLine."Order Date";
    //                     //Dimensions
    //                     Committment."Global Dimension 1 Code" := PurchLine."Shortcut Dimension 1 Code";
    //                     Committment."Global Dimension 2 Code" := PurchLine."Shortcut Dimension 2 Code";
    //                     //Dimensions
    //                     //Case of G/L Account,Item,Fixed Asset
    //                     case PurchLine.Type of
    //                         PurchLine.Type::Item:
    //                             begin
    //                                 Item.Reset;
    //                                 if Item.Get(PurchLine."No.") then
    //                                     if Item."Inventory Posting Group" = '' then
    //                                         Error('Assign Posting Group to Item No %1', Item."No.");
    //                                 InventoryPostingSetup.Get(PurchLine."Location Code", Item."Inventory Posting Group");
    //                                 InventoryAccount := InventoryPostingSetup."Inventory Account";
    //                                 Committment.GLAccount := InventoryAccount;
    //                             end;
    //                         PurchLine.Type::"G/L Account":
    //                             begin
    //                                 Committment.GLAccount := PurchLine."No.";
    //                             end;
    //                         PurchLine.Type::"Fixed Asset":
    //                             begin
    //                                 FixedAsset.Reset;
    //                                 FixedAsset.Get(PurchLine."No.");
    //                                 FixedAssetPG.Get(FixedAsset."FA Posting Group");
    //                                 AcquisitionAccount := FixedAssetPG."Acquisition Cost Account";
    //                                 Committment.GLAccount := AcquisitionAccount;
    //                             end;
    //                     end;
    //                     Committment.Amount := -PurchLine."Line Amount";

    //                     Committment."User ID" := UserId;
    //                     Committment."Document No." := PurchHeader."No.";
    //                     Committment.No := PurchLine."No.";
    //                     Committment."Account Type" := Committment."account type"::Vendor;
    //                     Committment."Account No." := PurchLine."Buy-from Vendor No.";
    //                     if Vendor.Get(PurchLine."Buy-from Vendor No.") then
    //                         Committment."Account Name" := Vendor.Name;
    //                     Committment.Description := PurchLine.Description;

    //                     Committment.Insert;

    //                     //Mark entries as uncommited
    //                     PurchLine.Committed := false;
    //                     PurchLine.Modify;
    //                 end;

    //             until PurchLine.Next = 0;
    //         end;
    //         Message('Committed entries for Order No %1 Have been reversed Successfully', PurchHeader."No.");
    //     end;
    // end;


    // procedure UncommitLPO(var PurchHeader: Record "Purchase Header")
    // var
    //     Committment: Record "Commitment Entries1";
    //     PurchLine: Record "Purchase Line";
    //     EntryNo: Integer;
    //     Item: Record Item;
    //     InventoryPostingSetup: Record "Inventory Posting Setup";
    //     FixedAssetPG: Record "FA Posting Group";
    //     GenLedSetup: Record "General Ledger Setup";
    //     InventoryAccount: Code[20];
    //     AcquisitionAccount: Code[20];
    //     Vendor: Record Vendor;
    //     FixedAsset: Record "Fixed Asset";
    // begin
    //     /*//Post Reversals to committment entries
    //        PurchLine.RESET;
    //        PurchLine.SETRANGE(PurchLine."Document Type",PurchLine."Document Type"::Order);
    //        PurchLine.SETRANGE(PurchLine."Document No.",PurchHeader."No.");
    //        IF PurchLine.FIND('-') THEN BEGIN
    //         IF Committment.FIND('+') THEN
    //            EntryNo:=Committment."Time Stamp";
    //            EntryNo:=EntryNo+1;
    //           REPEAT
    //           IF LineCommitted(PurchHeader."No.",PurchLine."No.",PurchLine."Line No.") THEN BEGIN
    //             Committment.INIT;
    //             Committment."Time Stamp":=EntryNo;
    //             Committment."Entry No":=PurchHeader."No.";
    //             Committment."Document No.":=Committment."Document No."::"1";
    //             Committment."Commitment Date":=PurchLine."Order Date";
    //             //Dimensions
    //             Committment.Description:=PurchLine."Shortcut Dimension 1 Code";
    //             Committment."Global Dimension 2":=PurchLine."Shortcut Dimension 2 Code";
    //             //Dimensions
    //             //Case of G/L Account,Item,Fixed Asset
    //             CASE PurchLine.Type OF
    //             PurchLine.Type::Item:
    //             BEGIN
    //             Item.RESET;
    //              IF Item.GET(PurchLine."No.") THEN
    //                IF Item."Inventory Posting Group"='' THEN
    //                    ERROR('Assign Posting Group to Item No %1',Item."No.");
    //                   InventoryPostingSetup.GET(PurchLine."Location Code",Item."Inventory Posting Group");
    //                   InventoryAccount:=InventoryPostingSetup."Inventory Account";
    //                   Committment.Amount:=InventoryAccount;
    //             END;
    //             PurchLine.Type::"G/L Account":
    //             BEGIN
    //              Committment.Amount:=PurchLine."No.";
    //             END;
    //             PurchLine.Type::"Fixed Asset":
    //             BEGIN
    //               FixedAsset.RESET;
    //               FixedAsset.GET(PurchLine."No.");
    //               FixedAssetPG.GET(FixedAsset."FA Posting Group");
    //               AcquisitionAccount:=FixedAssetPG."Acquisition Cost Account";
    //               Committment.Amount:=AcquisitionAccount;
    //             END;
    //             END;
    //            Committment."Budget Line":=-PurchLine."Line Amount";

    //            Committment."Global Dimension 1 Code":=USERID;
    //            Committment."Commitment Type":=PurchHeader."No.";
    //            Committment."User ID":=PurchLine."No.";
    //            Committment."Line No.":=PurchLine."Line No.";
    //            Committment."Account Type":=Committment."Account Type"::"2";
    //            Committment."Account No.":=PurchLine."Buy-from Vendor No.";
    //            IF Vendor.GET(PurchLine."Buy-from Vendor No.") THEN
    //            Committment."Account Name":=Vendor.Name;
    //            Committment.Description:=PurchLine.Description;

    //            Committment.INSERT;
    //         END;
    //         UNTIL PurchLine.NEXT=0;
    //       END;
    //       //End Post Reversal to Committment entries
    //     */

    // end;


    // procedure LastCommittment(var CommittmentNo: Code[20]; var No: Code[20]; var LineNo: Integer) CommittmentAmt: Decimal
    // var
    //     Committed: Record "Commitment Entries1";
    // begin

    //     Committed.Reset;
    //     Committed.SetRange(Committed."Commitment No", CommittmentNo);
    //     Committed.SetRange(Committed.No, No);
    //     Committed.SetRange(Committed."Line No.", LineNo);
    //     if Committed.Find('-') then
    //         exit(Committed.Amount);
    // end;


    // procedure ImprestCommittment(var ImprestHeader: Record Payments)
    // var
    //     ImprestLines: Record "Imprest Lines";
    //     Committments: Record "Commitment Entries1";
    //     EntryNo: Integer;
    //     BudgetAmount: Decimal;
    //     Expenses: Decimal;
    //     BudgetAvailable: Decimal;
    //     CommittedAmount: Decimal;
    //     CommitmentEntries: Record "Commitment Entries1";
    //     GenLedSetup: Record "General Ledger Setup";
    //     GLAccount: Record "G/L Account";
    //     Customer: Record Customer;
    //     BudgetBal: Decimal;
    //     CommittedAmntSoFar: Decimal;
    //     WorkCode: Code[30];
    //     comm: Record "Commitment Entries1";
    //     EntryN: Integer;
    // begin
    //     comm.Reset;
    //     if comm.FindLast then begin
    //         if comm."Entry No" = 0 then
    //             EntryNo := 1
    //         else
    //             EntryNo := comm."Entry No" + 1;
    //     end else
    //         EntryNo := 1;

    //     Committments.Init;
    //     Committments."Commitment No" := ImprestHeader."No.";
    //     Committments.Type := Committments.Type::Committed;
    //     Committments."Commitment Type" := Committments."commitment type"::IMPREST;
    //     Committments."Commitment Date" := ImprestHeader.Date;
    //     Committments."Global Dimension 1 Code" := ImprestHeader."Shortcut Dimension 1 Code";
    //     Committments."Global Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
    //     Committments."User ID" := UserId;
    //     Committments."Document No." := ImprestHeader."No.";
    //     Committments."Account Type" := Committments."account type"::Employee;
    //     Committments.Job := ImprestHeader.Job;
    //     ImprestHeader.CalcFields(ImprestHeader."Imprest Amount");
    //     Committments.Amount := ImprestHeader."Imprest Amount";
    //     Committments."Job Task No" := ImprestHeader."Job Task No";
    //     Committments."Account No." := ImprestHeader."Account No.";
    //     Committments."Account Name" := ImprestHeader."Account Name";
    //     Committments.Description := ImprestHeader."Account Name";
    //     //Check whether line is committed.
    //     //IF NOT LineCommitted(PurchHeader."No.",PurchaseLines."No.",PurchaseLines."Line No.")THEN BEGIN
    //     Committments."Entry No" := EntryNo;
    //     Committments.Insert;
    // end;


    // procedure ImprestUnCommittment(var ImprestHeader: Record Payments)
    // var
    //     ImprestLines: Record "Imprest Lines";
    //     Committments: Record "Commitment Entries1";
    //     EntryNo: Integer;
    //     BudgetAmount: Decimal;
    //     Expenses: Decimal;
    //     BudgetAvailable: Decimal;
    //     CommittedAmount: Decimal;
    //     CommitmentEntries: Record "Commitment Entries1";
    //     GenLedSetup: Record "General Ledger Setup";
    //     GLAccount: Record "G/L Account";
    //     Customer: Record Customer;
    //     CashMngt: Record "Cash Management Setup";
    //     UncommittmentDate: Date;
    // begin

    //     ImprestLines.Reset;
    //     if ImprestLines.FindFirst then begin
    //         if Committments.FindLast then
    //             EntryNo := Committments."Entry No";

    //         Committments.Reset;
    //         Committments.SetRange(Committments."Commitment No", ImprestHeader."Imprest Issue Doc. No");
    //         Committments.SetRange(Committments.Type, Committments.Type::Committed);
    //         if Committments.Find('-') then
    //             Committments.Type := Committments.Type::Reversal;
    //         Committments."Uncommittment Date" := Today;
    //         Committments.Modify;

    //     end;
    // end;


    // procedure CheckLPOCommittment(var PurchHeader: Record "Purchase Header")
    // var
    //     PurchaseLines: Record "Purchase Line";
    //     Committments: Record "Commitment Entries1";
    //     Item: Record Item;
    //     GLAccount: Record "G/L Account";
    //     FixedAsset: Record "Fixed Asset";
    //     EntryNo: Integer;
    //     InventoryPostingSetup: Record "Inventory Posting Setup";
    //     FixedAssetPG: Record "FA Posting Group";
    //     GenLedSetup: Record "General Ledger Setup";
    //     InventoryAccount: Code[20];
    //     AcquisitionAccount: Code[20];
    //     BudgetAmount: Decimal;
    //     Expenses: Decimal;
    //     BudgetAvailable: Decimal;
    //     CommitmentEntries: Record "Commitment Entries1";
    //     CommittedAmount: Decimal;
    //     Vendor: Record Vendor;
    //     Procurementplan: Record "Procurement Plan1";
    // begin


    //     PurchaseLines.Reset;
    //     PurchaseLines.SetRange(PurchaseLines."Document No.", PurchHeader."No.");
    //     //PurchaseLines.SETRANGE(PurchaseLines."Document Type",PurchaseLines."Document Type"::Order);
    //     if PurchaseLines.FindFirst then begin
    //         repeat

    //             Procurementplan.Reset;
    //             Procurementplan.SetRange("Plan Year", PurchaseLines."Procurement Plan");
    //             Procurementplan.SetRange("Plan Item No", PurchaseLines."Procurement Plan Item");
    //             if Procurementplan.FindSet then begin
    //                 Procurementplan.CalcFields(Actual, Commitment);
    //                 BudgetAmount := Procurementplan."Estimated Cost";
    //                 Expenses := Procurementplan.Actual;
    //                 BudgetAvailable := Procurementplan."Estimated Cost" - Procurementplan.Actual;
    //                 CommittedAmount := Procurementplan.Commitment;
    //             end;
    //             if LineCommitted(PurchHeader."No.", PurchaseLines."No.", PurchaseLines."Line No.") then
    //                 Message('Line No %1 has been commited', PurchaseLines."Line No.")
    //             else

    //                 if CommittedAmount + PurchaseLines."Line Amount" > BudgetAvailable then
    //                     Error('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
    //                     , Committments.GLAccount,
    //                     Abs(BudgetAvailable - (CommittedAmount + PurchaseLines."Line Amount")), BudgetAvailable, CommittedAmount);

    //         until PurchaseLines.Next = 0;
    //     end;
    //     Message('Budget is available for the item and the balance is %1',
    //     Abs(BudgetAvailable - (CommittedAmount + PurchaseLines."Line Amount")));
    // end;


    procedure GenerateRFQ(PurchLines: Record "Purchase Line")
    var
        RequestRec: Record "Procurement Request";
        RequestLine: Record "Procurement Request Lines";
        RequestLines: Record "Purchase Line";
        RequisitionHeader: Record "Purchase Header";
        ProcurementRequest: Record "Procurement Request";
        ProcurementRequestLine: Record "Procurement Request Lines";
        LineNo: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PPSetup: Record "Purchases & Payables Setup";
    begin
        //WITH PurchLines DO BEGIN
        PurchLines.Reset;
        //PurchLines.SETRANGE(PurchLines.Select2,TRUE);
        //PurchLines.SETRANGE(PurchLines."Request Generated",FALSE);
        PurchLines.SetRange("Document No.", PurchLines."Document No.");
        if PurchLines.Find('-') then begin
            RequisitionHeader.Reset;
            RequisitionHeader.SetRange("No.", PurchLines."Document No.");
            if RequisitionHeader.FindSet then begin
                PurchLines.CalcFields(PurchLines."Process Type");
                ProcurementRequest.Init;
                if PurchLines."Process Type" = 'RFP' then
                    ProcurementRequest."Process Type" := ProcurementRequest."process type"::RFP
                else
                    ProcurementRequest."Process Type" := ProcurementRequest."process type"::RFQ;
                if not PPSetup.Get then
                    Error(Text000);
                case ProcurementRequest."Process Type" of
                    ProcurementRequest."process type"::RFQ:
                        begin
                            PPSetup.TestField("Request for Quotation Nos.");
                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Request for Quotation Nos.", Today, true);
                        end;
                    ProcurementRequest."process type"::RFP:
                        begin
                            PPSetup.TestField("Request for Proposals Nos.");
                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Request for Proposals Nos.", Today, true);
                        end;
                    ProcurementRequest."process type"::Tender:
                        begin
                            PPSetup.TestField("Tenders Nos");

                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Tenders Nos", Today, true);
                        end;
                end;
                RequisitionHeader.Reset;
                RequisitionHeader.SetRange("No.", PurchLines."Document No.");
                if RequisitionHeader.FindSet then
                    ProcurementRequest.Title := RequisitionHeader.Description;
                ProcurementRequest."Requisition No" := PurchLines."Document No.";
                ProcurementRequest."Issued Date" := Today;
                ProcurementRequest."Creation Date" := Today;
                ProcurementRequest."Procurement Plan No" := PurchLines."Procurement Plan";
                //ProcurementRequest."Procurement Plan Item":=PurchLines."Procurement Plan Item";
                ProcurementRequest."User ID" := UserId;
                ProcurementRequest.Insert(true);
            end;
            repeat
                LineNo := LineNo + 10000;
                ProcurementRequestLine.Init;
                // ProcurementRequestLine.TRANSFERFIELDS(PurchLines);
                ProcurementRequestLine."Requisition No" := ProcurementRequest.No;
                ProcurementRequestLine."Line No" := LineNo;
                ProcurementRequestLine.Type := PurchLines.Type;
                ProcurementRequestLine.No := PurchLines."No.";
                ProcurementRequestLine.Description := PurchLines.Description;
                ProcurementRequestLine.Quantity := PurchLines.Quantity;
                ProcurementRequestLine."Unit of Measure" := PurchLines."Unit of Measure";
                ProcurementRequestLine."Unit Price" := PurchLines."Unit Price (LCY)";
                //ProcurementRequestLine.Amount:=PurchLines."Line Amount";
                ProcurementRequestLine."Procurement Plan" := PurchLines."Procurement Plan";
                ProcurementRequestLine."Procurement Plan Item" := PurchLines."Procurement Plan Item";
                ProcurementRequestLine."Budget Line" := PurchLines."Procurement Plan";
                ProcurementRequestLine."Global Dimension 1 Code" := PurchLines."Shortcut Dimension 1 Code";
                //ProcurementRequestLine."Amount LCY":=PurchLines.Amount;
                ProcurementRequestLine.Select := PurchLines.Select2;
                ProcurementRequestLine."Request Generated" := PurchLines."Request Generated";
                //ProcurementRequestLine."Supplier Category":=PurchLines.Subtyp
                //ProcurementRequestLine."Vendor No":=PurchLines.ve
                ProcurementRequestLine.Ordered := PurchLines.Ordered;
                ProcurementRequestLine."Order Date" := PurchLines."Order Creation date";
                ProcurementRequestLine."Current Budget" := PurchLines."Procurement Plan";
                ProcurementRequestLine.Specifications := PurchLines.Specifications;
                //ProcurementRequestLine.TRANSFERFIELDS(PurchLines);
                if not ProcurementRequestLine.Get(ProcurementRequest.No, LineNo) then
                    ProcurementRequestLine.Insert;
                PurchLines."Request Generated" := true;
                PurchLines.Modify;
            until PurchLines.Next = 0;
        end;

        Message('Document %1 Created successfully, Kindly Proceed to Quotations List', ProcurementRequest.No);
        Page.Run(70026, ProcurementRequest);
        // END;
    end;


    procedure GenerateDirect(PurchLines: Record "Purchase Line")
    var
        RequestRec: Record "Procurement Request";
        RequestLine: Record "Procurement Request Lines";
        RequestLines: Record "Purchase Line";
        RequisitionHeader: Record "Purchase Header";
        ProcurementRequest: Record "Procurement Request";
        ProcurementRequestLine: Record "Procurement Request Lines";
        LineNo: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PPSetup: Record "Purchases & Payables Setup";
    begin
        //WITH PurchLines DO BEGIN
        PurchLines.Reset;
        //PurchLines.SETRANGE(PurchLines.Select2,TRUE);
        //PurchLines.SETRANGE(PurchLines."Request Generated",FALSE);
        PurchLines.SetRange("Document No.", PurchLines."Document No.");
        if PurchLines.Find('-') then begin
            RequisitionHeader.Reset;
            RequisitionHeader.SetRange("No.", PurchLines."Document No.");
            if RequisitionHeader.FindSet then begin
                PurchLines.CalcFields(PurchLines."Process Type");
                ProcurementRequest.Init;

                ProcurementRequest."Process Type" := ProcurementRequest."process type"::Direct;
                if not PPSetup.Get then
                    Error(Text000);


                PPSetup.TestField("Direct Prcmnt Nos");
                ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Direct Prcmnt Nos", Today, true);
                //END;
            end;
            ProcurementRequest.Title := PurchLines.Description;
            ProcurementRequest."Requisition No" := PurchLines."Document No.";
            ProcurementRequest."Issued Date" := Today;
            ProcurementRequest."Creation Date" := Today;
            ProcurementRequest."Procurement Plan No" := PurchLines."Procurement Plan";
            //ProcurementRequest."Procurement Plan Item":=PurchLines."Procurement Plan Item";
            ProcurementRequest."User ID" := UserId;
            ProcurementRequest.Insert(true);
            //END;
            repeat
                LineNo := LineNo + 10000;
                ProcurementRequestLine.Init;
                // ProcurementRequestLine.TRANSFERFIELDS(PurchLines);
                ProcurementRequestLine."Requisition No" := ProcurementRequest.No;
                ProcurementRequestLine."Line No" := LineNo;
                ProcurementRequestLine.Type := PurchLines.Type;
                ProcurementRequestLine.No := PurchLines."No.";
                ProcurementRequestLine.Description := PurchLines.Description;
                ProcurementRequestLine.Quantity := PurchLines.Quantity;
                ProcurementRequestLine."Unit of Measure" := PurchLines."Unit of Measure";
                ProcurementRequestLine."Unit Price" := PurchLines."Unit Price (LCY)";
                ProcurementRequestLine.Amount := PurchLines."Line Amount";
                ProcurementRequestLine."Procurement Plan" := PurchLines."Procurement Plan";
                ProcurementRequestLine."Procurement Plan Item" := PurchLines."Procurement Plan Item";
                ProcurementRequestLine."Budget Line" := PurchLines."Procurement Plan";
                ProcurementRequestLine."Global Dimension 1 Code" := PurchLines."Shortcut Dimension 1 Code";
                ProcurementRequestLine."Amount LCY" := PurchLines.Amount;
                ProcurementRequestLine.Select := PurchLines.Select2;
                ProcurementRequestLine."Request Generated" := PurchLines."Request Generated";
                //ProcurementRequestLine."Supplier Category":=PurchLines.Subtyp
                //ProcurementRequestLine."Vendor No":=PurchLines.ve
                ProcurementRequestLine.Ordered := PurchLines.Ordered;
                ProcurementRequestLine."Order Date" := PurchLines."Order Creation date";
                ProcurementRequestLine."Current Budget" := PurchLines."Procurement Plan";
                ProcurementRequestLine.Specifications := PurchLines.Specifications;
                //ProcurementRequestLine.TRANSFERFIELDS(PurchLines);
                if not ProcurementRequestLine.Get(ProcurementRequest.No, LineNo) then
                    ProcurementRequestLine.Insert;
                PurchLines."Request Generated" := true;
                PurchLines.Modify;
            until PurchLines.Next = 0;
        end;

        Message('Direct Procurement Document %1 Created successfully, Kindly Proceed to Document no. List', ProcurementRequest.No);
        // END;
    end;


    procedure GenerateRFQDoc(PurchHeader: Record "Purchase Header")
    var
        RequestRec: Record "Procurement Request";
        RequestLine: Record "Procurement Request Lines";
        RequestLines: Record "Purchase Line";
        RequisitionHeader: Record "Purchase Header";
        ProcurementRequest: Record "Procurement Request";
        ProcurementRequestLine: Record "Procurement Request Lines";
        LineNo: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PPSetup: Record "Purchases & Payables Setup";
        PurchLines: Record "Purchase Line";
    begin
        //WITH PurchLines DO BEGIN
        PurchHeader.Reset;
        //PurchLines.SETRANGE(PurchLines.Select2,TRUE);
        //PurchLines.SETRANGE(PurchLines."Request Generated",FALSE);
        PurchHeader.SetRange("No.", PurchHeader."No.");
        if PurchHeader.Find('-') then begin
            RequisitionHeader.Reset;
            RequisitionHeader.SetRange("No.", PurchHeader."No.");
            if RequisitionHeader.FindSet then begin
                //PurchLines.CALCFIELDS(PurchLines."Process Type");
                ProcurementRequest.Init;
                if PurchHeader."Process Type" = 'RFP' then
                    ProcurementRequest."Process Type" := ProcurementRequest."process type"::RFP
                else
                    ProcurementRequest."Process Type" := ProcurementRequest."process type"::RFQ;
                if not PPSetup.Get then
                    Error(Text000);
                case ProcurementRequest."Process Type" of
                    ProcurementRequest."process type"::RFQ:
                        begin
                            PPSetup.TestField("Request for Quotation Nos.");
                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Request for Quotation Nos.", Today, true);
                        end;
                    ProcurementRequest."process type"::RFP:
                        begin
                            PPSetup.TestField("Request for Proposals Nos.");
                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Request for Proposals Nos.", Today, true);
                        end;
                    ProcurementRequest."process type"::Tender:
                        begin
                            PPSetup.TestField("Tenders Nos");
                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Tenders Nos", Today, true);
                        end;
                end;
                ProcurementRequest.Title := PurchHeader.Description;
                ProcurementRequest."Requisition No" := PurchHeader."No.";
                ProcurementRequest."Issued Date" := Today;
                ProcurementRequest."Creation Date" := Today;
                ProcurementRequest."Procurement Plan No" := PurchLines."Procurement Plan";


                ProcurementRequest.Status := ProcurementRequest.Status::Open;
                //ProcurementRequest."Procurement Plan Item":=PurchLines."Procurement Plan Item";
                ProcurementRequest."User ID" := UserId;
                ProcurementRequest.Insert(true);
            end;
            //PurchLines.SETRANGE(PurchLines.Select2,TRUE);
            //PurchLines.SETRANGE(PurchLines."Request Generated",FALSE);
            PurchLines.Reset;
            PurchLines.SetRange("Document No.", PurchHeader."No.");
            if PurchLines.Find('-') then begin
                repeat
                    LineNo := LineNo + 10000;
                    ProcurementRequestLine.Init;
                    // ProcurementRequestLine.TRANSFERFIELDS(PurchLines);
                    ProcurementRequestLine."Requisition No" := ProcurementRequest.No;
                    //ProcurementRequestLine."Line No":=LineNo;
                    ProcurementRequestLine."Line No" := PurchLines."Line No.";
                    ProcurementRequestLine.Type := PurchLines.Type;
                    ProcurementRequestLine.No := PurchLines."No.";
                    ProcurementRequestLine.Description := PurchLines.Description;
                    ProcurementRequestLine.Quantity := PurchLines.Quantity;
                    ProcurementRequestLine."Unit of Measure" := PurchLines."Unit of Measure";
                    //ProcurementRequestLine."Unit Price":=PurchLines."Unit Price (LCY)";//commented by Morris
                    ProcurementRequestLine."Unit Price" := PurchLines."Direct Unit Cost";
                    ProcurementRequestLine.Amount := PurchLines."Line Amount";
                    ProcurementRequestLine."Procurement Plan" := PurchLines."Procurement Plan";
                    ProcurementRequestLine."Procurement Plan Item" := PurchLines."Procurement Plan Item";
                    ProcurementRequestLine."Budget Line" := PurchLines."Procurement Plan";
                    ProcurementRequestLine."Global Dimension 1 Code" := PurchLines."Shortcut Dimension 1 Code";
                    ProcurementRequestLine."Amount LCY" := PurchLines.Amount;
                    ProcurementRequestLine.Select := PurchLines.Select2;
                    ProcurementRequestLine."Request Generated" := PurchLines."Request Generated";
                    //ProcurementRequestLine."Supplier Category":=PurchLines.Subtyp
                    //ProcurementRequestLine."Vendor No":=PurchLines.ve
                    ProcurementRequestLine.Ordered := PurchLines.Ordered;
                    ProcurementRequestLine."Order Date" := PurchLines."Order Creation date";
                    ProcurementRequestLine."Current Budget" := PurchLines."Procurement Plan";
                    ProcurementRequestLine.Specifications := PurchLines.Specifications;
                    ProcurementRequestLine."Job No." := PurchLines."Job No."; //*****Hunaina 28.11.2019 Job No. from PRN to RFQ
                    ProcurementRequestLine."Job Task No." := PurchLines."Job Task No."; //*****Hunaina 28.11.2019 Job Task No. from PRN to RFQ
                                                                                        //ProcurementRequestLine.TRANSFERFIELDS(PurchLines);
                    if not ProcurementRequestLine.Get(ProcurementRequest.No, LineNo) then
                        ProcurementRequestLine.Insert;
                    PurchLines."Request Generated" := true;
                    PurchLines.Modify;
                until PurchLines.Next = 0;
            end;
        end;

        Message('Document %1 Created successfully', ProcurementRequest.No);
        Page.Run(70026, ProcurementRequest);
        //END;
    end;


    procedure GenerateDirectDOC(PurchHeader: Record "Purchase Header")
    var
        RequestRec: Record "Procurement Request";
        RequestLine: Record "Procurement Request Lines";
        RequestLines: Record "Purchase Line";
        RequisitionHeader: Record "Purchase Header";
        ProcurementRequest: Record "Procurement Request";
        ProcurementRequestLine: Record "Procurement Request Lines";
        LineNo: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PPSetup: Record "Purchases & Payables Setup";
        PurchLines: Record "Purchase Line";
    begin
        //WITH PurchLines DO BEGIN
        PurchHeader.Reset;
        //PurchLines.SETRANGE(PurchLines.Select2,TRUE);
        //PurchLines.SETRANGE(PurchLines."Request Generated",FALSE);
        PurchHeader.SetRange("No.", PurchHeader."No.");
        if PurchHeader.Find('-') then begin

            RequisitionHeader.Reset;
            RequisitionHeader.SetRange("No.", PurchHeader."No.");
            if RequisitionHeader.FindSet then begin
                //PurchLines.CALCFIELDS(PurchLines."Process Type");
                ProcurementRequest.Init;

                ProcurementRequest."Process Type" := ProcurementRequest."process type"::Direct;
                if not PPSetup.Get then
                    Error(Text000);


                PPSetup.TestField("Direct Prcmnt Nos");
                ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Direct Prcmnt Nos", Today, true);
                //END;
            end;
            ProcurementRequest.Title := PurchHeader.Description;

            ProcurementRequest."Requisition No" := PurchHeader."No.";
            ProcurementRequest."Issued Date" := Today;
            ProcurementRequest."Creation Date" := Today;
            ProcurementRequest."Procurement Plan No" := PurchHeader."Procurement Plan";
            ProcurementRequest."Procurement Plan Item" := PurchHeader."Procurement Plan Item";
            ProcurementRequest."User ID" := UserId;
            ProcurementRequest.Insert(true);
            //END;
            PurchLines.Reset;
            PurchLines.SetRange("Document No.", PurchHeader."No.");
            if PurchLines.Find('-') then begin

                repeat
                    LineNo := LineNo + 10000;
                    ProcurementRequestLine.Init;
                    // ProcurementRequestLine.TRANSFERFIELDS(PurchLines);
                    ProcurementRequestLine."Requisition No" := ProcurementRequest.No;
                    ProcurementRequestLine."Line No" := LineNo;
                    ProcurementRequestLine.Type := PurchLines.Type;
                    ProcurementRequestLine.No := PurchLines."No.";
                    ProcurementRequestLine.Description := PurchLines.Description;
                    ProcurementRequestLine.Specifications := PurchLines.Specifications;
                    ProcurementRequestLine.Quantity := PurchLines.Quantity;
                    ProcurementRequestLine."Unit of Measure" := PurchLines."Unit of Measure";
                    ProcurementRequestLine."Unit Price" := PurchLines."Unit Price (LCY)";
                    ProcurementRequestLine.Amount := PurchLines."Line Amount";
                    ProcurementRequestLine."Procurement Plan" := PurchLines."Procurement Plan";
                    ProcurementRequestLine."Procurement Plan Item" := PurchLines."Procurement Plan Item";
                    ProcurementRequestLine."Budget Line" := PurchLines."Procurement Plan";
                    ProcurementRequestLine."Global Dimension 1 Code" := PurchLines."Shortcut Dimension 1 Code";
                    ProcurementRequestLine."Amount LCY" := PurchLines.Amount;
                    ProcurementRequestLine.Select := PurchLines.Select2;
                    ProcurementRequestLine."Request Generated" := PurchLines."Request Generated";
                    //ProcurementRequestLine."Supplier Category":=PurchLines.Subtyp
                    //ProcurementRequestLine."Vendor No":=PurchLines.ve
                    ProcurementRequestLine.Ordered := PurchLines.Ordered;
                    ProcurementRequestLine."Order Date" := PurchLines."Order Creation date";
                    ProcurementRequestLine."Current Budget" := PurchLines."Procurement Plan";
                    ProcurementRequestLine."Job No." := PurchLines."Job No."; //*****Hunaina 28.11.2019 Job No. from PRN to RFQ
                    ProcurementRequestLine."Job Task No." := PurchLines."Job Task No."; //*****Hunaina 28.11.2019 Job Task No. from PRN to RFQ
                                                                                        //ProcurementRequestLine.Specifications:=PurchLines.Specifications;
                                                                                        //ProcurementRequestLine.TRANSFERFIELDS(PurchLines);
                    if not ProcurementRequestLine.Get(ProcurementRequest.No, LineNo) then
                        ProcurementRequestLine.Insert;
                    PurchLines."Request Generated" := true;
                    PurchLines.Modify;
                until PurchLines.Next = 0;
            end;
        end;
        Message('Direct Procurement Document %1 Created successfully, Kindly Proceed to Document no List', ProcurementRequest.No);
        Page.Run(70038, ProcurementRequest);
        // END;
    end;


    // procedure StaffUnCommittment(var ImprestHeader: Record Payments)
    // var
    //     ImprestLines: Record "Imprest Lines";
    //     Committments: Record "Commitment Entries1";
    //     EntryNo: Integer;
    //     BudgetAmount: Decimal;
    //     Expenses: Decimal;
    //     BudgetAvailable: Decimal;
    //     CommittedAmount: Decimal;
    //     CommitmentEntries: Record "Commitment Entries1";
    //     GenLedSetup: Record "General Ledger Setup";
    //     GLAccount: Record "G/L Account";
    //     Customer: Record Customer;
    //     CashMngt: Record "Cash Management Setup";
    //     UncommittmentDate: Date;
    // begin

    //     ImprestLines.Reset;
    //     if ImprestLines.FindFirst then begin
    //         if Committments.FindLast then
    //             EntryNo := Committments."Entry No";

    //         Committments.Reset;
    //         Committments.SetRange(Committments."Commitment No", ImprestHeader."No.");
    //         Committments.SetRange(Committments.Type, Committments.Type::Committed);
    //         if Committments.Find('-') then
    //             Committments.Type := Committments.Type::Reversal;
    //         Committments."Uncommittment Date" := Today;
    //         Committments.Modify;

    //     end;
    // end;


    // procedure ImprestmemoCommittment(var ImprestHeader: Record "Imprest Memo")
    // var
    //     ImprestLines: Record "Imprest Lines";
    //     Committments: Record "Commitment Entries1";
    //     EntryNo: Integer;
    //     BudgetAmount: Decimal;
    //     Expenses: Decimal;
    //     BudgetAvailable: Decimal;
    //     CommittedAmount: Decimal;
    //     CommitmentEntries: Record "Commitment Entries1";
    //     GenLedSetup: Record "General Ledger Setup";
    //     GLAccount: Record "G/L Account";
    //     Customer: Record Customer;
    //     BudgetBal: Decimal;
    //     CommittedAmntSoFar: Decimal;
    //     WorkCode: Code[30];
    //     comm: Record "Commitment Entries1";
    //     EntryN: Integer;
    // begin
    //     comm.Reset;
    //     if comm.FindLast then begin
    //         if comm."Entry No" = 0 then
    //             EntryNo := 1
    //         else
    //             EntryNo := comm."Entry No" + 1;
    //     end else
    //         EntryNo := 1;
    //     ImprestHeader.CalcFields(ImprestHeader."Total Subsistence Allowance");
    //     //ImprestHeader.CALCFIELDS  (ImprestHeader.("Total Subsistence Allowance")+("Total Casuals Cost"+"Total Fuel Costs")+("Total Maintenance Costs")+("Total Other Costs")+("Total Transport Costs"));
    //     BudgetAmount := ImprestHeader."Total Subsistence Allowance";
    //     Committments.Init;
    //     Committments."Commitment No" := ImprestHeader."No.";
    //     Committments.Type := Committments.Type::Committed;
    //     Committments."Commitment Type" := Committments."commitment type"::IMPREST;
    //     Committments."Commitment Date" := ImprestHeader.Date;
    //     Committments."Global Dimension 1 Code" := ImprestHeader."Global Dimension 1 Code";
    //     Committments."Global Dimension 2 Code" := ImprestHeader."Global Dimension 2 Code";
    //     Committments."User ID" := UserId;
    //     Committments."Document No." := ImprestHeader."No.";
    //     Committments."Account Type" := Committments."account type"::"G/L Account";
    //     Committments.Job := ImprestHeader.Job;
    //     //ImprestHeader.CALCFIELDS(ImprestHeader."Imprest Amount");
    //     Committments.Amount := BudgetAmount;
    //     Committments."Job Task No" := ImprestHeader."Job  Task";
    //     Committments."Account No." := ImprestHeader.Requestor;
    //     Committments."Account Name" := ImprestHeader."Requestor Name";
    //     Committments.Description := ImprestHeader.Subject;
    //     //Check whether line is committed.
    //     //IF NOT LineCommitted(PurchHeader."No.",PurchaseLines."No.",PurchaseLines."Line No.")THEN BEGIN
    //     Committments."Entry No" := EntryNo;
    //     Committments.Insert;
    // end;


    // procedure ImprestMemoUnCommittment(var ImprestHeader: Record "Imprest Memo")
    // var
    //     ImprestLines: Record "Imprest Lines";
    //     Committments: Record "Commitment Entries1";
    //     EntryNo: Integer;
    //     BudgetAmount: Decimal;
    //     Expenses: Decimal;
    //     BudgetAvailable: Decimal;
    //     CommittedAmount: Decimal;
    //     CommitmentEntries: Record "Commitment Entries1";
    //     GenLedSetup: Record "General Ledger Setup";
    //     GLAccount: Record "G/L Account";
    //     Customer: Record Customer;
    //     CashMngt: Record "Cash Management Setup";
    //     UncommittmentDate: Date;
    // begin

    //     /*ImprestHeader.RESET;
    //       IF ImprestHeader.FINDFIRST THEN BEGIN
    //         IF Committments.FINDLAST THEN
    //           EntryNo:=Committments."Entry No";*/

    //     Committments.Reset;
    //     Committments.SetRange(Committments."Document No.", ImprestHeader."No.");
    //     Committments.SetRange(Committments.Type, Committments.Type::Committed);
    //     if Committments.Find('-') then begin
    //         repeat
    //             //MESSAGE('hie');
    //             Committments.Type := Committments.Type::Reversal;
    //             Committments."Uncommittment Date" := Today;
    //             Committments.Modify;
    //         until Committments.Next = 0;
    //     end;

    //     //END;

    // end;


    procedure GenerateOpenTenderDOC(PurchHeader: Record "Purchase Header")
    var
        RequestRec: Record "Procurement Request";
        RequestLine: Record "Procurement Request Lines";
        RequestLines: Record "Purchase Line";
        RequisitionHeader: Record "Purchase Header";
        ProcurementRequest: Record "Procurement Request";
        ProcurementRequestLine: Record "Procurement Request Lines";
        LineNo: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PPSetup: Record "Purchases & Payables Setup";
        PurchLines: Record "Purchase Line";
    begin
        //WITH PurchLines DO BEGIN
        PurchHeader.Reset;
        //PurchLines.SETRANGE(PurchLines.Select2,TRUE);
        //PurchLines.SETRANGE(PurchLines."Request Generated",FALSE);
        PurchHeader.SetRange("No.", PurchHeader."No.");
        if PurchHeader.Find('-') then begin

            RequisitionHeader.Reset;
            RequisitionHeader.SetRange("No.", PurchHeader."No.");
            if RequisitionHeader.FindSet then begin
                //PurchLines.CALCFIELDS(PurchLines."Process Type");
                ProcurementRequest.Init;

                ProcurementRequest."Process Type" := ProcurementRequest."process type"::Tender;
                if not PPSetup.Get then
                    Error(Text000);


                PPSetup.TestField("Tenders Nos");
                ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Tenders Nos", Today, true);
                //END;
            end;
            ProcurementRequest.Title := PurchHeader.Description;

            ProcurementRequest."Requisition No" := PurchHeader."No.";
            ProcurementRequest."Issued Date" := Today;
            ProcurementRequest."Creation Date" := Today;
            ProcurementRequest."Procurement Plan No" := PurchHeader."Procurement Plan";
            ProcurementRequest."Procurement Plan Item" := PurchHeader."Procurement Plan Item";
            ProcurementRequest."User ID" := UserId;
            ProcurementRequest.Insert(true);
            //END;
            PurchLines.Reset;
            PurchLines.SetRange("Document No.", PurchHeader."No.");
            if PurchLines.Find('-') then begin

                repeat
                    LineNo := LineNo + 10000;
                    ProcurementRequestLine.Init;
                    // ProcurementRequestLine.TRANSFERFIELDS(PurchLines);
                    ProcurementRequestLine."Requisition No" := ProcurementRequest.No;
                    ProcurementRequestLine."Line No" := LineNo;
                    ProcurementRequestLine.Type := PurchLines.Type;
                    ProcurementRequestLine.No := PurchLines."No.";
                    ProcurementRequestLine.Description := PurchLines.Description;
                    ProcurementRequestLine.Specifications := PurchLines.Specifications;
                    ProcurementRequestLine.Quantity := PurchLines.Quantity;
                    ProcurementRequestLine."Unit of Measure" := PurchLines."Unit of Measure";
                    ProcurementRequestLine."Unit Price" := PurchLines."Unit Price (LCY)";
                    ProcurementRequestLine.Amount := PurchLines."Line Amount";
                    ProcurementRequestLine."Procurement Plan" := PurchLines."Procurement Plan";
                    ProcurementRequestLine."Procurement Plan Item" := PurchLines."Procurement Plan Item";
                    ProcurementRequestLine."Budget Line" := PurchLines."Procurement Plan";
                    ProcurementRequestLine."Global Dimension 1 Code" := PurchLines."Shortcut Dimension 1 Code";
                    ProcurementRequestLine."Amount LCY" := PurchLines.Amount;
                    ProcurementRequestLine.Select := PurchLines.Select2;
                    ProcurementRequestLine."Request Generated" := PurchLines."Request Generated";
                    //ProcurementRequestLine."Supplier Category":=PurchLines.Subtyp
                    //ProcurementRequestLine."Vendor No":=PurchLines.ve
                    ProcurementRequestLine.Ordered := PurchLines.Ordered;
                    ProcurementRequestLine."Order Date" := PurchLines."Order Creation date";
                    ProcurementRequestLine."Current Budget" := PurchLines."Procurement Plan";
                    ProcurementRequestLine."Job No." := PurchLines."Job No."; //*****Hunaina 28.11.2019 Job No. from PRN to RFQ
                    ProcurementRequestLine."Job Task No." := PurchLines."Job Task No."; //*****Hunaina 28.11.2019 Job Task No. from PRN to RFQ
                                                                                        //ProcurementRequestLine.Specifications:=PurchLines.Specifications;
                                                                                        //ProcurementRequestLine.TRANSFERFIELDS(PurchLines);
                    if not ProcurementRequestLine.Get(ProcurementRequest.No, LineNo) then
                        ProcurementRequestLine.Insert;
                    PurchLines."Request Generated" := true;
                    PurchLines.Modify;
                until PurchLines.Next = 0;
            end;
        end;
        Message('Open Tender Document %1 Created successfully, Kindly Proceed to Document no List', ProcurementRequest.No);
        Page.Run(70036, ProcurementRequest);
        // END;
    end;

    // procedure Createonetimepass(SupplierReq: Record Contact; SuppNo: Code[50])
    // var
    //     //  SupplierReq: Record Contact;
    //     LastFieldNo: Integer;
    //     FooterPrinted: Boolean;
    //     FileDirectory: Text[100];
    //     FileName: Text[100];
    //     ReportID: Integer;
    //     //"Object": Record "Object";
    //     Window: Dialog;
    //     RunOnceFile: Text[1000];
    //     TimeOut: Integer;
    //     Customer2: Record Customer;
    //     Cust: Record Customer;
    //     cr: Integer;
    //     lf: Integer;
    //     EmailBody: array[2] of Text[30];
    //     BodyText: Text[250];
    //     mymail: Codeunit Mail;
    //     DefaultPrinter: Text[200];
    //     WindowisOpen: Boolean;
    //     SendingDate: Date;
    //     SendingTime: Time;
    //     Counter: Integer;
    //     ////DocLog: Record "Document E-mail Log";
    //     BranchName: Code[80];
    //     DimValue: Record "Dimension Value";
    //     SenderAddress: Text[100];
    //     CustEmail: Text[100];
    //     UserSetup: Record "User Setup";
    //     HRSetup: Record "Company Information";
    //     Emp: Record Vendor;
    //     PayrollMonth: Date;
    //     PayrollMonthText: Text[30];
    //     PayPeriodtext: Text;
    //     PayPeriod: Record "Payroll PeriodX";
    //     CompInfo: Record "Company Information";
    //     DateFilter: Text;
    //     FromDate: Date;
    //     ToDate: Date;
    //     FromDateS: Text;
    //     ToDateS: Text;
    //     vend: Record Vendor;
    //     StartDate: Date;
    //     EndDAte: Date;
    //     EmailVerifier: Codeunit Payroll3;
    //     IsEmailValid: Boolean;
    //     PPayableSetup: Record "Procurement Setup";
    //     RequesterName: Text[100];
    //     RequesterEmail: Text[100];
    //     emailhdr: Text[100];
    //     CompanyDetails: Text[250];
    //     SupplierDetails: Text[1000];
    //     SenderMessage: Text[1000];
    //     ProcNote: Text[1000];
    //     LoginDetails: Text[1000];
    //     //PortalUser: Record "Dynasoft Portal User";
    //     Password: Text[50];
    //     ActivationDetails: Text[1000];
    //     RandomDigit: Text[50];
    //     entryno: Integer;

    // begin
    //     // Update Dynasoft Portal user
    //     PortalUSer.RESET;
    //     IF PortalUSer.FINDLAST THEN
    //         entryno := PortalUSer."Entry No";
    //     PortalUSer.RESET;
    //     PortalUSer.SETRANGE("User Name", SupplierReq."E-Mail");
    //     IF NOT PortalUSer.FINDSET THEN BEGIN
    //         PortalUSer.INIT;
    //         PortalUSer."Entry No" := entryno + 1;
    //         PortalUSer."User Name" := SupplierReq."E-Mail";
    //         PortalUSer."Full Name" := SupplierReq.Name;
    //         PortalUSer."Authentication Email" := SupplierReq."E-Mail";
    //         PortalUSer."Mobile Phone No." := SupplierReq."Phone No.";
    //         PortalUSer.State := PortalUSer.State::Enabled;
    //         PortalUSer."Record Type" := PortalUSer."Record Type"::Vendor;
    //         PortalUSer."Record ID" := SuppNo;

    //         RandomDigit := CREATEGUID;
    //         RandomDigit := DELCHR(RandomDigit, '=', '{}-01');
    //         RandomDigit := COPYSTR(RandomDigit, 1, 8);
    //         //MESSAGE(RandomDigit);
    //         PortalUSer."Password Value" := RandomDigit;
    //         PortalUSer.INSERT;




    //         SupplierReq.FnSendEmaiNotificationOnAccountActivation(SupplierReq);




    //         //FnSendEmaiNotificationOnAccountActivation(Rec);
    //         //Procurement.FnSendEmaiNotificationOnSupplierAccountActivation(Rec);
    //     END;

    // end;

    procedure CreateVendorPortal(RecNo: Code[20])
    var
        Contact: Record Contact;
        Suppliers: Record Vendor;

    begin
        Contact.get(RecNo);
        Suppliers.reset();
        Suppliers.setrange("No.", Contact."No.");
        if Suppliers.FindFirst() then begin
            ERROR('Supplier %1 Already Exists', Suppliers."No.");
        end;
        Suppliers.Init();
        Suppliers.Name := Contact.Name;
        Suppliers."Country/Region Code" := Contact."Country/Region Code";
        Suppliers.Address := Contact.Address;
        Suppliers."Post Code" := Contact."Post Code";
        Suppliers."Phone No." := Contact."Phone No.";
        Suppliers."E-Mail" := Contact."E-Mail";
        Suppliers."VAT Registration No." := Contact."VAT Registration No.";
        Suppliers.Registered := Suppliers.Registered::No;
        // Suppliers."Contact No" := Contact."No.";
        //Suppliers."Tax Compliance" := Contact."Tax Compliance Certificate No";
        if Suppliers.insert(true) then begin
            //Createonetimepass(Contact, Suppliers."No.");

            message('Supplier %1 Successfully created', Suppliers."No.");
        end;


    end;

    procedure CreateVendor(Contact: Record Contact)
    var
        // Contact: Record Contact;
        Suppliers: Record Vendor;

    begin
        Suppliers.reset();
        Suppliers.setrange("No.", Contact."No.");
        if Suppliers.FindFirst() then begin
            ERROR('Supplier %1 Already Exists', Suppliers."No.");
        end;
        Suppliers.Init();
        Suppliers.Name := Contact.Name;
        Suppliers."Country/Region Code" := Contact."Country/Region Code";
        Suppliers.Address := Contact.Address;
        Suppliers."Post Code" := Contact."Post Code";
        Suppliers."Phone No." := Contact."Phone No.";
        Suppliers."E-Mail" := Contact."E-Mail";
        Suppliers."VAT Registration No." := Contact."VAT Registration No.";
        Suppliers.Registered := Suppliers.Registered::No;
        // Suppliers."Contact No" := Contact."No.";
        //Suppliers."Tax Compliance" := Contact."Tax Compliance Certificate No";
        if Suppliers.insert(true) then begin
            //Createonetimepass(Contact, Suppliers."No.");

            message('Supplier %1 Successfully created', Suppliers."No.");
        end;


    end;

    procedure FnSendEmaiNotificationOnSupplierRegRequest(SupplierRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //   //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[250];
        SenderMessage: Text[250];
    begin
        ///Notifying Procurement Team on supplier Request


        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;



        RequesterEmail := SupplierRequest."E-Mail";
        RequesterName := SupplierRequest.Name;

        Window.Open('Notifying the Procurement Department...');

        WindowisOpen := true;


        Counter := Counter + 1;

        //Create message
        if HRSetup."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := HRSetup."E-Mail";

        if PPayableSetup."Default Proc Email Contact" = '' then
            Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
        CustEmail := PPayableSetup."Default Proc Email Contact";

        CompanyDetails := 'Procurement Officer,' + '<BR></BR>' + CompInfo.Name + '<BR></BR>' + CompInfo.Address + '<BR></BR>' + CompInfo."Address 2" + '<BR></BR>' + CompInfo.City;
        SenderMessage := '<BR>This is to notify you that there has been a request for Registration via e-procurement for your action</BR>';
        SupplierDetails := 'Registration Request Reference No:' + SupplierRequest."No." + '<BR></BR>' + 'Company Name:' + SupplierRequest.Name + '<BR></BR>' +
        'Tax Registration (PIN) No:' + SupplierRequest."VAT Registration No." + '<BR></BR>' + 'Primary Email:' + SupplierRequest."E-Mail" + '<BR></BR>' +
        'Mobile Phone No:' + SupplierRequest."Phone No." + '<BR></BR>';
        if CustEmail = '' then
            exit;

        //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
        emailhdr := 'Vendor e-Registration Request Reference No:' + SupplierRequest."No.";

        // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // 'Procurement Officer,' + '<BR></BR>' + SenderMessage + SupplierDetails, true);

        // cu400.AddCC(RequesterEmail);

        // cu400.AppendToBody(CompanyDetails);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
    end;


    procedure FnSendEmaiNotificationOnSupplierRegRequestAcknowledge(SupplierRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[250];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[250];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
    begin
        ///Notifying Procurement Team on supplier Request


        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;



        RequesterEmail := SupplierRequest."E-Mail";
        RequesterName := SupplierRequest.Name;

        Window.Open('Notifying the Sender...');

        WindowisOpen := true;


        Counter := Counter + 1;


        //Create message
        if HRSetup."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := HRSetup."E-Mail";

        if PPayableSetup."Default Proc Email Contact" = '' then
            Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
        CustEmail := PPayableSetup."Default Proc Email Contact";

        CompanyDetails := 'Procurement Officer,' + '<BR></BR>' + CompInfo.Name + '<BR></BR>' + CompInfo.Address + '<BR></BR>' + CompInfo."Address 2" + '<BR></BR>' + CompInfo.City;
        SenderMessage := '<BR>Thank you for using our e-Procurement Portal which has been established to provide you with easy access to our online business services such as supplier registration, vendor self-service and e-bidding.' +
        'This email is to acknowledge that your Request for registration as a supplier, done on:' + Format(SupplierRequest."Last Date Modified") +
        'has been received, summarized as follows:' + '<BR></BR>';

        SupplierDetails := 'Registration Request Reference No:' + SupplierRequest."No." + '<BR></BR>' + 'Company Name:' + SupplierRequest.Name + '<BR></BR>' +
        'Tax Registration (PIN) No:' + SupplierRequest."VAT Registration No." + '<BR></BR>' + 'Primary Email:' + SupplierRequest."E-Mail" + '<BR></BR>' +
        'Mobile Phone No:' + SupplierRequest."Phone No." + '<BR></BR>';


        ProcNote := 'Please note that the Procurement Office shall review your request and once approved, you shall receive an account activation email and a link to the Confidential Business Questionnaire for you to complete your registration.' +
        '<BR></BR>' + 'If you require any assistance, please contact our Procurement team by Phone' + HRSetup."Phone No." + 'or vendor support team via Email:' + PPayableSetup."Default Proc Email Contact";

        if CustEmail = '' then
            exit;

        //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
        emailhdr := 'Vendor e-Registration acknowledgment (Reference No:' + SupplierRequest."No." + ')';

        // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

        // cu400.AddCC(RequesterEmail);

        // cu400.AppendToBody(ProcNote);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
    end;


    /// <summary>
    /// FnSendEmaiNotificationOnSupplierAccountActivation.
    /// </summary>
    /// <param name="Vendor">Record Contact.</param>
    // procedure FnSendEmaiNotificationOnSupplierAccountActivation(Vendor: Record Contact)
    // var
    //     SupplierReq: Record Contact;
    //     LastFieldNo: Integer;
    //     FooterPrinted: Boolean;
    //     FileDirectory: Text[100];
    //     FileName: Text[100];
    //     ReportID: Integer;
    //     // //"Object": Record "Object";
    //     Window: Dialog;
    //     RunOnceFile: Text[1000];
    //     TimeOut: Integer;
    //     Customer2: Record Customer;
    //     Cust: Record Customer;
    //     cr: Integer;
    //     lf: Integer;
    //     EmailBody: array[2] of Text[30];
    //     BodyText: Text[250];
    //     mymail: Codeunit Mail;
    //     DefaultPrinter: Text[200];
    //     WindowisOpen: Boolean;
    //     FileDialog: Codeunit "Email Message";
    //     SendingDate: Date;
    //     SendingTime: Time;
    //     Counter: Integer;
    //     cu400: Codeunit "Email Message";
    //     //DocLog: Record "Document E-mail Log";
    //     BranchName: Code[80];
    //     DimValue: Record "Dimension Value";
    //     SenderAddress: Text[100];
    //     CustEmail: Text[100];
    //     UserSetup: Record "User Setup";
    //     HRSetup: Record "Company Information";
    //     Emp: Record Vendor;
    //     PayrollMonth: Date;
    //     PayrollMonthText: Text[30];
    //     PayPeriodtext: Text;
    //     PayPeriod: Record "Payroll PeriodX";
    //     CompInfo: Record "Company Information";
    //     DateFilter: Text;
    //     FromDate: Date;
    //     ToDate: Date;
    //     FromDateS: Text;
    //     ToDateS: Text;
    //     vend: Record Vendor;
    //     StartDate: Date;
    //     EndDAte: Date;
    //     EmailVerifier: Codeunit Payroll3;
    //     IsEmailValid: Boolean;
    //     PPayableSetup: Record "Procurement Setup";
    //     RequesterName: Text[100];
    //     RequesterEmail: Text[100];
    //     emailhdr: Text[100];
    //     CompanyDetails: Text[250];
    //     SupplierDetails: Text[1000];
    //     SenderMessage: Text[1000];
    //     ProcNote: Text[1000];
    //     LoginDetails: Text[1000];
    //     //PortalUser: Record "Dynasoft Portal User";
    //     Password: Text[50];
    //     ActivationDetails: Text[1000];
    // begin
    //     ///Notifying Procurement Team on supplier Request


    //     CompInfo.Get;
    //     HRSetup.Get;
    //     PPayableSetup.Get;



    //     RequesterEmail := Vendor."E-Mail";
    //     RequesterName := Vendor.Name;

    //     Window.Open('Notifying the Sender...');

    //     WindowisOpen := true;


    //     Counter := Counter + 1;
    //     PortalUser.Reset;
    //     PortalUser.SetRange("User Name", Vendor."E-Mail");
    //     if PortalUser.FindSet then
    //         Password := PortalUser."Password Value";

    //     //Create message
    //     if HRSetup."E-Mail" = '' then
    //         Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
    //     SenderAddress := HRSetup."E-Mail";

    //     if PPayableSetup."Default Proc Email Contact" = '' then
    //         Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
    //     CustEmail := PPayableSetup."Default Proc Email Contact";

    //     CompanyDetails := 'Dear Vendor,' + '<BR></BR>' + Vendor.Name;
    //     SenderMessage := '<BR>Please note that your Vendor account has been created on our System, with the following key registration details:</BR>' + '<BR></BR>';
    //     SupplierDetails := '<BR>Registration Request Reference No:' + Vendor."No." + '</BR>' + '<BR> Name:' + Vendor.Name + '</BR>' +
    //     '<BR>Tax Registration (PIN) No:' + Vendor."VAT Registration No." + '</BR>' +
    //     '<BR>Mobile Phone No:' + Vendor."Phone No." + '</BR>';
    //     LoginDetails := 'We have also created your portal access account with the following login credentials:' + '<BR></BR>' +
    //     'User Name:' + Vendor."E-Mail" + '<BR></BR>' + 'Password:' + Password + '<BR>To access our portal and complete your registration click on the link below, using your email address: </BR>' + Vendor."E-Mail";
    //     ActivationDetails := '<BR>Once you access our portal, you shall be able to complete the Confidential Business Questionnaire section of the registration that shall require you to provide the following information:</BR>' +
    //     '<BR> • Business profile summary</BR>' +
    //     '<BR> •Communication/contact details</BR>' +
    //     '<BR> •Bank account details</BR>' +
    //     '<BR> •Business ownership details-Business type and directors/shareholders</BR>' +
    //     '<BR> •Products and services offered by your organization</BR>' +
    //     '<BR> •Litigation history</BR>' +
    //     '<BR> •Any client references</BR>' +
    //     '<BR> •Summary of your key staff</BR>';

    //     ProcNote := 'Please note that the Procurement Office shall review your request and once approved, you shall receive an account activation email and a link to the Confidential Business Questionnaire for you to complete your registration.' +
    //     '<BR></BR>' + 'If you require any assistance, please contact our Procurement team by Phone' + HRSetup."Phone No." + 'or vendor support team via Email:' + PPayableSetup."Default Proc Email Contact";

    //     if CustEmail = '' then
    //         exit;

    //     //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
    //     emailhdr := 'e-Procurement Account Activation (Vendor Account No:' + vend."No." + ')';

    //     // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
    //     // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

    //     // cu400.AddCC(RequesterEmail);

    //     // cu400.AppendToBody(ProcNote);


    //     // cu400.Send;
    //     SendingDate := Today;
    //     SendingTime := Time;

    //     Sleep(1000);
    //     Window.Close;
    // end;


    procedure "...................Invitation For Prequalification......................."()
    begin
    end;


    procedure SuggestProcurementCategories(IFP: Record "Request For Information")
    var
        ProcCategories: Record "Procurement Category";
        IFPProcCategory: Record "RFI Prequalification Category";
    begin
        IFPProcCategory.Reset;
        IFPProcCategory.SetRange("Document No", IFP.Code);
        if not IFPProcCategory.FindSet then begin
            ProcCategories.Reset;
            if IFP."Procurement Type" <> '' then
                ProcCategories.SetRange("Procurement Type", IFP."Procurement Type");
            ProcCategories.SetRange(Blocked, false);
            if ProcCategories.FindSet then begin
                repeat
                    IFPProcCategory."Document Type" := IFP."Document Type";
                    IFPProcCategory."Document No" := IFP.Code;
                    IFPProcCategory."Prequalification Category ID" := ProcCategories.Code;
                    IFPProcCategory.Validate("Prequalification Category ID");
                    if ProcCategories."Preferred Vendor Cluster" = ProcCategories."preferred vendor cluster"::Special then
                        IFPProcCategory."Special Group Reservation" := true;
                    IFPProcCategory."Restricted RC Code" := ProcCategories."Responsibility Center Code";
                    IFPProcCategory."Applicable Location" := ProcCategories."Applicable Location";
                    IFPProcCategory.Insert(true);
                until ProcCategories.Next = 0;
            end;
        end;
    end;


    procedure SuggestRequiredDoc(IFP: Record "Request For Information")
    var
        ProcSetup: Record "Procurement Setup";
        ProccDocumentTempLine: Record "Procurement Doc Template Line";
        RFIRequiredDoc: Record "RFI Required Document";
    begin
        ProcSetup.Get;
        ProcSetup.TestField("Default Procurement Template");
        RFIRequiredDoc.Reset;
        RFIRequiredDoc.SetRange("Document No", IFP.Code);
        if not RFIRequiredDoc.FindSet then begin
            ProccDocumentTempLine.Reset;
            ProccDocumentTempLine.SetRange("Template ID", ProcSetup."Default Procurement Template");
            ProccDocumentTempLine.SetRange("Procurement Process", ProccDocumentTempLine."procurement process"::Prequalification);
            if ProccDocumentTempLine.FindSet then begin
                repeat
                    RFIRequiredDoc.Init;
                    RFIRequiredDoc."Document No" := IFP.Code;
                    RFIRequiredDoc."Document Type" := IFP."Document Type";
                    RFIRequiredDoc."Procurement Document Type ID" := ProccDocumentTempLine."Procurement Document Type";
                    RFIRequiredDoc.Description := ProccDocumentTempLine.Description;
                    RFIRequiredDoc.Insert(true);
                until ProccDocumentTempLine.Next = 0;
            end;

        end;
    end;


    procedure PublishIFP(IFP: Record "Request For Information")
    var
        Text0001: label 'The Invitation for Prequalification Voucher %1 should be fully approved';
    begin
        if IFP.Status <> IFP.Status::Released then
            Error(Text0001, IFP.Code);

        //Publish
        IFP.Published := true;
        IFP."Date/Time Published" := CurrentDatetime;
        IFP."RFI Document Status" := IFP."rfi document status"::Published;
        IFP.Modify;
    end;


    procedure CloseIFP(IFP: Record "Request For Information")
    var
        Text0001: label 'The IFP voucher is still Active for submission';
        IFPResponse: Record "RFI Response";
        IFPResponseLine: Record "IFP Response Line";
        VendPrequalificationEntry: Record "Vendor Prequalification Entry";
    begin
        if IFP."Submission End Date" > Today then
            Error(Text0001);

        IFPResponse.Reset;
        IFPResponse.SetRange("RFI Document No.", IFP.Code);
        if IFPResponse.FindSet then begin
            repeat
                IFPResponseLine.Reset;
                IFPResponseLine.SetRange("Document No.", IFPResponse."Document No.");
                if IFPResponseLine.FindSet then begin
                    repeat
                        //all lines should be assigned final score
                        IFPResponseLine.TestField("Evaluation Score %");
                        if IFPResponseLine."Evaluation Decision" = IFPResponseLine."evaluation decision"::Pass then begin
                            VendPrequalificationEntry.Reset;
                            VendPrequalificationEntry.SetRange("Vendor No.", IFPResponseLine."Vendor No.");
                            VendPrequalificationEntry.SetRange("Procurement Category Code", IFPResponseLine."Procurement Category");
                            if not VendPrequalificationEntry.FindSet then begin
                                VendPrequalificationEntry.Init;
                                VendPrequalificationEntry."IFP No." := IFPResponseLine."RFI Document No.";
                                VendPrequalificationEntry."Vendor No." := IFPResponseLine."Vendor No.";
                                //VendPrequalificationEntry."Procurement Type":=IFPResponseLine.p
                                VendPrequalificationEntry."Procurement Category Code" := IFPResponseLine."Procurement Category";
                                VendPrequalificationEntry.Description := IFPResponseLine."Category Description";
                                VendPrequalificationEntry."Start Date" := IFPResponseLine."Prequalification Start Date";
                                VendPrequalificationEntry."End Date" := IFPResponseLine."Prequalification End Date";
                                VendPrequalificationEntry.Insert(true)
                            end;
                        end;

                    until IFPResponseLine.Next = 0;
                end;
                IFPResponse."Document Status" := IFPResponse."document status"::Closed;
                IFPResponse.Modify(true);
            until IFPResponse.Next = 0;
        end;

        //IFP."RFI Document Status":=IFP."RFI Document Status"::"Submissions Closed";
        IFP."RFI Document Status" := IFP."rfi document status"::Closed;
        IFP.Modify(true);
        Message('Invitation for Prequalification %1 has been closed successfuly', IFP.Code);
    end;


    procedure ActivateEvaluationsIFP(IFP: Record "Request For Information")
    var
        Text0001: label 'The IFP voucher is still Active for submission';
        IFPResponse: Record "RFI Response";
    begin
        if IFP."Submission End Date" > Today then
            Error(Text0001);

        //IFP."RFI Document Status":=IFP."RFI Document Status"::"Submissions Closed";


        //Activate Evaluations
        IFPResponse.Reset;
        IFPResponse.SetRange("RFI Document No.", IFP.Code);
        if IFPResponse.FindSet then begin
            repeat
                IFPResponse."Document Status" := IFPResponse."document status"::Evaluation;
                IFPResponse.Modify(true);
            until IFPResponse.Next = 0;
        end;
        IFP."RFI Document Status" := IFP."rfi document status"::"Evaluation Stage";
        IFP.Modify;
        Message('Evaluations for Prequalification %1 has been actviated Successfully Proceed to List of IFP Response evaluation', IFP.Code);
    end;


    procedure CancelIFP(IFP: Record "Request For Information")
    var
        Text0001: label 'The IFP voucher is still Active for submission';
        IFPResponse: Record "RFI Response";
        IFPResponseLine: Record "IFP Response Line";
        VendPrequalificationEntry: Record "Vendor Prequalification Entry";
    begin
        if IFP."Submission End Date" > Today then
            Error(Text0001);
        IFPResponse.Reset;
        IFPResponse.SetRange("RFI Document No.", IFP.Code);
        if IFPResponse.FindSet then begin
            repeat
                IFPResponseLine.Reset;
                IFPResponseLine.SetRange("Document No.", IFPResponse."Document No.");
                if IFPResponseLine.FindSet then begin
                    repeat
                        //all lines should be assigned final score
                        IFPResponseLine.TestField("Evaluation Score %");
                        if IFPResponseLine."Evaluation Decision" = IFPResponseLine."evaluation decision"::Pass then begin
                            VendPrequalificationEntry.Reset;
                            VendPrequalificationEntry.SetRange("Vendor No.", IFPResponseLine."Vendor No.");
                            VendPrequalificationEntry.SetRange("Procurement Category Code", IFPResponseLine."Procurement Category");
                            if VendPrequalificationEntry.FindSet then begin
                                VendPrequalificationEntry.Blocked := true;
                                VendPrequalificationEntry.Modify(true)
                            end;
                        end;

                    until IFPResponseLine.Next = 0;
                end;
                IFPResponse."Document Status" := IFPResponse."document status"::Cancelled;
                IFPResponse.Modify(true);
            until IFPResponse.Next = 0;
        end;

        //IFP."RFI Document Status":=IFP."RFI Document Status"::"Submissions Closed";
        IFP."RFI Document Status" := IFP."rfi document status"::Canceled;
        IFP.Modify(true);
        Message('Invitation for Prequalification %1 has been closed successfuly', IFP.Code);
    end;

    local procedure ".......Vendor Debarment....................."()
    begin
    end;


    procedure PostVendDebarment(VendDebarment: Record "Vendor Debarment Voucher")
    var
        VendDebarmentLines: Record "Vendor Debarment Voucher Line";
        Vendor: Record Vendor;
        VendDebarmentEntries: Record "Vendor Debarment Entry";
    begin
        VendDebarmentLines.Reset;
        VendDebarmentLines.SetRange("Document No", VendDebarment."Document No");
        if VendDebarmentLines.FindSet then begin
            repeat
                //all lines must have debarment reason code
                VendDebarmentLines.TestField("Debarment Reason Code");
                //if source type is internal all lines should have vendor no.
                if VendDebarment."Source Type" = VendDebarment."source type"::"Internal(Procuring Entity)" then
                    VendDebarmentLines.TestField("Vendor No.");

                Vendor.Reset;
                Vendor.SetRange("No.", VendDebarmentLines."Vendor No.");
                if Vendor.FindSet then begin
                    Vendor.Debarred := true;
                    Vendor."Debarment Voucher No" := VendDebarment."Document No";
                    Vendor."Debarment Expiry Date" := VendDebarmentLines."Ineligibility End Date";
                    Vendor.Blocked := Vendor.Blocked::All;
                    Vendor.Modify;
                end;

                VendDebarmentEntries.Reset;
                VendDebarmentEntries.SetRange("Source Voucher No.", VendDebarment."Document No");
                VendDebarmentEntries.SetRange("Vendor No.", VendDebarmentLines."Vendor No.");
                if not VendDebarmentEntries.FindSet then begin
                    VendDebarmentEntries.Init;
                    VendDebarmentEntries."Document Type" := VendDebarmentLines."Document Type";
                    VendDebarmentEntries."Source Voucher No." := VendDebarmentLines."Document No";
                    VendDebarmentEntries."Entry no" := VendDebarmentLines."Line No.";
                    VendDebarmentEntries."Firm Name" := VendDebarmentLines."Firm Name";
                    VendDebarmentEntries."Reason Code" := VendDebarmentLines."Debarment Reason Code";
                    VendDebarmentEntries."Ineligibility Start Date" := VendDebarmentLines."Ineligibility Start Date";
                    VendDebarmentEntries."Ineligibility End Date" := VendDebarmentLines."Ineligibility End Date";
                    VendDebarmentEntries."Reinstatement Date" := VendDebarmentLines."Reinstatement Date";
                    VendDebarmentEntries."Vendor No." := VendDebarmentLines."Vendor No.";
                    VendDebarmentEntries."Tax Registration (PIN) No." := VendDebarmentLines."Tax Registration (PIN) No.";
                    VendDebarmentEntries.Blocked := false;
                    VendDebarmentEntries.Insert(true);

                end;


            until VendDebarmentLines.Next = 0;

        end;
        VendDebarment.Posted := true;
        VendDebarment.Modify;
        Message('Vendor Debarment Voucher %1 has been posted succesfuly', VendDebarment."Document No");
    end;


    procedure PostVendReinstatement(VendDebarment: Record "Vendor Debarment Voucher")
    var
        VendDebarmentLines: Record "Vendor Debarment Voucher Line";
        Vendor: Record Vendor;
        VendDebarmentEntries: Record "Vendor Debarment Entry";
    begin
        VendDebarmentLines.Reset;
        VendDebarmentLines.SetRange("Document No", VendDebarment."Document No");
        if VendDebarmentLines.FindSet then begin
            repeat
                //all lines must have Reinstatement reason code
                VendDebarmentLines.TestField("Debarment Reason Code");
                //if source type is internal all lines should have vendor no.
                if VendDebarment."Source Type" = VendDebarment."source type"::"Internal(Procuring Entity)" then
                    VendDebarmentLines.TestField("Vendor No.");

                Vendor.Reset;
                Vendor.SetRange("No.", VendDebarmentLines."Vendor No.");
                if Vendor.FindSet then begin
                    Vendor.Debarred := false;
                    Vendor."Debarment Voucher No" := VendDebarment."Document No";
                    Vendor."Debarment Expiry Date" := VendDebarmentLines."Ineligibility End Date";
                    Vendor.Blocked := Vendor.Blocked::" ";
                    Vendor.Modify;
                end;

                VendDebarmentEntries.Reset;
                VendDebarmentEntries.SetRange("Source Voucher No.", VendDebarment."Document No");
                VendDebarmentEntries.SetRange("Vendor No.", VendDebarmentLines."Vendor No.");
                if not VendDebarmentEntries.FindSet then begin
                    VendDebarmentEntries.Init;
                    VendDebarmentEntries."Document Type" := VendDebarmentLines."Document Type";
                    VendDebarmentEntries."Source Voucher No." := VendDebarmentLines."Document No";
                    VendDebarmentEntries."Entry no" := VendDebarmentLines."Line No.";
                    VendDebarmentEntries."Firm Name" := VendDebarmentLines."Firm Name";
                    VendDebarmentEntries."Reason Code" := VendDebarmentLines."Debarment Reason Code";
                    VendDebarmentEntries."Ineligibility Start Date" := VendDebarmentLines."Ineligibility Start Date";
                    VendDebarmentEntries."Ineligibility End Date" := VendDebarmentLines."Ineligibility End Date";
                    VendDebarmentEntries."Reinstatement Date" := VendDebarmentLines."Reinstatement Date";
                    VendDebarmentEntries."Vendor No." := VendDebarmentLines."Vendor No.";
                    VendDebarmentEntries."Tax Registration (PIN) No." := VendDebarmentLines."Tax Registration (PIN) No.";
                    VendDebarmentEntries.Blocked := false;
                    VendDebarmentEntries.Insert(true);

                end;


            until VendDebarmentLines.Next = 0;

        end;
        VendDebarment.Posted := true;
        VendDebarment.Modify;
        Message('Vendor Reinstatement Voucher %1 has been posted succesfuly', VendDebarment."Document No");
    end;

    local procedure "................."()
    begin
    end;


    procedure ReleaseSupplierRatingTemplate(SupplierRatingTemp: Record "Supplier Rating Template")
    var
        EvaluationCriteria: Record "Supplier Rating Requirement";
        ScoreGuide: Record "Supplier Rating Score Guide";
    begin
        if SupplierRatingTemp.Released = true then
            Error('Document has already been Released');


        //check to ensure every evaluation critera has associated score guide entries

        EvaluationCriteria.Reset;
        EvaluationCriteria.SetRange("Appraisal Template ID", SupplierRatingTemp.Code);
        if EvaluationCriteria.FindSet then begin
            repeat
                ScoreGuide.Reset;
                ScoreGuide.SetRange("Appraisal Template ID", EvaluationCriteria."Appraisal Template ID");
                ScoreGuide.SetRange("Criteria Group", EvaluationCriteria."Criteria Group");
                ScoreGuide.SetRange("Checklist ID", EvaluationCriteria."Checklist ID");
                if not ScoreGuide.FindSet then
                    Error('Evaluation Criteria %1 should have a score Guide ', EvaluationCriteria."Evaluation Requirement");
            until EvaluationCriteria.Next = 0;
        end;

        SupplierRatingTemp.Released := true;
        SupplierRatingTemp.Modify(true);

        Message('Supplier Rating Template %1 has been released successfuly', SupplierRatingTemp.Code);
    end;


    procedure SuggestScoreGuide(SupplierRatingTemp: Record "Supplier Rating Template")
    var
        EvaluationCriteria: Record "Supplier Rating Requirement";
        ScoreGuide: Record "Supplier Rating Score Guide";
        i: Integer;
    begin
        if SupplierRatingTemp.Released = true then
            Error('The Supplier Rating Template is already Released, it cannot be modified unless Reopened');

        //Suggest every evaluation critera with associated score guide entries

        EvaluationCriteria.Reset;
        EvaluationCriteria.SetRange("Appraisal Template ID", SupplierRatingTemp.Code);
        if EvaluationCriteria.FindSet then begin
            repeat
                ScoreGuide.Reset;
                ScoreGuide.SetRange("Appraisal Template ID", EvaluationCriteria."Appraisal Template ID");
                ScoreGuide.SetRange("Criteria Group", EvaluationCriteria."Criteria Group");
                ScoreGuide.SetRange("Checklist ID", EvaluationCriteria."Checklist ID");
                if not ScoreGuide.FindSet then begin

                    if EvaluationCriteria."Rating Type" = EvaluationCriteria."rating type"::"Yes/No" then begin
                        i := 1;
                        repeat
                            ScoreGuide.Init;
                            ScoreGuide."Appraisal Template ID" := SupplierRatingTemp.Code;
                            ScoreGuide."Template Type" := SupplierRatingTemp."Template Type";
                            ScoreGuide."Criteria Group" := EvaluationCriteria."Criteria Group";
                            ScoreGuide."Checklist ID" := EvaluationCriteria."Checklist ID";
                            ScoreGuide."Min Bid Value" := 0;
                            ScoreGuide."Min Date Value" := 0D;
                            ScoreGuide."Max Bid Value" := 0;
                            ScoreGuide."Max Date Value" := 0D;
                            if i = 1 then begin
                                ScoreGuide."Response Value" := SupplierRatingTemp."YES Bid Rating Response Value";
                                ScoreGuide."Score %" := SupplierRatingTemp."Default YES Bid Rating Score %";
                            end else begin
                                ScoreGuide."Response Value" := SupplierRatingTemp."NO Bid Rating Response Value";
                                ScoreGuide."Score %" := SupplierRatingTemp."Default NO Bid Rating Score %";
                            end;
                            i += 1;
                            ScoreGuide.Init;
                        until i = 2;
                    end;
                    if EvaluationCriteria."Rating Type" = EvaluationCriteria."rating type"::Number then begin
                        if EvaluationCriteria."Desired Perfomance Direction" = EvaluationCriteria."desired perfomance direction"::"Increasing KPI" then begin
                            i := 1;
                            repeat
                                ScoreGuide.Init;
                                ScoreGuide."Appraisal Template ID" := SupplierRatingTemp.Code;
                                ScoreGuide."Template Type" := SupplierRatingTemp."Template Type";
                                ScoreGuide."Criteria Group" := EvaluationCriteria."Criteria Group";
                                ScoreGuide."Checklist ID" := EvaluationCriteria."Checklist ID";
                                if i = 1 then begin
                                    ScoreGuide."Min Bid Value" := 0;
                                    ScoreGuide."Min Date Value" := 0D;
                                    ScoreGuide."Max Bid Value" := EvaluationCriteria."Target Qty" - 1;
                                    ScoreGuide."Max Date Value" := 0D;
                                    //ScoreGuide."Response Value":=SupplierRatingTemp."YES Bid Rating Response Value";
                                    ScoreGuide."Score %" := 0;
                                end else begin
                                    ScoreGuide."Min Bid Value" := EvaluationCriteria."Target Qty";
                                    ScoreGuide."Min Date Value" := 0D;
                                    ScoreGuide."Max Bid Value" := SupplierRatingTemp."Max Bid Value Limit";
                                    ScoreGuide."Max Date Value" := 0D;
                                    // ScoreGuide."Response Value":=SupplierRatingTemp."NO Bid Rating Response Value";
                                    ScoreGuide."Score %" := 100;
                                end;
                                i += 1;
                                ScoreGuide.Init;
                            until i = 2;
                        end;
                        if EvaluationCriteria."Target Qty" <> 0 then begin
                            if EvaluationCriteria."Desired Perfomance Direction" = EvaluationCriteria."desired perfomance direction"::"Decreasing KPI" then begin
                                i := 1;
                                repeat
                                    ScoreGuide.Init;
                                    ScoreGuide."Appraisal Template ID" := SupplierRatingTemp.Code;
                                    ScoreGuide."Template Type" := SupplierRatingTemp."Template Type";
                                    ScoreGuide."Criteria Group" := EvaluationCriteria."Criteria Group";
                                    ScoreGuide."Checklist ID" := EvaluationCriteria."Checklist ID";
                                    if i = 1 then begin
                                        ScoreGuide."Min Bid Value" := 0;
                                        ScoreGuide."Min Date Value" := 0D;
                                        ScoreGuide."Max Bid Value" := EvaluationCriteria."Target Qty" - 1;
                                        ScoreGuide."Max Date Value" := 0D;
                                        //ScoreGuide."Response Value":=SupplierRatingTemp."YES Bid Rating Response Value";
                                        ScoreGuide."Score %" := 100;
                                    end else begin
                                        ScoreGuide."Min Bid Value" := EvaluationCriteria."Target Qty";
                                        ScoreGuide."Min Date Value" := 0D;
                                        ScoreGuide."Max Bid Value" := SupplierRatingTemp."Max Bid Value Limit";
                                        ScoreGuide."Max Date Value" := 0D;
                                        //ScoreGuide."Response Value":=SupplierRatingTemp."NO Bid Rating Response Value";
                                        ScoreGuide."Score %" := 0;
                                    end;
                                    i += 1;
                                    ScoreGuide.Init;
                                until i = 2;
                            end;
                        end else begin
                            if EvaluationCriteria."Desired Perfomance Direction" = EvaluationCriteria."desired perfomance direction"::"Decreasing KPI" then begin
                                i := 1;
                                repeat
                                    ScoreGuide.Init;
                                    ScoreGuide."Appraisal Template ID" := SupplierRatingTemp.Code;
                                    ScoreGuide."Template Type" := SupplierRatingTemp."Template Type";
                                    ScoreGuide."Criteria Group" := EvaluationCriteria."Criteria Group";
                                    ScoreGuide."Checklist ID" := EvaluationCriteria."Checklist ID";
                                    if i = 1 then begin
                                        ScoreGuide."Min Bid Value" := 0;
                                        ScoreGuide."Min Date Value" := 0D;
                                        ScoreGuide."Max Bid Value" := EvaluationCriteria."Target Qty" - 1;
                                        ScoreGuide."Max Date Value" := 0D;
                                        //ScoreGuide."Response Value":=SupplierRatingTemp."YES Bid Rating Response Value";
                                        ScoreGuide."Score %" := 100;
                                    end else begin
                                        ScoreGuide."Min Bid Value" := EvaluationCriteria."Target Qty" + 1;
                                        ScoreGuide."Min Date Value" := 0D;
                                        ScoreGuide."Max Bid Value" := SupplierRatingTemp."Max Bid Value Limit";
                                        ScoreGuide."Max Date Value" := 0D;
                                        //ScoreGuide."Response Value":=SupplierRatingTemp."NO Bid Rating Response Value";
                                        ScoreGuide."Score %" := 0;
                                    end;
                                    i += 1;
                                    ScoreGuide.Init;
                                until i = 2;
                            end;
                        end;
                    end;
                    if EvaluationCriteria."Rating Type" = EvaluationCriteria."rating type"::"Options Text" then begin
                        i := 5;
                        repeat
                            ScoreGuide.Init;
                            ScoreGuide."Appraisal Template ID" := SupplierRatingTemp.Code;
                            ScoreGuide."Template Type" := SupplierRatingTemp."Template Type";
                            ScoreGuide."Criteria Group" := EvaluationCriteria."Criteria Group";
                            ScoreGuide."Checklist ID" := EvaluationCriteria."Checklist ID";
                            ScoreGuide."Min Bid Value" := 0;
                            ScoreGuide."Min Date Value" := 0D;
                            ScoreGuide."Max Bid Value" := 0;
                            ScoreGuide."Max Date Value" := 0D;
                            if i = 1 then begin
                                ScoreGuide."Response Value" := '1-POOR';
                                ScoreGuide."Score %" := SupplierRatingTemp."1-POOR Option Text Bid Score %";
                            end else
                                if i = 2 then begin
                                    ScoreGuide."Response Value" := '2-FAIR';
                                    ScoreGuide."Score %" := SupplierRatingTemp."2-FAIR Option Text Bid Score %";
                                end else
                                    if i = 3 then begin
                                        ScoreGuide."Response Value" := '3-GOOD';
                                        ScoreGuide."Score %" := SupplierRatingTemp."3-GOOD Option Text Bid Score %";
                                    end else
                                        if i = 4 then begin
                                            ScoreGuide."Response Value" := '4-VERY GOOD';
                                            ScoreGuide."Score %" := SupplierRatingTemp."4-VERY GOOD  Text Bid Score %";
                                        end else
                                            if i = 5 then begin
                                                ScoreGuide."Response Value" := '5-EXCELLENT';
                                                ScoreGuide."Score %" := SupplierRatingTemp."5-EXCELLENT Text Bid Score %";
                                            end;
                            i += 1;
                            ScoreGuide.Init;
                        until i = 5;
                    end;
                end;
            until EvaluationCriteria.Next = 0;
        end;



        Message('Supplier Score Guide has been Suggested successfuly');
    end;


    procedure SuggestEvaluationCriteria(EvaluationHeader: Record "Prequalification Score Header")
    var
        Scoresheet: Record "Prequalification Score Line";
        SupplierRatingReq: Record "Bid Score Requirement";
        LineNo: Integer;
    begin
        EvaluationHeader.TestField("Prequalification Evaluation Te");

        Scoresheet.Reset;
        if Scoresheet.FindLast then
            LineNo := Scoresheet."Line No" + 1;

        Scoresheet.Reset;
        Scoresheet.SetRange("Rating Template ID", EvaluationHeader."Prequalification Evaluation Te");
        Scoresheet.SetRange("Evaluation Voucher ID", EvaluationHeader.Code);
        if Scoresheet.FindSet then begin
            Scoresheet.DeleteAll;

        end;

        SupplierRatingReq.Reset;
        SupplierRatingReq.SetRange("Template ID", EvaluationHeader."Prequalification Evaluation Te");
        if SupplierRatingReq.FindSet then begin
            repeat
                Scoresheet.Init;
                Scoresheet."Evaluation Voucher ID" := EvaluationHeader.Code;
                Scoresheet."Line No" := LineNo;
                Scoresheet."Rating Template ID" := SupplierRatingReq."Template ID";
                Scoresheet."Template Type" := SupplierRatingReq."Evaluation Type";
                Scoresheet."Criteria Group" := SupplierRatingReq."Criteria Group ID";
                Scoresheet."Checklist ID" := SupplierRatingReq."Requirement ID";
                Scoresheet."Evaluation Requirement" := SupplierRatingReq."Evaluation Requirement";
                Scoresheet."Rating Type" := SupplierRatingReq."Rating Type";
                Scoresheet."Assigned Weight %" := SupplierRatingReq."Assigned Weight %";
                Scoresheet."Weighted Line Score" := Scoresheet."Score %" * Scoresheet."Assigned Weight %" / 100;
                Scoresheet."Target Qty" := SupplierRatingReq."Target Qty";
                Scoresheet."Desired Perfomance Direction" := SupplierRatingReq."Desired Perfomance Direction";
                Scoresheet."Target Value" := SupplierRatingReq."Target Qty";
                Scoresheet.Insert(true);
                LineNo += 1;
            until SupplierRatingReq.Next = 0;
        end;
    end;


    procedure PostEvaluation(EvaluationHeader: Record "Prequalification Score Header")
    var
        Scoresheet: Record "Prequalification Score Line";
        SupplierRatingReq: Record "Supplier Rating Requirement";
        IFPResponseLine: Record "IFP Response Line";
        IFP: Record "Request For Information";
    begin

        EvaluationHeader.TestField("Prequalification Evaluation Te");
        EvaluationHeader.TestField("Final Evaluation Decision");
        PrequalificationEntry.Reset;
        PrequalificationEntry.SetRange("Vendor No.", EvaluationHeader."Vendor No.");
        PrequalificationEntry.SetRange("Document Type", PrequalificationEntry."document type"::"IFP Response");
        PrequalificationEntry.SetRange("Document No.", EvaluationHeader.Code);
        if EvaluationHeader."Final Evaluation Decision" = EvaluationHeader."Final Evaluation Decision"::Fail then begin


            // if PrequalificationEntry.FindSet then begin
            //     PrequalificationEntry."IFP No." := EvaluationHeader."IFP No.";
            //     PrequalificationEntry."Vendor No." := EvaluationHeader."Vendor No.";
            //     PrequalificationEntry."Procurement Category Code" := EvaluationHeader."Procurement Category";
            //     PrequalificationEntry.Description := EvaluationHeader."Category Name";
            //     PrequalificationEntry."Document No." := EvaluationHeader.Code;
            //     ProcurementCat.Reset;
            //     ProcurementCat.SetRange(Code, EvaluationHeader."Procurement Category");
            //     if ProcurementCat.FindSet then begin
            //         PrequalificationEntry."Procurement Type" := ProcurementCat."Procurement Type";
            //     end;
            //     IFP.Reset;
            //     IFP.SetRange(Code, EvaluationHeader."IFP No.");
            //     if IFP.FindSet then begin
            //         PrequalificationEntry."Start Date" := IFP."Submission Start Date";
            //         PrequalificationEntry."End Date" := IFP."Submission End Date";
            //     end;
            IFPResponseL.Reset;
            IFPResponseL.SetRange("Document No.", EvaluationHeader."Prequalification Response No.");
            IFPResponseL.SetRange("RFI Document No.", EvaluationHeader."IFP No.");
            IFPResponseL.SetRange("Procurement Category", EvaluationHeader."Procurement Category");
            if IFPResponseL.FindSet then begin
                IFPResponseL."Evaluation Decision" := EvaluationHeader."Final Evaluation Decision";
                IFPResponseL."Evaluation Score %" := EvaluationHeader."Final Evaluation Score %";
            end;
            //     PrequalificationEntry.Modify(true);
            //     Message('Successfully Modified');
        end else begin
            PrequalificationEntry.Init;
            PrequalificationEntry."IFP No." := EvaluationHeader."IFP No.";
            PrequalificationEntry."Vendor No." := EvaluationHeader."Vendor No.";
            PrequalificationEntry."Procurement Category Code" := EvaluationHeader."Procurement Category";
            PrequalificationEntry.Description := EvaluationHeader."Category Name";
            PrequalificationEntry."Document No." := EvaluationHeader.Code;
            if ProcurementCat.FindSet then begin
                PrequalificationEntry."Procurement Type" := ProcurementCat."Procurement Type";
            end;
            IFP.Reset;
            IFP.SetRange(Code, EvaluationHeader."IFP No.");
            if IFP.FindSet then begin
                PrequalificationEntry."Start Date" := IFP."Period Start Date";
                PrequalificationEntry."End Date" := IFP."Period End Date";
            end;
            IFPResponseL.Reset;
            IFPResponseL.SetRange("Document No.", EvaluationHeader."Prequalification Response No.");
            IFPResponseL.SetRange("RFI Document No.", EvaluationHeader."IFP No.");
            IFPResponseL.SetRange("Procurement Category", EvaluationHeader."Procurement Category");
            if IFPResponseL.FindSet then begin
                IFPResponseL."Evaluation Decision" := EvaluationHeader."Final Evaluation Decision";
                IFPResponseL."Evaluation Score %" := EvaluationHeader."Final Evaluation Score %";
            end;
            PrequalificationEntry.Insert(true);
        end;
        EvaluationHeader.Posted := TRUE;
        EvaluationHeader.MODIFY(TRUE);
        MESSAGE('Successfully Posted');

    end;


    procedure SuggestLinesFromRequisitionTemplate(Purch: Record "Purchase Header")
    var
        PurchLines: Record "Purchase Line";
        RequisitionTempLine: Record "BoQ Template Line1";
        RequisitionTempheader: Record "Purchase Requisition Template";
        LineNo: Integer;
    begin
        //Purch.TESTFIELD("PRN Type");
        if Purch."PRN Type" <> Purch."prn type"::Standard then
            Error('Purchase Requisition Must be Standard');

        PurchLines.Reset;
        if PurchLines.FindLast then
            LineNo := PurchLines."Line No.";

        //Transfer the Requisition Template Lines to PRN Lines
        RequisitionTempLine.Reset;
        RequisitionTempLine.SetRange("BoQ Template ID", Purch."Requisition Template ID");
        if RequisitionTempLine.FindSet then begin
            repeat
                PurchLines.Init;
                PurchLines."Document Type" := Purch."Document Type";
                PurchLines."Document No." := Purch."No.";
                PurchLines."Line No." := LineNo;
                PurchLines.Type := RequisitionTempLine.Type;
                PurchLines."No." := RequisitionTempLine."No.";
                PurchLines.Description := RequisitionTempLine.Description;
                PurchLines.Quantity := RequisitionTempLine.Quantity;
                PurchLines."Unit of Measure Code" := RequisitionTempLine."Unit of Measure Code";
                PurchLines.Amount := RequisitionTempLine."Amount Excl. VAT";
                PurchLines."Shortcut Dimension 1 Code" := RequisitionTempLine."Shortcut Dimension 1 Code";
                PurchLines."Shortcut Dimension 2 Code" := RequisitionTempLine."Shortcut Dimension 2 Code";
                PurchLines."Variant Code" := RequisitionTempLine."Variant Code";
                PurchLines."Dimension Set ID" := RequisitionTempLine."Dimension Set ID";
                PurchLines."Item Category Code" := RequisitionTempLine."Item Category Code";
                PurchLines.Insert(true);
                LineNo := LineNo + 10000;
            until RequisitionTempLine.Next = 0;

        end;
    end;


    procedure SuggestLinesFromRequisitionWorksTemplate(Purch: Record "Purchase Header")
    var
        PurchLines: Record "Purchase Line";
        RequisitionTempLine: Record "BoQ Template Line1";
        RequisitionTempheader: Record "Purchase Requisition Template";
        LineNo: Integer;
        NewDesc: Text;
    begin
        //Purch.TESTFIELD("PRN Type");
        if Purch."PRN Type" <> Purch."prn type"::"Project Works" then
            Error('Purchase Requisition Must be Project Works');
        PurchLines.Reset;
        if PurchLines.FindLast then
            LineNo := PurchLines."Line No.";
        //Transfer the Requisition Template Lines to PRN Lines
        RequisitionTempLine.Reset;
        RequisitionTempLine.SetRange("BoQ Template ID", Purch."Requisition Template ID");
        if RequisitionTempLine.FindSet then begin
            repeat
                PurchLines.Init;
                PurchLines."Document Type" := Purch."Document Type";
                PurchLines."Document No." := Purch."No.";
                PurchLines."Line No." := LineNo;
                PurchLines.Type := RequisitionTempLine.Type;
                PurchLines."No." := RequisitionTempLine."No.";
                NewDesc := CopyStr(RequisitionTempLine.Description, 1, 50);
                PurchLines.Description := NewDesc;
                PurchLines.Quantity := RequisitionTempLine.Quantity;
                PurchLines."Unit of Measure Code" := RequisitionTempLine."Unit of Measure Code";
                PurchLines.Amount := RequisitionTempLine."Amount Excl. VAT";
                PurchLines."Shortcut Dimension 1 Code" := RequisitionTempLine."Shortcut Dimension 1 Code";
                PurchLines."Shortcut Dimension 2 Code" := RequisitionTempLine."Shortcut Dimension 2 Code";
                PurchLines."Variant Code" := RequisitionTempLine."Variant Code";
                PurchLines."Dimension Set ID" := RequisitionTempLine."Dimension Set ID";
                PurchLines."Item Category Code" := RequisitionTempLine."Item Category Code";
                PurchLines.Insert(true);
                LineNo := LineNo + 10000;
            until RequisitionTempLine.Next = 0;

        end;
    end;


    // procedure SuggestPRNPersonnel_equipmentSpecification(Purch: Record "Purchase Header")
    // var
    //     PurchLines: Record "Purchase Line";
    //     RequisitionTempLine: Record "BoQ Template Line1";
    //     RequisitionTempheader: Record "Purchase Requisition Template";
    //     PRNPersonnelSpecification: Record "PRN Personnel Specification";
    //     PRNPersonnelqualification: Record "PRN Personnel Qualification";
    //     PRNPersonnelExperience: Record "PRN Personnel Experience";
    //     PRNEquipmentsSpecification: Record "PRN Equipment Specification";
    //     ProjStaffTemplate: Record "Project Staff Template Line";
    //     ProjStaffExperienceTemplate: Record "Project Staff Template Experie";
    //     ProjStaffQualificationTemplate: Record "Project Staff Template Qualifi";
    //     WorksEquipemntSpecification: Record "Works Equipment Template Line";
    // begin
    //     Purch.TestField("PRN Type");
    //     if Purch."PRN Type" <> Purch."prn type"::"Project Works" then
    //         Error('Purchase Requisition Must be Project Works');

    //     //Transfer the Requisition Template Lines to PRN Lines
    //     ProjStaffTemplate.Reset;
    //     ProjStaffTemplate.SetRange("Key Staff Template ID", Purch."Project Staffing Template ID");
    //     if ProjStaffTemplate.FindSet then begin
    //         repeat
    //             //Creation of PRN Personnel Specification details
    //             PRNPersonnelSpecification.Init;
    //             PRNPersonnelSpecification."Document Type" := Purch."Document Type";
    //             PRNPersonnelSpecification."Document No." := Purch."No.";
    //             PRNPersonnelSpecification."Staff Role Code" := ProjStaffTemplate."Project Role Code";
    //             PRNPersonnelSpecification."Title/Designation Description" := ProjStaffTemplate.Description;
    //             PRNPersonnelSpecification."Staff Category" := ProjStaffTemplate."Staff Category";
    //             PRNPersonnelSpecification."Min No. of Recomm Staff" := ProjStaffTemplate."Min No. of Recomm Staff";
    //             PRNPersonnelSpecification.Insert(true);

    //         until ProjStaffTemplate.Next = 0;

    //     end;

    //     //Creation of PRN Personnel Experience details
    //     ProjStaffExperienceTemplate.Reset;
    //     ProjStaffExperienceTemplate.SetRange("Key Staff Template ID", Purch."Project Staffing Template ID");
    //     if ProjStaffExperienceTemplate.FindSet then begin
    //         repeat
    //             PRNPersonnelExperience.Init;
    //             PRNPersonnelExperience."Document Type" := Purch."Document Type";
    //             PRNPersonnelExperience."Document No." := Purch."No.";
    //             PRNPersonnelExperience."Staff Role Code" := ProjStaffExperienceTemplate."Project Role Code";
    //             PRNPersonnelExperience."Experience Category" := ProjStaffExperienceTemplate."Experience Category";
    //             PRNPersonnelExperience."Entry No" := ProjStaffExperienceTemplate."Entry No";
    //             PRNPersonnelExperience."Minimum Years of Experience" := ProjStaffExperienceTemplate."Minimum Years of Experience";
    //             PRNPersonnelExperience."Minimum Experience Req" := ProjStaffExperienceTemplate."Minimum Experience Req";
    //             PRNPersonnelExperience.Insert(true);

    //         until ProjStaffExperienceTemplate.Next = 0;
    //     end;

    //     //Creation of PRN Personnel Qualification details

    //     ProjStaffQualificationTemplate.Reset;
    //     ProjStaffQualificationTemplate.SetRange("Key Staff Template ID", Purch."Project Staffing Template ID");
    //     if ProjStaffQualificationTemplate.FindSet then begin
    //         repeat
    //             PRNPersonnelqualification.Init;
    //             PRNPersonnelqualification."Document Type" := Purch."Document Type";
    //             PRNPersonnelqualification."Document No." := Purch."No.";
    //             PRNPersonnelqualification."Staff Role Code" := ProjStaffQualificationTemplate."Project Role Code";
    //             PRNPersonnelqualification."Entry No" := ProjStaffQualificationTemplate."Entry No";
    //             PRNPersonnelqualification."Qualification Category" := ProjStaffQualificationTemplate."Qualification Category";
    //             PRNPersonnelqualification."Minimum Qualification Req" := ProjStaffQualificationTemplate."Minimum Qualification Req";
    //             PRNPersonnelqualification.Insert(true);

    //         until ProjStaffQualificationTemplate.Next = 0;
    //     end;

    //     //Creation of PRN Equipment Specifications
    //     WorksEquipemntSpecification.Reset;
    //     WorksEquipemntSpecification.SetRange("Equipment Template ID", Purch."Works Equipment Template ID");
    //     if WorksEquipemntSpecification.FindSet then begin
    //         repeat
    //             PRNEquipmentsSpecification.Init;
    //             PRNEquipmentsSpecification."Document Type" := Purch."Document Type";
    //             PRNEquipmentsSpecification."Document No." := Purch."No.";
    //             PRNEquipmentsSpecification."Equipment Type" := WorksEquipemntSpecification."Equipment Type";
    //             PRNEquipmentsSpecification.Category := WorksEquipemntSpecification.Category;
    //             PRNEquipmentsSpecification.Description := WorksEquipemntSpecification.Description;
    //             PRNEquipmentsSpecification."Minimum Required Qty" := WorksEquipemntSpecification."Minimum Required Qty";
    //             PRNEquipmentsSpecification.Insert(true);
    //         until WorksEquipemntSpecification.Next = 0;

    //     end;
    //     Message('Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly', Purch."No.");
    // end;

    local procedure "......Invitation For Supply................"()
    begin
    end;


    procedure PublishITT(ITT: Record "Standard Purchase Code")
    var
        Text0001: label 'The Invitation To Tender Voucher %1 should be fully approved';
    begin
        if ITT.Status <> ITT.Status::Released then
            Error(Text0001, ITT.Code);

        //Publish
        ITT.Published := true;
        ITT."Date/Time Published" := CurrentDatetime;
        ITT."Document Status" := ITT."document status"::Published;
        ITT.Modify;
    end;


    procedure SuggestRequiredDocITT(ITT: Record "Standard Purchase Code")
    var
        ProcSetup: Record "Procurement Setup";
        ProccDocumentTempLine: Record "Procurement Doc Template Line";
        IFSRequiredDoc: Record "IFS Required Document";
    begin
        ProcSetup.Get;
        ProcSetup.TestField("Default Procurement Template");
        IFSRequiredDoc.Reset;
        IFSRequiredDoc.SetRange("Document No", ITT.Code);
        if not IFSRequiredDoc.FindSet then begin
            ProccDocumentTempLine.Reset;
            ProccDocumentTempLine.SetRange("Template ID", ProcSetup."Default Procurement Template");
            ProccDocumentTempLine.SetRange("Procurement Process", ProccDocumentTempLine."procurement process"::"ITT Response");
            if ProccDocumentTempLine.FindSet then begin
                repeat
                    IFSRequiredDoc.Init;
                    IFSRequiredDoc."Document No" := ITT.Code;
                    IFSRequiredDoc."Procurement Document Type ID" := ProccDocumentTempLine."Procurement Document Type";
                    IFSRequiredDoc.Description := ProccDocumentTempLine.Description;
                    IFSRequiredDoc."Requirement Type" := ProccDocumentTempLine."Requirement Type";
                    IFSRequiredDoc.Insert(true);
                until ProccDocumentTempLine.Next = 0;
            end;

        end;
    end;


    procedure CreateAddendumNoticeITT(ITT: Record "Standard Purchase Code")
    var
        //ReleasePurchDoc: Codeunit "Release Approval Document";
        TenderAddendum: Record "Tender Addendum Notice";
        ProcSetup: Record "Procurement Setup";
        TenderAddendumTypes: Record "Tender Addendum Type";
    begin
        ProcSetup.Get;
        ProcSetup.TestField("Tender Addendum Notice");
        ITT."Document Status" := ITT."document status"::Draft;
        //  ReleasePurchDoc.ReopenITT(ITT);
        ITT.Modify(true);

        //create addendum notice
        TenderAddendum.Reset;
        TenderAddendum.SetRange("Invitation Notice No.", ITT.Code);
        if not TenderAddendum.FindSet then begin
            TenderAddendum.Init;
            TenderAddendum."Addendum Notice No." := '';
            TenderAddendum."Document Date" := Today;
            TenderAddendum."Invitation Notice No." := ITT.Code;
            TenderAddendum.Description := 'Addendum Notice for Tender Notice No: ' + ITT.Code;
            TenderAddendum."Primary Addendum Type ID" := ProcSetup."Default Tender Addendum Type";
            if TenderAddendumTypes.Get(TenderAddendum."Primary Addendum Type ID") then
                TenderAddendum."Addendum Type Description" := TenderAddendumTypes.Description;
            TenderAddendum."Tender No" := ITT."External Document No";
            TenderAddendum."Tender Description" := ITT.Description;
            TenderAddendum."Responsibility Center" := ITT."Responsibility Center";
            TenderAddendum."Original Submission Start Date" := ITT."Submission Start Date";
            TenderAddendum."Original Submission End Date" := ITT."Submission End Date";
            TenderAddendum."Original Submission Start Time" := ITT."Submission Start Time";
            TenderAddendum."Original Submission End Time" := ITT."Submission End Time";
            TenderAddendum."New Submission Start Date" := ITT."Submission Start Date";
            TenderAddendum."New Submission End Date" := ITT."Submission End Date";
            TenderAddendum."New Submission Start Time" := ITT."Submission Start Time";
            TenderAddendum."New Submission End Time" := ITT."Submission End Time";
            TenderAddendum."New Bid Opening Date" := ITT."Bid Opening Date";
            TenderAddendum."New Bid Opening Time" := ITT."Bid Opening Time";
            TenderAddendum."Original Bid Opening Date" := ITT."Bid Opening Date";
            TenderAddendum."Original Bid Opening Time" := ITT."Bid Opening Time";
            TenderAddendum."Original Prebid Meeting Date" := ITT."Mandatory Pre-bid Visit Date";
            TenderAddendum."New Prebid Meeting Date" := ITT."Mandatory Pre-bid Visit Date";
            TenderAddendum."Document Status" := TenderAddendum."document status"::Draft;

            TenderAddendum.Insert(true);
        end;
    end;


    procedure CancelITT(ITT: Record "Standard Purchase Code")
    var
        Text0001: label 'The IFP voucher is still Active for submission';
        IFPResponse: Record "RFI Response";
        IFPResponseLine: Record "IFP Response Line";
        VendPrequalificationEntry: Record "Vendor Prequalification Entry";
        RandomDigit: Text[50];
        entryno: Integer;
        UserSetup: Record "User Setup";
    begin
        if ITT."Submission End Date" > Today then
            Error(Text0001);
        ITT.TestField("Cancel Reason Code");
        ITT.TestField("Cancelled By");
        //Send Random pass-key
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        //UserSetup.SetRange(UserSetup."Cancel Invitation For Supply", true);
        if UserSetup.FindSet then begin
            FnSendEmaiNotificationOncancelITT(UserSetup);
        end;



        ITT."Document Status" := ITT."document status"::Cancelled;
        ITT.Modify(true);
        Message('Invitation for Prequalification %1 has been closed successfuly', ITT.Code);
    end;


    procedure FnSendEmaiNotificationOncancelITT(UserSetup: Record "User Setup")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        RandomDigit: Text[50];
    begin
        ///Notifying Procurement Team on supplier Request
        RandomDigit := CreateGuid;
        RandomDigit := DelChr(RandomDigit, '=', '{}-01');
        RandomDigit := CopyStr(RandomDigit, 1, 8);

        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;


        /*
        RequesterEmail:=Vendor."E-Mail";
        RequesterName:=Vendor.Name;
        */
        Window.Open('Notifying the Sender...');

        WindowisOpen := true;


        Counter := Counter + 1;
        Password := RandomDigit;

        //Create message
        if HRSetup."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := HRSetup."E-Mail";
        CustEmail := UserSetup."E-Mail";


        CompanyDetails := 'Procurement Officer,' + '<BR></BR>' + UserSetup."Employee Name" + '<BR></BR>' + CompInfo.Name + '<BR>' + CompInfo.Address + '<BR></BR>' + CompInfo."Address 2" + '<BR></BR>' + CompInfo.City;
        SenderMessage := 'Kindly Find below you random pass key<BR>' + Password;
        if CustEmail = '' then
            exit;


        // //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
        // emailhdr := 'e-Procurement Invitation For Supply Cancelation (ITT No:' + vend."No." + ')';

        // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // CompanyDetails + '<BR></BR>' + SenderMessage, true);

        // cu400.AddCC(RequesterEmail);

        // cu400.AppendToBody(ProcNote);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;

    end;

    procedure CreateInvitationNotice(Purch: Record "Purchase Header"; Display: Boolean; UserI: text[100]): Code[20];
    var
        UserSetup: Record "User Setup";
        IFS: Record "Standard Purchase Code";
        ProcSetup: Record "Procurement Setup";
        PurchLines: Record "Purchase Line";
        IFSPurchLines: Record "Standard Purchase Line";
        IFSMajorWorkDeliverable: Record "IFS Major Work_Deliverable";
        PRNMajorWorkDeliverable: Record "PRN Major Work Deliverable";
        IFSKeyStaff: Record "IFS Key Staff";
        PRNPersonnelSpecification: Record "PRN Personnel Specification";
        IFSStaffQualification: Record "IFS Staff Min Qualification";
        PRNStaffQualification: Record "PRN Personnel Qualification";
        PRNPersonnelExperience: Record "PRN Personnel Experience";
        IFSPersonnelExperience: Record "IFS Staff Min Experience";
        PRNEquipmentsSpecification: Record "PRN Equipment Specification";
        IFSEquipmentsSpecification: Record "IFS Required Equipment";
        //EmailNotification: Codeunit "Email Notifications";
        CompInfo: Record "Company Information";
        IFSS: Record "Standard Purchase Code";
        UserSetup2: Record "User Setup";
        IFSCodePortal: Code[20];
        SalesOrder: Record "Salesperson/Purchaser";
        PPlan: Record "Procurement Plan";
    begin
        if Purch."PRN Conversion Procedure" <> Purch."prn conversion procedure"::"Invitation For Supply" then
            Error('The PRN %1  must be one that supports direct creation of Invitation Notices', Purch."No.");
        ProcSetup.Get;
        //Check Procurement User
        UserSetup.Reset;
        // UserSetup.SetRange("User ID", UserId);
        UserSetup.SetRange("User ID", UserI);
        if UserSetup.FindSet then begin
            // UserSetup.TESTFIELD("Purchase Resp. Ctr. Filter");
            if UserSetup."Authorize IFS Creator" = false then
                Error('User %1 Must be an Authorized IFS Creator in the User Setup, Kindly contact system administrator', UserSetup."User ID");
            // IF UserSetup."Purchase Resp. Ctr. Filter"<>Purch."Responsibility Center" THEN
            //   ERROR('You are not authorized to create IFS for this resonsibility center %1',Purch."Responsibility Center");
        end;

        //check if the PRN has associated IFS Notice
        if (Purch."Ordered PRN" = true) or (Purch."Linked IFS No." <> '') then
            Error('The PRN %1 has been already ordered', Purch."No.");

        //The total value of the PRN request must be within the available procurement budget
        if Purch."Total PRN Amount (LCY)" > Purch."PP Total Available Budget" then
            Error('The total value of the PRN request must be within the available procurement budget');

        PPlan.Reset();
        PPlan.SetRange(Code, Purch."Procurement Plan ID");
        PPlan.FindFirst();

        //Testfields no blanks allowed
        Purch.TestField("PP  Invitation Notice Type");
        Purch.TestField("PP Solicitation Type");
        Purch.TestField("PP Procurement Method");
        //Action should automatically create an Invitation For Supply (IFS)
        IFS.Reset;
        IFS.SetRange("PRN No.", Purch."No.");
        if not IFS.FindSet then begin
            IFS.Init;
            if Purch."PP Procurement Method" = Purch."PP Procurement Method"::"Framework Agreement" then begin
                IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."Framework ITT No. Series", Today, true);
            end else
                if Purch."PP Procurement Method" = Purch."PP Procurement Method"::"Direct Procurement" then begin
                    IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."Direct Prcmnt Nos", Today, true);
                end else
                    if Purch."PP Procurement Method" = Purch."PP Procurement Method"::RFQ then begin
                        IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."Request for Quotation Nos.", Today, true);
                    end
                    else begin
                        IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."ITT No. Series", Today, true);
                    end;
            IFS.Validate("Invitation Notice Type", Purch."PP  Invitation Notice Type");
            IFS.Validate(Description, Purch.Description);
            IFS.Validate("Tender Name", Purch.Description);
            IFS.Validate(Name, Purch.Description);
            IFS.Validate("Tender Summary", Purch.Description);

            //IFS."Location Code":=Purch."Location Code";
            IFS.Validate("Location Code", Purch."Location Code");
            IFS.Validate("Requisition Product Group", Purch."Requisition Product Group");
            IFS.Validate("Document Date", Today);
            IFS.Validate("PRN No.", Purch."No.");
            IFS.Validate("Responsibility Center", Purch."Responsibility Center");
            IFS.Validate("Requisition Product Group", Purch."Requisition Product Group");
            IFS.Validate("Requisition Template ID", Purch."Requisition Template ID");
            IFS.Validate("Solicitation Type", Purch."PP Solicitation Type");
            IFS.Validate("Bid Selection Method", Purch."PP Bid Selection Method");
            IFS.Validate("Procurement Method", Purch."PP Procurement Method");
            IFS."Invitation Notice Type" := Purch."PP  Invitation Notice Type";
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Single  Stage Tender" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default Single Stage Tender");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Two Stage Tender" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default Two Stage Tender valid");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::RFQ then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default RFQ Validity Duration");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Low Value Procurement" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default LVP Validity Duration");
            IFS."Purchaser Code" := Purch."Purchaser Code2";
            assignPurchaserCode(IFS, Purch."Purchaser Code2");
            IFS.Validate("Language Code", ProcSetup."Default Language Code");
            IFS.Validate("Appointer of Bid Arbitrator", ProcSetup."Default Arbitrator Appointer");
            IFS.Validate("Requesting Region", Purch.Region);
            IFS.Validate("Global Dimension 1 Code", Purch."Shortcut Dimension 1 Code");
            IFS.Validate("Global Dimension 2 Code", Purch."Shortcut Dimension 2 Code");
            //MESSAGE('"Directorate Code" %1',Purch."Directorate Code");
            IFS.Validate("Department Code", Purch."Department Code");
            IFS.Validate("Procurement Plan ID", Purch."Procurement Plan ID");
            // IFS.Validate("Procurement Plan Entry No", Purch."Procurement Plan Entry No");
            IFS.Validate(Job, PPlan."Financial Budget ID");
            // IFS.Validate("Job Task No.", Purch."Job Task No.");
            IFS.Validate("PP Planning Category", Purch."PP Planning Category");
            //IFS.VALIDATE("PP Funding Source ID",Purch."PP Funding Source ID");
            IFS.Validate("PP Total Budget", Purch."PP Total Budget");
            IFS.Validate("PP Total Actual Costs", Purch."PP Total Actual Costs");
            IFS.Validate("PP Total Commitments", Purch."PP Total Commitments");
            IFS.Validate("PP Total Available Budget", Purch."PP Total Available Budget");
            IFS.Validate("PP Preference/Reservation Code", Purch."PP Preference/Reservation Code");
            //IFS.VALIDATE("Financial Year Code",ProcSetup.
            IFS.Validate("Works Category", Purch."Works Category");
            // IFS.Validate("Road Code", Purch."Road Code");
            // IFS.Validate("Road Link Name", Purch."Link Name");
            // IFS.Validate("Constituency ID", Purch.Consitituency);
            IFS."RFQ Created" := true;
            IFS.VALIDATE("Procurement Type", Purch."Procurement Type");
            IFS.Validate("Procurement Category ID", Purch."PP Planning Category");
            IFS.Validate("Project ID", PPlan."Financial Budget ID");
            //IFS.Validate("Requesting Directorate",Purch."Directorate Code");
            IFS.Validate("Requesting Department", Purch."Department Code");

            CompInfo.Get;
            IFS.Address := CompInfo.Address;
            IFS."Procuring Entity Name/Contact" := CompInfo.Name;
            IFS."Address 2" := CompInfo."Address 2";
            IFS."Post Code" := CompInfo."Post Code";
            IFS.City := CompInfo.City;
            IFS."External Document No" := IFS.Code;
            IFS."Country/Region Code" := CompInfo."Country/Region Code";
            IFS."Phone No." := CompInfo."Phone No.";
            IFS."E-Mail" := CompInfo."E-Mail";
            IFS."Primary Tender Submission" := CompInfo.Address;
            IFS."Primary Engineer Contact" := CompInfo.Address;
            IFS."Created by" := UserI;
            IFS."Created Date/Time" := CURRENTDATETIME;


            if IFS.Insert(true) then begin
                PurchLines.Reset;
                PurchLines.SetRange("Document No.", Purch."No.");
                PurchLines.SetRange("Document Type", Purch."Document Type");
                if PurchLines.FindSet then begin
                    repeat
                        //2.IFS Purchase Lines (T174)-Default values shall be inherited from PRN Lines (T39)
                        IFSPurchLines.Init;
                        IFSPurchLines.Validate("Standard Purchase Code", IFS.Code);
                        IFSPurchLines.Validate("Line No.", PurchLines."Line No.");
                        IFSPurchLines.Validate(Type, PurchLines.Type);
                        IFSPurchLines.Validate("No.", PurchLines."No.");
                        IFSPurchLines.Validate(Description, PurchLines.Description);
                        // IFSPurchLines.VALIDATE(Quantity,PurchLines.Quantity);
                        IFSPurchLines.Quantity := PurchLines.Quantity;
                        IFSPurchLines.Validate("Unit of Measure Code", PurchLines."Unit of Measure Code");
                        IFSPurchLines.Validate("Shortcut Dimension 1 Code", PurchLines."Shortcut Dimension 1 Code");
                        IFSPurchLines.Validate("Shortcut Dimension 2 Code", PurchLines."Shortcut Dimension 2 Code");
                        IFSPurchLines.Validate("Variant Code", PurchLines."Variant Code");
                        IFSPurchLines.Validate("Dimension Set ID", PurchLines."Dimension Set ID");
                        IFSPurchLines.Validate("Item Category", PurchLines."Item Category Code");
                        // IFSPurchLines.Validate("Directorate Code", PurchLines."Directorate Code");
                        //MESSAGE('"Directorate Code" %1',Purch."Directorate Code");
                        IFSPurchLines.Validate("Department Code", PurchLines."Department Code");
                        IFSPurchLines.Validate("Procurement Plan ID", PurchLines."Procurement Plan ID");
                        IFSPurchLines."Procurement Plan Entry No" := PurchLines."Procurement Plan Entry No";
                        // IFSPurchLines.Validate("Job No.", PurchLines."Job No.");
                        IFSPurchLines.Validate("Job No.", PurchLines.Budget);
                        // IFSPurchLines.Validate("Job Task No.", PurchLines."Job Task No.");
                        IFSPurchLines.Validate("Job Task No.", PurchLines."Budget Line");
                        IFSPurchLines.Validate("PP Planning Category", PurchLines."PP Planning Category");
                        IFSPurchLines.Validate("PP Funding Source ID", PurchLines."PP Funding Source ID");
                        IFSPurchLines.Validate("PP Total Budget", PurchLines."PP Total Budget");
                        IFSPurchLines.Validate("Technical Specifications", PurchLines."Technical Specifications");
                        IFSPurchLines.Validate("PP Total Actual Costs", PurchLines."PP Total Actual Costs");
                        IFSPurchLines.Validate("PP Total Commitments", PurchLines."PP Total Commitments");
                        IFSPurchLines.Validate("PP Total Available Budget", PurchLines."PP Total Available Budget");
                        IFSPurchLines.Validate("PP Preference/Reservation Code", PurchLines."PP Preference/Reservation Code");
                        IFSPurchLines.Insert(true);
                    until PurchLines.Next = 0;
                end;

                //3.IFS Major Work Deliverables table-Default values shall be inherited from the PRN Major Work Deliverable table
                PRNMajorWorkDeliverable.Reset;
                PRNMajorWorkDeliverable.SetRange("Document No.", Purch."No.");
                if PRNMajorWorkDeliverable.FindSet then begin
                    repeat
                        IFSMajorWorkDeliverable.Init;
                        IFSMajorWorkDeliverable.Validate("Document No", IFS.Code);
                        IFSMajorWorkDeliverable.Validate("Entry No", PRNMajorWorkDeliverable."Entry No");
                        IFSMajorWorkDeliverable.Validate("Major Activity Description", PRNMajorWorkDeliverable.Description);
                        IFSMajorWorkDeliverable.Insert(true);
                    until PRNMajorWorkDeliverable.Next = 0;
                end;

                //4.IFS Key Staff table-Default values shall be inherited from the PRN Personnel Specification IFS Key Staff Table FieldsMapping Rules
                PRNPersonnelSpecification.Reset;
                PRNPersonnelSpecification.SetRange("Document No.", Purch."No.");
                if PRNPersonnelSpecification.FindSet then begin
                    repeat
                        IFSKeyStaff.Init;
                        IFSKeyStaff."IFS Code" := IFS.Code;
                        IFSKeyStaff."Staff Role Code" := PRNPersonnelSpecification."Staff Role Code";
                        IFSKeyStaff."Title/Designation Description" := PRNPersonnelSpecification."Title/Designation Description";
                        IFSKeyStaff."Staff Category" := PRNPersonnelSpecification."Staff Category";
                        IFSKeyStaff."Min No. of Recomm Staff" := PRNPersonnelSpecification."Min No. of Recomm Staff";
                        IFSKeyStaff.Insert(true);
                    until PRNPersonnelSpecification.Next = 0;
                end;

                //5.IFS Staff Min Qualification-Default values shall be inherited from the PRN Personnel Qualification
                PRNStaffQualification.Reset;
                PRNStaffQualification.SetRange("Document No.", Purch."No.");
                if PRNStaffQualification.FindSet then begin
                    repeat
                        IFSStaffQualification.Init;
                        IFSStaffQualification."IFS Code" := IFS.Code;
                        IFSStaffQualification."Project Role Code" := PRNStaffQualification."Staff Role Code";
                        IFSStaffQualification."Entry No" := PRNStaffQualification."Entry No";
                        IFSStaffQualification."Qualification Category" := PRNStaffQualification."Qualification Category";
                        IFSStaffQualification."Minimum Qualification Req" := PRNStaffQualification."Minimum Qualification Req";
                        IFSStaffQualification.Insert(true);
                    until PRNStaffQualification.Next = 0;
                end;

                //6.IFS Staff Min Experience -Default values shall be inherited from the PRN Personnel Experience
                PRNPersonnelExperience.Reset;
                PRNPersonnelExperience.SetRange("Document No.", Purch."No.");
                if PRNPersonnelExperience.FindSet then begin
                    repeat
                        IFSPersonnelExperience.Init;
                        IFSPersonnelExperience."IFS Code" := IFS.Code;
                        IFSPersonnelExperience."Project Role Code" := PRNPersonnelExperience."Staff Role Code";
                        IFSPersonnelExperience."Experience Category" := PRNPersonnelExperience."Experience Category";
                        IFSPersonnelExperience."Entry No" := PRNPersonnelExperience."Entry No";
                        IFSPersonnelExperience."Minimum Years of Experience" := PRNPersonnelExperience."Minimum Years of Experience";
                        IFSPersonnelExperience."Minimum Experience Req" := PRNPersonnelExperience."Minimum Experience Req";
                        IFSPersonnelExperience.Insert(true);

                    until PRNPersonnelExperience.Next = 0;
                end;

                //7.IFS Required Equipment- Default values shall be inherited from the PRN Equipment Specification
                PRNEquipmentsSpecification.Reset;
                PRNEquipmentsSpecification.SetRange("Document No.", Purch."No.");
                if PRNEquipmentsSpecification.FindSet then begin
                    repeat

                        IFSEquipmentsSpecification.Init;
                        IFSEquipmentsSpecification."Document No" := IFS.Code;
                        IFSEquipmentsSpecification."Equipment Type Code" := PRNEquipmentsSpecification."Equipment Type";
                        IFSEquipmentsSpecification.Category := PRNEquipmentsSpecification.Category;
                        IFSEquipmentsSpecification.Description := PRNEquipmentsSpecification.Description;
                        IFSEquipmentsSpecification."Minimum Required Qty" := PRNEquipmentsSpecification."Minimum Required Qty";
                        IFSEquipmentsSpecification.Insert(true);
                    until PRNEquipmentsSpecification.Next = 0;
                end;
                if Display = true then begin

                    Message('Purchase Requisition No: %1 has successfully been converted to Invitation Notice No: %2. Please check', Purch."No.", IFS.Code);
                    if IFS."Procurement Method" = IFS."procurement method"::"Open Tender" then begin
                        Page.Run(75078, IFS);
                    end;
                    if IFS."Procurement Method" = IFS."procurement method"::RFQ then begin
                        Page.Run(75121, IFS);
                    end;
                end;

                IFSCodePortal := IFS.Code;

                Purch."Ordered PRN" := true;
                Purch."PRN Order Date/Time" := CurrentDatetime;
                Purch."Linked IFS No." := IFS.Code;
                Purch.Modify(true);
                // EmailNotification.SendPRNApprovedMailAfterIFSCreation(Purch);
                //Back Email Notification to requestor.
                exit(IFSCodePortal);

            end;
        end;
    end;

    procedure CreateInvitationNoticeB4(Purch: Record "Purchase Header")
    var
        UserSetup: Record "User Setup";
        IFS: Record "Standard Purchase Code";
        ProcSetup: Record "Procurement Setup";
        PurchLines: Record "Purchase Line";
        IFSPurchLines: Record "Standard Purchase Line";
        IFSMajorWorkDeliverable: Record "IFS Major Work_Deliverable";
        PRNMajorWorkDeliverable: Record "PRN Major Work Deliverable";
        IFSKeyStaff: Record "IFS Key Staff";
        PRNPersonnelSpecification: Record "PRN Personnel Specification";
        IFSStaffQualification: Record "IFS Staff Min Qualification";
        PRNStaffQualification: Record "PRN Personnel Qualification";
        PRNPersonnelExperience: Record "PRN Personnel Experience";
        IFSPersonnelExperience: Record "IFS Staff Min Experience";
        PRNEquipmentsSpecification: Record "PRN Equipment Specification";
        IFSEquipmentsSpecification: Record "IFS Required Equipment";
        //EmailNotification: Codeunit "Email Notifications";
        CompInfo: Record "Company Information";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if Purch."PRN Conversion Procedure" <> Purch."prn conversion procedure"::"Invitation For Supply" then
            Error('The PRN %1  must be one that supports direct creation of Invitation Notices', Purch."No.");
        ProcSetup.Get;
        //Check Procurement User
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            //UserSetup.TestField("Purchase Resp. Ctr. Filter");
            if UserSetup."Authorize IFS Creator" = false then
                Error('You Must be Authorized IFS Creator, Kindly contact system administrator');
            // if UserSetup."Purchase Resp. Ctr. Filter" <> Purch."Responsibility Center" then
            //     Error('You are not authorized to create IFS for this resonsibility center %1', Purch."Responsibility Center");
        end;

        //check if the PRN has associated IFS Notice
        if (Purch."Ordered PRN" = true) or (Purch."Linked IFS No." <> '') then
            Error('The PRN %1 has been already ordered', Purch."No.");

        //The total value of the PRN request must be within the available procurement budget
        if Purch."Total PRN Amount (LCY)" > Purch."PP Total Available Budget" then
            Error('The total value of the PRN request must be within the available procurement budget');

        //Testfields no blanks allowed
        Purch.TestField("PP  Invitation Notice Type");
        Purch.TestField("PP Solicitation Type");
        Purch.TestField("PP Procurement Method");

        //Action should automatically create an Invitation For Supply (IFS)
        IFS.Reset;
        IFS.SetRange("PRN No.", Purch."No.");
        if not IFS.FindSet then begin
            IFS.Init;
            if Purch."PP Procurement Method" = Purch."PP Procurement Method"::"Framework Agreement" then begin
                IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."Framework ITT No. Series", Today, true);
            end else
                if Purch."PP Procurement Method" = Purch."PP Procurement Method"::"Direct Procurement" then begin
                    IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."Direct Prcmnt Nos", Today, true);
                end else
                    if Purch."PP Procurement Method" = Purch."PP Procurement Method"::RFQ then begin
                        IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."Request for Quotation Nos.", Today, true);
                    end
                    else begin
                        IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."ITT No. Series", Today, true);
                    end;
            IFS.Validate("Invitation Notice Type", Purch."PP  Invitation Notice Type");
            IFS.Validate(Description, Purch.Description);
            IFS.Validate("Tender Name", Purch.Description);
            IFS.Validate(Name, Purch.Description);
            IFS.Validate("Tender Summary", Purch.Description);

            //IFS."Location Code":=Purch."Location Code";
            IFS.Validate("Location Code", Purch."Location Code");
            IFS.Validate("Requisition Product Group", Purch."Requisition Product Group");
            IFS.Validate("Document Date", Today);
            IFS.Validate("PRN No.", Purch."No.");
            IFS.Validate("Responsibility Center", Purch."Responsibility Center");
            IFS.Validate("Requisition Product Group", Purch."Requisition Product Group");
            IFS.Validate("Requisition Template ID", Purch."Requisition Template ID");
            IFS.Validate("Solicitation Type", Purch."PP Solicitation Type");
            IFS.Validate("Bid Selection Method", Purch."PP Bid Selection Method");
            IFS.Validate("Procurement Method", Purch."PP Procurement Method");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Single  Stage Tender" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default Single Stage Tender");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Two Stage Tender" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default Two Stage Tender valid");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::RFQ then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default RFQ Validity Duration");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Low Value Procurement" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default LVP Validity Duration");
            IFS.Validate("Purchaser Code", Purch."Purchaser Code");
            IFS.Validate("Language Code", ProcSetup."Default Language Code");
            IFS.Validate("Appointer of Bid Arbitrator", ProcSetup."Default Arbitrator Appointer");
            //MESSAGE('"Directorate Code" %1',Purch."Directorate Code");
            IFS.Validate("Global Dimension 1 Code", Purch."Shortcut Dimension 1 Code");
            IFS.Validate("Global Dimension 2 Code", Purch."Shortcut Dimension 2 Code");
            IFS.Validate("Procurement Plan Entry No", Purch."Procurement Plan Entry No");
            IFS.Validate(Job, Purch.Job);
            IFS.Validate("Job Task No.", Purch."Job Task No.");
            IFS.Validate("PP Planning Category", Purch."PP Planning Category");
            IFS.Validate("PP Funding Source ID", Purch."PP Funding Source ID");
            IFS.Validate("PP Total Budget", Purch."PP Total Budget");
            IFS.Validate("PP Total Actual Costs", Purch."PP Total Actual Costs");
            IFS.Validate("PP Total Commitments", Purch."PP Total Commitments");
            IFS.Validate("PP Total Available Budget", Purch."PP Total Available Budget");
            IFS.Validate("PP Preference/Reservation Code", Purch."PP Preference/Reservation Code");
            //IFS.VALIDATE("Financial Year Code",ProcSetup.
            IFS.Validate("Works Category", Purch."Works Category");
            IFS.Validate("Road Code", Purch."Road Code");
            IFS.Validate("Road Link Name", Purch."Link Name");
            IFS.Validate("Constituency ID", Purch.Consitituency);
            IFS.Validate("Procurement Type", Purch."Procurement Type");
            IFS.Validate("Procurement Category ID", Purch."PP Planning Category");
            IFS.Validate("Project ID", Purch.Job);
            IFS.Validate("Requesting Directorate", Purch."Directorate Code1");
            IFS.Validate("Requesting Department", Purch."Department Code");

            CompInfo.Get;
            IFS.Address := CompInfo.Address;
            IFS."Procuring Entity Name/Contact" := CompInfo.Name;
            IFS."Address 2" := CompInfo."Address 2";
            IFS."Post Code" := CompInfo."Post Code";
            IFS.City := CompInfo.City;
            IFS."Country/Region Code" := CompInfo."Country/Region Code";
            IFS."Phone No." := CompInfo."Phone No.";
            IFS."E-Mail" := CompInfo."E-Mail";
            IFS."Primary Tender Submission" := CompInfo.Address;
            IFS."Primary Engineer Contact" := CompInfo.Address;


            if IFS.Insert(true) then begin
                PurchLines.Reset;
                PurchLines.SetRange("Document No.", Purch."No.");
                PurchLines.SetRange("Document Type", Purch."Document Type");
                if PurchLines.FindSet then begin
                    repeat
                        //2.IFS Purchase Lines (T174)-Default values shall be inherited from PRN Lines (T39)
                        IFSPurchLines.Init;
                        IFSPurchLines.Validate("Standard Purchase Code", IFS.Code);
                        IFSPurchLines.Validate("Line No.", PurchLines."Line No.");
                        IFSPurchLines.Validate(Type, PurchLines.Type);
                        IFSPurchLines.Validate("No.", PurchLines."No.");
                        IFSPurchLines.Validate(Description, PurchLines.Description);
                        IFSPurchLines.Validate(Quantity, PurchLines.Quantity);
                        IFSPurchLines.Validate("Unit of Measure Code", PurchLines."Unit of Measure Code");
                        IFSPurchLines.Validate("Shortcut Dimension 1 Code", PurchLines."Shortcut Dimension 1 Code");
                        IFSPurchLines.Validate("Shortcut Dimension 2 Code", PurchLines."Shortcut Dimension 2 Code");
                        IFSPurchLines.Validate("Variant Code", PurchLines."Variant Code");
                        IFSPurchLines.Validate("Dimension Set ID", PurchLines."Dimension Set ID");
                        IFSPurchLines.Validate("Item Category", PurchLines."Item Category Code");
                        IFSPurchLines.Insert(true);
                    until PurchLines.Next = 0;
                end;

                //3.IFS Major Work Deliverables table-Default values shall be inherited from the PRN Major Work Deliverable table
                // PRNMajorWorkDeliverable.Reset;
                // PRNMajorWorkDeliverable.SetRange("Document No.", Purch."No.");
                // if PRNMajorWorkDeliverable.FindSet then begin
                //     repeat
                //         IFSMajorWorkDeliverable.Init;
                //         IFSMajorWorkDeliverable.Validate("Document No", IFS.Code);
                //         IFSMajorWorkDeliverable.Validate("Entry No", PRNMajorWorkDeliverable."Entry No");
                //         IFSMajorWorkDeliverable.Validate("Major Activity Description", PRNMajorWorkDeliverable.Description);
                //         IFSMajorWorkDeliverable.Insert(true);
                //     until PRNMajorWorkDeliverable.Next = 0;
                // end;

                //4.IFS Key Staff table-Default values shall be inherited from the PRN Personnel Specification IFS Key Staff Table FieldsMapping Rules
                // PRNPersonnelSpecification.Reset;
                // PRNPersonnelSpecification.SetRange("Document No.", Purch."No.");
                // if PRNPersonnelSpecification.FindSet then begin
                //     repeat
                //         IFSKeyStaff.Init;
                //         IFSKeyStaff."IFS Code" := IFS.Code;
                //         IFSKeyStaff."Staff Role Code" := PRNPersonnelSpecification."Staff Role Code";
                //         IFSKeyStaff."Title/Designation Description" := PRNPersonnelSpecification."Title/Designation Description";
                //         IFSKeyStaff."Staff Category" := PRNPersonnelSpecification."Staff Category";
                //         IFSKeyStaff."Min No. of Recomm Staff" := PRNPersonnelSpecification."Min No. of Recomm Staff";
                //         IFSKeyStaff.Insert(true);
                //     until PRNPersonnelSpecification.Next = 0;
                // end;

                //5.IFS Staff Min Qualification-Default values shall be inherited from the PRN Personnel Qualification
                // PRNStaffQualification.Reset;
                // PRNStaffQualification.SetRange("Document No.", Purch."No.");
                // if PRNStaffQualification.FindSet then begin
                //     repeat
                //         IFSStaffQualification.Init;
                //         IFSStaffQualification."IFS Code" := IFS.Code;
                //         IFSStaffQualification."Project Role Code" := PRNStaffQualification."Staff Role Code";
                //         IFSStaffQualification."Entry No" := PRNStaffQualification."Entry No";
                //         IFSStaffQualification."Qualification Category" := PRNStaffQualification."Qualification Category";
                //         IFSStaffQualification."Minimum Qualification Req" := PRNStaffQualification."Minimum Qualification Req";
                //         IFSStaffQualification.Insert(true);
                //     until PRNStaffQualification.Next = 0;
                // end;

                //6.IFS Staff Min Experience -Default values shall be inherited from the PRN Personnel Experience
                // PRNPersonnelExperience.Reset;
                // PRNPersonnelExperience.SetRange("Document No.", Purch."No.");
                // if PRNPersonnelExperience.FindSet then begin
                //     repeat
                //         IFSPersonnelExperience.Init;
                //         IFSPersonnelExperience."IFS Code" := IFS.Code;
                //         IFSPersonnelExperience."Project Role Code" := PRNPersonnelExperience."Staff Role Code";
                //         IFSPersonnelExperience."Experience Category" := PRNPersonnelExperience."Experience Category";
                //         IFSPersonnelExperience."Entry No" := PRNPersonnelExperience."Entry No";
                //         IFSPersonnelExperience."Minimum Years of Experience" := PRNPersonnelExperience."Minimum Years of Experience";
                //         IFSPersonnelExperience."Minimum Experience Req" := PRNPersonnelExperience."Minimum Experience Req";
                //         IFSPersonnelExperience.Insert(true);

                //     until PRNPersonnelExperience.Next = 0;
                // end;

                //7.IFS Required Equipment- Default values shall be inherited from the PRN Equipment Specification
                // PRNEquipmentsSpecification.Reset;
                // PRNEquipmentsSpecification.SetRange("Document No.", Purch."No.");
                // if PRNEquipmentsSpecification.FindSet then begin
                //     repeat

                //         IFSEquipmentsSpecification.Init;
                //         IFSEquipmentsSpecification."Document No" := IFS.Code;
                //         IFSEquipmentsSpecification."Equipment Type Code" := PRNEquipmentsSpecification."Equipment Type";
                //         IFSEquipmentsSpecification.Category := PRNEquipmentsSpecification.Category;
                //         IFSEquipmentsSpecification.Description := PRNEquipmentsSpecification.Description;
                //         IFSEquipmentsSpecification."Minimum Required Qty" := PRNEquipmentsSpecification."Minimum Required Qty";
                //         IFSEquipmentsSpecification.Insert(true);
                //     until PRNEquipmentsSpecification.Next = 0;
                // end;
            end;
            Message('Purchase Requisition No: %1 has successfully been converted to Invitation Notice No: %2. Please check', Purch."No.", IFS.Code);
            Page.Run(75200, IFS);
            Purch."Ordered PRN" := true;
            Purch."PRN Order Date/Time" := CurrentDatetime;
            Purch."Linked IFS No." := IFS.Code;
            Purch.Modify(true);

        end;
    end;


    procedure CopyPRNDetails(Purch: Record "Purchase Header"; IFSDetail: Record "Standard Purchase Code")
    var
        UserSetup: Record "User Setup";
        IFS: Record "Standard Purchase Code";
        ProcSetup: Record "Procurement Setup";
        PurchLines: Record "Purchase Line";
        IFSPurchLines: Record "Standard Purchase Line";
        IFSMajorWorkDeliverable: Record "IFS Major Work_Deliverable";
        PRNMajorWorkDeliverable: Record "PRN Major Work Deliverable";
        IFSKeyStaff: Record "IFS Key Staff";
        PRNPersonnelSpecification: Record "PRN Personnel Specification";
        IFSStaffQualification: Record "IFS Staff Min Qualification";
        PRNStaffQualification: Record "PRN Personnel Qualification";
        PRNPersonnelExperience: Record "PRN Personnel Experience";
        IFSPersonnelExperience: Record "IFS Staff Min Experience";
        PRNEquipmentsSpecification: Record "PRN Equipment Specification";
        IFSEquipmentsSpecification: Record "IFS Required Equipment";
    //EmailNotification: Codeunit "Email Notifications";
    begin
        if Purch."PRN Conversion Procedure" <> Purch."prn conversion procedure"::"Invitation For Supply" then
            Error('The PRN %1  must be one that supports direct creation of Invitation Notices', Purch."No.");
        ProcSetup.Get;
        //Check Procurement User
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            UserSetup.TestField("Purchase Resp. Ctr. Filter");
            if UserSetup."Authorize IFS Creator" = false then
                Error('You Must be Authorized IFS Creator, Kindly contact system administrator');
            if UserSetup."Purchase Resp. Ctr. Filter" <> Purch."Responsibility Center" then
                Error('You are not authorized to create IFS for this resonsibility center %1', Purch."Responsibility Center");
        end;

        //check if the PRN has associated IFS Notice
        /* IF (Purch."Ordered PRN"=TRUE) OR (Purch."Linked IFS No."<>'') THEN
           ERROR('The PRN %1 has been already ordered',Purch."No.");*/

        //The total value of the PRN request must be within the available procurement budget
        /*IF Purch."Total PRN Amount (LCY)">Purch."PP Total Available Budget" THEN
          ERROR('The total value of the PRN request must be within the available procurement budget');*/

        //Testfields no blanks allowed
        Purch.TestField("PP  Invitation Notice Type");
        Purch.TestField("PP Solicitation Type");
        Purch.TestField("PP Procurement Method");

        //Action should automatically create an Invitation For Supply (IFS)
        IFS.Reset;
        IFS.SetRange(Code, IFSDetail.Code);
        if IFS.FindSet then begin
            IFS.Init;
            //IFS.Code:='';
            IFS.Validate("Invitation Notice Type", Purch."PP  Invitation Notice Type");
            IFS.Validate("Document Date", Today);
            IFS.Validate("PRN No.", Purch."No.");
            IFS.Validate("Responsibility Center", Purch."Responsibility Center");
            IFS.Validate("Location Code", Purch."Location Code");
            IFS.Validate("Procurement Type", Purch."Procurement Type");
            IFS.Validate("Requisition Product Group", Purch."Requisition Product Group");
            IFS.Validate("Requisition Template ID", Purch."Requisition Template ID");
            IFS.Validate("Solicitation Type", Purch."PP Solicitation Type");
            IFS.Validate("Bid Selection Method", Purch."PP Bid Selection Method");
            IFS.Validate("Procurement Method", Purch."PP Procurement Method");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Single  Stage Tender" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default Single Stage Tender");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Two Stage Tender" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default Two Stage Tender valid");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::RFQ then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default RFQ Validity Duration");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Low Value Procurement" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default LVP Validity Duration");
            IFS.Validate("Purchaser Code", UserSetup."Salespers./Purch. Code");
            IFS.Validate("Language Code", ProcSetup."Default Language Code");
            IFS.Validate("Appointer of Bid Arbitrator", ProcSetup."Default Arbitrator Appointer");
            IFS.Validate("Requesting Region", Purch.Region);
            IFS.Validate("Directorate Code", Purch."Directorate Code1");
            IFS.Validate("Department Code", Purch."Department Code");
            IFS.Validate("Procurement Plan ID", Purch."Procurement Plan ID");
            IFS.Validate("Procurement Plan Entry No", Purch."Procurement Plan Entry No");
            IFS.Validate(Job, Purch.Job);
            IFS.Validate("Job Task No.", Purch."Job Task No.");
            IFS.Validate("PP Planning Category", Purch."PP Planning Category");
            IFS.Validate("PP Funding Source ID", Purch."Funding Source");
            IFS.Validate("PP Total Budget", Purch."PP Total Budget");
            IFS.Validate("PP Total Actual Costs", Purch."PP Total Actual Costs");
            IFS.Validate("PP Total Commitments", Purch."PP Total Commitments");
            IFS.Validate("PP Total Available Budget", Purch."PP Total Available Budget");
            IFS.Validate("PP Preference/Reservation Code", Purch."PP Preference/Reservation Code");
            //IFS.VALIDATE("Financial Year Code",ProcSetup.
            IFS.Validate("Works Category", Purch."Works Category");
            IFS.Validate("Road Code", Purch."Road Code");
            IFS.Validate("Road Link Name", Purch."Link Name");
            IFS.Validate("Constituency ID", Purch.Consitituency);
            if IFS.Modify(true) then begin
                PurchLines.Reset;
                PurchLines.SetRange("Document No.", Purch."No.");
                PurchLines.SetRange("Document Type", Purch."Document Type");
                if PurchLines.FindSet then begin
                    repeat
                        //2.IFS Purchase Lines (T174)-Default values shall be inherited from PRN Lines (T39)
                        IFSPurchLines.Init;
                        IFSPurchLines.Validate("Standard Purchase Code", IFS.Code);
                        IFSPurchLines.Validate("Line No.", PurchLines."Line No.");
                        IFSPurchLines.Validate(Type, PurchLines.Type);
                        IFSPurchLines.Validate("No.", PurchLines."No.");
                        IFSPurchLines.Validate(Description, PurchLines.Description);
                        IFSPurchLines.Validate(Quantity, PurchLines.Quantity);
                        IFSPurchLines.Validate("Unit of Measure Code", PurchLines."Unit of Measure Code");
                        IFSPurchLines.Validate("Shortcut Dimension 1 Code", PurchLines."Shortcut Dimension 1 Code");
                        IFSPurchLines.Validate("Shortcut Dimension 2 Code", PurchLines."Shortcut Dimension 2 Code");
                        IFSPurchLines.Validate("Variant Code", PurchLines."Variant Code");
                        IFSPurchLines.Validate("Dimension Set ID", PurchLines."Dimension Set ID");
                        IFSPurchLines.Validate("Item Category", PurchLines."Item Category Code");
                        IFSPurchLines.Insert(true);
                    until PurchLines.Next = 0;
                end;

                //3.IFS Major Work Deliverables table-Default values shall be inherited from the PRN Major Work Deliverable table
                PRNMajorWorkDeliverable.Reset;
                PRNMajorWorkDeliverable.SetRange("Document No.", Purch."No.");
                if PRNMajorWorkDeliverable.FindSet then begin
                    repeat
                        IFSMajorWorkDeliverable.Init;
                        IFSMajorWorkDeliverable.Validate("Document No", IFS.Code);
                        IFSMajorWorkDeliverable.Validate("Entry No", PRNMajorWorkDeliverable."Entry No");
                        IFSMajorWorkDeliverable.Validate("Major Activity Description", PRNMajorWorkDeliverable.Description);
                        IFSMajorWorkDeliverable.Insert(true);
                    until PRNMajorWorkDeliverable.Next = 0;
                end;

                //4.IFS Key Staff table-Default values shall be inherited from the PRN Personnel Specification IFS Key Staff Table FieldsMapping Rules
                PRNPersonnelSpecification.Reset;
                PRNPersonnelSpecification.SetRange("Document No.", Purch."No.");
                if PRNPersonnelSpecification.FindSet then begin
                    repeat
                        IFSKeyStaff.Init;
                        IFSKeyStaff."IFS Code" := IFS.Code;
                        IFSKeyStaff."Staff Role Code" := PRNPersonnelSpecification."Staff Role Code";
                        IFSKeyStaff."Title/Designation Description" := PRNPersonnelSpecification."Title/Designation Description";
                        IFSKeyStaff."Staff Category" := PRNPersonnelSpecification."Staff Category";
                        IFSKeyStaff."Min No. of Recomm Staff" := PRNPersonnelSpecification."Min No. of Recomm Staff";
                        IFSKeyStaff.Insert(true);
                    until PRNPersonnelSpecification.Next = 0;
                end;

                //5.IFS Staff Min Qualification-Default values shall be inherited from the PRN Personnel Qualification
                PRNStaffQualification.Reset;
                PRNStaffQualification.SetRange("Document No.", Purch."No.");
                if PRNStaffQualification.FindSet then begin
                    repeat
                        IFSStaffQualification.Init;
                        IFSStaffQualification."IFS Code" := IFS.Code;
                        IFSStaffQualification."Project Role Code" := PRNStaffQualification."Staff Role Code";
                        IFSStaffQualification."Entry No" := PRNStaffQualification."Entry No";
                        IFSStaffQualification."Qualification Category" := PRNStaffQualification."Qualification Category";
                        IFSStaffQualification."Minimum Qualification Req" := PRNStaffQualification."Minimum Qualification Req";
                        IFSStaffQualification.Insert(true);
                    until PRNStaffQualification.Next = 0;
                end;

                //6.IFS Staff Min Experience -Default values shall be inherited from the PRN Personnel Experience
                PRNPersonnelExperience.Reset;
                PRNPersonnelExperience.SetRange("Document No.", Purch."No.");
                if PRNPersonnelExperience.FindSet then begin
                    repeat
                        IFSPersonnelExperience.Init;
                        IFSPersonnelExperience."IFS Code" := IFS.Code;
                        IFSPersonnelExperience."Project Role Code" := PRNPersonnelExperience."Staff Role Code";
                        IFSPersonnelExperience."Experience Category" := PRNPersonnelExperience."Experience Category";
                        IFSPersonnelExperience."Entry No" := PRNPersonnelExperience."Entry No";
                        IFSPersonnelExperience."Minimum Years of Experience" := PRNPersonnelExperience."Minimum Years of Experience";
                        IFSPersonnelExperience."Minimum Experience Req" := PRNPersonnelExperience."Minimum Experience Req";
                        IFSPersonnelExperience.Insert(true);

                    until PRNPersonnelExperience.Next = 0;
                end;

                //7.IFS Required Equipment- Default values shall be inherited from the PRN Equipment Specification
                PRNEquipmentsSpecification.Reset;
                PRNEquipmentsSpecification.SetRange("Document No.", Purch."No.");
                if PRNEquipmentsSpecification.FindSet then begin
                    repeat

                        IFSEquipmentsSpecification.Init;
                        IFSEquipmentsSpecification."Document No" := IFS.Code;
                        IFSEquipmentsSpecification."Equipment Type Code" := PRNEquipmentsSpecification."Equipment Type";
                        IFSEquipmentsSpecification.Category := PRNEquipmentsSpecification.Category;
                        IFSEquipmentsSpecification.Description := PRNEquipmentsSpecification.Description;
                        IFSEquipmentsSpecification."Minimum Required Qty" := PRNEquipmentsSpecification."Minimum Required Qty";
                        IFSEquipmentsSpecification.Insert(true);
                    until PRNEquipmentsSpecification.Next = 0;
                end;
            end;
            Message('Purchase Requisition No: %1 has successfully been converted to Invitation Notice No: %2. Please check', Purch."No.", IFS.Code);
            Page.Run(75078, IFS);
            Purch."Ordered PRN" := true;
            Purch."PRN Order Date/Time" := CurrentDatetime;
            Purch."Linked IFS No." := IFS.Code;
            Purch.Modify(true);
            //Back Email Notification to requestor.
            //   EmailNotification.SendPRNApprovedMailAfterIFSCreation(Purch);

        end;

    end;


    procedure CancelIFSInvitation(IFS: Record "Standard Purchase Code")
    var
        Text0001: label 'The IFP voucher is still Active for submission';
        BIDResponse: Record "Purchase Header";
        IFPResponseLine: Record "IFP Response Line";
        VendPrequalificationEntry: Record "Vendor Prequalification Entry";
        UserSetup: Record "User Setup";
        TenderCommitteAppointment: Record "IFS Tender Committee";
        IFSPrebid: Record "IFS Prebid Register";
        TenderAddendum: Record "Tender Addendum Notice";
        BidOpeningRegister: Record "Bid Opening Register";
        BidEvaluation: Record "Bid Evaluation Register";
        BidTabulation: Record "Bid Tabulation Header";
    begin
        //Check Procurement User
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            UserSetup.TestField("Purchase Resp. Ctr. Filter");
            // if UserSetup."Cancel Invitation For Supply" = false then
            //     Error('The function can only be executed by authorized users , Kindly contact system administrator');
            if UserSetup."Purchase Resp. Ctr. Filter" <> IFS."Responsibility Center" then
                Error('You are not authorized to create IFS for this resonsibility center %1', IFS."Responsibility Center");
        end;

        //check for IFS random key
        if IFS."Sent Cancellation Secret Code" = '' then begin
            FnSendSecretCodeOnIFSCancellation(IFS, UserId);
        end else begin
            if IFS."Cancellation Secret Code" <> IFS."Sent Cancellation Secret Code" then
                Error('Kindly input The correct Cancellation Secret Code sent to your EMail %1', UserSetup."E-Mail");
        end;
        IFS.TestField("Cancel Reason Code");
        IFS.TestField("Cancellation Date");

        //v.The Tender Committee Appointment Vouchers linked to the IFS shall be cancelled
        TenderCommitteAppointment.Reset;
        TenderCommitteAppointment.SetRange("IFS Code", IFS.Code);
        if TenderCommitteAppointment.FindSet then begin
            TenderCommitteAppointment."Document Status" := TenderCommitteAppointment."document status"::Cancelled;
            TenderCommitteAppointment.Modify(true);
        end;

        //vi.The prebid meeting register linked to the IFS shall be cancelled
        IFSPrebid.Reset;
        IFSPrebid.SetRange("IFS Code", IFS.Code);
        if IFSPrebid.FindSet then begin
            IFSPrebid."Document Status" := IFS."document status"::Cancelled;
            IFSPrebid.Modify(true);
        end;

        //vii.The Bid Response Vouchers (Mapped to Quotes on T38) linked to this IFS shall be marked as Cancelled
        BIDResponse.Reset;
        BIDResponse.SetRange("Linked IFS No.", IFS.Code);
        if BIDResponse.FindSet then begin
            BIDResponse."Document Status" := BIDResponse."document status"::Cancelled;
            BIDResponse.Modify(true);
        end;

        //viii.Any Tender Addendum Notices linked to a given IFS shall be set to cancelled
        TenderAddendum.Reset;
        TenderAddendum.SetRange("Invitation Notice No.", IFS.Code);
        if TenderAddendum.FindSet then begin
            TenderAddendum."Document Status" := TenderAddendum."document status"::Cancelled;
            TenderAddendum.Modify(true);
        end;

        //Any bid/tender opening register linked to the IFS shall be cancelled
        BidOpeningRegister.Reset;
        BidOpeningRegister.SetRange("IFS Code", IFS.Code);
        if BidOpeningRegister.FindSet then begin
            BidOpeningRegister."Document Status" := BidOpeningRegister."document status"::Cancelled;
            BidOpeningRegister.Modify(true);
        end;

        //x.Any bid evaluation register linked to the IFS shall be cancelled
        BidEvaluation.Reset;
        BidEvaluation.SetRange("IFS Code", IFS.Code);
        if BidEvaluation.FindSet then begin
            BidEvaluation."Document Status" := BidEvaluation."document status"::Cancelled;
            BidEvaluation.Modify(true);
        end;

        //xi.Any bid evaluation report, Procurement Professional Opinion or Notice of Award linked to the IFS shall be cancelled by
        BidTabulation.Reset;
        BidTabulation.SetRange("IFS Code", IFS.Code);
        if BidTabulation.FindSet then begin
            BidTabulation."Document Status" := BidTabulation."document status"::Cancelled;
            BidTabulation.Modify(true)
        end;



        IFS."Document Status" := IFS."document status"::Cancelled;
        IFS.Modify(true);
        Message('Invitation for Prequalification %1 has been closed successfuly', IFS.Code);
    end;


    procedure FnSendSecretCodeOnIFSCancellation(IFS: Record "Standard Purchase Code"; User1: Code[50])
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        ////"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        RandomDigit: Text[50];
    begin
        ///Notifying Procurement Team on supplier Request


        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;

        UserSetup.Reset;
        UserSetup.SetRange("User ID", User1);
        if UserSetup.FindSet then
            RequesterEmail := UserSetup."E-Mail";
        RequesterName := UserSetup.UserName;

        Window.Open('Notifying the Sender...');

        WindowisOpen := true;

        RandomDigit := CreateGuid;
        RandomDigit := DelChr(RandomDigit, '=', '{}-01');
        RandomDigit := CopyStr(RandomDigit, 1, 8);

        Counter := Counter + 1;

        Password := RandomDigit;

        //Create message
        if HRSetup."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := HRSetup."E-Mail";

        if PPayableSetup."Default Proc Email Contact" = '' then
            Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
        CustEmail := PPayableSetup."Default Proc Email Contact";

        CompanyDetails := 'Procurement Officer,' + '<BR></BR>' + CompInfo.Name + '<BR></BR>' + CompInfo.Address + '<BR></BR>' + CompInfo."Address 2" + '<BR></BR>' + CompInfo.City;
        SenderMessage := '<BR>Please find below system Generated Cancellation Secret code to be used in cancellation Process:</BR>' + '<BR></BR>';
        LoginDetails := 'Password:' + Password;
        ActivationDetails := '<BR>Please fill the Secret Code on the IFS to be able to proceed :</BR>';

        if CustEmail = '' then
            exit;

        //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
        emailhdr := 'IFS Cancellation Activation (IFS No:' + IFS.Code + ')';

        // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

        // cu400.AddCC(RequesterEmail);

        // cu400.AppendToBody(ProcNote);


        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
        IFS."Sent Cancellation Secret Code" := Password;
        IFS.Modify(true);
    end;


    procedure SuggestTenderSourceDoc(IFS: Record "Standard Purchase Code")
    var
        ProcSetup: Record "Procurement Setup";
        IFSTenderDOc: Record "IFS Tender Document Source";
        TenderDoc: Record "Tender Document Source";
    begin
        ProcSetup.Get;
        IFSTenderDOc.Reset;
        IFSTenderDOc.SetRange("Document No.", IFS.Code);
        if IFSTenderDOc.FindSet then begin
            IFSTenderDOc.DeleteAll;
        end;
        TenderDoc.Reset;
        if TenderDoc.FindSet then begin
            repeat
                IFSTenderDOc.Init;
                IFSTenderDOc."Document No." := IFS.Code;
                IFSTenderDOc."Tender Source ID" := TenderDoc.Code;
                IFSTenderDOc.Description := TenderDoc.Description;
                IFSTenderDOc."Url Link" := TenderDoc."Url Link";
                IFSTenderDOc.Validate("Bid Charge Code", TenderDoc."Default IFS Bid Charge Code");
                IFSTenderDOc.Insert(true);


            //MESSAGE('TENDER DOC %1',TenderDoc.Code);
            until TenderDoc.Next = 0;
        end;
    end;


    procedure SuggestPrequalifiedSuppliers(IFS: Record "Standard Purchase Code")
    var
        ProcSetup: Record "Procurement Setup";
        IFSPurchaseline: Record "Standard Vendor Purchase Code";
        VendorPreqEntry: Record "Vendor Prequalification Entry";
    begin
        ProcSetup.Get;

        IFSPurchaseline.Reset;
        IFSPurchaseline.SetRange(Code, IFS.Code);
        if IFSPurchaseline.FindSet then begin
            IFSPurchaseline.DELETEALL;
        end;
        VendorPreqEntry.Reset;
        VendorPreqEntry.SetRange("Procurement Category Code", IFS."Procurement Category ID");
        VendorPreqEntry.SetRange(Blocked, false);
        if VendorPreqEntry.FindSet then begin
            repeat
                IFSPurchaseline.Init;
                IFSPurchaseline.Validate("Vendor No.", VendorPreqEntry."Vendor No.");
                IFSPurchaseline.Code := IFS.Code;
                IFSPurchaseline.category := IFS."Procurement Category ID";
                IFSPurchaseline.Validate("Supplier No.", VendorPreqEntry."Vendor No.");
                IFSPurchaseline.Validate(Description, VendorPreqEntry.Description);
                IFSPurchaseline.Validate("IFS Code", IFS.Code);
                IFSPurchaseline.Insert(true);
            until VendorPreqEntry.Next = 0;
        end;
        // end;
        Message('Suggested');
    end;


    procedure FnSendRFQInvitation(IFS: Record "Standard Purchase Code")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        RFQReqVendors: Record "Standard Vendor Purchase Code";

        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        IFSList: Record "Standard Purchase Code";
        RFQReqVendors1: Record "Standard Vendor Purchase Code";
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        Recipients: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;
    begin
        ///Notifying Procurement Team on supplier Request


        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;

        RFQReqVendors.Reset;
        RFQReqVendors.SetRange(Code, IFS.Code);
        if RFQReqVendors.FindSet then begin
            repeat
                RFQReqVendors.TestField("Primary Email");
                RequesterEmail := RFQReqVendors."Primary Email";
                RequesterName := RFQReqVendors."Vendor Name";

                Window.Open('Notifying the Sender...');

                WindowisOpen := true;


                Counter := Counter + 1;

                //Create message
                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'To: ' + RequesterName;
                SenderMessage := '<BR>You are hereby invited to submit your Bid Response for the Request for Quotation:' + IFS.Code + ' That is summarized as follows:</BR>';
                SupplierDetails := '<BR>RFQ Invitation Notice NO:' + IFS.Code + '</BR>' + '<BR> Description:' + IFS.Description + '</BR>' +
                '<BR>Submission Due Date:' + Format(IFS."Submission End Date") + '</BR>' +
                '<BR>Submission Due Time:' + Format(IFS."Submission End Time") + '</BR>' +
                '<BR>Procuring Entity Name:' + IFS."Procuring Entity Name/Contact" + '</BR>';
                LoginDetails := '';

                FileName := RFQReqVendors."Vendor No." + 'RFQ.pdf';
                FileDirectory := 'C:\DOCS\' + FileName;


                ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";
                IFSList.RESET;
                IFSList.SETRANGE(Code, IFS.Code);
                if IFSList.FINDSET then begin
                    RFQReqVendors1.RESET;
                    RFQReqVendors1.SETRANGE(Code, IFSList.Code);
                    RFQReqVendors1.SETRANGE("Vendor No.", RFQReqVendors."Vendor No.");
                    if RFQReqVendors1.FINDSET then begin

                        //REPORT.SAVEASPDF(70068,FileDirectory,RFQReqVendors1);
                        RecRef.GetTable(RFQReqVendors1);
                        TempBlob.CreateOutStream(OutStr);
                        Report.SaveAs(Report::"RFQ2", '', ReportFormat::Pdf, OutStr, RecRef);
                        TempBlob.CreateInStream(InStr);
                        InStr.ReadText(BodyTxt);


                        // add attachment for with pdf
                        TempBlob.CreateOutStream(OutStr2);
                        Report.SaveAs(Report::"RFQ2", '', ReportFormat::Pdf, OutStr, RecRef);
                        TempBlob.CreateInStream(InStr2);
                    end;
                end;


                if CustEmail = '' then
                    exit;

                //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                emailhdr := 'Invitation Notice for Request for Quotation(RFQ) Reference No: (' + IFS.Code + ')';

                // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
                // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

                // cu400.AddCC(RequesterEmail);

                // cu400.AppendToBody(ProcNote);
                EmailMessage.Create(RequesterEmail, emailhdr, CompanyDetails + SenderMessage + SupplierDetails + LoginDetails, true);
                EmailMessage.AddAttachment('RFQ.pdf', 'PDF', InStr2);
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

                // cu400.Send;
                SendingDate := Today;
                SendingTime := Time;
                RFQReqVendors."Invitation Email Sent" := true;
                RFQReqVendors."Date/Time Notified" := CurrentDatetime;
                RFQReqVendors.Modify(true);


                Sleep(1000);
                Window.Close;

            until RFQReqVendors.Next = 0;
        end;
    end;


    procedure FnSendTenderCommitteNotification(IFSTenderCommitte: Record "IFS Tender Committee")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        IFSCommitteMembers: Record "IFS Tender Committee Member";
        IFS: Record "Standard Purchase Code";
        CommitteType: Record "Procurement Committee Types";
        CommitteMembers: Record "IFS Tender Committee";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        Recipients: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;
    begin
        ///Notifying Procurement Team on supplier Request


        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;

        IFSCommitteMembers.Reset;
        IFSCommitteMembers.SetRange("Document No.", IFSTenderCommitte."Document No.");
        if IFSCommitteMembers.FindSet then begin
            repeat
                IFSCommitteMembers.TestField("Member Email");
                RequesterEmail := IFSCommitteMembers."Member Email";
                // RequesterName := IFSCommitteMembers."Member No.";
                RequesterName := IFSCommitteMembers."Member Name";

                Window.Open('Notifying the Sender...');

                WindowisOpen := true;


                Counter := Counter + 1;

                //Create message
                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'Dear  ' + RequesterName + ',';
                SenderMessage := '<BR><BR>You have been appointed to serve in the Tender/Procurement Committee No: ' + IFSTenderCommitte."Document No." + '</BR>';
                SupplierDetails := '<BR>Appointment Reference No:' + IFSTenderCommitte."Document No." + '</BR>' + '<BR> Committee Type:' + IFSTenderCommitte."Committee Type" + '</BR>' +
                '<BR>Membership Role:' + Format(IFSCommitteMembers.Role) + '</BR>' +
                '<BR>Appointment Effective Date:' + Format(IFSTenderCommitte."Appointment Effective Date") + '</BR>' +
                '<BR>Invitation For Supply No:' + IFSTenderCommitte."IFS Code" + '</BR>' +
                '<BR>Tender Name:' + IFSTenderCommitte."Tender Name" + '</BR>' +
                '<BR>Appointing Authority:' + IFSTenderCommitte."Appointing Authority" + '</BR>';
                LoginDetails := '<BR>Attached herein, please find an e-copy of your appointment letter</BR>';


                ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";

                FileDirectory := 'C:\DOCS\';
                FileName := 'AppointmentLetter_' + IFSTenderCommitte."Document No." + '.pdf';
                CommitteMembers.Reset;
                CommitteMembers.SetRange("Document No.", IFSTenderCommitte."Document No.");
                if CommitteMembers.FindSet then begin

                    RecRef.GetTable(CommitteMembers);
                    TempBlob.CreateOutStream(OutStr);
                    Report.SaveAs(Report::"Tender Committee appointment", '', ReportFormat::Pdf, OutStr, RecRef);
                    TempBlob.CreateInStream(InStr);
                    InStr.ReadText(BodyTxt);
                    TempBlob.CreateOutStream(OutStr2);
                    Report.SaveAs(Report::"Tender Committee appointment", '', ReportFormat::Pdf, OutStr, RecRef);
                    TempBlob.CreateInStream(InStr2);

                end;



                if CustEmail = '' then
                    exit;

                //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                emailhdr := 'Tender/Procurement Committee appointment (Reference No: ' + IFSTenderCommitte."Document No." + ')';

                // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
                // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

                // cu400.AddCC(RequesterEmail);
                // cu400.AddAttachment(FileDirectory + FileName, FileName);

                // cu400.AppendToBody(ProcNote);
                EmailMessage.Create(RequesterEmail, emailhdr, CompanyDetails + SenderMessage + SupplierDetails + LoginDetails, true);

                EmailMessage.AddAttachment('Appointment_Letter.pdf', 'PDF', InStr2);
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);


                // cu400.Send;
                SendingDate := Today;
                SendingTime := Time;

                IFSCommitteMembers."Notified on Email" := true;
                IFSCommitteMembers."Date/Time Notified" := CurrentDatetime;
                IFSCommitteMembers.Modify(true);


                Sleep(1000);
                Window.Close;

            until IFSCommitteMembers.Next = 0;
        end;


        //update IFS
        IFS.Reset;
        IFS.SetRange(Code, IFSTenderCommitte."IFS Code");
        if IFS.FindSet then begin
            CommitteType.Reset;
            CommitteType.SetRange("Committee Type", IFSTenderCommitte."Committee Type");
            if CommitteType.FindSet then begin
                if CommitteType."Mandate Type" = CommitteType."mandate type"::"Tender Evaluation" then
                    IFS."Bid Evaluation Committe" := IFSTenderCommitte."Document No."
                else
                    if CommitteType."Mandate Type" = CommitteType."mandate type"::"Tender Opening" then
                        IFS."Bid Opening Committe" := IFSTenderCommitte."Document No.";
                IFS.Modify(true);
            end;

        end;
    end;


    procedure SuggestBidScoreGuide(SupplierRatingTemp: Record "Bid Scoring Template")
    var
        EvaluationCriteria: Record "Bid Score Requirement";
        ScoreGuide: Record "Bid Score Guide";
        i: Integer;
        entryno: Integer;
    begin
        if SupplierRatingTemp.Released = true then
            Error('The Supplier Rating Template is already Released, it cannot be modified unless Reopened');

        //Suggest every evaluation critera with associated score guide entries



        EvaluationCriteria.Reset;
        EvaluationCriteria.SetRange("Template ID", SupplierRatingTemp.Code);
        if EvaluationCriteria.FindSet then begin
            repeat
                ScoreGuide.Reset;
                ScoreGuide.SetRange("Template ID", EvaluationCriteria."Template ID");
                ScoreGuide.SetRange("Criteria Group ID", EvaluationCriteria."Criteria Group ID");
                ScoreGuide.SetRange("Requirement ID", EvaluationCriteria."Requirement ID");
                if not ScoreGuide.FindSet then begin

                    if EvaluationCriteria."Rating Type" = EvaluationCriteria."rating type"::"Yes/No" then begin
                        i := 1;
                        repeat
                            ScoreGuide.Reset;
                            if ScoreGuide.FindLast then
                                entryno := ScoreGuide."Entry No";
                            ScoreGuide.Init;
                            ScoreGuide."Template ID" := SupplierRatingTemp.Code;
                            ScoreGuide."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                            ScoreGuide."Requirement ID" := EvaluationCriteria."Requirement ID";
                            ScoreGuide."Rating Type" := ScoreGuide."rating type"::"Yes/No";
                            ScoreGuide."Entry No" := entryno + 1;
                            ScoreGuide."Min Bid Value" := 0;
                            ScoreGuide."Min Date Value" := 0D;
                            ScoreGuide."Max Bid Value" := 0;
                            ScoreGuide."Max Date Value" := 0D;
                            if i = 1 then begin
                                ScoreGuide."Response Value" := SupplierRatingTemp."YES Bid Rating Response Value";
                                ScoreGuide."Score %" := SupplierRatingTemp."Default YES Bid Rating Score %";
                            end else begin
                                ScoreGuide."Response Value" := SupplierRatingTemp."NO Bid Rating Response Value";
                                ScoreGuide."Score %" := SupplierRatingTemp."Default NO Bid Rating Score %";
                            end;
                            i += 1;
                            ScoreGuide.Insert(true);
                        until i = 3;
                    end;
                    if EvaluationCriteria."Rating Type" = EvaluationCriteria."rating type"::Number then begin
                        if EvaluationCriteria."Desired Perfomance Direction" = EvaluationCriteria."desired perfomance direction"::"Increasing KPI" then begin
                            i := 1;
                            repeat
                                ScoreGuide.Reset;
                                if ScoreGuide.FindLast then
                                    entryno := ScoreGuide."Entry No";
                                ScoreGuide.Init;
                                ScoreGuide."Template ID" := SupplierRatingTemp.Code;
                                ScoreGuide."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                                ScoreGuide."Requirement ID" := EvaluationCriteria."Requirement ID";
                                ScoreGuide."Entry No" := entryno + 1;
                                ScoreGuide."Rating Type" := ScoreGuide."rating type"::Number;
                                if i = 1 then begin
                                    ScoreGuide."Min Bid Value" := 0;
                                    ScoreGuide."Min Date Value" := 0D;
                                    ScoreGuide."Max Bid Value" := EvaluationCriteria."Target Qty" - 1;
                                    ScoreGuide."Max Date Value" := 0D;
                                    //ScoreGuide."Response Value":=SupplierRatingTemp."YES Bid Rating Response Value";
                                    ScoreGuide."Score %" := 0;
                                end else begin
                                    ScoreGuide."Min Bid Value" := EvaluationCriteria."Target Qty";
                                    ScoreGuide."Min Date Value" := 0D;
                                    ScoreGuide."Max Bid Value" := SupplierRatingTemp."Max Bid Value Limit";
                                    ScoreGuide."Max Date Value" := 0D;
                                    // ScoreGuide."Response Value":=SupplierRatingTemp."NO Bid Rating Response Value";
                                    ScoreGuide."Score %" := 100;
                                end;
                                i += 1;
                                ScoreGuide.Insert(true);
                            until i = 3;
                        end;
                        if EvaluationCriteria."Target Qty" <> 0 then begin
                            if EvaluationCriteria."Desired Perfomance Direction" = EvaluationCriteria."desired perfomance direction"::"Decreasing KPI" then begin
                                i := 1;
                                repeat
                                    ScoreGuide.Reset;
                                    if ScoreGuide.FindLast then
                                        entryno := ScoreGuide."Entry No";
                                    ScoreGuide.Init;
                                    ScoreGuide."Template ID" := SupplierRatingTemp.Code;
                                    ScoreGuide."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                                    ScoreGuide."Requirement ID" := EvaluationCriteria."Requirement ID";
                                    ScoreGuide."Entry No" := entryno + 1;
                                    ScoreGuide."Rating Type" := ScoreGuide."rating type"::Number;
                                    if i = 1 then begin
                                        ScoreGuide."Min Bid Value" := 0;
                                        ScoreGuide."Min Date Value" := 0D;
                                        ScoreGuide."Max Bid Value" := EvaluationCriteria."Target Qty" - 1;
                                        ScoreGuide."Max Date Value" := 0D;
                                        //ScoreGuide."Response Value":=SupplierRatingTemp."YES Bid Rating Response Value";
                                        ScoreGuide."Score %" := 100;
                                    end else begin
                                        ScoreGuide."Min Bid Value" := EvaluationCriteria."Target Qty";
                                        ScoreGuide."Min Date Value" := 0D;
                                        ScoreGuide."Max Bid Value" := SupplierRatingTemp."Max Bid Value Limit";
                                        ScoreGuide."Max Date Value" := 0D;
                                        //ScoreGuide."Response Value":=SupplierRatingTemp."NO Bid Rating Response Value";
                                        ScoreGuide."Score %" := 0;
                                    end;
                                    i += 1;
                                    ScoreGuide.Insert;
                                until i = 3;
                            end;
                        end else begin
                            if EvaluationCriteria."Desired Perfomance Direction" = EvaluationCriteria."desired perfomance direction"::"Decreasing KPI" then begin
                                i := 1;
                                repeat
                                    ScoreGuide.Reset;
                                    if ScoreGuide.FindLast then
                                        entryno := ScoreGuide."Entry No";
                                    ScoreGuide.Init;
                                    ScoreGuide."Template ID" := SupplierRatingTemp.Code;
                                    ScoreGuide."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                                    ScoreGuide."Requirement ID" := EvaluationCriteria."Requirement ID";
                                    ScoreGuide."Entry No" := entryno + 1;
                                    ScoreGuide."Rating Type" := ScoreGuide."rating type"::Number;
                                    if i = 1 then begin
                                        ScoreGuide."Min Bid Value" := 0;
                                        ScoreGuide."Min Date Value" := 0D;
                                        ScoreGuide."Max Bid Value" := EvaluationCriteria."Target Qty" - 1;
                                        ScoreGuide."Max Date Value" := 0D;
                                        //ScoreGuide."Response Value":=SupplierRatingTemp."YES Bid Rating Response Value";
                                        ScoreGuide."Score %" := 100;
                                    end else begin
                                        ScoreGuide."Min Bid Value" := EvaluationCriteria."Target Qty" + 1;
                                        ScoreGuide."Min Date Value" := 0D;
                                        ScoreGuide."Max Bid Value" := SupplierRatingTemp."Max Bid Value Limit";
                                        ScoreGuide."Max Date Value" := 0D;
                                        //ScoreGuide."Response Value":=SupplierRatingTemp."NO Bid Rating Response Value";
                                        ScoreGuide."Score %" := 0;
                                    end;
                                    i += 1;
                                    ScoreGuide.Insert(true);
                                until i = 3;
                            end;
                        end;
                    end;
                    if EvaluationCriteria."Rating Type" = EvaluationCriteria."rating type"::"Options Text" then begin
                        i := 1;
                        repeat
                            ScoreGuide.Reset;
                            if ScoreGuide.FindLast then
                                entryno := ScoreGuide."Entry No";
                            ScoreGuide.Init;
                            ScoreGuide."Template ID" := SupplierRatingTemp.Code;
                            ScoreGuide."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                            ScoreGuide."Requirement ID" := EvaluationCriteria."Requirement ID";
                            ScoreGuide."Entry No" := entryno + 1;
                            ScoreGuide."Rating Type" := ScoreGuide."rating type"::"Options Text";
                            ScoreGuide."Min Bid Value" := 0;
                            ScoreGuide."Min Date Value" := 0D;
                            ScoreGuide."Max Bid Value" := 0;
                            ScoreGuide."Max Date Value" := 0D;
                            if i = 1 then begin
                                ScoreGuide."Response Value" := '1-POOR';
                                ScoreGuide."Score %" := SupplierRatingTemp."1-POOR Option Text Bid Score %";
                            end else
                                if i = 2 then begin
                                    ScoreGuide."Response Value" := '2-FAIR';
                                    ScoreGuide."Score %" := SupplierRatingTemp."2-FAIR Option Text Bid Score %";
                                end else
                                    if i = 3 then begin
                                        ScoreGuide."Response Value" := '3-GOOD';
                                        ScoreGuide."Score %" := SupplierRatingTemp."3-GOOD Option Text Bid Score %";
                                    end else
                                        if i = 4 then begin
                                            ScoreGuide."Response Value" := '4-VERY GOOD';
                                            ScoreGuide."Score %" := SupplierRatingTemp."4-VERY GOOD  Text Bid Score %";
                                        end else
                                            if i = 5 then begin
                                                ScoreGuide."Response Value" := '5-EXCELLENT';
                                                ScoreGuide."Score %" := SupplierRatingTemp."5-EXCELLENT Text Bid Score %";
                                            end;
                            i += 1;
                            ScoreGuide.Insert(true);
                        until i = 6;
                    end;
                end;
            until EvaluationCriteria.Next = 0;
        end;
        Message('Supplier Score Guide has been Suggested successfuly');
    end;


    procedure FnNotifyPrebidAttendees(PreBid: Record "IFS Prebid Register")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        IFSPrebidAttendees: Record "IFS Prebid Bidder Attendance";
    begin
        ///Notifying Procurement Team on supplier Request


        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;

        IFSPrebidAttendees.Reset;
        IFSPrebidAttendees.SetRange("Prebid Register ID", PreBid.Code);
        if IFSPrebidAttendees.FindSet then begin
            repeat
                IFSPrebidAttendees.TestField("Representative Email");
                RequesterEmail := IFSPrebidAttendees."Representative Email";
                RequesterName := IFSPrebidAttendees."Representative Name";

                Window.Open('Notifying the Sender...');

                WindowisOpen := true;


                Counter := Counter + 1;

                //Create message
                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'Dear,  ' + RequesterName + '<BR>' + IFSPrebidAttendees."Bidder No";
                SenderMessage := '<BR>Thank You for participating in the prebid meeting (Meeting Reference No:' + PreBid.Code + ') held on ' + Format(PreBid."Pre-bid Visit Date") +
                'as summarized below: </BR>';
                SupplierDetails := '<BR>Tender invitation Notice No:' + PreBid."IFS Code" + '</BR>' + '<BR> Tender Reference No:' + PreBid."Tender External Document No" + '</BR>' +
                '<BR>Tender Name:' + PreBid."Tender Description" + '</BR>' +
                '<BR>Prebid meeting Time and Venue:' + Format(PreBid."Pre-bid Visit Start Time") + ' To ' + Format(PreBid."Pre-bid Visit Start Time") + ' ,' + PreBid."Prebid Meeting Venue" + '</BR>';
                LoginDetails := 'Attached herein, please find summarized minutes of the Prebid meeting';


                ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";

                if CustEmail = '' then
                    exit;

                //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                emailhdr := 'Minutes of Prebid meeting (Reference No: ' + PreBid.Code + ')';

                // cu400.Create(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
                // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

                // cu400.AddCC(CustEmail);

                // cu400.AppendToBody(ProcNote);


                // cu400.Send;
                SendingDate := Today;
                SendingTime := Time;


                IFSPrebidAttendees."Notified on Email" := true;
                IFSPrebidAttendees."Date/Time Notified" := CurrentDatetime;
                IFSPrebidAttendees.Modify(true);


                Sleep(1000);
                Window.Close;

            until IFSPrebidAttendees.Next = 0;
        end;
    end;


    procedure suggestIntentionToBidVends(TenderAddendum: Record "Tender Addendum Notice")
    var
        TenderAddedumBidders: Record "Tender Addendum Bidder";
        IntentionToBid: Record "Standard Vendor Purchase Code";
        Bids: Record "Purchase Header";
    begin

        TenderAddedumBidders.Reset;
        TenderAddedumBidders.SetRange("Addendum Notice No.", TenderAddendum."Addendum Notice No.");
        if not TenderAddedumBidders.FindSet then begin
            IntentionToBid.Reset;
            IntentionToBid.SetRange(Code, TenderAddendum."Invitation Notice No.");
            if IntentionToBid.FindSet then begin
                repeat
                    TenderAddedumBidders.Init;
                    TenderAddedumBidders."Addendum Notice No." := TenderAddendum."Addendum Notice No.";
                    TenderAddedumBidders."Vendor No." := IntentionToBid."Vendor No.";
                    TenderAddedumBidders."IFS No." := IntentionToBid.Code;
                    TenderAddedumBidders."Vendor Name" := IntentionToBid."Vendor Name";
                    TenderAddedumBidders."Primary Email" := IntentionToBid."Primary Email";
                    TenderAddedumBidders.Insert(true);
                until IntentionToBid.Next = 0;
                Message('Suggested successfuly');
            end else begin
                Bids.Reset;
                Bids.SetRange("Invitation For Supply No", TenderAddendum."Invitation Notice No.");
                if Bids.FindSet then begin
                    repeat
                        TenderAddedumBidders.Init;
                        TenderAddedumBidders."Addendum Notice No." := TenderAddendum."Addendum Notice No.";
                        TenderAddedumBidders."Vendor No." := Bids."Buy-from Vendor No.";
                        TenderAddedumBidders."IFS No." := Bids."IFS Code";
                        TenderAddedumBidders."Vendor Name" := Bids."Buy-from Vendor Name";
                        //TenderAddedumBidders."Primary Email":=Bids.;
                        TenderAddedumBidders.Insert(true);
                    until Bids.Next = 0;
                end;
            end;
        end;
    end;


    procedure SendAddendumNotice(Tenderaddendum: Record "Tender Addendum Notice")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        TenderAddendumBidders: Record "Tender Addendum Bidder";
    begin
        ///Notifying Procurement Team on supplier Request


        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;

        TenderAddendumBidders.Reset;
        TenderAddendumBidders.SetRange("Addendum Notice No.", Tenderaddendum."Addendum Notice No.");
        if TenderAddendumBidders.FindSet then begin
            repeat
                TenderAddendumBidders.TestField("Primary Email");
                RequesterEmail := TenderAddendumBidders."Primary Email";
                RequesterName := TenderAddendumBidders."Vendor Name";

                Window.Open('Notifying the Sender...');

                WindowisOpen := true;


                Counter := Counter + 1;

                //Create message
                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'To:' + RequesterName;
                SenderMessage := '<BR>Please note we have issued an Addendum Notice  (Reference No:' + Tenderaddendum."Addendum Notice No." +
                ' as summarized below: </BR>';
                SupplierDetails := '<BR>Tender invitation Notice No:' + Tenderaddendum."Invitation Notice No." + '</BR>' + '<BR> Tender Reference No:' + Tenderaddendum."Tender No" + '</BR>' +
                '<BR>Tender Name:' + Tenderaddendum.Description + '</BR>' +
                '<BR>Addendum Description:' + Tenderaddendum."Addendum Instructions" + '</BR>';
                LoginDetails := 'Please login to e-procurement portal to view the Addendum Notice Details';


                ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";

                if CustEmail = '' then
                    exit;

                //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                emailhdr := 'Tender Addendum Notice (Reference No: ' + Tenderaddendum."Addendum Notice No." + ')';

                // cu400.Create(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
                // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

                // cu400.AddCC(CustEmail);

                // cu400.AppendToBody(ProcNote);


                // cu400.Send;
                SendingDate := Today;
                SendingTime := Time;


                TenderAddendumBidders."Addendum e-Notice Sent" := true;
                TenderAddendumBidders."e-Notice Sent Date/Time" := CurrentDatetime;
                TenderAddendumBidders.Modify(true);


                Sleep(1000);
                Window.Close;

            until TenderAddendumBidders.Next = 0;
        end;
    end;


    procedure UpdateBidResponse(Purch: Record "Purchase Header")
    var
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
    begin
        /*Vendor.RESET;
        Vendor.SETRANGE("No.",Purch."Vendor No.");
        IF Vendor.FINDSET THEN BEGIN
          //Purch.INIT;
          Purch."Building/House No":=Vendor."Building/House No";
          Purch."Plot No":=Vendor."Plot No";
          Purch.Street:=Vendor.Street;
          Purch."Nature of Business":=Vendor."Nature of Business";
          Purch."Current Trade Licence No":=Vendor."Current Trade Licence No";
          Purch."Trade Licence Expiry Date":=Vendor."Trade Licence Expiry Date";
          Purch."Max Value of Business":=Vendor."Max Value of Business";
          Purch."Preferred Bank Account Code":=Vendor."Preferred Bank Account Code";
          Purch."Business Type":=Vendor."Business Type";
          Purch."Nominal Capital LCY":=Vendor."Nominal Capital LCY";
          Purch."Issued Capital LCY":=Vendor."Issued Capital LCY";
          Purch.MODIFY(TRUE)
          END;*/

        //a)Owners/Directors
        BidOwner.Reset;
        BidOwner.SetRange(No, Purch."No.");
        if not BidOwner.FindSet then begin
            VendBusinessOwner.Reset;
            VendBusinessOwner.SetRange("Vendor No.", Purch."Vendor No.");
            VendBusinessOwner.SetRange(Blocked, false);
            if VendBusinessOwner.FindSet then begin
                repeat
                    BidOwner.Init;
                    BidOwner."Document Type" := Purch."Document Type";
                    BidOwner.No := Purch."No.";
                    BidOwner."Vendor No." := Purch."Vendor No.";
                    BidOwner."Entry No." := VendBusinessOwner."Entry No.";
                    BidOwner.Name := VendBusinessOwner.Name;
                    BidOwner.Address := VendBusinessOwner.Address;
                    BidOwner."Post Code" := VendBusinessOwner."Post Code";
                    BidOwner."Address 2" := VendBusinessOwner."Address 2";
                    BidOwner.City := VendBusinessOwner.City;
                    BidOwner."Phone No." := VendBusinessOwner."Phone No.";
                    BidOwner."Nationality ID" := VendBusinessOwner."Nationality ID";
                    BidOwner."Citizenship Type" := VendBusinessOwner."Citizenship Type";
                    BidOwner."ID/Passport No." := VendBusinessOwner."ID/Passport No.";
                    BidOwner."Entity Ownership %" := VendBusinessOwner."Entity Ownership %";
                    BidOwner."Share Types" := VendBusinessOwner."Share Types";
                    BidOwner."No. of Shares" := VendBusinessOwner."No. of Shares";
                    BidOwner."Nominal Value/Share" := VendBusinessOwner."Nominal Value/Share";
                    BidOwner."Total Nominal Value" := VendBusinessOwner."Total Nominal Value";
                    BidOwner."Ownership Effective Date" := VendBusinessOwner."Ownership Effective Date";
                    BidOwner.Blocked := VendBusinessOwner.Blocked;
                    BidOwner.Insert(true);
                until VendBusinessOwner.Next = 0;
            end;

        end;
        //b)Preference and Reservations

        BidPreferences.Reset;
        BidPreferences.SetRange("Document No.", Purch."No.");
        if not BidPreferences.FindSet then begin
            VendSpecialGroup.Reset;
            VendSpecialGroup.SetRange("Vendor No", Purch."Vendor No.");
            VendSpecialGroup.SetRange(Blocked, false);
            if VendSpecialGroup.FindSet then begin
                repeat
                    BidPreferences.Init;
                    BidPreferences."Document Type" := Purch."Document Type";
                    BidPreferences."Document No." := Purch."No.";
                    BidPreferences."Vendor No." := Purch."Vendor No.";
                    BidPreferences."AGPO Certificate No" := VendSpecialGroup."Certifcate No";
                    BidPreferences."Registered Special Group" := VendSpecialGroup."Registered Special Group";
                    BidPreferences."Products/Service Category" := VendSpecialGroup."Products/Service Category";
                    BidPreferences."Certificate Effective Date" := VendSpecialGroup."Effective Date";
                    BidPreferences."Certificate Expiry Date" := VendSpecialGroup."Certificate Expiry Date";
                    BidPreferences."Certifying Agency" := VendSpecialGroup."Certifying Agency";
                    BidPreferences.Insert(true);
                until VendSpecialGroup.Next = 0;
            end;
        end;

        //c)Litigation History

        BidLitigation.Reset;
        BidLitigation.SetRange("No.", Purch."No.");
        if not BidLitigation.FindSet then begin
            VendLitigation.Reset;
            VendLitigation.SetRange("Vendor No.", Purch."Vendor No.");
            if VendLitigation.FindSet then begin
                repeat
                    BidLitigation.Init;
                    BidLitigation."Document Type" := Purch."Document Type";
                    BidLitigation."No." := Purch."No.";
                    BidLitigation."Vendor No." := Purch."Vendor No.";
                    BidLitigation."Entry No." := VendLitigation."Entry No.";
                    BidLitigation."Dispute Matter" := VendLitigation."Dispute Matter";
                    BidLitigation."Other Dispute Party" := VendLitigation."Other Dispute Party";
                    BidLitigation."Dispute Amount LCY" := VendLitigation."Dispute Amount LCY";
                    BidLitigation."Category of Matter" := VendLitigation."Category of Matter";
                    BidLitigation.Year := VendLitigation.Year;
                    BidLitigation."Award Type" := VendLitigation."Award Type";
                    BidLitigation.Insert(true);
                until VendLitigation.Next = 0;
            end;
        end;

        //d)Past Experience
        /*
        BidPastExperience.RESET;
        BidPastExperience.SETRANGE("No.",Purch."No.");
         IF NOT BidPastExperience.FINDSET THEN BEGIN
           VendPastExperience.RESET;
           VendPastExperience.SETRANGE("Vendor No.",Purch."Vendor No.");
           IF VendPastExperience.FINDSET THEN BEGIN
             REPEAT
               BidPastExperience.INIT;
               BidPastExperience."Document Type":=Purch."Document Type";
               BidPastExperience."No.":=Purch."No.";
               BidPastExperience."Vendor No.":=Purch."Vendor No.";
               BidPastExperience."Entry No.":=VendPastExperience."Entry No.";
               BidPastExperience."Client Name":=VendPastExperience."Client Name";
               BidPastExperience.Address:=VendPastExperience.Address;
               BidPastExperience."Address 2":=VendPastExperience."Address 2";
               BidPastExperience."Country/Region Code":=VendPastExperience."Country/Region Code";
               BidPastExperience."E-Mail":=VendPastExperience."E-Mail";
               BidPastExperience."Primary Contact Person":=VendPastExperience."Primary Contact Person";
               BidPastExperience."Primary Contact Designation":=VendPastExperience."Primary Contact Designation";
               BidPastExperience."Primary Contact Tel":=VendPastExperience."Primary Contact Tel";
               BidPastExperience."Primary Contact Email":=VendPastExperience."Primary Contact Email";
               BidPastExperience."Assignment/Project Name":=VendPastExperience."Assignment Name";
               BidPastExperience."Project Scope Summary":=VendPastExperience."Project Scope Summary";
               BidPastExperience."Delivery Location":=VendPastExperience."Delivery Location";
               BidPastExperience."Contract Ref No":=VendPastExperience."Contract Ref No";
               BidPastExperience."Assignment Start Date":=VendPastExperience."Assignment Start Date";
               BidPastExperience."Assignment End Date":=VendPastExperience."Assignment End Date";
               BidPastExperience."Assignment Value LCY":=VendPastExperience."Assignment Value LCY";
               BidPastExperience."Assignment Status":=VendPastExperience."Assignment Status";
               BidPastExperience.INSERT(TRUE);
               UNTIL VendPastExperience.NEXT=0;
             END;
          END;
          */
        //e)Audited Balance Sheet-

        BidAuditedBal.Reset;
        BidAuditedBal.SetRange("No.", Purch."No.");
        if not BidAuditedBal.FindSet then begin
            VendAuditedBal.Reset;
            VendAuditedBal.SetRange("Vendor No.", Purch."Vendor No.");
            if VendAuditedBal.FindSet then begin
                repeat
                    BidAuditedBal.Init;
                    BidAuditedBal."Document Type" := Purch."Document Type";
                    BidAuditedBal."No." := Purch."No.";
                    BidAuditedBal."Vendor No." := Purch."Vendor No.";
                    BidAuditedBal."Audit Year Code Reference" := VendAuditedBal."Audit Year Code Reference";
                    BidAuditedBal."Current Assets (LCY)" := VendAuditedBal."Current Assets (LCY)";
                    BidAuditedBal."Fixed Assets (LCY)" := VendAuditedBal."Fixed Assets (LCY)";
                    BidAuditedBal."Total Assets (LCY)" := VendAuditedBal."Total Assets (LCY)";
                    BidAuditedBal."Current Liabilities (LCY)" := VendAuditedBal."Current Liabilities (LCY)";
                    BidAuditedBal."Long-term Liabilities (LCY)" := VendAuditedBal."Long-term Liabilities (LCY)";
                    BidAuditedBal."Total Liabilities (LCY)" := VendAuditedBal."Total Liabilities (LCY)";
                    BidAuditedBal."Owners Equity (LCY)" := VendAuditedBal."Owners Equity (LCY)";
                    BidAuditedBal."Total Liabilities & Equity(LCY" := VendAuditedBal."Total Liabilities & Equity(LCY";
                    BidAuditedBal."Debt Ratio" := VendAuditedBal."Debt Ratio";
                    BidAuditedBal."Current Ratio" := VendAuditedBal."Current Ratio";
                    BidAuditedBal."Working Capital (LCY)" := VendAuditedBal."Working Capital (LCY)";
                    BidAuditedBal."Assets-To-Equity Ratio" := VendAuditedBal."Assets-To-Equity Ratio";
                    BidAuditedBal."Debt-To-Equity Ratio" := VendAuditedBal."Debt-To-Equity Ratio";
                    BidAuditedBal.Insert(true);
                until VendAuditedBal.Next = 0;

            end;
        end;

        //f)Audited Income Statement-

        BidIncomeStat.Reset;
        BidIncomeStat.SetRange("No.", Purch."No.");
        if not BidIncomeStat.FindSet then begin
            VendIncomeStat.Reset;
            VendIncomeStat.SetRange("Vendor No.", Purch."Vendor No.");
            if VendIncomeStat.FindSet then begin
                repeat
                    BidIncomeStat.Init;
                    BidIncomeStat."Document Type" := Purch."Document Type";
                    BidIncomeStat."No." := Purch."No.";
                    BidIncomeStat."Vendor No." := Purch."Vendor No.";
                    BidIncomeStat."Audit Year Code Reference" := VendIncomeStat."Audit Year Code Reference";
                    BidIncomeStat."Total Revenue (LCY)" := VendIncomeStat."Total Revenue (LCY)";
                    BidIncomeStat."Total COGS (LCY)" := VendIncomeStat."Total COGS (LCY)";
                    BidIncomeStat."Gross Margin (LCY)" := VendIncomeStat."Gross Margin (LCY)";
                    BidIncomeStat."Total Operating Expenses (LCY)" := VendIncomeStat."Total Operating Expenses (LCY)";
                    BidIncomeStat."Operating Income/EBIT (LCY)" := VendIncomeStat."Operating Income/EBIT (LCY)";
                    BidIncomeStat."Other Non-operating Re/Exp LCY" := VendIncomeStat."Other Non-operating Re/Exp LCY";
                    BidIncomeStat."Interest Expense (LCY)" := VendIncomeStat."Interest Expense (LCY)";
                    BidIncomeStat."Income Before Taxes (LCY)" := VendIncomeStat."Income Before Taxes (LCY)";
                    BidIncomeStat."Income Tax Expense (LCY)" := VendIncomeStat."Income Tax Expense (LCY)";
                    BidIncomeStat."Net Income from Ops  (LCY)" := VendIncomeStat."Net Income from Ops  (LCY)";
                    BidIncomeStat."Below-the-line Items (LCY)" := VendIncomeStat."Below-the-line Items (LCY)";
                    BidIncomeStat."Net Income" := VendIncomeStat."Net Income";
                    BidIncomeStat.Insert(true);
                until VendIncomeStat.Next = 0;
            end;
        end;

        //g)Vendor Bank Accounts

        BidVendBankAccount.Reset;
        BidVendBankAccount.SetRange("No.", Purch."No.");
        if not BidVendBankAccount.FindSet then begin
            VendBankAccount.Reset;
            VendBankAccount.SetRange("Vendor No.", Purch."Vendor No.");
            if VendBankAccount.FindSet then begin
                repeat
                    BidVendBankAccount.Init;
                    BidVendBankAccount."Document Type" := Purch."Document Type";
                    BidVendBankAccount."No." := Purch."No.";
                    BidVendBankAccount."Vendor No." := Purch."Vendor No.";
                    BidVendBankAccount.Code := VendBankAccount.Code;
                    BidVendBankAccount.Name := VendBankAccount.Name;
                    //BidVendBankAccount."Available Credit Line Valu" := VendBankAccount."Available Credit Line Valu";
                    BidVendBankAccount."Currency Code" := VendBankAccount."Currency Code";
                    BidVendBankAccount.Address := VendBankAccount.Address;
                    BidVendBankAccount."Address 2" := VendBankAccount."Address 2";
                    BidVendBankAccount."Post Code" := VendBankAccount."Post Code";
                    BidVendBankAccount.City := VendBankAccount.City;
                    BidVendBankAccount."Country/Region Code" := VendBankAccount."Country/Region Code";
                    BidVendBankAccount."Phone No." := VendBankAccount."Phone No.";
                    BidVendBankAccount."Bank Account No." := VendBankAccount."Bank Account No.";
                    BidVendBankAccount."Bank Branch No." := VendBankAccount."Bank Branch No.";
                    BidVendBankAccount.Contact := VendBankAccount.Contact;
                    BidVendBankAccount."Telex No." := VendBankAccount."Telex No.";
                    BidVendBankAccount."Transit No." := VendBankAccount."Transit No.";
                    BidVendBankAccount.County := VendBankAccount.County;
                    BidVendBankAccount."Fax No." := VendBankAccount."Fax No.";
                    BidVendBankAccount."Telex Answer Back" := VendBankAccount."Telex Answer Back";
                    BidVendBankAccount."Language Code" := VendBankAccount."Language Code";
                    BidVendBankAccount."E-Mail" := VendBankAccount."E-Mail";
                    BidVendBankAccount."Home Page" := VendBankAccount."Home Page";
                    BidVendBankAccount.Iban := VendBankAccount.Iban;
                    BidVendBankAccount."SWIFT Code" := VendBankAccount."SWIFT Code";
                    BidVendBankAccount."Bank Clearing Code" := VendBankAccount."Bank Clearing Code";
                    BidVendBankAccount."Bank Clearing Standard" := VendBankAccount."Bank Clearing Standard";
                    BidVendBankAccount.Insert(true);

                until VendBankAccount.Next = 0;
            end;

        end;

        //h)Key staff



        VendKeyStaff.Reset;
        VendKeyStaff.SetRange("Vendor No.", Purch."Vendor No.");
        if VendKeyStaff.FindSet then begin
            repeat
                BidKeyStaff.Init;
                BidKeyStaff."Document Type" := Purch."Document Type";
                BidKeyStaff."No." := Purch."No.";
                BidKeyStaff."Vendor No." := Purch."Vendor No.";
                BidKeyStaff."Staff No." := VendKeyStaff."Staff Number";
                BidKeyStaff."Staff Name" := VendKeyStaff."Staff Name";
                BidKeyStaff."Years with Firm" := VendKeyStaff."Years With the Firm";
                BidKeyStaff."Staff Category" := VendKeyStaff."Staff Category";
                BidKeyStaff."Phone No." := VendKeyStaff."Phone No.";
                BidKeyStaff.Nationality := VendKeyStaff.Nationality;
                BidKeyStaff."E-Mail" := VendKeyStaff."E-Mail";
                BidKeyStaff.Insert(true);
            until VendKeyStaff.Next = 0;
        end;

        //i)Key Staff Qualifications-

        VendKeyStaffQual.Reset;
        VendKeyStaffQual.SetRange("Vendor No", Purch."No.");
        if VendKeyStaffQual.FindSet then begin
            repeat
                BidKeyStaffQual.Init;
                BidKeyStaffQual."Document Type" := Purch."Document Type";
                BidKeyStaffQual."No." := Purch."No.";
                BidKeyStaffQual."Vendor No." := Purch."Vendor No.";
                BidKeyStaffQual."Staff No." := VendKeyStaffQual."Staff Id";
                BidKeyStaffQual."Entry No" := VendKeyStaffQual."Entry No";
                BidKeyStaffQual."Qualification Category" := VendKeyStaffQual."Qualification Category";
                BidKeyStaffQual."Qualification Name" := VendKeyStaffQual."Qualification Name";
                BidKeyStaffQual.Institution := VendKeyStaffQual.Institution;
                BidKeyStaffQual."Start Year" := VendKeyStaffQual."Start Year";
                BidKeyStaffQual."End Year" := VendKeyStaffQual."End Year";
                BidKeyStaffQual."Outstanding Achievements" := VendKeyStaffQual."Outstanding Achievements";
                BidKeyStaffQual.Insert(true);
            until VendKeyStaffQual.Next = 0;
        end;

        //j)Key Staff Experience-



        VendStaffExperience.Reset;
        VendStaffExperience.SetRange("Vendor No", Purch."No.");
        if VendStaffExperience.FindSet then begin
            repeat
                BidStaffExperience.Init;
                BidStaffExperience."Document Type" := Purch."Document Type";
                BidStaffExperience."No." := Purch."No.";
                BidStaffExperience."Vendor No." := Purch."Vendor No.";
                BidStaffExperience."Staff No." := VendStaffExperience."Staff ID";
                BidStaffExperience."Entry No" := VendStaffExperience."Entry No";
                BidStaffExperience."Experience Category" := VendStaffExperience."Experience Category";
                BidStaffExperience."Years of Experience" := VendStaffExperience."Years of Experience";
                BidStaffExperience."Experience Summary" := VendStaffExperience."Experience Summary";
                BidStaffExperience."Sample Assignments/Projects" := VendStaffExperience."Assignment Description";
                BidStaffExperience."Experience From Year" := VendStaffExperience."Start Year";
                BidStaffExperience."Experience To Year" := VendStaffExperience."End Year";
                BidStaffExperience.Insert(true);

            until VendStaffExperience.Next = 0;
        end;

    end;


    procedure UpdateBidResponseFromITT(Purch: Record "Purchase Header")
    var
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        PurchHeader: Record "Purchase Header";
    begin
        /*PurchHeader.RESET;
        PurchHeader.SETRANGE("No.",Purch."No.");
        IF NOT PurchHeader.FINDSET THEN BEGIN
        
        
        IFS.RESET;
        IFS.SETRANGE(Code,Purch."Invitation For Supply No");
        IF IFS.FINDSET THEN BEGIN
         Purch.INIT;
         Purch."Document Type":=Purch."Document Type"::Quote;
         Purch."Invitation Notice Type":=IFS."Invitation Notice Type";
         Purch."Bid Envelope Type":=IFS."Bid Envelop Type";
         Purch."Tender Description":=IFS."Tender Summary";
         Purch."Responsibility Center":=IFS."Responsibility Center";
         Purch."Location Code":=IFS."Location Code";
         Purch."Language Code":=IFS."Language Code";
         Purch."Purchaser Code":=IFS."Purchaser Code";
         Purch."Currency Code":=IFS."Currency Code";
         //Purch.seal/Commended By Fred To enable testing
         Purch.INSERT(TRUE);
        END;
        END;
        IFSLines.RESET;
        IFSLines.SETRANGE("Standard Purchase Code",Purch."Invitation For Supply No");
        IF IFSLines.FINDSET THEN BEGIN
          REPEAT
        
          PurchLines.INIT;
          PurchLines."Document Type":=PurchLines."Document Type"::Quote;
          PurchLines."Document No.":=Purch."No.";
          PurchLines."Line No.":=IFSLines."Line No.";
          PurchLines."Buy-from Vendor No.":=Purch."Vendor No.";
          PurchLines.Type:=IFSLines.Type;
          PurchLines."No.":=IFSLines."No.";
          //PurchLines."Location Code":=IFSLines.
          //PurchLines."Posting Group":=IFSLines
          PurchLines.Description:=IFSLines.Description;
          PurchLines."Description 2":=IFSLines.Description;
          //PurchLines."Unit of Measure":=IFSLines."Unit of Measure Code";
          PurchLines.Quantity:=IFSLines.Quantity;
          PurchLines.Amount:=IFSLines."Amount Excl. VAT";
          PurchLines."Unit of Measure Code":=IFSLines."Unit of Measure Code";
          PurchLines."Shortcut Dimension 1 Code":=IFSLines."Shortcut Dimension 2 Code";
          PurchLines."Shortcut Dimension 2 Code":=IFSLines."Shortcut Dimension 2 Code";
          PurchLines."Variant Code":=IFSLines."Variant Code";
          PurchLines."Dimension Set ID":=IFSLines."Dimension Set ID";
          PurchLines."Item Category":=IFSLines."Item Category";
          PurchLines.INSERT(TRUE);
        
          UNTIL IFSLines.NEXT=0;
          END;
          */
        //END;

        Vendor.Reset;
        Vendor.SetRange("No.", Purch."Vendor No.");
        if Vendor.FindSet then begin
            //Purch.INIT;
            Purch."Building/House No" := Vendor."Building/House No";
            Purch."Plot No" := Vendor."Plot No";
            Purch.Street := Vendor.Street;
            Purch."Nature of Business" := Vendor."Nature of Business";
            Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
            Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
            Purch."Max Value of Business" := Vendor."Max Value of Business";
            Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
            Purch."Business Type" := Vendor."Business Type";
            Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
            Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
            Purch.Modify(true)
        end;

        //a)Owners/Directors
        BidOwner.Reset;
        BidOwner.SetRange(No, Purch."No.");
        if not BidOwner.FindSet then begin
            VendBusinessOwner.Reset;
            VendBusinessOwner.SetRange("Vendor No.", Purch."Vendor No.");
            VendBusinessOwner.SetRange(Blocked, false);
            if VendBusinessOwner.FindSet then begin
                repeat
                    BidOwner.Init;
                    BidOwner."Document Type" := Purch."Document Type";
                    BidOwner.No := Purch."No.";
                    BidOwner."Vendor No." := Purch."Vendor No.";
                    BidOwner."Entry No." := VendBusinessOwner."Entry No.";
                    BidOwner.Name := VendBusinessOwner.Name;
                    BidOwner.Address := VendBusinessOwner.Address;
                    BidOwner."Post Code" := VendBusinessOwner."Post Code";
                    BidOwner."Address 2" := VendBusinessOwner."Address 2";
                    BidOwner.City := VendBusinessOwner.City;
                    BidOwner."Phone No." := VendBusinessOwner."Phone No.";
                    BidOwner."Nationality ID" := VendBusinessOwner."Nationality ID";
                    BidOwner."Citizenship Type" := VendBusinessOwner."Citizenship Type";
                    BidOwner."ID/Passport No." := VendBusinessOwner."ID/Passport No.";
                    BidOwner."Entity Ownership %" := VendBusinessOwner."Entity Ownership %";
                    BidOwner."Share Types" := VendBusinessOwner."Share Types";
                    BidOwner."No. of Shares" := VendBusinessOwner."No. of Shares";
                    BidOwner."Nominal Value/Share" := VendBusinessOwner."Nominal Value/Share";
                    BidOwner."Total Nominal Value" := VendBusinessOwner."Total Nominal Value";
                    BidOwner."Ownership Effective Date" := VendBusinessOwner."Ownership Effective Date";
                    BidOwner.Blocked := VendBusinessOwner.Blocked;
                    BidOwner.Insert(true);
                until VendBusinessOwner.Next = 0;
            end;

        end;
        //b)Preference and Reservations

        BidPreferences.Reset;
        BidPreferences.SetRange("Document No.", Purch."No.");
        if not BidPreferences.FindSet then begin
            VendSpecialGroup.Reset;
            VendSpecialGroup.SetRange("Vendor No", Purch."Vendor No.");
            VendSpecialGroup.SetRange(Blocked, false);
            if VendSpecialGroup.FindSet then begin
                repeat
                    BidPreferences.Init;
                    BidPreferences."Document Type" := Purch."Document Type";
                    BidPreferences."Document No." := Purch."No.";
                    BidPreferences."Vendor No." := Purch."Vendor No.";
                    BidPreferences."AGPO Certificate No" := VendSpecialGroup."Certifcate No";
                    BidPreferences."Registered Special Group" := VendSpecialGroup."Registered Special Group";
                    BidPreferences."Products/Service Category" := VendSpecialGroup."Products/Service Category";
                    BidPreferences."Certificate Effective Date" := VendSpecialGroup."Effective Date";
                    BidPreferences."Certificate Expiry Date" := VendSpecialGroup."Certificate Expiry Date";
                    BidPreferences."Certifying Agency" := VendSpecialGroup."Certifying Agency";
                    BidPreferences.Insert(true);
                until VendSpecialGroup.Next = 0;
            end;
        end;

        //c)Litigation History

        BidLitigation.Reset;
        BidLitigation.SetRange("No.", Purch."No.");
        if not BidLitigation.FindSet then begin
            VendLitigation.Reset;
            VendLitigation.SetRange("Vendor No.", Purch."Vendor No.");
            if VendLitigation.FindSet then begin
                repeat
                    BidLitigation.Init;
                    BidLitigation."Document Type" := Purch."Document Type";
                    BidLitigation."No." := Purch."No.";
                    BidLitigation."Vendor No." := Purch."Vendor No.";
                    BidLitigation."Entry No." := VendLitigation."Entry No.";
                    BidLitigation."Dispute Matter" := VendLitigation."Dispute Matter";
                    BidLitigation."Other Dispute Party" := VendLitigation."Other Dispute Party";
                    BidLitigation."Dispute Amount LCY" := VendLitigation."Dispute Amount LCY";
                    BidLitigation."Category of Matter" := VendLitigation."Category of Matter";
                    BidLitigation.Year := VendLitigation.Year;
                    BidLitigation."Award Type" := VendLitigation."Award Type";
                    BidLitigation.Insert(true);
                until VendLitigation.Next = 0;
            end;
        end;

        //d)Past Experience

        BidPastExperience.Reset;
        BidPastExperience.SetRange("No.", Purch."No.");
        if not BidPastExperience.FindSet then begin
            VendPastExperience.Reset;
            VendPastExperience.SetRange("Vendor No.", Purch."Vendor No.");
            if VendPastExperience.FindSet then begin
                repeat
                    BidPastExperience.Init;
                    BidPastExperience."Document Type" := Purch."Document Type";
                    BidPastExperience."No." := Purch."No.";
                    BidPastExperience."Vendor No." := Purch."Vendor No.";
                    BidPastExperience."Entry No." := VendPastExperience."Entry No.";
                    BidPastExperience."Client Name" := VendPastExperience."Client Name";
                    BidPastExperience.Address := VendPastExperience.Address;
                    BidPastExperience."Address 2" := VendPastExperience."Address 2";
                    BidPastExperience."Country/Region Code" := VendPastExperience."Country/Region Code";
                    BidPastExperience."E-Mail" := VendPastExperience."E-Mail";
                    BidPastExperience."Primary Contact Person" := VendPastExperience."Primary Contact Person";
                    BidPastExperience."Primary Contact Designation" := VendPastExperience."Primary Contact Designation";
                    BidPastExperience."Primary Contact Tel" := VendPastExperience."Primary Contact Tel";
                    BidPastExperience."Primary Contact Email" := VendPastExperience."Primary Contact Email";
                    BidPastExperience."Assignment/Project Name" := VendPastExperience."Assignment Name";
                    BidPastExperience."Project Scope Summary" := VendPastExperience."Project Scope Summary";
                    BidPastExperience."Delivery Location" := VendPastExperience."Delivery Location";
                    BidPastExperience."Contract Ref No" := VendPastExperience."Contract Ref No";
                    BidPastExperience."Assignment Start Date" := VendPastExperience."Assignment Start Date";
                    BidPastExperience."Assignment End Date" := VendPastExperience."Assignment End Date";
                    BidPastExperience."Assignment Value LCY" := VendPastExperience."Assignment Value LCY";
                    BidPastExperience."Assignment Status" := VendPastExperience."Assignment Status";
                    BidPastExperience.Insert(true);
                until VendPastExperience.Next = 0;
            end;
        end;
        //e)Audited Balance Sheet-

        BidAuditedBal.Reset;
        BidAuditedBal.SetRange("No.", Purch."No.");
        if not BidAuditedBal.FindSet then begin
            VendAuditedBal.Reset;
            VendAuditedBal.SetRange("Vendor No.", Purch."Vendor No.");
            if VendAuditedBal.FindSet then begin
                repeat
                    BidAuditedBal.Init;
                    BidAuditedBal."Document Type" := Purch."Document Type";
                    BidAuditedBal."No." := Purch."No.";
                    BidAuditedBal."Vendor No." := Purch."Vendor No.";
                    BidAuditedBal."Audit Year Code Reference" := VendAuditedBal."Audit Year Code Reference";
                    BidAuditedBal."Current Assets (LCY)" := VendAuditedBal."Current Assets (LCY)";
                    BidAuditedBal."Fixed Assets (LCY)" := VendAuditedBal."Fixed Assets (LCY)";
                    BidAuditedBal."Total Assets (LCY)" := VendAuditedBal."Total Assets (LCY)";
                    BidAuditedBal."Current Liabilities (LCY)" := VendAuditedBal."Current Liabilities (LCY)";
                    BidAuditedBal."Long-term Liabilities (LCY)" := VendAuditedBal."Long-term Liabilities (LCY)";
                    BidAuditedBal."Total Liabilities (LCY)" := VendAuditedBal."Total Liabilities (LCY)";
                    BidAuditedBal."Owners Equity (LCY)" := VendAuditedBal."Owners Equity (LCY)";
                    BidAuditedBal."Total Liabilities & Equity(LCY" := VendAuditedBal."Total Liabilities & Equity(LCY";
                    BidAuditedBal."Debt Ratio" := VendAuditedBal."Debt Ratio";
                    BidAuditedBal."Current Ratio" := VendAuditedBal."Current Ratio";
                    BidAuditedBal."Working Capital (LCY)" := VendAuditedBal."Working Capital (LCY)";
                    BidAuditedBal."Assets-To-Equity Ratio" := VendAuditedBal."Assets-To-Equity Ratio";
                    BidAuditedBal."Debt-To-Equity Ratio" := VendAuditedBal."Debt-To-Equity Ratio";
                    BidAuditedBal.Insert(true);
                until VendAuditedBal.Next = 0;

            end;
        end;

        //f)Audited Income Statement-

        BidIncomeStat.Reset;
        BidIncomeStat.SetRange("No.", Purch."No.");
        if not BidIncomeStat.FindSet then begin
            VendIncomeStat.Reset;
            VendIncomeStat.SetRange("Vendor No.", Purch."Vendor No.");
            if VendIncomeStat.FindSet then begin
                repeat
                    BidIncomeStat.Init;
                    BidIncomeStat."Document Type" := Purch."Document Type";
                    BidIncomeStat."No." := Purch."No.";
                    BidIncomeStat."Vendor No." := Purch."Vendor No.";
                    BidIncomeStat."Audit Year Code Reference" := VendIncomeStat."Audit Year Code Reference";
                    BidIncomeStat."Total Revenue (LCY)" := VendIncomeStat."Total Revenue (LCY)";
                    BidIncomeStat."Total COGS (LCY)" := VendIncomeStat."Total COGS (LCY)";
                    BidIncomeStat."Gross Margin (LCY)" := VendIncomeStat."Gross Margin (LCY)";
                    BidIncomeStat."Total Operating Expenses (LCY)" := VendIncomeStat."Total Operating Expenses (LCY)";
                    BidIncomeStat."Operating Income/EBIT (LCY)" := VendIncomeStat."Operating Income/EBIT (LCY)";
                    BidIncomeStat."Other Non-operating Re/Exp LCY" := VendIncomeStat."Other Non-operating Re/Exp LCY";
                    BidIncomeStat."Interest Expense (LCY)" := VendIncomeStat."Interest Expense (LCY)";
                    BidIncomeStat."Income Before Taxes (LCY)" := VendIncomeStat."Income Before Taxes (LCY)";
                    BidIncomeStat."Income Tax Expense (LCY)" := VendIncomeStat."Income Tax Expense (LCY)";
                    BidIncomeStat."Net Income from Ops  (LCY)" := VendIncomeStat."Net Income from Ops  (LCY)";
                    BidIncomeStat."Below-the-line Items (LCY)" := VendIncomeStat."Below-the-line Items (LCY)";
                    BidIncomeStat."Net Income" := VendIncomeStat."Net Income";
                    BidIncomeStat.Insert(true);
                until VendIncomeStat.Next = 0;
            end;
        end;

        //g)Vendor Bank Accounts

        BidVendBankAccount.Reset;
        BidVendBankAccount.SetRange("No.", Purch."No.");
        if not BidVendBankAccount.FindSet then begin
            VendBankAccount.Reset;
            VendBankAccount.SetRange("Vendor No.", Purch."Vendor No.");
            if VendBankAccount.FindSet then begin
                repeat
                    BidVendBankAccount.Init;
                    BidVendBankAccount."Document Type" := Purch."Document Type";
                    BidVendBankAccount."No." := Purch."No.";
                    BidVendBankAccount."Vendor No." := Purch."Vendor No.";
                    BidVendBankAccount.Code := VendBankAccount.Code;
                    BidVendBankAccount.Name := VendBankAccount.Name;
                    BidVendBankAccount."Available Credit Line Valu" := VendBankAccount."Available Credit Line Valu";
                    BidVendBankAccount."Currency Code" := VendBankAccount."Currency Code";
                    BidVendBankAccount.Address := VendBankAccount.Address;
                    BidVendBankAccount."Address 2" := VendBankAccount."Address 2";
                    BidVendBankAccount."Post Code" := VendBankAccount."Post Code";
                    BidVendBankAccount.City := VendBankAccount.City;
                    BidVendBankAccount."Country/Region Code" := VendBankAccount."Country/Region Code";
                    BidVendBankAccount."Phone No." := VendBankAccount."Phone No.";
                    BidVendBankAccount."Bank Account No." := VendBankAccount."Bank Account No.";
                    BidVendBankAccount."Bank Branch No." := VendBankAccount."Bank Branch No.";
                    BidVendBankAccount.Contact := VendBankAccount.Contact;
                    BidVendBankAccount."Telex No." := VendBankAccount."Telex No.";
                    BidVendBankAccount."Transit No." := VendBankAccount."Transit No.";
                    BidVendBankAccount.County := VendBankAccount.County;
                    BidVendBankAccount."Fax No." := VendBankAccount."Fax No.";
                    BidVendBankAccount."Telex Answer Back" := VendBankAccount."Telex Answer Back";
                    BidVendBankAccount."Language Code" := VendBankAccount."Language Code";
                    BidVendBankAccount."E-Mail" := VendBankAccount."E-Mail";
                    BidVendBankAccount."Home Page" := VendBankAccount."Home Page";
                    BidVendBankAccount.Iban := VendBankAccount.Iban;
                    BidVendBankAccount."SWIFT Code" := VendBankAccount."SWIFT Code";
                    BidVendBankAccount."Bank Clearing Code" := VendBankAccount."Bank Clearing Code";
                    BidVendBankAccount."Bank Clearing Standard" := VendBankAccount."Bank Clearing Standard";
                    BidVendBankAccount.Insert(true);

                until VendBankAccount.Next = 0;
            end;

        end;

        //h)Key staff



        VendKeyStaff.Reset;
        VendKeyStaff.SetRange("Vendor No.", Purch."Vendor No.");
        if VendKeyStaff.FindSet then begin
            repeat
                BidKeyStaff.Init;
                BidKeyStaff."Document Type" := Purch."Document Type";
                BidKeyStaff."No." := Purch."No.";
                BidKeyStaff."Vendor No." := Purch."Vendor No.";
                BidKeyStaff."Staff No." := VendKeyStaff."Staff Number";
                BidKeyStaff."Staff Name" := VendKeyStaff."Staff Name";
                BidKeyStaff."Years with Firm" := VendKeyStaff."Years With the Firm";
                BidKeyStaff."Staff Category" := VendKeyStaff."Staff Category";
                BidKeyStaff."Phone No." := VendKeyStaff."Phone No.";
                BidKeyStaff.Nationality := VendKeyStaff.Nationality;
                BidKeyStaff."E-Mail" := VendKeyStaff."E-Mail";
                BidKeyStaff.Insert(true);
            until VendKeyStaff.Next = 0;
        end;

        //i)Key Staff Qualifications-

        VendKeyStaffQual.Reset;
        VendKeyStaffQual.SetRange("Vendor No", Purch."No.");
        if VendKeyStaffQual.FindSet then begin
            repeat
                BidKeyStaffQual.Init;
                BidKeyStaffQual."Document Type" := Purch."Document Type";
                BidKeyStaffQual."No." := Purch."No.";
                BidKeyStaffQual."Vendor No." := Purch."Vendor No.";
                BidKeyStaffQual."Staff No." := VendKeyStaffQual."Staff Id";
                BidKeyStaffQual."Entry No" := VendKeyStaffQual."Entry No";
                BidKeyStaffQual."Qualification Category" := VendKeyStaffQual."Qualification Category";
                BidKeyStaffQual."Qualification Name" := VendKeyStaffQual."Qualification Name";
                BidKeyStaffQual.Institution := VendKeyStaffQual.Institution;
                BidKeyStaffQual."Start Year" := VendKeyStaffQual."Start Year";
                BidKeyStaffQual."End Year" := VendKeyStaffQual."End Year";
                BidKeyStaffQual."Outstanding Achievements" := VendKeyStaffQual."Outstanding Achievements";
                BidKeyStaffQual.Insert(true);
            until VendKeyStaffQual.Next = 0;
        end;

        //j)Key Staff Experience-



        VendStaffExperience.Reset;
        VendStaffExperience.SetRange("Vendor No", Purch."No.");
        if VendStaffExperience.FindSet then begin
            repeat
                BidStaffExperience.Init;
                BidStaffExperience."Document Type" := Purch."Document Type";
                BidStaffExperience."No." := Purch."No.";
                BidStaffExperience."Vendor No." := Purch."Vendor No.";
                BidStaffExperience."Staff No." := VendStaffExperience."Staff ID";
                BidStaffExperience."Entry No" := VendStaffExperience."Entry No";
                BidStaffExperience."Experience Category" := VendStaffExperience."Experience Category";
                BidStaffExperience."Years of Experience" := VendStaffExperience."Years of Experience";
                BidStaffExperience."Experience Summary" := VendStaffExperience."Experience Summary";
                BidStaffExperience."Sample Assignments/Projects" := VendStaffExperience."Assignment Description";
                BidStaffExperience."Experience From Year" := VendStaffExperience."Start Year";
                BidStaffExperience."Experience To Year" := VendStaffExperience."End Year";
                BidStaffExperience.Insert(true);

            until VendStaffExperience.Next = 0;
        end;

    end;


    procedure SuggestBidEvaluationCriteria(EvaluationHeader: Record "Bid Evaluation Register")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
    begin

        EvaluationHeader.TestField("Bid Scoring Document No.");



        Bidevaluationscore.Reset;
        if Bidevaluationscore.FindLast then
            LineNo := Bidevaluationscore."Line No";

        Bidevaluationscore.Reset;
        Bidevaluationscore.SetRange("Bid Scoring Document No.", EvaluationHeader."Bid Scoring Document No.");
        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
        if Bidevaluationscore.FindSet then begin
            Bidevaluationscore.DeleteAll;

        end;

        BidEvaluationCriteria.Reset;
        BidEvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvaluationCriteria.SetRange("Document No", EvaluationHeader.Code);
        if BidEvaluationCriteria.FindSet then begin
            BidEvaluationCriteria.DeleteAll;
        end;

        BidEvalScore.Reset;
        BidEvalScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvalScore.SetRange("Document No", EvaluationHeader.Code);
        if BidEvalScore.FindSet then begin
            BidEvalScore.DeleteAll;
        end;


        BidSCoreGuide.Reset;
        BidSCoreGuide.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidSCoreGuide.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if BidSCoreGuide.FindSet then begin
            repeat
                Bidevaluationscore.Init;
                Bidevaluationscore.Code := EvaluationHeader.Code;
                Bidevaluationscore."Line No" := LineNo + 1;
                ;
                Bidevaluationscore."Bid No." := EvaluationHeader."Bid No.";
                Bidevaluationscore."Vendor No." := EvaluationHeader."Vendor No.";
                Bidevaluationscore."Criteria Group" := BidSCoreGuide."Criteria Group ID";
                Bidevaluationscore."Requirement ID" := BidSCoreGuide."Requirement ID";
                Bidevaluationscore."Evaluation Requirement" := BidSCoreGuide."Evaluation Requirement";
                Bidevaluationscore."Rating Type" := BidSCoreGuide."Rating Type";
                Bidevaluationscore."Target Qty" := BidSCoreGuide."Target Qty";
                Bidevaluationscore."Target Value/KPI" := BidSCoreGuide."Target Value";
                Bidevaluationscore."Unit of Measure" := BidSCoreGuide."Unit of Measure";
                //Bidevaluationscore."Response Value":=Bid
                //Bidevaluationscore."Bid Response Actual Qty":=BidSCoreGuide.
                //Bidevaluationscore."Score %":=
                Bidevaluationscore."Assigned Weight %" := BidSCoreGuide."Assigned Weight %";
                //Bidevaluationscore."Weighted Line Score":=BidSCoreGuide.
                Bidevaluationscore."Equipment Type" := BidSCoreGuide."Equipment Type";
                Bidevaluationscore."Desired Perfomance Direction" := BidSCoreGuide."Desired Perfomance Direction";
                Bidevaluationscore."Bid Scoring Document No." := EvaluationHeader."Bid Scoring Document No.";
                Bidevaluationscore.Insert(true);
                LineNo += 1;
            until BidSCoreGuide.Next = 0;
        end;

        //add bid evaluation criteria
        EvaluationCriteria.Reset;
        EvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        EvaluationCriteria.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if EvaluationCriteria.FindSet then begin
            repeat
                BidEvaluationCriteria.Init;
                BidEvaluationCriteria."Template ID" := EvaluationCriteria."Template ID";
                BidEvaluationCriteria."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                BidEvaluationCriteria."Document No" := EvaluationHeader.Code;
                BidEvaluationCriteria."Evaluation Type" := EvaluationCriteria."Evaluation Type";
                BidEvaluationCriteria.Description := EvaluationCriteria.Description;
                BidEvaluationCriteria."Total Weight %" := EvaluationCriteria."Total Weight %";
                BidEvaluationCriteria.Insert(true);
            until EvaluationCriteria.Next = 0;
        end;

        //add Bid Evaluation Score Guide
        BidScore.Reset;
        BidScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidScore.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if BidScore.FindSet then begin
            repeat
                BidEvalScore.Init;
                BidEvalScore."Template ID" := BidScore."Template ID";
                BidEvalScore."Criteria Group ID" := BidScore."Criteria Group ID";
                BidEvalScore."Requirement ID" := BidScore."Requirement ID";
                BidEvalScore."Entry No" := BidScore."Entry No";
                BidEvalScore."Response Value" := BidScore."Response Value";
                BidEvalScore."Document No" := EvaluationHeader.Code;
                BidEvalScore."Target Qty" := BidScore."Target Qty";
                BidEvalScore."Rating Type" := BidScore."Rating Type";
                BidEvalScore."Evaluation Type" := BidScore."Evaluation Type";
                BidEvalScore."Desired Perfomance Direction" := BidScore."Desired Perfomance Direction";
                BidEvalScore."Min Bid Value" := BidScore."Min Bid Value";
                BidEvalScore."Max Bid Value" := BidScore."Max Bid Value";
                BidEvalScore."Min Date Value" := BidScore."Min Date Value";
                BidEvalScore."Max Date Value" := BidScore."Max Date Value";
                BidEvalScore."Score %" := BidScore."Score %";
                BidEvalScore.Insert(true);
            until BidScore.Next = 0;
        end;
    end;


    procedure PostBidOpeningRegister(BidOpeningRegister: Record "Bid Opening Register")
    var
        IFSDetails: Record "Standard Vendor Purchase Code";
        BidOpeningLines: Record "Bid Opening Register Line";
        IFS: Record "Standard Purchase Code";
    begin

        BidOpeningLines.Reset;
        BidOpeningLines.SetRange(Code, BidOpeningRegister.Code);
        if BidOpeningLines.FindSet then begin
            repeat
                IFSDetails.Reset;
                IFSDetails.SetRange(Code, BidOpeningLines."IFS Code");
                IFSDetails.SetRange("Vendor No.", BidOpeningLines."Vendor No.");
                if IFSDetails.FindSet then begin
                    IFSDetails."Bid Opening Register No." := BidOpeningRegister.Code;
                    IFSDetails."Bid Opening Date (Technical)" := BidOpeningRegister."Bid Opening Date";
                    IFSDetails.Modify(true);
                end;
            //  FnNotifyBidOpeningAttendees(BidOpeningLines);
            until BidOpeningLines.Next = 0;

        end;
        BidOpeningRegister.Posted := true;
        BidOpeningRegister."Posted By" := UserId;
        BidOpeningRegister."Posted Date" := Today;
        IFS.Reset;
        IFS.SetRange(Code, BidOpeningRegister."IFS Code");
        if IFS.FindSet then begin
            IFS."Bid Opening Register" := BidOpeningRegister.Code;
            IFS.Modify(true);

        end;
        Message('Bid No: %1 Has been Posted Successfully', BidOpeningRegister.Code);
    end;


    procedure FnNotifyBidOpeningAttendees(BidOpening: Record "Bid Opening Register Line")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        IFSPrebidAttendees: Record "Bid Opening Bidder Attendance";
        BidopeningRegister: Record "Bid Opening Register";
    begin
        ///Notifying Procurement Team on supplier Request
        vend.Reset;
        vend.SetRange("No.", BidOpening."Vendor No.");
        if vend.FindSet then begin
            BidopeningRegister.Reset;
            BidopeningRegister.SetRange(Code, BidOpening.Code);

            CompInfo.Get;
            HRSetup.Get;
            PPayableSetup.Get;

            vend.TestField("E-Mail");
            RequesterEmail := vend."E-Mail";
            RequesterName := vend.Name;

            Window.Open('Notifying the Sender...');

            WindowisOpen := true;


            Counter := Counter + 1;

            //Create message
            if HRSetup."E-Mail" = '' then
                Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
            SenderAddress := HRSetup."E-Mail";

            if PPayableSetup."Default Proc Email Contact" = '' then
                Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
            CustEmail := PPayableSetup."Default Proc Email Contact";

            CompanyDetails := 'Dear,  ' + RequesterName + '<BR>' + vend."No.";
            SenderMessage := '<BR>Thank You for participating in the Bid Opening meeting (Meeting Reference No:' + BidOpening.Code + ') held on ' + Format(BidopeningRegister."Bid Opening Date") +
            'as summarized below: </BR>';
            SupplierDetails := '<BR>Tender invitation Notice No:' + BidopeningRegister."IFS Code" + '</BR>' + '<BR> Tender Name:' + BidopeningRegister."Tender Name" + '</BR>' +
            '<BR>Bid Opening Meeting Time and Venue:' + Format(BidopeningRegister."Bid Opening Start Time") + ' To ' + Format(BidopeningRegister."Bid Opening End Time") + ' ,' + BidopeningRegister."Bid Opening Venue" + '</BR>';
            LoginDetails := 'Attached herein, please find summarized minutes of the Bid Opening meeting';


            ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";

            FileDirectory := 'C:\DOCS\';
            FileName := 'BidOpening_' + BidopeningRegister.Code + '.pdf';
            //    //Report.SaveAsPdf(70040, FileDirectory + FileName, BidopeningRegister);


            if CustEmail = '' then
                exit;

            //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
            emailhdr := 'Bid Opening Register (Reference No: ' + BidopeningRegister.Code + ')';

            // cu400.Create(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
            // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
            // cu400.AddAttachment(FileDirectory + FileName, FileName);
            // IFSPrebidAttendees.Reset;
            // IFSPrebidAttendees.SetRange("Vendor No.", vend."No.");
            // IFSPrebidAttendees.SetRange(Code, BidOpening.Code);
            // if IFSPrebidAttendees.FindSet then begin
            //     repeat
            //         cu400.AddCC(IFSPrebidAttendees."Representative Email");
            //         IFSPrebidAttendees."Notified By Email" := true;
            //         IFSPrebidAttendees."Date/Time Notified" := Today;
            //         IFSPrebidAttendees.Modify(true);
            //     until IFSPrebidAttendees.Next = 0;
            // end;
            // cu400.AddCC(CustEmail);

            // cu400.AppendToBody(ProcNote);


            // cu400.Send;
            SendingDate := Today;
            SendingTime := Time;
            BidOpening.Notified := true;
            BidOpening."Date/Time Notified" := Today;
            BidOpening.Modify(true);



            Sleep(1000);
            Window.Close;

            //UNTIL vend.NEXT=0;
        end;
    end;


    procedure UnsealBid(BidOpeningRegister: Record "Bid Opening Register")
    var
        IFSDetails: Record "Standard Vendor Purchase Code";
        BidOpeningLines: Record "Bid Opening Register Line";
        Bids: Record "Purchase Header";
        BIdTenders: record "Bid Opening Tender Committee";
        BidsSecurity: Record "Bid_Contract Security Register";
        SPurchCode: Record "Standard Purchase Code";
    begin
        // BidOpeningRegister.TestField("Opening Person 1");
        // BidOpeningRegister.TestField("Opening Person 2");
        // BidOpeningRegister.TestField("Opening Person 3");


        //BidOpeningRegister.TESTFIELD("Opening Person 4");
        BIdTenders.Reset();
        BIdTenders.SetRange("Document No.", BidOpeningRegister.Code);
        if bidtenders.FindSet() then begin
            repeat
                if (bidtenders."Role Type" <> bidtenders."Role Type"::Secretary) then begin
                    if bidtenders.Passcode <> BIdTenders."member code" then
                        error('Invalid Member code for staff No %1', bidtenders."Staff  No.");
                end;

            until bidtenders.next = 0;
        end;
        Bids.Reset;
        Bids.SetRange("Invitation For Supply No", BidOpeningRegister."IFS Code");
        Bids.SetRange("Document Type", Bids."document type"::Quote);
        //Bids.SETRANGE("Responsive Bid (Evaluation)",TRUE);
        nobids := Bids.Count;
        //IF Bids."document type" in [Bids."document type"::] then
        IF nobids < 3 THEN BEGIN
            SPurchCode.Reset();
            SPurchCode.SetRange(Code, BidOpeningRegister."IFS Code");
            if SPurchCode.FindFirst() then begin
                if SPurchCode."Procurement Method" = SPurchCode."Procurement Method"::RFQ then
                    ERROR('The number of Bids submitted must be Three or more Kindly Close and Refloat');
            end;
        END;
        if Bids.FindSet then begin
            repeat


                BidOpeningLines.Reset;
                BidOpeningLines.SetRange("Bid No.", Bids."No.");
                BidOpeningLines.SetRange("IFS Code", BidOpeningRegister."IFS Code");
                BidOpeningLines.SetRange(Code, BidOpeningRegister.Code);
                if not BidOpeningLines.FindSet then begin
                    BidOpeningLines.Init;
                    BidOpeningLines.Code := BidOpeningRegister.Code;
                    BidOpeningLines."Vendor No." := Bids."Buy-from Vendor No.";
                    BidOpeningLines."IFS Code" := BidOpeningRegister."IFS Code";
                    BidOpeningLines."Bidder Name" := Bids."Buy-from Vendor Name";
                    BidOpeningLines."Bid No." := Bids."No.";
                    BidOpeningLines."External Bid Reference No" := BidOpeningRegister."IFS Code";
                    BidsSecurity.Reset;
                    BidsSecurity.SetRange("No.", Bids."No.");
                    if BidsSecurity.FindSet then begin
                        if BidsSecurity."Security Amount (LCY)" > 0 then
                            BidOpeningLines."Valid Bid Security Provided" := true;
                        BidOpeningLines."Bid Security Issuer" := BidsSecurity."Issuer/Guarantor Name";
                        BidOpeningLines."Bid Security Amount (LCY)" := BidsSecurity."Security Amount (LCY)";
                        //MESSAGE('%1 %2',BidsSecurity."Security Amount (LCY)",BidsSecurity."Issuer/Guarantor Name");
                        if BidOpeningLines."Bid Security Amount (LCY)" >= BidsSecurity."Security Amount (LCY)" then
                            BidOpeningLines."Bid Security Amount Pass" := true
                        else
                            BidOpeningLines."Bid Security Amount Pass" := false;
                    end;
                    Bids.CalcFields(Bids."Amount Including VAT");
                    if Bids."Amount Including VAT" = 0 then begin
                        Error('Error! Bid amount should be greater than Zero');
                    end;
                    BidOpeningLines."Total Tender Price (LCY)" := Bids."Amount Including VAT";
                    //BidOpeningLines."Complete Bid Doc Submitted":=
                    //BidOpeningLines."Late Bid":=
                    // BidOpeningLines."Late Bid Submission Time":=
                    BidOpeningLines."Bid Withdrawal Notice No." := Bids."Withdrawal Notice No";
                    //BidOpeningLines."Bid Modification Notice No.":=Bids.bid
                    BidOpeningLines."Bid Withdrawal Notice No." := Bids."Withdrawal Notice No";
                    //BidOpeningLines."Bid Submission No" := Bids."Bid No";
                    if BidOpeningLines."Bid Modification Notice No." <> '' then
                        BidOpeningLines."Bid Modification Exists" := true
                    else
                        BidOpeningLines."Bid Modification Exists" := false;
                    if BidOpeningLines."Bid Withdrawal Notice No." <> '' then
                        BidOpeningLines."Bid Withdrawal Exists" := true
                    else
                        BidOpeningLines."Bid Withdrawal Exists" := false;
                    BidOpeningLines.Insert(true);

                end;

            until Bids.Next = 0;
        end;

    end;

    procedure PostPreliminaryEvaluation(EvaluationHeader: Record "Bid Evaluation Register"; loggedInUser: Code[20])
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        EvaluationRegister: Record "Bid Evaluation Register";
        BIDREgister: record "Bid Opening Register Line";
        BidCounts: integer;
        RegisterCounts: integer;
        Standardspp: record "Standard Purchase Code";

    begin

        EvaluationHeader.TestField("IFS Code");
        EvaluationHeader.TestField("Bid No.");
        EvaluationHeader.TestField("Evaluation Date");
        EvaluationHeader.TestField("Evaluation Lead");
        EvaluationHeader.TestField("Preliminary Evaluation Score");


        // EvaluationHeader.Posted := true;
        // EvaluationHeader."Posted By" := UserId;
        // EvaluationHeader."Posted Date" := Today;

        Bids.Reset;
        Bids.SetRange("No.", EvaluationHeader."Bid No.");
        Bids.SetRange("IFS Code", EvaluationHeader."IFS Code");
        if Bids.FindSet then begin
            if EvaluationHeader."Preliminary Evaluation Score" = EvaluationHeader."preliminary evaluation score"::Responsive then
                Bids."Responsive Bid (Evaluation)" := true;
            Bids."Preliminary Evaluation Date" := EvaluationHeader."Evaluation Date";
            Bids."Preliminary Evaluation Voucher" := EvaluationHeader.Code;
            Bids."Preliminary Evaluation Verdict" := EvaluationHeader."Preliminary Evaluation Score";
            Bids."Remarks(Preliminary)" := EvaluationHeader."Tender Evaluation Comm Remarks";
            Bids.Modify(true);
        end;

        IFSDetails.Reset;
        IFSDetails.SetRange(Code, EvaluationHeader."IFS Code");
        IFSDetails.SetRange("Vendor No.", EvaluationHeader."Vendor No.");
        if IFSDetails.FindSet then begin
            IFSDetails."Preliminary Evaluation Reg" := EvaluationHeader.Code;
            IFSDetails."Preliminary Evaluation Date" := EvaluationHeader."Created Date";
            IFSDetails."Preliminary Evaluation Outcome" := Format(EvaluationHeader."Preliminary Evaluation Score");
            IFSDetails."Preminary Evaluation Committee" := EvaluationHeader."Tender Evaluation Comm Remarks";
            IFSDetails.Modify(true);
        end else begin

            IFSDetails.Init;
            IFSDetails."Vendor No." := EvaluationHeader."Vendor No.";
            IFSDetails.Code := EvaluationHeader."IFS Code";
            IFS.Reset;
            IFS.SetRange(Code, EvaluationHeader."IFS Code");
            if IFS.FindSet then begin
                IFSDetails.Description := IFS."Tender Name";
                IFSDetails."IFS Code" := IFS.Code;
            end;

            IFSDetails."Bid No." := EvaluationHeader."Bid No.";
            IFSDetails."Vendor Name" := EvaluationHeader."Bidder Name";
            IFSDetails."Preliminary Evaluation Reg" := EvaluationHeader.Code;
            IFSDetails."Preliminary Evaluation Date" := EvaluationHeader."Created Date";
            IFSDetails."Preliminary Evaluation Outcome" := Format(EvaluationHeader."Preliminary Evaluation Score");
            IFSDetails."Preminary Evaluation Committee" := EvaluationHeader."Tender Evaluation Comm Remarks";
            IFSDetails.Insert(true);
        end;
        // ProcuremnetSetup.GET;
        //   IF ProcuremnetSetup."Notify Committe Members"=TRUE THEN
        //FnSendBidEvaluationNotification(EvaluationHeader);


        EvaluationRegister.reset;
        EvaluationRegister.setrange("IFS Code", EvaluationHeader."IFS Code");
        if EvaluationRegister.find('-') then begin
            // EvaluationRegister.count();
            RegisterCounts := EvaluationRegister.count();
        end;
        BIDREgister.Reset();
        BIDREgister.SetRange("IFS Code", EvaluationHeader."IFS Code");
        if BIDREgister.find('-') then
            // BIDREgister.count();
            BidCounts := BIDREgister.count();
        IFS.Reset;
        IFS.SetRange(Code, EvaluationHeader."IFS Code");
        if IFS.FindSet then begin
            IFS."Document Status" := IFS."document status"::Evaluation;
            // if RegisterCounts = BidCounts then
            ifs."Preliminary Evaluated" := true;
            IFS.Modify(true);
        end;
        EvaluationHeader.Posted := true;
        EvaluationHeader."Posted By" := loggedInUser;
        EvaluationHeader."Posted Date" := Today;
        EvaluationHeader.Modify();


        Message('Submitted Successfully');
    end;

    procedure PostPreliminaryEvaluation33(EvaluationHeader: Record "Bid Evaluation Register")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
    begin

        EvaluationHeader.TestField("IFS Code");
        EvaluationHeader.TestField("Bid No.");
        EvaluationHeader.TestField("Evaluation Date");
        EvaluationHeader.TestField("Evaluation Lead");
        EvaluationHeader.TestField("Preliminary Evaluation Score");


        EvaluationHeader.Posted := true;
        EvaluationHeader."Posted By" := UserId;
        EvaluationHeader."Posted Date" := Today;

        Bids.Reset;
        Bids.SetRange("No.", EvaluationHeader."Bid No.");
        Bids.SetRange("IFS Code", EvaluationHeader."IFS Code");
        if Bids.FindSet then begin
            if EvaluationHeader."Preliminary Evaluation Score" = EvaluationHeader."preliminary evaluation score"::Responsive then
                Bids."Responsive Bid (Evaluation)" := true;
            Bids."Preliminary Evaluation Date" := EvaluationHeader."Evaluation Date";
            Bids.Modify;
        end;

        IFSDetails.Reset;
        IFSDetails.SetRange(Code, EvaluationHeader."IFS Code");
        IFSDetails.SetRange("Vendor No.", EvaluationHeader."Vendor No.");
        if IFSDetails.FindSet then begin
            IFSDetails."Preliminary Evaluation Reg" := EvaluationHeader.Code;
            IFSDetails."Preliminary Evaluation Date" := EvaluationHeader."Created Date";
            IFSDetails."Preliminary Evaluation Outcome" := Format(EvaluationHeader."Preliminary Evaluation Score");
            IFSDetails."Preminary Evaluation Committee" := EvaluationHeader."Tender Evaluation Comm Remarks";
            IFSDetails.Modify(true);
        end else begin

            IFSDetails.Init;
            IFSDetails."Vendor No." := EvaluationHeader."Vendor No.";
            IFSDetails.Code := EvaluationHeader."IFS Code";
            IFS.Reset;
            IFS.SetRange(Code, EvaluationHeader."IFS Code");
            if IFS.FindSet then begin
                IFSDetails.Description := IFS."Tender Name";
                IFSDetails."IFS Code" := IFS.Code;
            end;

            IFSDetails."Bid No." := EvaluationHeader."Bid No.";
            IFSDetails."Vendor Name" := EvaluationHeader."Bidder Name";
            IFSDetails."Preliminary Evaluation Reg" := EvaluationHeader.Code;
            IFSDetails."Preliminary Evaluation Date" := EvaluationHeader."Created Date";
            IFSDetails."Preliminary Evaluation Outcome" := Format(EvaluationHeader."Preliminary Evaluation Score");
            IFSDetails."Preminary Evaluation Committee" := EvaluationHeader."Tender Evaluation Comm Remarks";
            IFSDetails.Insert(true);
        end;
        ProcuremnetSetup.Get;
        if ProcuremnetSetup."Notify Committe Members" = true then
            FnSendBidEvaluationNotification(EvaluationHeader);

        IFS.Reset;
        IFS.SetRange(Code, EvaluationHeader."IFS Code");
        if IFS.FindSet then begin
            IFS."Document Status" := IFS."document status"::Evaluation;
            IFS.Modify;
        end;
    end;


    procedure FnSendBidEvaluationNotification(evaluationHeaader: Record "Bid Evaluation Register")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        IFSCommitteMembers: Record "Bid Evaluation Committee";
        IFSTenderCommitte: Record "IFS Tender Committee";
        EvaluationRegister: Record "Bid Evaluation Register";
    begin
        ///Notifying Procurement Team on supplier Request


        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;


        IFSCommitteMembers.Reset;
        IFSCommitteMembers.SetRange("Document No.", evaluationHeaader.Code);
        if IFSCommitteMembers.FindSet then begin
            repeat
                IFSCommitteMembers.TestField(Email);
                RequesterEmail := IFSCommitteMembers.Email;
                RequesterName := IFSCommitteMembers."Member Name";
                Window.Open('Notifying the Sender...');
                WindowisOpen := true;

                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.", evaluationHeaader."Appointed Bid Evaluation Commi");
                if IFSTenderCommitte.FindSet then
                    Counter := Counter + 1;

                //Create message
                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'Dear,  ' + RequesterName;
                SenderMessage := '<BR>Please find attached summary of the Evaluation No:' + evaluationHeaader.Code + '</BR>';
                SupplierDetails := '<BR>Appointment Reference No:' + IFSCommitteMembers."Appointed Bid Opening Com" + '</BR>' + '<BR> Committee Type:' + IFSTenderCommitte."Committee Type" + '</BR>' +
                '<BR>Membership Role:' + Format(IFSCommitteMembers."Role Type") + '</BR>' +
                '<BR>Appointment Effective Date:' + Format(IFSTenderCommitte."Appointment Effective Date") + '</BR>' +
                '<BR>Invitation For Supply No:' + IFSCommitteMembers."IFS Code" + '</BR>' +
                '<BR>Tender Name:' + IFSTenderCommitte."Tender Name" + '</BR>' +
                '<BR>Appointing Authority:' + IFSTenderCommitte."Appointing Authority" + '</BR>';
                LoginDetails := 'Attached herein, please find an e-copy of Tender Evaluation Summary';


                ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";

                EvaluationRegister.Reset;
                EvaluationRegister.SetRange(Code, evaluationHeaader.Code);
                if EvaluationRegister.FindSet then
                    FileDirectory := 'C:\DOCS\';
                FileName := 'BidEvaluation_' + evaluationHeaader.Code + '.pdf';
                // //Report.SaveAsPdf(70041, FileDirectory + FileName, EvaluationRegister);
                // if EvaluationRegister."Evaluation Type" = evaluationHeaader."evaluation type"::"Financial Evaluation" then
                //     //Report.SaveAsPdf(70042, FileDirectory + FileName, EvaluationRegister);

                if CustEmail = '' then
                    exit;

                //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                emailhdr := 'Tender/Procurement Evaluation Summary (Reference No: ' + evaluationHeaader.Code + ')';

                // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
                // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

                // cu400.AddCC(RequesterEmail);

                // cu400.AppendToBody(ProcNote);

                // cu400.AddAttachment(FileDirectory + FileName, FileName);
                // cu400.Send;
                SendingDate := Today;
                SendingTime := Time;

                IFSCommitteMembers."Notified on Email" := true;
                IFSCommitteMembers."Date/Time Notified" := CurrentDatetime;
                IFSCommitteMembers.Modify(true);


                Sleep(1000);
                Window.Close;

            until IFSCommitteMembers.Next = 0;
        end;
    end;


    procedure SuggestFinanceBids(EvaluationHeader: Record "Bid Evaluation Register")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidRegister: Record "Bid Evaluation Register";
        FinEvaluationLine: Record "Finance Evaluation Line";
        Bids: Record "Purchase Header";
        RankingNo: Integer;
        FinanceEvaluationLine1: Record "Finance Evaluation Line";
        IFSRestricted: Record "IFS Restricted Vendor Category";
        PurchaseLine1: Record "Purchase Line";
        PurchaseHeader1: Record "Purchase Header";
    begin


        EvaluationHeader.TestField("Bid Scoring Document No.");

        FinEvaluationLine.Reset;
        FinEvaluationLine.SetRange("Document ID", EvaluationHeader.Code);
        if FinEvaluationLine.FindSet then begin
            FinEvaluationLine.DeleteAll;
        end;

        //add finance evaluation line
        BidRegister.Reset;
        BidRegister.SetRange("IFS Code", EvaluationHeader."IFS Code");
        BidRegister.SetRange("Evaluator Category", BidRegister."evaluator category"::"Evaluation Committee");
        BidRegister.SetRange("Evaluation Type", BidRegister."evaluation type"::"Technical Evaluation");
        BidRegister.SetRange("Technical Evaluation  Decision", BidRegister."technical evaluation  decision"::Pass);
        if BidRegister.FindSet then begin
            // LineNo := BidRegister.Count + 1;
            // if LineNo = 0 then
            //     LineNo := 1;
            repeat
                FinEvaluationLine.Reset();
                if FinEvaluationLine.findset then
                    LineNo := FinEvaluationLine.Count + 1;
                if LineNo = 0 then
                    LineNo := 1;
                FinEvaluationLine.Init;
                FinEvaluationLine."Line No." := LineNo;
                FinEvaluationLine."Document ID" := EvaluationHeader.Code;
                FinEvaluationLine."Document Type" := FinEvaluationLine."document type"::Quote;
                FinEvaluationLine."No." := BidRegister."Bid No.";
                FinEvaluationLine."Bidder Name" := BidRegister."Bidder Name";
                FinEvaluationLine."Bidder No" := BidRegister."Vendor No.";
                FinEvaluationLine."Invitation For Supply No" := BidRegister."IFS Code";
                Bids.Reset;
                Bids.SetRange("No.", BidRegister."Bid No.");
                if Bids.FindSet then begin
                    FinEvaluationLine."Bid Currency Code" := Bids."Currency Code";
                    FinEvaluationLine."Read-out Bid Price (A)" := Bids."Amount Including VAT";
                end;
                //FinEvaluationLine."Bid Currency Code":=BidRegister
                //BidRegister.CALCFIELDS(BidRegister."Weighted Technical Eval Score");
                FinEvaluationLine."Preliminary Evaluation Date" := BidRegister."Evaluation Date";
                FinEvaluationLine."Responsive Bid" := true;
                FinEvaluationLine."Technical Evaluation Date" := BidRegister."Evaluation Date";
                FinEvaluationLine."Weighted Tech Score %" := BidRegister."Weighted Technical Eval Score";
                Bids.CalcFields(Bids."Amount Including VAT");
                FinEvaluationLine."Final Evaluated Bid Price" := Bids."Amount Including VAT";
                FinEvaluationLine."Read-out Bid Price (A)" := Bids."Amount Including VAT";
                FinEvaluationLine."Evaluation Committee Recomm" := FinEvaluationLine."evaluation committee recomm"::"...";
                FinEvaluationLine."Passed Tech Evaluation" := true;
                FinEvaluationLine."Tech Evaluation Ranking" := BidRegister."Tech Evaluation Ranking";
                FinEvaluationLine."Financial Evaluation Date" := Today;
                FinEvaluationLine.Insert(true);
            until BidRegister.Next = 0;
        end;



        Bidevaluationscore.Reset;
        if Bidevaluationscore.FindLast then
            LineNo := Bidevaluationscore."Line No";

        Bidevaluationscore.Reset;
        Bidevaluationscore.SetRange("Bid Scoring Document No.", EvaluationHeader."Bid Scoring Document No.");
        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
        if Bidevaluationscore.FindSet then begin
            Bidevaluationscore.DeleteAll;

        end;

        BidEvaluationCriteria.Reset;
        BidEvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvaluationCriteria.SetRange("Document No", EvaluationHeader.Code);
        if BidEvaluationCriteria.FindSet then begin
            BidEvaluationCriteria.DeleteAll;
        end;

        BidEvalScore.Reset;
        BidEvalScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvalScore.SetRange("Document No", EvaluationHeader.Code);
        if BidEvalScore.FindSet then begin
            BidEvalScore.DeleteAll;
        end;


        BidSCoreGuide.Reset;
        BidSCoreGuide.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidSCoreGuide.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if BidSCoreGuide.FindSet then begin
            LineNo := BidSCoreGuide.Count + 1;
            if LineNo = 0 then
                LineNo := 1;
            repeat
                Bidevaluationscore.Init;
                Bidevaluationscore.Code := EvaluationHeader.Code;
                Bidevaluationscore."Line No" := LineNo;
                Bidevaluationscore."Bid No." := EvaluationHeader."Bid No.";
                Bidevaluationscore."Vendor No." := EvaluationHeader."Vendor No.";
                Bidevaluationscore."Criteria Group" := BidSCoreGuide."Criteria Group ID";
                Bidevaluationscore."Requirement ID" := BidSCoreGuide."Requirement ID";
                Bidevaluationscore."Evaluation Requirement" := BidSCoreGuide."Evaluation Requirement";
                Bidevaluationscore."Rating Type" := BidSCoreGuide."Rating Type";
                Bidevaluationscore."Target Qty" := BidSCoreGuide."Target Qty";
                Bidevaluationscore."Target Value/KPI" := BidSCoreGuide."Target Value";
                Bidevaluationscore."Unit of Measure" := BidSCoreGuide."Unit of Measure";
                //Bidevaluationscore."Response Value":=Bid
                //Bidevaluationscore."Bid Response Actual Qty":=BidSCoreGuide.
                //Bidevaluationscore."Score %":=
                Bidevaluationscore."Assigned Weight %" := BidSCoreGuide."Assigned Weight %";
                //Bidevaluationscore."Weighted Line Score":=BidSCoreGuide.
                Bidevaluationscore."Equipment Type" := BidSCoreGuide."Equipment Type";
                Bidevaluationscore."Desired Perfomance Direction" := BidSCoreGuide."Desired Perfomance Direction";
                Bidevaluationscore."Bid Scoring Document No." := EvaluationHeader."Bid Scoring Document No.";
                Bidevaluationscore.Insert(true);
                LineNo += 1;
            until BidSCoreGuide.Next = 0;
        end;

        //add bid evaluation criteria
        EvaluationCriteria.Reset;
        EvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        EvaluationCriteria.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if EvaluationCriteria.FindSet then begin
            LineNo := EvaluationCriteria.Count + 1;
            if LineNo = 0 then
                LineNo := 1;
            repeat
                BidEvaluationCriteria.Init;
                BidEvaluationCriteria."Line No" := LineNo;
                BidEvaluationCriteria."Template ID" := EvaluationCriteria."Template ID";
                BidEvaluationCriteria."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                BidEvaluationCriteria."Document No" := EvaluationHeader.Code;
                BidEvaluationCriteria."Evaluation Type" := EvaluationCriteria."Evaluation Type";
                BidEvaluationCriteria.Description := EvaluationCriteria.Description;
                BidEvaluationCriteria."Total Weight %" := EvaluationCriteria."Total Weight %";
                BidEvaluationCriteria.Insert(true);
            until EvaluationCriteria.Next = 0;
        end;

        //add Bid Evaluation Score Guide
        BidScore.Reset;
        BidScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidScore.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if BidScore.FindSet then begin
            LineNo := BidScore.Count + 1;
            if LineNo = 0 then
                LineNo := 1;
            repeat
                BidEvalScore.Init;
                BidEvalScore."Entry No" := LineNo;
                BidEvalScore."Template ID" := BidScore."Template ID";
                BidEvalScore."Criteria Group ID" := BidScore."Criteria Group ID";
                BidEvalScore."Requirement ID" := BidScore."Requirement ID";
                BidEvalScore."Entry No" := BidScore."Entry No";
                BidEvalScore."Response Value" := BidScore."Response Value";
                BidEvalScore."Document No" := EvaluationHeader.Code;
                BidEvalScore."Target Qty" := BidScore."Target Qty";
                BidEvalScore."Rating Type" := BidScore."Rating Type";
                BidEvalScore."Evaluation Type" := BidScore."Evaluation Type";
                BidEvalScore."Desired Perfomance Direction" := BidScore."Desired Perfomance Direction";
                BidEvalScore."Min Bid Value" := BidScore."Min Bid Value";
                BidEvalScore."Max Bid Value" := BidScore."Max Bid Value";
                BidEvalScore."Min Date Value" := BidScore."Min Date Value";
                BidEvalScore."Max Date Value" := BidScore."Max Date Value";
                BidEvalScore."Score %" := BidScore."Score %";
                BidEvalScore.Insert(true);
            until BidScore.Next = 0;
        end;
    end;

    procedure SuggestFinanceEvaluationCriteria(EvaluationHeader: Record "Bid Evaluation Register")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidRegister: Record "Bid Evaluation Register";
        FinEvaluationLine: Record "Finance Evaluation Line";
        Bids: Record "Purchase Header";
        RankingNo: Integer;
        FinanceEvaluationLine1: Record "Finance Evaluation Line";
        IFSRestricted: Record "IFS Restricted Vendor Category";
        PurchaseLine1: Record "Purchase Line";
        PurchaseHeader1: Record "Purchase Header";
    begin


        EvaluationHeader.TestField("Bid Scoring Document No.");

        FinEvaluationLine.Reset;
        FinEvaluationLine.SetRange("Document ID", EvaluationHeader.Code);
        if FinEvaluationLine.FindSet then begin
            FinEvaluationLine.DeleteAll;
        end;

        //add finance evaluation line
        BidRegister.Reset;
        BidRegister.SetRange("IFS Code", EvaluationHeader."IFS Code");
        BidRegister.SetRange("Evaluation Type", BidRegister."evaluation type"::"Technical Evaluation");
        BidRegister.SetRange("Technical Evaluation  Decision", BidRegister."technical evaluation  decision"::Pass);
        if BidRegister.FindSet then begin
            repeat
                FinEvaluationLine.Init;
                FinEvaluationLine."Document ID" := EvaluationHeader.Code;
                FinEvaluationLine."Document Type" := FinEvaluationLine."document type"::Quote;
                FinEvaluationLine."No." := BidRegister."Bid No.";
                FinEvaluationLine."Bidder Name" := BidRegister."Bidder Name";
                FinEvaluationLine."Bidder No" := BidRegister."Vendor No.";
                FinEvaluationLine."Invitation For Supply No" := BidRegister."IFS Code";
                Bids.Reset;
                Bids.SetRange("No.", BidRegister."Bid No.");
                if Bids.FindSet then begin
                    FinEvaluationLine."Bid Currency Code" := Bids."Currency Code";
                    FinEvaluationLine."Read-out Bid Price (A)" := Bids."Amount Including VAT";
                end;
                //FinEvaluationLine."Bid Currency Code":=BidRegister
                //BidRegister.CALCFIELDS(BidRegister."Weighted Technical Eval Score");
                FinEvaluationLine."Preliminary Evaluation Date" := BidRegister."Evaluation Date";
                FinEvaluationLine."Responsive Bid" := true;
                FinEvaluationLine."Technical Evaluation Date" := BidRegister."Evaluation Date";
                FinEvaluationLine."Weighted Tech Score %" := BidRegister."Weighted Technical Eval Score";
                Bids.CalcFields(Bids."Amount Including VAT");
                FinEvaluationLine."Final Evaluated Bid Price" := Bids."Amount Including VAT";
                FinEvaluationLine."Read-out Bid Price (A)" := Bids."Amount Including VAT";
                FinEvaluationLine."Passed Tech Evaluation" := true;
                FinEvaluationLine."Tech Evaluation Ranking" := BidRegister."Tech Evaluation Ranking";
                FinEvaluationLine."Financial Evaluation Date" := Today;
                FinEvaluationLine.Insert(true);
            until BidRegister.Next = 0;
        end;



        Bidevaluationscore.Reset;
        if Bidevaluationscore.FindLast then
            LineNo := Bidevaluationscore."Line No";

        Bidevaluationscore.Reset;
        Bidevaluationscore.SetRange("Bid Scoring Document No.", EvaluationHeader."Bid Scoring Document No.");
        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
        if Bidevaluationscore.FindSet then begin
            Bidevaluationscore.DeleteAll;

        end;

        BidEvaluationCriteria.Reset;
        BidEvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvaluationCriteria.SetRange("Document No", EvaluationHeader.Code);
        if BidEvaluationCriteria.FindSet then begin
            BidEvaluationCriteria.DeleteAll;
        end;

        BidEvalScore.Reset;
        BidEvalScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvalScore.SetRange("Document No", EvaluationHeader.Code);
        if BidEvalScore.FindSet then begin
            BidEvalScore.DeleteAll;
        end;


        BidSCoreGuide.Reset;
        BidSCoreGuide.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidSCoreGuide.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if BidSCoreGuide.FindSet then begin
            repeat
                Bidevaluationscore.Init;
                Bidevaluationscore.Code := EvaluationHeader.Code;
                Bidevaluationscore."Line No" := LineNo + 1;
                ;
                Bidevaluationscore."Bid No." := EvaluationHeader."Bid No.";
                Bidevaluationscore."Vendor No." := EvaluationHeader."Vendor No.";
                Bidevaluationscore."Criteria Group" := BidSCoreGuide."Criteria Group ID";
                Bidevaluationscore."Requirement ID" := BidSCoreGuide."Requirement ID";
                Bidevaluationscore."Evaluation Requirement" := BidSCoreGuide."Evaluation Requirement";
                Bidevaluationscore."Rating Type" := BidSCoreGuide."Rating Type";
                Bidevaluationscore."Target Qty" := BidSCoreGuide."Target Qty";
                Bidevaluationscore."Target Value/KPI" := BidSCoreGuide."Target Value";
                Bidevaluationscore."Unit of Measure" := BidSCoreGuide."Unit of Measure";
                //Bidevaluationscore."Response Value":=Bid
                //Bidevaluationscore."Bid Response Actual Qty":=BidSCoreGuide.
                //Bidevaluationscore."Score %":=
                Bidevaluationscore."Assigned Weight %" := BidSCoreGuide."Assigned Weight %";
                //Bidevaluationscore."Weighted Line Score":=BidSCoreGuide.
                Bidevaluationscore."Equipment Type" := BidSCoreGuide."Equipment Type";
                Bidevaluationscore."Desired Perfomance Direction" := BidSCoreGuide."Desired Perfomance Direction";
                Bidevaluationscore."Bid Scoring Document No." := EvaluationHeader."Bid Scoring Document No.";
                Bidevaluationscore.Insert(true);
                LineNo += 1;
            until BidSCoreGuide.Next = 0;
        end;

        //add bid evaluation criteria
        EvaluationCriteria.Reset;
        EvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        EvaluationCriteria.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if EvaluationCriteria.FindSet then begin
            repeat
                BidEvaluationCriteria.Init;
                BidEvaluationCriteria."Template ID" := EvaluationCriteria."Template ID";
                BidEvaluationCriteria."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                BidEvaluationCriteria."Document No" := EvaluationHeader.Code;
                BidEvaluationCriteria."Evaluation Type" := EvaluationCriteria."Evaluation Type";
                BidEvaluationCriteria.Description := EvaluationCriteria.Description;
                BidEvaluationCriteria."Total Weight %" := EvaluationCriteria."Total Weight %";
                BidEvaluationCriteria.Insert(true);
            until EvaluationCriteria.Next = 0;
        end;

        //add Bid Evaluation Score Guide
        BidScore.Reset;
        BidScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidScore.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if BidScore.FindSet then begin
            repeat
                BidEvalScore.Init;
                BidEvalScore."Template ID" := BidScore."Template ID";
                BidEvalScore."Criteria Group ID" := BidScore."Criteria Group ID";
                BidEvalScore."Requirement ID" := BidScore."Requirement ID";
                BidEvalScore."Entry No" := BidScore."Entry No";
                BidEvalScore."Response Value" := BidScore."Response Value";
                BidEvalScore."Document No" := EvaluationHeader.Code;
                BidEvalScore."Target Qty" := BidScore."Target Qty";
                BidEvalScore."Rating Type" := BidScore."Rating Type";
                BidEvalScore."Evaluation Type" := BidScore."Evaluation Type";
                BidEvalScore."Desired Perfomance Direction" := BidScore."Desired Perfomance Direction";
                BidEvalScore."Min Bid Value" := BidScore."Min Bid Value";
                BidEvalScore."Max Bid Value" := BidScore."Max Bid Value";
                BidEvalScore."Min Date Value" := BidScore."Min Date Value";
                BidEvalScore."Max Date Value" := BidScore."Max Date Value";
                BidEvalScore."Score %" := BidScore."Score %";
                BidEvalScore.Insert(true);
            until BidScore.Next = 0;
        end;
    end;

    procedure PosTechnicalEvaluation(EvaluationHeader: Record "Bid Evaluation Register"; loggedInUser: code[20])
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        FinanceLine: Record "Finance Evaluation Line";
        EvaluationRegister: Record "Bid Evaluation Register";
        BIDREgister: record "Bid Opening Register Line";
        BidCounts: integer;
        RegisterCounts: integer;
        Standardspp: record "Standard Purchase Code";
    begin

        EvaluationHeader.TestField("IFS Code");
        EvaluationHeader.TestField("Bid No.");
        EvaluationHeader.TestField("Evaluation Date");
        EvaluationHeader.TestField("Evaluation Lead");
        EvaluationHeader.TestField("Technical Evaluation  Decision");
        //EvaluationHeader.TESTFIELD("Weighted Technical Eval Score");




        Bids.Reset;
        Bids.SetRange("No.", EvaluationHeader."Bid No.");
        Bids.SetRange("IFS Code", EvaluationHeader."IFS Code");
        if Bids.FindSet then begin
            Bids."Tech Evaluation Ranking" := EvaluationHeader."Tech Evaluation Ranking";
            Bids."Technical Evaluation Date" := EvaluationHeader."Evaluation Date";
            Bids."Techn Evaluation Voucher" := EvaluationHeader.Code;
            Bids."Remarks(Technical)" := EvaluationHeader."Tender Evaluation Comm Remarks";
            Bids."Technical Evaluation Verdict" := EvaluationHeader."Technical Evaluation  Decision";
            if EvaluationHeader."Technical Evaluation  Decision" = EvaluationHeader."technical evaluation  decision"::Pass then
                Bids."Passed Tech Evaluation" := true;
            EvaluationHeader.CalcFields("Weighted Technical Eval Score");
            Bids."Weighted Tech Score %" := EvaluationHeader."Weighted Technical Eval Score";
            Bids."Responsive Bid (Evaluation)" := true;
            Bids.Modify(true);
        end;

        IFSDetails.Reset;
        IFSDetails.SetRange(Code, EvaluationHeader."IFS Code");
        IFSDetails.SetRange("Vendor No.", EvaluationHeader."Vendor No.");
        if IFSDetails.FindSet then begin
            IFSDetails."Technical Evaluation Reg" := EvaluationHeader.Code;
            IFSDetails."Technical Evaluation Date" := EvaluationHeader."Created Date";
            IFSDetails."Technical Evaluation  Outcome" := Format(EvaluationHeader."Preliminary Evaluation Score");
            IFSDetails."Evaluation Committee Rem" := EvaluationHeader."Tender Evaluation Comm Remarks";
            IFSDetails.Modify(true);
        end else begin

            IFSDetails.Init;
            IFSDetails."Vendor No." := EvaluationHeader."Vendor No.";
            IFSDetails.Code := EvaluationHeader."IFS Code";
            IFS.Reset;
            IFS.SetRange(Code, EvaluationHeader."IFS Code");
            if IFS.FindSet then begin
                IFSDetails.Description := IFS."Tender Name";
                IFSDetails."IFS Code" := IFS.Code;
            end;

            IFSDetails."Bid No." := EvaluationHeader."Bid No.";
            IFSDetails."Vendor Name" := EvaluationHeader."Bidder Name";
            IFSDetails."Preliminary Evaluation Reg" := EvaluationHeader.Code;
            IFSDetails."Preliminary Evaluation Date" := EvaluationHeader."Created Date";
            IFSDetails."Preliminary Evaluation Outcome" := Format(EvaluationHeader."Preliminary Evaluation Score");
            IFSDetails."Preminary Evaluation Committee" := EvaluationHeader."Tender Evaluation Comm Remarks";
            IFSDetails."Technical Evaluation Reg" := EvaluationHeader.Code;
            IFSDetails."Technical Evaluation Date" := EvaluationHeader."Created Date";
            IFSDetails."Technical Evaluation  Outcome" := Format(EvaluationHeader."Preliminary Evaluation Score");
            IFSDetails."Evaluation Committee Rem" := EvaluationHeader."Tender Evaluation Comm Remarks";
            IFSDetails.Insert(true);
        end;
        //    ProcuremnetSetup.GET;
        //    IF ProcuremnetSetup."Notify Committe Members"=TRUE THEN
        //    //FnSendBidEvaluationNotification(EvaluationHeader);
        //
        // IFS.Reset;
        // IFS.SetRange(Code, EvaluationHeader."IFS Code");
        // if IFS.FindSet then begin
        //     IFS."Document Status" := IFS."document status"::Evaluation;
        //     IFS.Modify;
        // end;
        EvaluationRegister.reset;
        EvaluationRegister.setrange("IFS Code", EvaluationHeader."IFS Code");
        if EvaluationRegister.find('-') then begin
            // EvaluationRegister.count();
            RegisterCounts := EvaluationRegister.count();
        end;
        BIDREgister.Reset();
        BIDREgister.SetRange("IFS Code", EvaluationHeader."IFS Code");
        if BIDREgister.find('-') then
            // BIDREgister.count();
            BidCounts := BIDREgister.count();
        IFS.Reset;
        IFS.SetRange(Code, EvaluationHeader."IFS Code");
        if IFS.FindSet then begin
            IFS."Document Status" := IFS."document status"::Evaluation;
            // if RegisterCounts =< BidCounts then
            ifs."Technical Evaluated" := true;
            IFS.Modify(true);
        end;
        EvaluationHeader.Posted := true;
        EvaluationHeader."Posted By" := loggedInUser;
        EvaluationHeader."Posted Date" := Today;
        EvaluationHeader.Modify();

        Message('Submitted Successfully');
    end;

    procedure PosTechnicalEvaluation22(EvaluationHeader: Record "Bid Evaluation Register")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        FinanceLine: Record "Finance Evaluation Line";
    begin

        EvaluationHeader.TestField("IFS Code");
        EvaluationHeader.TestField("Bid No.");
        EvaluationHeader.TestField("Evaluation Date");
        EvaluationHeader.TestField("Evaluation Lead");
        EvaluationHeader.TestField("Technical Evaluation  Decision");
        EvaluationHeader.TestField("Weighted Technical Eval Score");


        EvaluationHeader.Posted := true;
        EvaluationHeader."Posted By" := UserId;
        EvaluationHeader."Posted Date" := Today;

        Bids.Reset;
        Bids.SetRange("No.", EvaluationHeader."Bid No.");
        Bids.SetRange("IFS Code", EvaluationHeader."IFS Code");
        if Bids.FindSet then begin
            Bids."Tech Evaluation Ranking" := EvaluationHeader."Tech Evaluation Ranking";
            Bids."Technical Evaluation Date" := EvaluationHeader."Evaluation Date";
            if EvaluationHeader."Technical Evaluation  Decision" = EvaluationHeader."technical evaluation  decision"::Pass then
                Bids."Passed Tech Evaluation" := true;
            Bids."Weighted Tech Score %" := EvaluationHeader."Weighted Technical Eval Score";
            Bids."Responsive Bid (Evaluation)" := true;
            Bids.Modify;
        end;

        IFSDetails.Reset;
        IFSDetails.SetRange(Code, EvaluationHeader."IFS Code");
        IFSDetails.SetRange("Vendor No.", EvaluationHeader."Vendor No.");
        if IFSDetails.FindSet then begin
            IFSDetails."Technical Evaluation Reg" := EvaluationHeader.Code;
            IFSDetails."Technical Evaluation Date" := EvaluationHeader."Created Date";
            IFSDetails."Technical Evaluation  Outcome" := Format(EvaluationHeader."Preliminary Evaluation Score");
            IFSDetails."Evaluation Committee Rem" := EvaluationHeader."Tender Evaluation Comm Remarks";
            IFSDetails.Modify(true);
        end else begin

            IFSDetails.Init;
            IFSDetails."Vendor No." := EvaluationHeader."Vendor No.";
            IFSDetails.Code := EvaluationHeader."IFS Code";
            IFS.Reset;
            IFS.SetRange(Code, EvaluationHeader."IFS Code");
            if IFS.FindSet then begin
                IFSDetails.Description := IFS."Tender Name";
                IFSDetails."IFS Code" := IFS.Code;
            end;

            IFSDetails."Bid No." := EvaluationHeader."Bid No.";
            IFSDetails."Vendor Name" := EvaluationHeader."Bidder Name";
            IFSDetails."Preliminary Evaluation Reg" := EvaluationHeader.Code;
            IFSDetails."Preliminary Evaluation Date" := EvaluationHeader."Created Date";
            IFSDetails."Preliminary Evaluation Outcome" := Format(EvaluationHeader."Preliminary Evaluation Score");
            IFSDetails."Preminary Evaluation Committee" := EvaluationHeader."Tender Evaluation Comm Remarks";
            IFSDetails."Technical Evaluation Reg" := EvaluationHeader.Code;
            IFSDetails."Technical Evaluation Date" := EvaluationHeader."Created Date";
            IFSDetails."Technical Evaluation  Outcome" := Format(EvaluationHeader."Preliminary Evaluation Score");
            IFSDetails."Evaluation Committee Rem" := EvaluationHeader."Tender Evaluation Comm Remarks";
            IFSDetails.Insert(true);
        end;
        ProcuremnetSetup.Get;
        if ProcuremnetSetup."Notify Committe Members" = true then
            FnSendBidEvaluationNotification(EvaluationHeader);

        IFS.Reset;
        IFS.SetRange(Code, EvaluationHeader."IFS Code");
        if IFS.FindSet then begin
            IFS."Document Status" := IFS."document status"::Evaluation;
            IFS.Modify;
        end;
    end;

    procedure PosFinanceEvaluation(EvaluationHeader: Record "Bid Evaluation Register"; loggedInUser: code[20])
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        ProcSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        FinanceLine: Record "Finance Evaluation Line";
        FinalEvalReport: Record "Bid Tabulation Header";
        FinalEvalLine: Record "Bid Tabulation Line";
        FinanceLine1: Record "Finance Evaluation Line";
        PQuotes: Record "Purchase Header";
        EvaluationRegister: Record "Bid Evaluation Register";
        BIDREgister: record "Bid Opening Register Line";
        BidCounts: integer;
        RegisterCounts: integer;
        Standardspp: record "Standard Purchase Code";
    begin

        EvaluationHeader.TestField("IFS Code");
        EvaluationHeader.TestField("Tender Evaluation Comm Remarks");
        EvaluationHeader.TestField("Evaluation Date");
        EvaluationHeader.TestField("Evaluation Lead");

        FinanceLine1.Reset;
        FinanceLine1.SetRange("Document ID", EvaluationHeader.Code);
        if FinanceLine1.FindSet then begin
            repeat
                Bids.Reset;
                Bids.SetRange("No.", FinanceLine1."No.");
                Bids.SetRange("IFS Code", EvaluationHeader."IFS Code");
                if Bids.FindSet then begin
                    Bids."Final Evaluated Bid Price" := FinanceLine1."Final Evaluated Bid Price";
                    Bids."Financial Evaluation Date" := EvaluationHeader."Evaluation Date";
                    Bids."Financial Evaluation Ranking" := FinanceLine1."Financial Evaluation Ranking";
                    Bids."Passed Tech Evaluation" := FinanceLine1."Passed Tech Evaluation";
                    Bids."Aggregate Ranking" := FinanceLine1."Aggregate Ranking";
                    Bids."Aggregate Weighted Score %" := FinanceLine1."Aggregate Weighted Score %";
                    Bids."Weighted Financial Score %" := FinanceLine1."Weighted Financial Score %";
                    Bids."Weighted Tech Score %" := FinanceLine1."Weighted Tech Score %";
                    Bids."Read-out Bid Price (A)" := FinanceLine1."Read-out Bid Price (A)";
                    Bids."Arithmetic Corrections (B)" := FinanceLine1."Arithmetic Corrections (B)";
                    Bids."Corrected Bid Price (C=A+B)" := FinanceLine1."Corrected Bid Price";
                    Bids."Remarks(Financial)" := FinanceLine1."Evaluation Committee Remarks";
                    //Bids."Unconditional Discount % (D)":=
                    //Bids."Unconditional Disc Amount (E)":=
                    Bids."Corrected & Disc Bid Price" := FinanceLine1."Corrected Bid Price";
                    ////Bids."Any Additional Adjustments (G)":=
                    //Bids."Any Priced Deviations (H))":=
                    //IF EvaluationHeader."Technical Evaluation  Decision"=EvaluationHeader."Technical Evaluation  Decision"::Pass THEN
                    Bids."Final Tender Outcome" := FinanceLine1."Final Tender Outcome";
                    Bids."Document Status" := Bids."document status"::Evaluation;
                    //Bids."Weighted Tech Score %":=EvaluationHeader."Weighted Technical Eval Score";
                    Bids.Modify(true);
                end;
            until FinanceLine1.Next = 0;
        end;

        FinanceLine.Reset;
        FinanceLine.SetRange("Document ID", EvaluationHeader.Code);
        if FinanceLine.FindSet then begin
            repeat

                IFSDetails.Reset;
                IFSDetails.SetRange(Code, EvaluationHeader."IFS Code");
                IFSDetails.SetRange("Vendor No.", Bids."Buy-from Vendor No.");
                if IFSDetails.FindSet then begin
                    IFSDetails."Bid Opening Finance Register" := EvaluationHeader."Finance Opening Register No.";
                    IFSDetails."Bid Opening Date (Financial)" := EvaluationHeader."Finance Opening Date";
                    IFSDetails."Financial Eval Register No" := EvaluationHeader."Bid Scoring Document No.";
                    IFSDetails."Financial Evaluation Date" := EvaluationHeader."Evaluation Date";
                    IFSDetails."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                    IFSDetails."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                    IFSDetails."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price";
                    IFSDetails."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                    IFSDetails."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                    IFSDetails."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                    IFSDetails."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                    IFSDetails."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                    IFSDetails."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                    IFSDetails."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                    IFSDetails."Weighted Technical  Score %" := FinanceLine."Weighted Tech Score %";
                    IFSDetails."Evaluation Committee Rem" := FinanceLine."Evaluation Committee Remarks";
                    IFSDetails."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                    IFSDetails."Financial Evaluation Comm Rem" := FinanceLine."Evaluation Committee Remarks";
                    IFSDetails."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                    IFSDetails."Award Type" := EvaluationHeader."Award Type";
                    IFSDetails."Finance Bid Evaluation Registe" := EvaluationHeader.Code;
                    IFSDetails.Modify(true);
                end else begin

                    IFSDetails.Init;
                    IFSDetails."Vendor No." := FinanceLine."Bidder No";
                    IFSDetails.Code := EvaluationHeader."IFS Code";
                    IFS.Reset;
                    IFS.SetRange(Code, EvaluationHeader."IFS Code");
                    if IFS.FindSet then begin
                        IFSDetails.Description := IFS."Tender Name";
                        IFSDetails."IFS Code" := IFS.Code;
                    end;

                    IFSDetails."Bid No." := FinanceLine."No.";
                    IFSDetails."Vendor Name" := FinanceLine."Bidder Name";
                    //eIFSDetails."Primary Email":=Bids.
                    //IFSDetails."Invitation Email Sent":=
                    IFSDetails."Bid Opening Finance Register" := EvaluationHeader."Finance Opening Register No.";
                    IFSDetails."Bid Opening Date (Financial)" := EvaluationHeader."Finance Opening Date";
                    IFSDetails."Financial Eval Register No" := EvaluationHeader."Bid Scoring Document No.";
                    IFSDetails."Financial Evaluation Date" := EvaluationHeader."Evaluation Date";
                    IFSDetails."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                    IFSDetails."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                    IFSDetails."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price";
                    IFSDetails."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                    IFSDetails."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                    IFSDetails."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                    IFSDetails."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                    IFSDetails."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                    IFSDetails."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                    IFSDetails."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                    IFSDetails."Weighted Technical  Score %" := FinanceLine."Weighted Tech Score %";
                    IFSDetails."Evaluation Committee Rem" := FinanceLine."Evaluation Committee Remarks";
                    IFSDetails."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                    IFSDetails."Award Type" := EvaluationHeader."Award Type";
                    IFSDetails."Finance Bid Evaluation Registe" := EvaluationHeader.Code;
                    IFSDetails."Financial Evaluation Comm Rem" := FinanceLine."Evaluation Committee Remarks";
                    IFSDetails."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                    IFSDetails.Insert(true);
                end;
            //END;
            until FinanceLine.Next = 0;
        end;




        /*ProcuremnetSetup.GET;
        IF ProcuremnetSetup."Notify Committe Members"=TRUE THEN
        FnSendBidEvaluationNotification(EvaluationHeader);*/

        // IFS.Reset;
        // IFS.SetRange(Code, EvaluationHeader."IFS Code");
        // if IFS.FindSet then begin
        //     IFS."Document Status" := IFS."document status"::Evaluation;
        //     IFS.Modify(true);
        // end;
        ProcSetup.get;
        //Generate Final Evaluation Report
        FinalEvalReport.Reset;
        //FinalEvalReport.SetFilter("Document Status", '<>%1', FinalEvalReport."document status"::Cancelled);
        FinalEvalReport.SetRange("IFS Code", EvaluationHeader."IFS Code");
        if not FinalEvalReport.FindSet then begin
            FinalEvalReport.Init;
            FinalEvalReport.code := NoSeriesManagement.GetNextNo(ProcSetup."Final Evaluation Report Nos", Today, true);
            FinalEvalReport."Document Type" := FinalEvalReport."document type"::"Evaluation Report";
            FinalEvalReport."IFS Code" := EvaluationHeader."IFS Code";
            FinalEvalReport."Document Date" := EvaluationHeader."Evaluation Date";
            FinalEvalReport."Financial Evaluation ID" := EvaluationHeader.Code;
            FinalEvalReport.Description := 'Final Tender evaluation Report' + EvaluationHeader."IFS Code";
            IFS.Reset;
            IFS.SetRange(Code, EvaluationHeader."IFS Code");
            if IFS.FindSet then begin
                FinalEvalReport."Tender Name" := IFS."Tender Name";
                FinalEvalReport."Appointed Bid Opening Comm" := IFS."Bid Opening Committe";
            end;
            FinalEvalReport."Raised By" := EvaluationHeader."Evaluation Lead";
            FinalEvalReport.Name := EvaluationHeader."Evaluation Lead Name";
            FinalEvalReport."Tender Committee Role" := FinalEvalReport."tender committee role"::Chairperson;
            FinalEvalReport."Bid Opening Date" := EvaluationHeader."Bid Opening Date";
            FinalEvalReport."Evaluation Completion Date" := EvaluationHeader."Evaluation Date";
            FinalEvalReport."Appointed Bid Evaluation Com" := EvaluationHeader."Appointed Bid Evaluation Commi";
            FinalEvalReport."Award Type" := EvaluationHeader."Award Type";
            FinalEvalReport."Finance Bid Evaluation Registe" := EvaluationHeader.Code;
            FinalEvalReport."Primary Region" := EvaluationHeader."Primary Region";
            if FinalEvalReport.Insert(true) then begin
                //FinalEvalReport.Validate(FinalEvalReport."Appointed Bid Opening Comm");
                // FinalEvalReport.Validate(FinalEvalReport."Appointed Bid Evaluation Com");
                PQuotes.Reset;
                PQuotes.SetRange("IFS Code", EvaluationHeader."IFS Code");
                if PQuotes.FindSet then begin
                    repeat
                        FinalEvalLine.Init;
                        FinalEvalLine."Tabulation ID" := FinalEvalReport.Code;
                        FinalEvalLine."Tabulation Type" := FinalEvalLine."tabulation type"::"Evaluation Report";
                        FinalEvalLine."Document Type" := FinalEvalLine."document type"::Quote;
                        FinalEvalLine."No." := PQuotes."No.";
                        FinalEvalLine."Bidder Name" := PQuotes."Buy-from Vendor Name";
                        FinalEvalLine."Bidder No" := PQuotes."Vendor No.";
                        FinalEvalLine."Invitation For Supply No" := PQuotes."Invitation For Supply No";
                        FinalEvalLine."Bid Currency Code" := PQuotes."Currency Code";
                        // FinalEvalLine.ReFinanceLine."Read-out Bid Price (A)"
                        //FinalEvalLine."Preliminary Evaluation Date":=PQuotes."Preliminary Evaluation Date";
                        FinalEvalLine."Responsive Bid" := PQuotes."Responsive Bid (Evaluation)";
                        // FinalEvalLine."Technical Evaluation Date":=PQuotes."Technical Evaluation Date";
                        // PQuotes.CALCFIELDS("Weighted Tech Score %");
                        FinalEvalLine."Weighted Tech Score %" := PQuotes."Weighted Tech Score %";
                        FinalEvalLine."Passed Tech Evaluation" := PQuotes."Passed Tech Evaluation";
                        FinalEvalLine."Tech Evaluation Ranking" := PQuotes."Tech Evaluation Ranking";
                        //FinalEvalLine.  IFSDetails."Bid Opening Finance Register"
                        //FinalEvalLine."Bid Opening Date":=FinanceLine.ope
                        //FinalEvalLine.finaIFSDetails."Financial Eval Register No"
                        FinalEvalLine."Financial Evaluation Date" := PQuotes."Financial Evaluation Date";
                        FinalEvalLine."Read-out Bid Price (A)" := PQuotes."Read-out Bid Price (A)";
                        FinalEvalLine."Arithmetic Corrections (B)" := PQuotes."Arithmetic Corrections (B)";
                        FinalEvalLine."Corrected Bid Price (C=A+B)" := PQuotes."Corrected & Disc Bid Price";
                        FinalEvalLine."Unconditional Discount % (D)" := PQuotes."Unconditional Discount % (D)";
                        FinalEvalLine."Unconditional Disc Amount (E)" := PQuotes."Unconditional Disc Amount (E)";
                        FinalEvalLine."Corrected & Disc Bid Price" := PQuotes."Corrected & Disc Bid Price";
                        FinalEvalLine."Any Additional Adjustments (G)" := PQuotes."Any Additional Adjustments (G)";
                        FinalEvalLine."Any Priced Deviations (H))" := PQuotes."Any Priced Deviations (H))";
                        FinalEvalLine."Final Evaluated Bid Price" := PQuotes."Final Evaluated Bid Price";
                        FinalEvalLine."Financial Evaluation Ranking" := PQuotes."Financial Evaluation Ranking";
                        //PQuotes.CALCFIELDS("Weighted Financial Score %");
                        FinalEvalLine."Weighted Financial Score %" := PQuotes."Weighted Financial Score %";
                        //FinalEvalLine."Weighted Tech Score %":=FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Evaluation Committee Recomm" := PQuotes."Final Tender Outcome";
                        //FinalEvalLine."Financial Evaluation Comm Rem":=FinanceLine."Evaluation Committee Remarks";
                        FinalEvalLine."Aggregate Weighted Score %" := PQuotes."Aggregate Weighted Score %";
                        FinalEvalLine."Pre-bid Register No." := PQuotes."Pre-bid Register No.";
                        FinalEvalLine."Prebid Conference Date" := PQuotes."Prebid Conference Date";
                        FinalEvalLine."Bid Opening Date" := PQuotes."Bid Opening Date";
                        FinalEvalLine."Bid Submission No" := PQuotes."Bid No";
                        //FinalEvalLine."Bid Opening Committee Remarks":=IFSDetails."Bid Opening Committee Remarks";
                        //FinalEvalLine."Bid Opening Date (Financial)":=PQuotes.FINA;
                        //FinalEvalLine."Bid Opening Finance Register":=IFSDetails."Bid Opening Finance Register";
                        FinalEvalLine."Bid Opening Register No." := PQuotes."Bid Opening Register No.";
                        // FinalEvalLine."Bid Opening Result":=IFSDetails."Bid Opening Result";
                        FinalEvalLine."Preliminary Evaluation Date" := PQuotes."Preliminary Evaluation Date";
                        FinalEvalLine."Preliminary Evaluation Outcome" := Format(PQuotes."Preliminary Evaluation Verdict");
                        FinalEvalLine."Preliminary Evaluation Reg" := PQuotes."Preliminary Evaluation Voucher";
                        FinalEvalLine."Preminary Evaluation Committee" := EvaluationHeader."Appointed Bid Evaluation Commi";
                        //FinalEvalLine."Tech Evaluation Ranking":=IFSDetails.;
                        FinalEvalLine."Technical Evaluation Date" := PQuotes."Technical Evaluation Date";
                        FinalEvalLine."Evaluation Committee Remarks" := PQuotes."Remarks(Preliminary)" + ' ' + PQuotes."Remarks(Technical)" + ' ' + PQuotes."Remarks(Financial)";


                        FinalEvalLine.Insert(true);
                    until PQuotes.Next = 0;

                end;
                EvaluationRegister.reset;
                EvaluationRegister.setrange("IFS Code", EvaluationHeader."IFS Code");
                if EvaluationRegister.find('-') then begin
                    // EvaluationRegister.count();
                    RegisterCounts := EvaluationRegister.count();
                end;
                BIDREgister.Reset();
                BIDREgister.SetRange("IFS Code", EvaluationHeader."IFS Code");
                if BIDREgister.find('-') then
                    // BIDREgister.count();
                    BidCounts := BIDREgister.count();
                IFS.Reset;
                IFS.SetRange(Code, EvaluationHeader."IFS Code");
                if IFS.FindSet then begin
                    IFS."Document Status" := IFS."document status"::Evaluation;
                    if RegisterCounts = BidCounts then
                        ifs."Financial Evaluated" := true;
                    IFS.Modify(true);
                end;
            end;
            Page.Run(75275, FinalEvalReport)
        end;
        EvaluationHeader.Posted := true;
        EvaluationHeader."Posted By" := loggedInUser;
        EvaluationHeader."Posted Date" := Today;
        // EvaluationHeader.modify(true);

    end;

    procedure PosFinanceEvaluation33(EvaluationHeader: Record "Bid Evaluation Register")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        FinanceLine: Record "Finance Evaluation Line";
        FinalEvalReport: Record "Bid Tabulation Header";
        FinalEvalLine: Record "Bid Tabulation Line";
    begin

        EvaluationHeader.TestField("IFS Code");
        EvaluationHeader.TestField("Tender Evaluation Comm Remarks");
        EvaluationHeader.TestField("Evaluation Date");
        EvaluationHeader.TestField("Evaluation Lead");
        //EvaluationHeader.TESTFIELD("Weighted Financial Eval Score");
        //EvaluationHeader.TESTFIELD("Award Decision");


        EvaluationHeader.Posted := true;
        EvaluationHeader."Posted By" := UserId;
        EvaluationHeader."Posted Date" := Today;

        FinanceLine.Reset;
        FinanceLine.SetRange("Document ID", EvaluationHeader.Code);
        if FinanceLine.FindSet then begin
            repeat
                Bids.Reset;
                Bids.SetRange("No.", FinanceLine."No.");
                Bids.SetRange("IFS Code", EvaluationHeader."IFS Code");
                if Bids.FindSet then begin
                    Bids."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                    Bids."Financial Evaluation Date" := EvaluationHeader."Evaluation Date";
                    Bids."Financial Evaluation Ranking" := FinanceLine."Financial Evaluation Ranking";
                    Bids."Aggregate Ranking" := FinanceLine."Aggregate Ranking";
                    Bids."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                    Bids."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                    Bids."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                    Bids."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                    Bids."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                    Bids."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price";
                    //Bids."Unconditional Discount % (D)":=
                    //Bids."Unconditional Disc Amount (E)":=
                    Bids."Corrected & Disc Bid Price" := FinanceLine."Corrected Bid Price";
                    ////Bids."Any Additional Adjustments (G)":=
                    //Bids."Any Priced Deviations (H))":=
                    //IF EvaluationHeader."Technical Evaluation  Decision"=EvaluationHeader."Technical Evaluation  Decision"::Pass THEN
                    Bids."Final Tender Outcome" := FinanceLine."Final Tender Outcome";
                    Bids."Document Status" := Bids."document status"::Evaluation;
                    //Bids."Weighted Tech Score %":=EvaluationHeader."Weighted Technical Eval Score";
                    Bids.Modify;

                    IFSDetails.Reset;
                    IFSDetails.SetRange(Code, EvaluationHeader."IFS Code");
                    IFSDetails.SetRange("Vendor No.", Bids."Buy-from Vendor No.");
                    if IFSDetails.FindSet then begin
                        IFSDetails."Bid Opening Finance Register" := EvaluationHeader."Finance Opening Register No.";
                        IFSDetails."Bid Opening Date (Financial)" := EvaluationHeader."Finance Opening Date";
                        IFSDetails."Financial Eval Register No" := EvaluationHeader."Bid Scoring Document No.";
                        IFSDetails."Financial Evaluation Date" := EvaluationHeader."Evaluation Date";
                        IFSDetails."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                        IFSDetails."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                        IFSDetails."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price";
                        IFSDetails."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                        IFSDetails."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                        IFSDetails."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                        IFSDetails."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                        IFSDetails."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                        IFSDetails."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                        IFSDetails."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                        IFSDetails."Weighted Technical  Score %" := FinanceLine."Weighted Tech Score %";
                        IFSDetails."Evaluation Committee Rem" := FinanceLine."Evaluation Committee Remarks";
                        IFSDetails."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                        IFSDetails."Financial Evaluation Comm Rem" := FinanceLine."Evaluation Committee Remarks";
                        IFSDetails."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                        IFSDetails.Modify(true);
                    end else begin

                        IFSDetails.Init;
                        IFSDetails."Vendor No." := FinanceLine."Bidder No";
                        IFSDetails.Code := EvaluationHeader."IFS Code";
                        IFS.Reset;
                        IFS.SetRange(Code, EvaluationHeader."IFS Code");
                        if IFS.FindSet then begin
                            IFSDetails.Description := IFS."Tender Name";
                            IFSDetails."IFS Code" := IFS.Code;
                        end;

                        IFSDetails."Bid No." := FinanceLine."No.";
                        IFSDetails."Vendor Name" := FinanceLine."Bidder Name";
                        //eIFSDetails."Primary Email":=Bids.
                        //IFSDetails."Invitation Email Sent":=
                        IFSDetails."Bid Opening Finance Register" := EvaluationHeader."Finance Opening Register No.";
                        IFSDetails."Bid Opening Date (Financial)" := EvaluationHeader."Finance Opening Date";
                        IFSDetails."Financial Eval Register No" := EvaluationHeader."Bid Scoring Document No.";
                        IFSDetails."Financial Evaluation Date" := EvaluationHeader."Evaluation Date";
                        IFSDetails."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                        IFSDetails."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                        IFSDetails."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price";
                        IFSDetails."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                        IFSDetails."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                        IFSDetails."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                        IFSDetails."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                        IFSDetails."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                        IFSDetails."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                        IFSDetails."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                        IFSDetails."Weighted Technical  Score %" := FinanceLine."Weighted Tech Score %";
                        IFSDetails."Evaluation Committee Rem" := FinanceLine."Evaluation Committee Remarks";
                        IFSDetails."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                        IFSDetails."Financial Evaluation Comm Rem" := FinanceLine."Evaluation Committee Remarks";
                        IFSDetails."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                        IFSDetails.Insert(true);
                    end;
                end;
            until FinanceLine.Next = 0;
        end;




        /*ProcuremnetSetup.GET;
        IF ProcuremnetSetup."Notify Committe Members"=TRUE THEN
        FnSendBidEvaluationNotification(EvaluationHeader);*/

        IFS.Reset;
        IFS.SetRange(Code, EvaluationHeader."IFS Code");
        if IFS.FindSet then begin
            IFS."Document Status" := IFS."document status"::Evaluation;
            IFS.Modify;
        end;

        //Generate Final Evaluation Report
        FinalEvalReport.Reset;
        FinalEvalReport.SetRange("IFS Code", EvaluationHeader."IFS Code");
        if not FinalEvalReport.FindSet then begin
            FinalEvalReport.Init;
            FinalEvalReport."Document Type" := FinalEvalReport."document type"::"Evaluation Report";
            FinalEvalReport."IFS Code" := EvaluationHeader."IFS Code";
            FinalEvalReport."Document Date" := EvaluationHeader."Evaluation Date";
            FinalEvalReport."Financial Evaluation ID" := EvaluationHeader.Code;
            FinalEvalReport.Description := 'Final Tender evaluation Report' + EvaluationHeader."IFS Code";
            IFS.Reset;
            IFS.SetRange(Code, EvaluationHeader."IFS Code");
            if IFS.FindSet then begin
                FinalEvalReport."Tender Name" := IFS."Tender Name";
            end;
            FinalEvalReport."Raised By" := EvaluationHeader."Evaluation Lead";
            FinalEvalReport.Name := EvaluationHeader."Evaluation Lead Name";
            FinalEvalReport."Tender Committee Role" := FinalEvalReport."tender committee role"::Chairperson;
            FinalEvalReport."Bid Opening Date" := EvaluationHeader."Bid Opening Date";
            FinalEvalReport."Evaluation Completion Date" := EvaluationHeader."Evaluation Date";
            FinalEvalReport.Validate(FinalEvalReport."Appointed Bid Opening Comm", EvaluationHeader."Bid Opening Register No.");
            FinalEvalReport.Validate(FinalEvalReport."Appointed Bid Evaluation Com", EvaluationHeader."Bid Scoring Document No.");
            FinalEvalReport."Primary Region" := EvaluationHeader."Primary Region";
            if FinalEvalReport.Insert(true) then begin
                FinanceLine.Reset;
                FinanceLine.SetRange("Document ID", EvaluationHeader.Code);
                if FinanceLine.FindSet then begin
                    repeat
                        FinalEvalLine.Init;
                        FinalEvalLine."Tabulation ID" := FinalEvalReport.Code;
                        FinalEvalLine."Tabulation Type" := FinalEvalLine."tabulation type"::"Evaluation Report";
                        FinalEvalLine."Document Type" := FinalEvalLine."document type"::Quote;
                        FinalEvalLine."No." := FinanceLine."No.";
                        FinalEvalLine."Bidder Name" := FinanceLine."Bidder Name";
                        FinalEvalLine."Bidder No" := FinanceLine."Bidder No";
                        FinalEvalLine."Invitation For Supply No" := FinanceLine."Invitation For Supply No";
                        FinalEvalLine."Bid Currency Code" := FinanceLine."Bid Currency Code";
                        // FinalEvalLine.ReFinanceLine."Read-out Bid Price (A)"
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Responsive Bid" := FinanceLine."Responsive Bid";
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Passed Tech Evaluation" := FinanceLine."Passed Tech Evaluation";
                        FinalEvalLine."Tech Evaluation Ranking" := FinanceLine."Tech Evaluation Ranking";
                        //FinalEvalLine.  IFSDetails."Bid Opening Finance Register"
                        //FinalEvalLine."Bid Opening Date":=FinanceLine.ope
                        //FinalEvalLine.finaIFSDetails."Financial Eval Register No"
                        FinalEvalLine."Financial Evaluation Date" := FinanceLine."Financial Evaluation Date";
                        FinalEvalLine."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                        FinalEvalLine."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                        FinalEvalLine."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price";
                        FinalEvalLine."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                        FinalEvalLine."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                        FinalEvalLine."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                        FinalEvalLine."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                        FinalEvalLine."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                        FinalEvalLine."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                        FinalEvalLine."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                        FinalEvalLine."Financial Evaluation Comm Rem" := FinanceLine."Evaluation Committee Remarks";
                        FinalEvalLine."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                        IFSDetails.Reset;
                        IFSDetails.SetRange(Code, EvaluationHeader."IFS Code");
                        IFSDetails.SetRange("Vendor No.", Bids."Buy-from Vendor No.");
                        if IFSDetails.FindSet then begin
                            FinalEvalLine."Pre-bid Register No." := IFSDetails."Prebid Register No.";
                            FinalEvalLine."Prebid Conference Date" := IFSDetails."Prebid Meeting Date";
                            FinalEvalLine."Bid Opening Date" := IFSDetails."Bid Opening Date (Technical)";
                            FinalEvalLine."Bid Opening Committee Remarks" := IFSDetails."Bid Opening Committee Remarks";
                            FinalEvalLine."Bid Opening Date (Financial)" := IFSDetails."Bid Opening Date (Financial)";
                            FinalEvalLine."Bid Opening Finance Register" := IFSDetails."Bid Opening Finance Register";
                            FinalEvalLine."Bid Opening Register No." := IFSDetails."Bid Opening Register No.";
                            FinalEvalLine."Bid Opening Result" := IFSDetails."Bid Opening Result";
                            FinalEvalLine."Preliminary Evaluation Date" := IFSDetails."Preliminary Evaluation Date";
                            FinalEvalLine."Preliminary Evaluation Outcome" := IFSDetails."Preliminary Evaluation Outcome";
                            FinalEvalLine."Preliminary Evaluation Reg" := IFSDetails."Preliminary Evaluation Reg";
                            FinalEvalLine."Preminary Evaluation Committee" := IFSDetails."Preminary Evaluation Committee";
                            //FinalEvalLine."Tech Evaluation Ranking":=IFSDetails.;
                            FinalEvalLine."Technical Evaluation Date" := IFSDetails."Technical Evaluation Date";
                        end;


                        FinalEvalLine.Insert(true);
                    until FinanceLine.Next = 0;

                end;
            end;
            Page.Run(75275, FinalEvalReport)
        end;

    end;


    procedure FnSendFinBidEvaluationNotification(evaluationHeaader: Record "Bid Evaluation Register")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        IFSCommitteMembers: Record "Bid Evaluation Committee";
        IFSTenderCommitte: Record "IFS Tender Committee";
        EvaluationRegister: Record "Bid Evaluation Register";
    begin
        ///Notifying Procurement Team on supplier Request


        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;


        IFSCommitteMembers.Reset;
        IFSCommitteMembers.SetRange("Document No.", evaluationHeaader.Code);
        if IFSCommitteMembers.FindSet then begin
            repeat
                IFSCommitteMembers.TestField(Email);
                RequesterEmail := IFSCommitteMembers.Email;
                RequesterName := IFSCommitteMembers."Member Name";
                Window.Open('Notifying the Sender...');
                WindowisOpen := true;

                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.", evaluationHeaader."Appointed Bid Evaluation Commi");
                if IFSTenderCommitte.FindSet then
                    Counter := Counter + 1;

                //Create message
                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'Dear,  ' + RequesterName;
                SenderMessage := '<BR>Please find attached summary of the Evaluation No:' + evaluationHeaader.Code + '</BR>';
                SupplierDetails := '<BR>Appointment Reference No:' + IFSCommitteMembers."Appointed Bid Opening Com" + '</BR>' + '<BR> Committee Type:' + IFSTenderCommitte."Committee Type" + '</BR>' +
                '<BR>Membership Role:' + Format(IFSCommitteMembers."Role Type") + '</BR>' +
                '<BR>Appointment Effective Date:' + Format(IFSTenderCommitte."Appointment Effective Date") + '</BR>' +
                '<BR>Invitation For Supply No:' + IFSCommitteMembers."IFS Code" + '</BR>' +
                '<BR>Tender Name:' + IFSTenderCommitte."Tender Name" + '</BR>' +
                '<BR>Appointing Authority:' + IFSTenderCommitte."Appointing Authority" + '</BR>';
                LoginDetails := 'Attached herein, please find an e-copy of Tender Evaluation Summary';


                ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";

                EvaluationRegister.Reset;
                EvaluationRegister.SetRange(Code, evaluationHeaader.Code);
                if EvaluationRegister.FindSet then
                    FileDirectory := 'C:\DOCS\';
                FileName := 'BidEvaluation_' + evaluationHeaader.Code + '.pdf';
                ////Report.SaveAsPdf(70042, FileDirectory + FileName, EvaluationRegister);

                if CustEmail = '' then
                    exit;

                //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                emailhdr := 'Tender/Procurement Evaluation Summary (Reference No: ' + evaluationHeaader.Code + ')';

                // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
                // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

                // cu400.AddCC(RequesterEmail);

                // cu400.AppendToBody(ProcNote);

                // cu400.AddAttachment(FileDirectory + FileName, FileName);
                // cu400.Send;
                SendingDate := Today;
                SendingTime := Time;

                IFSCommitteMembers."Notified on Email" := true;
                IFSCommitteMembers."Date/Time Notified" := CurrentDatetime;
                IFSCommitteMembers.Modify(true);


                Sleep(1000);
                Window.Close;

            until IFSCommitteMembers.Next = 0;
        end;
    end;


    procedure SuggestFinalEvalReport(FinalEvalReport: Record "Bid Tabulation Header")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        FinanceLine: Record "Finance Evaluation Line";
        FinalEvalLine: Record "Bid Tabulation Line";
        EvaluationHeader: Record "Bid Evaluation Register";
    begin


        //Generate Final Evaluation Report
        EvaluationHeader.Reset;
        EvaluationHeader.SetRange(Code, FinalEvalReport."Financial Evaluation ID");
        if EvaluationHeader.FindSet then begin
            //FinalEvalReport.INIT;
            FinalEvalReport."Document Type" := FinalEvalReport."document type"::"Evaluation Report";
            FinalEvalReport."IFS Code" := EvaluationHeader."IFS Code";
            FinalEvalReport."Document Date" := EvaluationHeader."Evaluation Date";
            FinalEvalReport.Description := 'Final Tender evaluation Report' + EvaluationHeader."IFS Code";
            IFS.Reset;
            IFS.SetRange(Code, EvaluationHeader."IFS Code");
            if IFS.FindSet then begin
                FinalEvalReport."Tender Name" := IFS."Tender Name";
            end;
            FinalEvalReport."Raised By" := EvaluationHeader."Evaluation Lead";
            FinalEvalReport.Name := EvaluationHeader."Evaluation Lead Name";
            FinalEvalReport."Tender Committee Role" := FinalEvalReport."tender committee role"::Chairperson;
            FinalEvalReport."Bid Opening Date" := EvaluationHeader."Bid Opening Date";
            FinalEvalReport."Evaluation Completion Date" := EvaluationHeader."Evaluation Date";
            FinalEvalReport.Validate(FinalEvalReport."Appointed Bid Opening Comm", EvaluationHeader."Bid Opening Register No.");
            FinalEvalReport.Validate(FinalEvalReport."Appointed Bid Evaluation Com", EvaluationHeader."Bid Scoring Document No.");
            FinalEvalReport."Primary Region" := EvaluationHeader."Primary Region";
            if FinalEvalReport.Modify(true) then begin
                FinanceLine.Reset;
                FinanceLine.SetRange("Document ID", EvaluationHeader.Code);
                if FinanceLine.FindSet then begin
                    repeat
                        FinalEvalLine.Init;
                        FinalEvalLine."Tabulation ID" := FinalEvalReport.Code;
                        FinalEvalLine."Tabulation Type" := FinalEvalLine."tabulation type"::"Evaluation Report";
                        FinalEvalLine."Document Type" := FinalEvalLine."document type"::Quote;
                        FinalEvalLine."No." := FinanceLine."No.";
                        FinalEvalLine."Bidder Name" := FinanceLine."Bidder Name";
                        FinalEvalLine."Bidder No" := FinanceLine."Bidder No";
                        FinalEvalLine."Invitation For Supply No" := FinanceLine."Invitation For Supply No";
                        FinalEvalLine."Bid Currency Code" := FinanceLine."Bid Currency Code";
                        // FinalEvalLine.ReFinanceLine."Read-out Bid Price (A)"
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Responsive Bid" := FinanceLine."Responsive Bid";
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Passed Tech Evaluation" := FinanceLine."Passed Tech Evaluation";
                        FinalEvalLine."Tech Evaluation Ranking" := FinanceLine."Tech Evaluation Ranking";
                        //FinalEvalLine.  IFSDetails."Bid Opening Finance Register"
                        //FinalEvalLine."Bid Opening Date":=FinanceLine.ope
                        //FinalEvalLine.finaIFSDetails."Financial Eval Register No"
                        FinalEvalLine."Financial Evaluation Date" := FinanceLine."Financial Evaluation Date";
                        FinalEvalLine."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                        FinalEvalLine."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                        FinalEvalLine."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price";
                        FinalEvalLine."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                        FinalEvalLine."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                        FinalEvalLine."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                        FinalEvalLine."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                        FinalEvalLine."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                        FinalEvalLine."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                        FinalEvalLine."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                        FinalEvalLine."Financial Evaluation Comm Rem" := FinanceLine."Evaluation Committee Remarks";
                        FinalEvalLine."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                        IFSDetails.Reset;
                        IFSDetails.SetRange(Code, EvaluationHeader."IFS Code");
                        IFSDetails.SetRange("Vendor No.", Bids."Buy-from Vendor No.");
                        if IFSDetails.FindSet then begin
                            FinalEvalLine."Pre-bid Register No." := IFSDetails."Prebid Register No.";
                            FinalEvalLine."Prebid Conference Date" := IFSDetails."Prebid Meeting Date";
                            FinalEvalLine."Bid Opening Date" := IFSDetails."Bid Opening Date (Technical)";
                            FinalEvalLine."Bid Opening Committee Remarks" := IFSDetails."Bid Opening Committee Remarks";
                            FinalEvalLine."Bid Opening Date (Financial)" := IFSDetails."Bid Opening Date (Financial)";
                            FinalEvalLine."Bid Opening Finance Register" := IFSDetails."Bid Opening Finance Register";
                            FinalEvalLine."Bid Opening Register No." := IFSDetails."Bid Opening Register No.";
                            FinalEvalLine."Bid Opening Result" := IFSDetails."Bid Opening Result";
                            FinalEvalLine."Preliminary Evaluation Date" := IFSDetails."Preliminary Evaluation Date";
                            FinalEvalLine."Preliminary Evaluation Outcome" := IFSDetails."Preliminary Evaluation Outcome";
                            FinalEvalLine."Preliminary Evaluation Reg" := IFSDetails."Preliminary Evaluation Reg";
                            FinalEvalLine."Preminary Evaluation Committee" := IFSDetails."Preminary Evaluation Committee";
                            //FinalEvalLine."Tech Evaluation Ranking":=IFSDetails.;
                            FinalEvalLine."Technical Evaluation Date" := IFSDetails."Technical Evaluation Date";
                        end;


                        FinalEvalLine.Insert(true);
                    until FinanceLine.Next = 0;

                end;
            end;
            //PAGE.RUN(75274,FinalEvalReport)
        end;
    end;

    procedure PostFinalEvaluationReport(FinalEvalReport: Record "Bid Tabulation Header")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        FinanceLine: Record "Bid Tabulation Line";
        FinalEvalLine: Record "Bid Tabulation Line";
        FinalEvalReport1: Record "Bid Tabulation Header";
        UserSetups: Record "User Setup";
    begin

        FinalEvalReport.TestField("General Procurement Remarks");





        FinalEvalLine.Reset;
        FinalEvalLine.SetRange("Tabulation ID", FinalEvalReport.Code);
        if FinalEvalLine.FindSet then begin
            repeat
                //awarded winner Details
                if FinalEvalLine."Evaluation Committee Recomm" = FinalEvalLine."evaluation committee recomm"::Awarded then begin
                    FinalEvalReport."Awarded Bid No" := FinalEvalLine."No.";
                    FinalEvalReport."Awarded Bidder No." := FinalEvalLine."Bidder No";
                    FinalEvalReport."Awarded Bidder Name" := FinalEvalLine."Bidder Name";
                    FinalEvalReport."Award Tender Sum Inc Taxes" := FinalEvalLine."Final Evaluated Bid Price";
                    FinalEvalReport."AGPO Category" := FinalEvalLine."AGPO Category";
                    FinalEvalReport."AGPO Certficate Number" := FinalEvalLine."AGPO Certficate Number";
                    FinalEvalReport.Manufacturer := FinalEvalLine.Manufacturer;
                    FinalEvalReport.Country := FinalEvalLine.Country;
                    FinalEvalReport.Classification := FinalEvalLine.Classification;


                end;

                Bids.Reset;
                Bids.SetRange("No.", FinalEvalLine."No.");
                Bids.SetRange("IFS Code", FinalEvalReport."IFS Code");
                if Bids.FindSet then begin

                    Bids."Final Evaluation Report" := FinalEvalReport.Code;
                    Bids."Final Evaluation Report Date" := FinalEvalReport."Document Date";
                    Bids.Modify(true);

                    IFSDetails.Reset;
                    IFSDetails.SetRange(Code, FinalEvalReport."IFS Code");
                    IFSDetails.SetRange("Vendor No.", FinalEvalLine."Bidder No");
                    IFSDetails.SetRange("Bid No.", FinalEvalLine."No.");
                    if IFSDetails.FindSet then begin
                        IFSDetails."Final Evaluation Report" := FinalEvalReport.Code;
                        IFSDetails."Final Evaluation Date" := FinalEvalReport."Document Date";
                        ;

                        IFSDetails.Modify(true);
                    end;
                end;
                if not FinalEvalLine.Insert then
                    FinalEvalLine.Modify(true);
            until FinalEvalLine.Next = 0;
        end;




        // ProcuremnetSetup.GET;
        // IF ProcuremnetSetup."Notify Committe Members"=TRUE THEN
        // FnSendBidTabulationNotification(FinalEvalReport);

        IFS.Reset;
        IFS.SetRange(Code, FinalEvalReport."IFS Code");
        if IFS.FindSet then
            IFS."Document Status" := IFS."document status"::Evaluation;
        IFS.Modify(true);


        //Generate PP
        FinalEvalReport1.Reset;
        FinalEvalReport1.SetRange("IFS Code", FinalEvalReport."IFS Code");
        FinalEvalReport1.SetRange("Document Type", FinalEvalReport."document type"::"Professional Opinion");
        if not FinalEvalReport1.FindSet then begin
            FinalEvalReport1.Init;
            FinalEvalReport1."Document Type" := FinalEvalReport."document type"::"Professional Opinion";
            FinalEvalReport1."IFS Code" := FinalEvalReport."IFS Code";
            FinalEvalReport1."Document Date" := FinalEvalReport."Document Date";
            FinalEvalReport1."Final Evaluation Report ID" := FinalEvalReport.Code;
            FinalEvalReport1."Award Type" := FinalEvalReport."Award Type";
            FinalEvalReport1."Finance Bid Evaluation Registe" := FinalEvalReport."Finance Bid Evaluation Registe";
            FinalEvalReport1.Description := 'Proffesion Opinion: ' + FinalEvalReport."IFS Code";
            FinalEvalReport1."Tender Name" := FinalEvalReport."Tender Name";
            if UserSetups.Get(UserId) then begin
                FinalEvalReport1."Raised By" := UserSetups."Employee No.";
                FinalEvalReport1.Name := UserSetups."Employee Name";
            end;
            FinalEvalReport1."Tender Committee Role" := FinalEvalReport."tender committee role"::Chairperson;
            FinalEvalReport1."Bid Opening Date" := FinalEvalReport."Bid Opening Date";
            FinalEvalReport1."Evaluation Completion Date" := FinalEvalReport."Evaluation Completion Date";
            FinalEvalReport1."Appointed Bid Opening Comm" := FinalEvalReport."Appointed Bid Opening Comm";
            FinalEvalReport1."Appointed Bid Evaluation Com" := FinalEvalReport."Appointed Bid Evaluation Com";
            FinalEvalReport1."Primary Region" := FinalEvalReport."Primary Region";
            FinalEvalReport1."Procurement Officer License No" := FinalEvalReport."Procurement Officer License No";
            FinalEvalReport1."Procurement Method" := IFS."Solicitation Type";
            FinalEvalReport1."Annual Procurement Plan ID" := IFS."Procurement Plan ID";
            //FinalEvalReport1."Procurement Plan Date":=IFS.
            FinalEvalReport1."Financial Year Code" := IFS."Financial Year Code";
            FinalEvalReport1."Procurement Plan Line No." := IFS."Procurement Plan Line No.";
            FinalEvalReport1."Procurement Plan Entry No" := IFS."Procurement Plan Entry No";
            FinalEvalReport1."Available Procurement Budget" := IFS."Available Procurement Budget";
            FinalEvalReport1."Budget Narration" := IFS."Budget Narration";
            if not FinalEvalReport1.Insert(true) then
                FinalEvalReport1.Modify(true);
            begin
                FinalEvalReport1.Validate(FinalEvalReport1."Appointed Bid Opening Comm");
                FinalEvalReport1.Validate(FinalEvalReport1."Appointed Bid Evaluation Com");

                //
                FinanceLine.Reset;
                FinanceLine.SetRange("Tabulation ID", FinalEvalReport.Code);
                if FinanceLine.FindSet then begin
                    repeat
                        FinalEvalLine.Init;
                        FinalEvalLine."Tabulation ID" := FinalEvalReport1.Code;
                        FinalEvalLine."Tabulation Type" := FinalEvalLine."tabulation type"::"Professional Opinion";
                        FinalEvalLine."Document Type" := FinalEvalLine."document type"::Quote;
                        FinalEvalLine."No." := FinanceLine."No.";
                        FinalEvalLine."Bidder Name" := FinanceLine."Bidder Name";
                        FinalEvalLine."Bidder No" := FinanceLine."Bidder No";
                        FinalEvalLine."Invitation For Supply No" := FinanceLine."Invitation For Supply No";
                        FinalEvalLine."Bid Currency Code" := FinanceLine."Bid Currency Code";
                        FinalEvalLine."Bid Submission No" := FinanceLine."Bid Submission No";
                        // FinalEvalLine.ReFinanceLine."Read-out Bid Price (A)"
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Responsive Bid" := FinanceLine."Responsive Bid";
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Passed Tech Evaluation" := FinanceLine."Passed Tech Evaluation";
                        FinalEvalLine."Tech Evaluation Ranking" := FinanceLine."Tech Evaluation Ranking";
                        //FinalEvalLine.  IFSDetails."Bid Opening Finance Register"
                        //FinalEvalLine."Bid Opening Date":=FinanceLine.ope
                        //FinalEvalLine.finaIFSDetails."Financial Eval Register No"

                        FinalEvalLine."Financial Evaluation Date" := FinanceLine."Financial Evaluation Date";
                        FinalEvalLine."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                        FinalEvalLine."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                        FinalEvalLine."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price (C=A+B)";
                        FinalEvalLine."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                        FinalEvalLine."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                        FinalEvalLine."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                        FinalEvalLine."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                        FinalEvalLine."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                        FinalEvalLine."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                        FinalEvalLine."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                        FinalEvalLine."Evaluation Committee Remarks" := FinanceLine."Evaluation Committee Remarks";
                        FinalEvalLine."Financial Evaluation Comm Rem" := FinanceLine."Financial Evaluation Comm Rem";
                        FinalEvalLine."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                        FinalEvalLine."Pre-bid Register No." := FinanceLine."Pre-bid Register No.";
                        FinalEvalLine."Prebid Conference Date" := FinanceLine."Prebid Conference Date";
                        FinalEvalLine."Bid Opening Date" := FinanceLine."Bid Opening Date";
                        FinalEvalLine."Bid Opening Committee Remarks" := FinanceLine."Bid Opening Committee Remarks";
                        FinalEvalLine."Bid Opening Date (Financial)" := FinanceLine."Bid Opening Date (Financial)";
                        FinalEvalLine."Bid Opening Finance Register" := FinanceLine."Bid Opening Finance Register";
                        FinalEvalLine."Bid Opening Register No." := FinanceLine."Bid Opening Register No.";
                        FinalEvalLine."AGPO Category" := FinanceLine."AGPO Category";
                        FinalEvalLine."AGPO Certficate Number" := FinanceLine."AGPO Certficate Number";
                        FinalEvalLine.Manufacturer := FinanceLine.Manufacturer;
                        FinalEvalLine.Country := FinanceLine.Country;
                        FinalEvalLine.Classification := FinanceLine.Classification;
                        FinalEvalLine."Bid Opening Result" := FinanceLine."Bid Opening Result";
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Preliminary Evaluation Outcome" := FinanceLine."Preliminary Evaluation Outcome";
                        FinalEvalLine."Preliminary Evaluation Reg" := FinanceLine."Preliminary Evaluation Reg";
                        FinalEvalLine."Preminary Evaluation Committee" := FinanceLine."Preminary Evaluation Committee";
                        //FinalEvalLine."Tech Evaluation Ranking":=IFSDetails.;
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        if FinanceLine."Evaluation Committee Recomm" = FinanceLine."evaluation committee recomm"::Awarded then begin
                            FinalEvalReport1."Awarded Bid No" := FinanceLine."No.";
                            FinalEvalReport1."Awarded Bidder No." := FinanceLine."Bidder No";
                            FinalEvalReport1."Awarded Bidder Name" := FinanceLine."Bidder Name";
                            FinalEvalReport1."Award Tender Sum Inc Taxes" := FinanceLine."Final Evaluated Bid Price";
                            FinalEvalReport1.Modify;
                        end;
                        // MESSAGE('opinion generated ');


                        FinalEvalLine.Insert(true);
                    until FinanceLine.Next = 0;

                end;
            end;
            Page.Run(75278, FinalEvalReport1);
        end else
            Page.Run(75278, FinalEvalReport1);

        FinalEvalReport.Posted := true;
        FinalEvalReport."Posted By" := UserId;
        FinalEvalReport."Posted Date" := Today;
        FinalEvalReport."Opinion Generated" := true;
        FinalEvalReport.Modify(true);
    end;

    procedure PostFinalEvaluationReport33(FinalEvalReport: Record "Bid Tabulation Header")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        FinanceLine: Record "Bid Tabulation Line";
        FinalEvalLine: Record "Bid Tabulation Line";
        FinalEvalReport1: Record "Bid Tabulation Header";
    begin

        FinalEvalReport.TestField("General Procurement Remarks");



        FinalEvalReport.Posted := true;
        FinalEvalReport."Posted By" := UserId;
        FinalEvalReport."Posted Date" := Today;

        FinalEvalLine.Reset;
        FinalEvalLine.SetRange("Tabulation ID", FinalEvalReport.Code);
        if FinalEvalLine.FindSet then begin
            repeat
                //awarded winner Details
                if FinalEvalLine."Evaluation Committee Recomm" = FinalEvalLine."evaluation committee recomm"::Awarded then begin
                    FinalEvalReport."Awarded Bid No" := FinalEvalLine."No.";
                    FinalEvalReport."Awarded Bidder No." := FinalEvalLine."Bidder No";
                    FinalEvalReport."Awarded Bidder Name" := FinalEvalLine."Bidder Name";
                    FinalEvalReport."Award Tender Sum Inc Taxes" := FinalEvalLine."Final Evaluated Bid Price";


                end;

                Bids.Reset;
                Bids.SetRange("No.", FinalEvalLine."No.");
                Bids.SetRange("IFS Code", FinalEvalReport."IFS Code");
                if Bids.FindSet then begin

                    Bids."Final Evaluation Report" := FinalEvalReport.Code;
                    Bids."Final Evaluation Report Date" := FinalEvalReport."Document Date";
                    Bids.Modify(true);

                    IFSDetails.Reset;
                    IFSDetails.SetRange(Code, FinalEvalReport."IFS Code");
                    IFSDetails.SetRange("Vendor No.", FinalEvalLine."Bidder No");
                    IFSDetails.SetRange("Bid No.", FinalEvalLine."No.");
                    if IFSDetails.FindSet then begin
                        IFSDetails."Final Evaluation Report" := FinalEvalReport.Code;
                        IFSDetails."Final Evaluation Date" := FinalEvalReport."Document Date";
                        ;
                        IFSDetails.Modify(true);
                    end;
                end;
            until FinalEvalLine.Next = 0;
        end;




        ProcuremnetSetup.Get;
        if ProcuremnetSetup."Notify Committe Members" = true then
            FnSendBidTabulationNotification(FinalEvalReport);

        IFS.Reset;
        IFS.SetRange(Code, FinalEvalReport."IFS Code");
        if IFS.FindSet then begin
            IFS."Document Status" := IFS."document status"::Evaluation;
            IFS.Modify;
        end;

        //Generate PP
        FinalEvalReport1.Reset;
        FinalEvalReport1.SetRange("IFS Code", FinalEvalReport."IFS Code");
        FinalEvalReport1.SetRange("Document Type", FinalEvalReport."document type"::"Professional Opinion");
        if not FinalEvalReport1.FindSet then begin
            FinalEvalReport1.Init;
            FinalEvalReport1."Document Type" := FinalEvalReport."document type"::"Professional Opinion";
            FinalEvalReport1."IFS Code" := FinalEvalReport."IFS Code";
            FinalEvalReport1."Document Date" := FinalEvalReport."Document Date";
            FinalEvalReport1."Final Evaluation Report ID" := FinalEvalReport.Code;
            FinalEvalReport1.Description := 'Proffesion Opinion: ' + FinalEvalReport."IFS Code";
            FinalEvalReport1."Tender Name" := FinalEvalReport."Tender Name";
            FinalEvalReport1."Raised By" := FinalEvalReport."Raised By";
            FinalEvalReport1.Name := FinalEvalReport.Name;
            FinalEvalReport1."Tender Committee Role" := FinalEvalReport."tender committee role"::Chairperson;
            FinalEvalReport1."Bid Opening Date" := FinalEvalReport."Bid Opening Date";
            FinalEvalReport1."Evaluation Completion Date" := FinalEvalReport."Evaluation Completion Date";
            FinalEvalReport1.Validate(FinalEvalReport1."Appointed Bid Opening Comm", FinalEvalReport."Appointed Bid Opening Comm");
            FinalEvalReport1.Validate(FinalEvalReport1."Appointed Bid Evaluation Com", FinalEvalReport."Appointed Bid Evaluation Com");
            FinalEvalReport1."Primary Region" := FinalEvalReport."Primary Region";
            if FinalEvalReport1.Insert(true) then begin
                FinanceLine.Reset;
                FinanceLine.SetRange("Tabulation ID", FinalEvalReport.Code);
                if FinanceLine.FindSet then begin
                    repeat
                        FinalEvalLine.Init;
                        FinalEvalLine."Tabulation ID" := FinalEvalReport1.Code;
                        FinalEvalLine."Tabulation Type" := FinalEvalLine."tabulation type"::"Professional Opinion";
                        FinalEvalLine."Document Type" := FinalEvalLine."document type"::Quote;
                        FinalEvalLine."No." := FinanceLine."No.";
                        FinalEvalLine."Bidder Name" := FinanceLine."Bidder Name";
                        FinalEvalLine."Bidder No" := FinanceLine."Bidder No";
                        FinalEvalLine."Invitation For Supply No" := FinanceLine."Invitation For Supply No";
                        FinalEvalLine."Bid Currency Code" := FinanceLine."Bid Currency Code";
                        // FinalEvalLine.ReFinanceLine."Read-out Bid Price (A)"
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Responsive Bid" := FinanceLine."Responsive Bid";
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Passed Tech Evaluation" := FinanceLine."Passed Tech Evaluation";
                        FinalEvalLine."Tech Evaluation Ranking" := FinanceLine."Tech Evaluation Ranking";
                        //FinalEvalLine.  IFSDetails."Bid Opening Finance Register"
                        //FinalEvalLine."Bid Opening Date":=FinanceLine.ope
                        //FinalEvalLine.finaIFSDetails."Financial Eval Register No"
                        FinalEvalLine."Financial Evaluation Date" := FinanceLine."Financial Evaluation Date";
                        FinalEvalLine."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                        FinalEvalLine."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                        FinalEvalLine."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price (C=A+B)";
                        FinalEvalLine."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                        FinalEvalLine."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                        FinalEvalLine."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                        FinalEvalLine."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                        FinalEvalLine."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                        FinalEvalLine."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                        FinalEvalLine."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                        FinalEvalLine."Financial Evaluation Comm Rem" := FinanceLine."Financial Evaluation Comm Rem";
                        FinalEvalLine."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                        FinalEvalLine."Pre-bid Register No." := FinanceLine."Pre-bid Register No.";
                        FinalEvalLine."Prebid Conference Date" := FinanceLine."Prebid Conference Date";
                        FinalEvalLine."Bid Opening Date" := FinanceLine."Bid Opening Date";
                        FinalEvalLine."Bid Opening Committee Remarks" := FinanceLine."Bid Opening Committee Remarks";
                        FinalEvalLine."Bid Opening Date (Financial)" := FinanceLine."Bid Opening Date (Financial)";
                        FinalEvalLine."Bid Opening Finance Register" := FinanceLine."Bid Opening Finance Register";
                        FinalEvalLine."Bid Opening Register No." := FinanceLine."Bid Opening Register No.";
                        FinalEvalLine."Bid Opening Result" := FinanceLine."Bid Opening Result";
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Preliminary Evaluation Outcome" := FinanceLine."Preliminary Evaluation Outcome";
                        FinalEvalLine."Preliminary Evaluation Reg" := FinanceLine."Preliminary Evaluation Reg";
                        FinalEvalLine."Preminary Evaluation Committee" := FinanceLine."Preminary Evaluation Committee";
                        //FinalEvalLine."Tech Evaluation Ranking":=IFSDetails.;
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        if FinanceLine."Evaluation Committee Recomm" = FinanceLine."evaluation committee recomm"::Awarded then begin
                            FinalEvalReport1."Awarded Bid No" := FinanceLine."No.";
                            FinalEvalReport1."Awarded Bidder No." := FinanceLine."Bidder No";
                            FinalEvalReport1."Awarded Bidder Name" := FinanceLine."Bidder Name";
                            FinalEvalReport1."Award Tender Sum Inc Taxes" := FinanceLine."Final Evaluated Bid Price";
                            FinalEvalReport1.Modify;
                        end;


                        FinalEvalLine.Insert(true);
                    until FinanceLine.Next = 0;

                end;
            end;
            Page.Run(75278, FinalEvalReport1)
        end else
            Page.Run(75278, FinalEvalReport1)
    end;


    procedure SuggestProffesionOpinion(FinalEvalReport1: Record "Bid Tabulation Header")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        FinanceLine: Record "Bid Tabulation Line";
        FinalEvalLine: Record "Bid Tabulation Line";
        EvaluationHeader: Record "Bid Evaluation Register";
        FinalEvalReport: Record "Bid Tabulation Header";
    begin
        //Generate PP
        FinalEvalReport.Reset;
        FinalEvalReport.SetRange(Code, FinalEvalReport1."Final Evaluation Report ID");
        //FinalEvalReport1.SETRANGE("Document Type",FinalEvalReport."Document Type"::"Professional Opinion");
        if FinalEvalReport.FindSet then begin
            //FinalEvalReport1.INIT;

            FinalEvalReport1."Document Type" := FinalEvalReport."document type"::"Professional Opinion";
            FinalEvalReport1."IFS Code" := FinalEvalReport."IFS Code";
            FinalEvalReport1."Document Date" := FinalEvalReport."Document Date";
            FinalEvalReport1."Financial Evaluation ID" := FinalEvalReport.Code;
            FinalEvalReport1.Description := 'Proffesion Opinion: ' + FinalEvalReport."IFS Code";
            FinalEvalReport1."Tender Name" := FinalEvalReport."Tender Name";
            FinalEvalReport1."Raised By" := FinalEvalReport."Raised By";
            FinalEvalReport1.Name := FinalEvalReport.Name;
            FinalEvalReport1."Tender Committee Role" := FinalEvalReport."tender committee role"::Chairperson;
            FinalEvalReport1."Bid Opening Date" := FinalEvalReport."Bid Opening Date";
            FinalEvalReport1."Evaluation Completion Date" := FinalEvalReport."Evaluation Completion Date";
            FinalEvalReport1.Validate(FinalEvalReport1."Appointed Bid Opening Comm", FinalEvalReport."Appointed Bid Opening Comm");
            FinalEvalReport1.Validate(FinalEvalReport1."Appointed Bid Evaluation Com", FinalEvalReport."Appointed Bid Evaluation Com");
            FinalEvalReport1."Primary Region" := FinalEvalReport."Primary Region";
            IFS.Reset;
            IFS.SetRange(Code, FinalEvalReport."IFS Code");
            if IFS.FindSet then begin
                FinalEvalReport1."Annual Procurement Plan ID" := IFS."Procurement Plan ID";
                //FinalEvalReport1."Procurement Plan Date":=IFS.
                FinalEvalReport1."Financial Year Code" := IFS."Financial Year Code";
                FinalEvalReport1."Procurement Plan Line No." := IFS."Procurement Plan Line No.";
                FinalEvalReport1."Procurement Plan Entry No" := IFS."Procurement Plan Entry No";
                FinalEvalReport1."Available Procurement Budget" := IFS."Available Procurement Budget";
                FinalEvalReport1."Budget Narration" := IFS."Budget Narration";
            end;
            if FinalEvalReport1.Modify(true) then begin
                FinanceLine.Reset;
                FinanceLine.SetRange("Tabulation ID", FinalEvalReport.Code);
                if FinanceLine.FindSet then begin
                    repeat
                        FinalEvalLine.Init;
                        FinalEvalLine."Tabulation ID" := FinalEvalReport1.Code;
                        FinalEvalLine."Tabulation Type" := FinalEvalLine."tabulation type"::"Professional Opinion";
                        FinalEvalLine."Document Type" := FinalEvalLine."document type"::Quote;
                        FinalEvalLine."No." := FinanceLine."No.";
                        FinalEvalLine."Bidder Name" := FinanceLine."Bidder Name";
                        FinalEvalLine."Bidder No" := FinanceLine."Bidder No";
                        FinalEvalLine."Invitation For Supply No" := FinanceLine."Invitation For Supply No";
                        FinalEvalLine."Bid Currency Code" := FinanceLine."Bid Currency Code";
                        // FinalEvalLine.ReFinanceLine."Read-out Bid Price (A)"
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Responsive Bid" := FinanceLine."Responsive Bid";
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Passed Tech Evaluation" := FinanceLine."Passed Tech Evaluation";
                        FinalEvalLine."Tech Evaluation Ranking" := FinanceLine."Tech Evaluation Ranking";
                        //FinalEvalLine.  IFSDetails."Bid Opening Finance Register"
                        //FinalEvalLine."Bid Opening Date":=FinanceLine.ope
                        //FinalEvalLine.finaIFSDetails."Financial Eval Register No"
                        FinalEvalLine."Financial Evaluation Date" := FinanceLine."Financial Evaluation Date";
                        FinalEvalLine."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                        FinalEvalLine."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                        FinalEvalLine."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price (C=A+B)";
                        FinalEvalLine."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                        FinalEvalLine."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                        FinalEvalLine."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                        FinalEvalLine."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                        FinalEvalLine."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                        FinalEvalLine."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                        FinalEvalLine."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                        FinalEvalLine."Financial Evaluation Comm Rem" := FinanceLine."Financial Evaluation Comm Rem";
                        FinalEvalLine."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                        FinalEvalLine."Pre-bid Register No." := FinanceLine."Pre-bid Register No.";
                        FinalEvalLine."Prebid Conference Date" := FinanceLine."Prebid Conference Date";
                        FinalEvalLine."Bid Opening Date" := FinanceLine."Bid Opening Date";
                        FinalEvalLine."Bid Opening Committee Remarks" := FinanceLine."Bid Opening Committee Remarks";
                        FinalEvalLine."Bid Opening Date (Financial)" := FinanceLine."Bid Opening Date (Financial)";
                        FinalEvalLine."Bid Opening Finance Register" := FinanceLine."Bid Opening Finance Register";
                        FinalEvalLine."Bid Opening Register No." := FinanceLine."Bid Opening Register No.";
                        FinalEvalLine."Bid Opening Result" := FinanceLine."Bid Opening Result";
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Preliminary Evaluation Outcome" := FinanceLine."Preliminary Evaluation Outcome";
                        FinalEvalLine."Preliminary Evaluation Reg" := FinanceLine."Preliminary Evaluation Reg";
                        FinalEvalLine."Preminary Evaluation Committee" := FinanceLine."Preminary Evaluation Committee";
                        //FinalEvalLine."Tech Evaluation Ranking":=IFSDetails.;
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";



                        FinalEvalLine.Insert(true);
                    until FinanceLine.Next = 0;

                end;
            end;
            //PAGE.RUN(75278,FinalEvalReport)
        end;
    end;

    procedure PostProffesionOpinion(FinalEvalReport: Record "Bid Tabulation Header")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        FinanceLine: Record "Bid Tabulation Line";
        FinalEvalLine: Record "Bid Tabulation Line";
        FinalEvalReport1: Record "Bid Tabulation Header";
    begin
        FinalEvalLine.Reset;
        FinalEvalLine.SetRange("Tabulation ID", FinalEvalReport.Code);
        if FinalEvalLine.FindSet then begin
            repeat


                Bids.Reset;
                Bids.SetRange("No.", FinalEvalLine."No.");
                Bids.SetRange("IFS Code", FinalEvalReport."IFS Code");
                if Bids.FindSet then begin

                    Bids."Proffesion Opinion No" := FinalEvalReport.Code;
                    Bids."Proffesion Opinion Date" := FinalEvalReport."Document Date";
                    Bids.Modify(true);

                    IFSDetails.Reset;
                    IFSDetails.SetRange(Code, FinalEvalReport."IFS Code");
                    IFSDetails.SetRange("Vendor No.", FinalEvalLine."Bidder No");
                    IFSDetails.SetRange("Bid No.", FinalEvalLine."No.");
                    if IFSDetails.FindSet then begin
                        IFSDetails."Professional Opion ID" := FinalEvalReport.Code;
                        IFSDetails."Professional Opion Date" := FinalEvalReport."Document Date";
                        IFSDetails.Modify(true);
                    end;
                end;
            until FinalEvalLine.Next = 0;
        end;




        //    ProcuremnetSetup.GET;
        //    IF ProcuremnetSetup."Notify Committe Members"=TRUE THEN
        //    FnSendBidTabulationNotification(FinalEvalReport);

        IFS.Reset;
        IFS.SetRange(Code, FinalEvalReport."IFS Code");
        if IFS.FindSet then begin
            IFS."Document Status" := IFS."document status"::Evaluation;
            IFS.Modify;
        end;

        //Generate PP
        FinalEvalReport1.reset;
        if FinalEvalReport1.FindSet() then
            LineNo := FinalEvalReport1.count + 1;
        FinalEvalReport1.Reset;
        FinalEvalReport1.SetRange("IFS Code", FinalEvalReport."IFS Code");
        FinalEvalReport1.SetRange("Document Type", FinalEvalReport."document type"::"Notice of Award");
        if not FinalEvalReport1.FindSet then begin
            FinalEvalReport1.Init;
            FinalEvalReport1."Line No" := LineNo;
            FinalEvalReport1."Document Type" := FinalEvalReport."document type"::"Notice of Award";
            FinalEvalReport1."IFS Code" := FinalEvalReport."IFS Code";
            FinalEvalReport1."Document Date" := FinalEvalReport."Document Date";
            FinalEvalReport1."Final Evaluation Report ID" := FinalEvalReport."Final Evaluation Report ID";
            FinalEvalReport1."Professional Opinion ID" := FinalEvalReport.Code;
            FinalEvalReport1.Description := 'Notice of Award: ' + FinalEvalReport."IFS Code";
            FinalEvalReport1."Award Type" := FinalEvalReport."Award Type";
            FinalEvalReport1."Finance Bid Evaluation Registe" := FinalEvalReport."Finance Bid Evaluation Registe";
            FinalEvalReport1."Tender Name" := FinalEvalReport."Tender Name";
            FinalEvalReport1."Raised By" := FinalEvalReport."Raised By";
            FinalEvalReport1.Name := FinalEvalReport.Name;
            FinalEvalReport1."Tender Committee Role" := FinalEvalReport."tender committee role"::Chairperson;
            FinalEvalReport1."Bid Opening Date" := FinalEvalReport."Bid Opening Date";
            FinalEvalReport1."Evaluation Completion Date" := FinalEvalReport."Evaluation Completion Date";
            FinalEvalReport1.Validate(FinalEvalReport1."Appointed Bid Opening Comm", FinalEvalReport."Appointed Bid Opening Comm");
            FinalEvalReport1.Validate(FinalEvalReport1."Appointed Bid Evaluation Com", FinalEvalReport."Appointed Bid Evaluation Com");
            FinalEvalReport1."Professional Opinion ID" := FinalEvalReport."Professional Opinion ID";
            FinalEvalReport1."Final Evaluation Report ID" := FinalEvalReport."Final Evaluation Report ID";
            FinalEvalReport1."Primary Region" := FinalEvalReport."Primary Region";
            FinalEvalReport1."AGPO Category" := FinalEvalReport."AGPO Category";
            FinalEvalReport1."AGPO Certficate Number" := FinalEvalReport."AGPO Certficate Number";
            FinalEvalReport1.Classification := FinalEvalReport.Classification;
            FinalEvalReport1.Manufacturer := FinalEvalReport.Manufacturer;
            FinalEvalReport1.Country := FinalEvalReport.Country;

            IFS.Reset;
            IFS.SetRange(Code, FinalEvalReport."IFS Code");
            if IFS.FindSet then begin
                FinalEvalReport1."Annual Procurement Plan ID" := IFS."Procurement Plan ID";
                //FinalEvalReport1."Procurement Plan Date":=IFS.
                FinalEvalReport1."Financial Year Code" := IFS."Financial Year Code";
                FinalEvalReport1."Procurement Plan Line No." := IFS."Procurement Plan Line No.";
                FinalEvalReport1."Procurement Plan Entry No" := IFS."Procurement Plan Entry No";
                FinalEvalReport1."Available Procurement Budget" := IFS."Available Procurement Budget";
                FinalEvalReport1."Budget Narration" := IFS."Budget Narration";
            end;

            if FinalEvalReport1.Insert(true) then begin
                FinanceLine.Reset;
                FinanceLine.SetRange("Tabulation ID", FinalEvalReport.Code);
                if FinanceLine.FindSet then begin
                    LineNo := FinalEvalLine.count + 1;
                    repeat
                        FinalEvalLine.Init;
                        FinalEvalLine."Line No" := LineNo;
                        FinalEvalLine."Tabulation ID" := FinalEvalReport1.Code;
                        FinalEvalLine."Tabulation Type" := FinalEvalLine."tabulation type"::"Notice of Award";
                        FinalEvalLine."Document Type" := FinalEvalLine."document type"::Quote;
                        FinalEvalLine."No." := FinanceLine."No.";
                        FinalEvalLine."Bidder Name" := FinanceLine."Bidder Name";
                        FinalEvalLine."Bidder No" := FinanceLine."Bidder No";
                        FinalEvalLine."Invitation For Supply No" := FinanceLine."Invitation For Supply No";
                        FinalEvalLine."Bid Currency Code" := FinanceLine."Bid Currency Code";
                        // FinalEvalLine.ReFinanceLine."Read-out Bid Price (A)"
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Responsive Bid" := FinanceLine."Responsive Bid";
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Passed Tech Evaluation" := FinanceLine."Passed Tech Evaluation";
                        FinalEvalLine."Tech Evaluation Ranking" := FinanceLine."Tech Evaluation Ranking";
                        FinalEvalLine."Bid Submission No" := FinanceLine."Bid Submission No";
                        //FinalEvalLine.  IFSDetails."Bid Opening Finance Register"
                        //FinalEvalLine."Bid Opening Date":=FinanceLine.ope
                        //FinalEvalLine.finaIFSDetails."Financial Eval Register No"
                        FinalEvalLine."Financial Evaluation Date" := FinanceLine."Financial Evaluation Date";
                        FinalEvalLine."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                        FinalEvalLine."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                        FinalEvalLine."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price (C=A+B)";
                        FinalEvalLine."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                        FinalEvalLine."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                        FinalEvalLine."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                        FinalEvalLine."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                        FinalEvalLine."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                        FinalEvalLine."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                        FinalEvalLine."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                        FinalEvalLine."Evaluation Committee Remarks" := FinanceLine."Evaluation Committee Remarks";
                        FinalEvalLine."Financial Evaluation Comm Rem" := FinanceLine."Financial Evaluation Comm Rem";
                        FinalEvalLine."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                        FinalEvalLine."Pre-bid Register No." := FinanceLine."Pre-bid Register No.";
                        FinalEvalLine."Prebid Conference Date" := FinanceLine."Prebid Conference Date";
                        FinalEvalLine."Bid Opening Date" := FinanceLine."Bid Opening Date";
                        FinalEvalLine."Bid Opening Committee Remarks" := FinanceLine."Bid Opening Committee Remarks";
                        FinalEvalLine."Bid Opening Date (Financial)" := FinanceLine."Bid Opening Date (Financial)";
                        FinalEvalLine."Bid Opening Finance Register" := FinanceLine."Bid Opening Finance Register";
                        FinalEvalLine."Bid Opening Register No." := FinanceLine."Bid Opening Register No.";
                        FinalEvalLine."Bid Opening Result" := FinanceLine."Bid Opening Result";
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Preliminary Evaluation Outcome" := FinanceLine."Preliminary Evaluation Outcome";
                        FinalEvalLine."Preliminary Evaluation Reg" := FinanceLine."Preliminary Evaluation Reg";
                        FinalEvalLine."AGPO Category" := FinanceLine."AGPO Category";
                        FinalEvalLine."AGPO Certficate Number" := FinanceLine."AGPO Certficate Number";
                        FinalEvalLine.Manufacturer := FinanceLine.Manufacturer;
                        FinalEvalLine.Country := FinanceLine.Country;
                        FinalEvalLine.Classification := FinanceLine.Classification;
                        FinalEvalLine."Preminary Evaluation Committee" := FinanceLine."Preminary Evaluation Committee";
                        //FinalEvalLine."Tech Evaluation Ranking":=IFSDetails.;
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        if FinanceLine."Evaluation Committee Recomm" = FinanceLine."evaluation committee recomm"::Awarded then begin
                            FinalEvalReport1."Awarded Bid No" := FinanceLine."No.";
                            FinalEvalReport1."Awarded Bidder No." := FinanceLine."Bidder No";
                            FinalEvalReport1."Awarded Bidder Name" := FinanceLine."Bidder Name";
                            FinalEvalReport1."Award Tender Sum Inc Taxes" := FinanceLine."Final Evaluated Bid Price";
                            FinalEvalReport1.Modify;
                        end;


                        FinalEvalLine.Insert(true);
                    until FinanceLine.Next = 0;

                end;
            end;
            Page.Run(75281, FinalEvalReport1);
        end else
            Page.Run(75281, FinalEvalReport1);
        FinalEvalReport.Posted := true;
        FinalEvalReport."Notice of Award Generated" := true;
        FinalEvalReport."Posted By" := UserId;
        FinalEvalReport."Posted Date" := Today;
        FinalEvalReport.Modify(true);

    end;

    procedure PostProffesionOpinion33(FinalEvalReport: Record "Bid Tabulation Header")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
        FinanceLine: Record "Bid Tabulation Line";
        FinalEvalLine: Record "Bid Tabulation Line";
        FinalEvalReport1: Record "Bid Tabulation Header";
    begin

        //FinalEvalReport.TESTFIELD("General Procurement Remarks");



        FinalEvalReport.Posted := true;
        FinalEvalReport."Posted By" := UserId;
        FinalEvalReport."Posted Date" := Today;

        FinalEvalLine.Reset;
        FinalEvalLine.SetRange("Tabulation ID", FinalEvalReport.Code);
        if FinalEvalLine.FindSet then begin
            repeat
                //awarded winner Details
                /*IF FinalEvalLine."Evaluation Committee Recomm"=FinalEvalLine."Evaluation Committee Recomm"::Award THEN BEGIN
                  FinalEvalReport."Awarded Bid No":=FinalEvalLine."No.";
                  FinalEvalReport."Awarded Bidder No.":=FinalEvalLine."Bidder No";
                  FinalEvalReport."Awarded Bidder Name":=FinalEvalLine."Bidder Name";
                  FinalEvalReport."Award Tender Sum Inc Taxes":=FinalEvalLine."Final Evaluated Bid Price";


                  END;*/

                Bids.Reset;
                Bids.SetRange("No.", FinalEvalLine."No.");
                Bids.SetRange("IFS Code", FinalEvalReport."IFS Code");
                if Bids.FindSet then begin

                    Bids."Proffesion Opinion No" := FinalEvalReport.Code;
                    Bids."Proffesion Opinion Date" := FinalEvalReport."Document Date";
                    Bids.Modify(true);

                    IFSDetails.Reset;
                    IFSDetails.SetRange(Code, FinalEvalReport."IFS Code");
                    IFSDetails.SetRange("Vendor No.", FinalEvalLine."Bidder No");
                    IFSDetails.SetRange("Bid No.", FinalEvalLine."No.");
                    if IFSDetails.FindSet then begin
                        IFSDetails."Professional Opion ID" := FinalEvalReport.Code;
                        IFSDetails."Professional Opion Date" := FinalEvalReport."Document Date";
                        ;
                        IFSDetails.Modify(true);
                    end;
                end;
            until FinalEvalLine.Next = 0;
        end;




        ProcuremnetSetup.Get;
        if ProcuremnetSetup."Notify Committe Members" = true then
            FnSendBidTabulationNotification(FinalEvalReport);

        IFS.Reset;
        IFS.SetRange(Code, FinalEvalReport."IFS Code");
        if IFS.FindSet then begin
            IFS."Document Status" := IFS."document status"::Evaluation;
            IFS.Modify;
        end;

        //Generate PP
        FinalEvalReport1.Reset;
        FinalEvalReport1.SetRange("IFS Code", FinalEvalReport."IFS Code");
        FinalEvalReport1.SetRange("Document Type", FinalEvalReport."document type"::"Notice of Award");
        if not FinalEvalReport1.FindSet then begin
            FinalEvalReport1.Init;
            FinalEvalReport1."Document Type" := FinalEvalReport."document type"::"Notice of Award";
            FinalEvalReport1."IFS Code" := FinalEvalReport."IFS Code";
            FinalEvalReport1."Document Date" := FinalEvalReport."Document Date";
            FinalEvalReport1."Final Evaluation Report ID" := FinalEvalReport."Final Evaluation Report ID";
            FinalEvalReport1."Professional Opinion ID" := FinalEvalReport.Code;
            FinalEvalReport1.Description := 'Notice of Award: ' + FinalEvalReport."IFS Code";
            FinalEvalReport1."Tender Name" := FinalEvalReport."Tender Name";
            FinalEvalReport1."Raised By" := FinalEvalReport."Raised By";
            FinalEvalReport1.Name := FinalEvalReport.Name;
            FinalEvalReport1."Tender Committee Role" := FinalEvalReport."tender committee role"::Chairperson;
            FinalEvalReport1."Bid Opening Date" := FinalEvalReport."Bid Opening Date";
            FinalEvalReport1."Evaluation Completion Date" := FinalEvalReport."Evaluation Completion Date";
            FinalEvalReport1.Validate(FinalEvalReport1."Appointed Bid Opening Comm", FinalEvalReport."Appointed Bid Opening Comm");
            FinalEvalReport1.Validate(FinalEvalReport1."Appointed Bid Evaluation Com", FinalEvalReport."Appointed Bid Evaluation Com");
            FinalEvalReport1."Professional Opinion ID" := FinalEvalReport."Professional Opinion ID";
            FinalEvalReport1."Final Evaluation Report ID" := FinalEvalReport."Final Evaluation Report ID";
            FinalEvalReport1."Primary Region" := FinalEvalReport."Primary Region";

            IFS.Reset;
            IFS.SetRange(Code, FinalEvalReport."IFS Code");
            if IFS.FindSet then begin
                FinalEvalReport1."Annual Procurement Plan ID" := IFS."Procurement Plan ID";
                //FinalEvalReport1."Procurement Plan Date":=IFS.
                FinalEvalReport1."Financial Year Code" := IFS."Financial Year Code";
                FinalEvalReport1."Procurement Plan Line No." := IFS."Procurement Plan Line No.";
                FinalEvalReport1."Procurement Plan Entry No" := IFS."Procurement Plan Entry No";
                FinalEvalReport1."Available Procurement Budget" := IFS."Available Procurement Budget";
                FinalEvalReport1."Budget Narration" := IFS."Budget Narration";
            end;

            if FinalEvalReport1.Insert(true) then begin
                FinanceLine.Reset;
                FinanceLine.SetRange("Tabulation ID", FinalEvalReport.Code);
                if FinanceLine.FindSet then begin
                    repeat
                        FinalEvalLine.Init;
                        FinalEvalLine."Tabulation ID" := FinalEvalReport1.Code;
                        FinalEvalLine."Tabulation Type" := FinalEvalLine."tabulation type"::"Notice of Award";
                        FinalEvalLine."Document Type" := FinalEvalLine."document type"::Quote;
                        FinalEvalLine."No." := FinanceLine."No.";
                        FinalEvalLine."Bidder Name" := FinanceLine."Bidder Name";
                        FinalEvalLine."Bidder No" := FinanceLine."Bidder No";
                        FinalEvalLine."Invitation For Supply No" := FinanceLine."Invitation For Supply No";
                        FinalEvalLine."Bid Currency Code" := FinanceLine."Bid Currency Code";
                        // FinalEvalLine.ReFinanceLine."Read-out Bid Price (A)"
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Responsive Bid" := FinanceLine."Responsive Bid";
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Passed Tech Evaluation" := FinanceLine."Passed Tech Evaluation";
                        FinalEvalLine."Tech Evaluation Ranking" := FinanceLine."Tech Evaluation Ranking";
                        //FinalEvalLine.  IFSDetails."Bid Opening Finance Register"
                        //FinalEvalLine."Bid Opening Date":=FinanceLine.ope
                        //FinalEvalLine.finaIFSDetails."Financial Eval Register No"
                        FinalEvalLine."Financial Evaluation Date" := FinanceLine."Financial Evaluation Date";
                        FinalEvalLine."Read-out Bid Price (A)" := FinanceLine."Read-out Bid Price (A)";
                        FinalEvalLine."Arithmetic Corrections (B)" := FinanceLine."Arithmetic Corrections (B)";
                        FinalEvalLine."Corrected Bid Price (C=A+B)" := FinanceLine."Corrected Bid Price (C=A+B)";
                        FinalEvalLine."Unconditional Discount % (D)" := FinanceLine."Unconditional Discount % (D)";
                        FinalEvalLine."Unconditional Disc Amount (E)" := FinanceLine."Unconditional Disc Amount (E)";
                        FinalEvalLine."Corrected & Disc Bid Price" := FinanceLine."Corrected & Disc Bid Price";
                        FinalEvalLine."Any Additional Adjustments (G)" := FinanceLine."Any Additional Adjustments (G)";
                        FinalEvalLine."Any Priced Deviations (H))" := FinanceLine."Any Priced Deviations (H))";
                        FinalEvalLine."Final Evaluated Bid Price" := FinanceLine."Final Evaluated Bid Price";
                        FinalEvalLine."Weighted Financial Score %" := FinanceLine."Weighted Financial Score %";
                        FinalEvalLine."Weighted Tech Score %" := FinanceLine."Weighted Tech Score %";
                        FinalEvalLine."Evaluation Committee Recomm" := FinanceLine."Evaluation Committee Recomm";
                        FinalEvalLine."Financial Evaluation Comm Rem" := FinanceLine."Financial Evaluation Comm Rem";
                        FinalEvalLine."Aggregate Weighted Score %" := FinanceLine."Aggregate Weighted Score %";
                        FinalEvalLine."Pre-bid Register No." := FinanceLine."Pre-bid Register No.";
                        FinalEvalLine."Prebid Conference Date" := FinanceLine."Prebid Conference Date";
                        FinalEvalLine."Bid Opening Date" := FinanceLine."Bid Opening Date";
                        FinalEvalLine."Bid Opening Committee Remarks" := FinanceLine."Bid Opening Committee Remarks";
                        FinalEvalLine."Bid Opening Date (Financial)" := FinanceLine."Bid Opening Date (Financial)";
                        FinalEvalLine."Bid Opening Finance Register" := FinanceLine."Bid Opening Finance Register";
                        FinalEvalLine."Bid Opening Register No." := FinanceLine."Bid Opening Register No.";
                        FinalEvalLine."Bid Opening Result" := FinanceLine."Bid Opening Result";
                        FinalEvalLine."Preliminary Evaluation Date" := FinanceLine."Preliminary Evaluation Date";
                        FinalEvalLine."Preliminary Evaluation Outcome" := FinanceLine."Preliminary Evaluation Outcome";
                        FinalEvalLine."Preliminary Evaluation Reg" := FinanceLine."Preliminary Evaluation Reg";
                        FinalEvalLine."Preminary Evaluation Committee" := FinanceLine."Preminary Evaluation Committee";
                        //FinalEvalLine."Tech Evaluation Ranking":=IFSDetails.;
                        FinalEvalLine."Technical Evaluation Date" := FinanceLine."Technical Evaluation Date";
                        if FinanceLine."Evaluation Committee Recomm" = FinanceLine."evaluation committee recomm"::Awarded then begin
                            FinalEvalReport1."Awarded Bid No" := FinanceLine."No.";
                            FinalEvalReport1."Awarded Bidder No." := FinanceLine."Bidder No";
                            FinalEvalReport1."Awarded Bidder Name" := FinanceLine."Bidder Name";
                            FinalEvalReport1."Award Tender Sum Inc Taxes" := FinanceLine."Final Evaluated Bid Price";
                            FinalEvalReport1.Modify;
                        end;


                        FinalEvalLine.Insert(true);
                    until FinanceLine.Next = 0;

                end;
            end;
            Page.Run(75281, FinalEvalReport1)
        end else
            Page.Run(75281, FinalEvalReport1)

    end;


    procedure FnSendBidTabulationNotification(evaluationHeaader: Record "Bid Tabulation Header")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        IFSCommitteMembers: Record "Bid Evaluation Committee";
        IFSTenderCommitte: Record "IFS Tender Committee";
        EvaluationRegister: Record "Bid Tabulation Header";
    begin
        ///Notifying Procurement Team on supplier Request


        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;


        IFSCommitteMembers.Reset;
        IFSCommitteMembers.SetRange("Document No.", evaluationHeaader.Code);
        if IFSCommitteMembers.FindSet then begin
            repeat
                IFSCommitteMembers.TestField(Email);
                RequesterEmail := IFSCommitteMembers.Email;
                RequesterName := IFSCommitteMembers."Member Name";
                Window.Open('Notifying the Sender...');
                WindowisOpen := true;

                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.", evaluationHeaader."Appointed Bid Evaluation Com");
                if IFSTenderCommitte.FindSet then
                    Counter := Counter + 1;

                //Create message
                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'Dear,  ' + RequesterName;
                SenderMessage := '<BR>Please find attached summary of the FInal Evaluation Report No:' + evaluationHeaader.Code + '</BR>';
                SupplierDetails := '<BR>Appointment Reference No:' + IFSCommitteMembers."Appointed Bid Opening Com" + '</BR>' + '<BR> Committee Type:' + IFSTenderCommitte."Committee Type" + '</BR>' +
                '<BR>Membership Role:' + Format(IFSCommitteMembers."Role Type") + '</BR>' +
                '<BR>Appointment Effective Date:' + Format(IFSTenderCommitte."Appointment Effective Date") + '</BR>' +
                '<BR>Invitation For Supply No:' + IFSCommitteMembers."IFS Code" + '</BR>' +
                '<BR>Tender Name:' + IFSTenderCommitte."Tender Name" + '</BR>' +
                '<BR>Appointing Authority:' + IFSTenderCommitte."Appointing Authority" + '</BR>';
                LoginDetails := 'Attached herein, please find an e-copy of Final Tender Evaluation Summary Report';


                ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";

                EvaluationRegister.Reset;
                EvaluationRegister.SetRange(Code, evaluationHeaader.Code);
                if EvaluationRegister.FindSet then
                    FileDirectory := 'C:\DOCS\';
                FileName := 'BidEvaluation_' + evaluationHeaader.Code + '.pdf';
                // //Report.SaveAsPdf(70043, FileDirectory + FileName, EvaluationRegister);

                if CustEmail = '' then
                    exit;

                //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                emailhdr := 'Final Tender Evaluation Summary (Reference No: ' + evaluationHeaader.Code + ')';

                // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
                // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

                // cu400.AddCC(RequesterEmail);

                // cu400.AppendToBody(ProcNote);

                // cu400.AddAttachment(FileDirectory + FileName, FileName);
                // cu400.Send;
                SendingDate := Today;
                SendingTime := Time;

                IFSCommitteMembers."Notified on Email" := true;
                IFSCommitteMembers."Date/Time Notified" := CurrentDatetime;
                IFSCommitteMembers.Modify(true);


                Sleep(1000);
                Window.Close;

            until IFSCommitteMembers.Next = 0;
        end;
    end;


    procedure FnNotifyTenderAwarded(BidTabulation: Record "Bid Tabulation Header")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        IFSPrebidAttendees: Record "Bid Opening Bidder Attendance";
        BidopeningRegister: Record "Bid Opening Register";
        BidTab: Record "Bid Tabulation Header";
    begin
        ///Notifying Procurement Team on supplier Request
        vend.Reset;
        vend.SetRange("No.", BidTabulation."Awarded Bidder No.");
        if vend.FindSet then begin
            /*BidopeningRegister.RESET;
            BidopeningRegister.SETRANGE(Code,BidOpening.Code);*/

            CompInfo.Get;
            HRSetup.Get;
            PPayableSetup.Get;

            vend.TestField("E-Mail");
            RequesterEmail := vend."E-Mail";
            RequesterName := vend.Name;

            Window.Open('Notifying the Sender...');

            WindowisOpen := true;


            Counter := Counter + 1;

            //Create message
            if HRSetup."E-Mail" = '' then
                Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
            SenderAddress := HRSetup."E-Mail";

            if PPayableSetup."Default Proc Email Contact" = '' then
                Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
            CustEmail := PPayableSetup."Default Proc Email Contact";

            CompanyDetails := 'Dear,  ' + RequesterName + '<BR>' + vend."No.";
            SenderMessage := '<BR>Thank You for participating in the Tender (Reference No:' + BidTabulation.Code + ') Submitted on ' + Format(BidTabulation."Bid Opening Date") +
            'as summarized below: </BR>';
            SupplierDetails := '<BR>Tender invitation Notice No:' + BidTabulation."IFS Code" + '</BR>' + '<BR> Tender Name:' + BidTabulation."Tender Name" + '</BR>';
            LoginDetails := '<BR> This is to notify you that your bid was successful and you have been awarded the tender, Attached is the E-Award Letter </BR>';


            ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";

            BidTab.Reset;
            BidTab.SetRange(Code, BidTabulation.Code);
            if BidTab.FindSet then begin

                FileDirectory := 'C:\DOCS\';
                FileName := 'AwardLetter_' + BidTab.Code + '.pdf';
                ////Report.SaveAsPdf(70044, FileDirectory + FileName, BidTab);
            end;

            if CustEmail = '' then
                exit;

            //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
            emailhdr := 'Award Letter (Reference No: ' + BidTabulation.Code + ')';

            // cu400.Create(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
            // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
            // cu400.AddAttachment(FileDirectory + FileName, FileName);
            /*IFSPrebidAttendees.RESET;
            IFSPrebidAttendees.SETRANGE("Vendor No.",vend."No.");
            IFSPrebidAttendees.SETRANGE(Code,BidOpening.Code);
            IF IFSPrebidAttendees.FINDSET THEN BEGIN
              REPEAT
              cu400.AddCC(IFSPrebidAttendees."Representative Email");
             IFSPrebidAttendees."Notified By Email":=TRUE;
            IFSPrebidAttendees."Date/Time Notified":=TODAY;
            IFSPrebidAttendees.MODIFY(TRUE);
              UNTIL IFSPrebidAttendees.NEXT=0;
              END;*/
            // cu400.AddCC(CustEmail);

            // cu400.AppendToBody(ProcNote);


            //  cu400.Send;
            SendingDate := Today;
            SendingTime := Time;
            /*BidTabulation.Notified:=TRUE;
            BidTabulation."Date/Time Notified":=TODAY;
            BidTabulation.MODIFY(TRUE);*/



            Sleep(1000);
            Window.Close;

            //UNTIL vend.NEXT=0;
        end;

    end;


    procedure FnNotifyTenderRegrets(BidTabulation: Record "Bid Tabulation Header")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        IFSPrebidAttendees: Record "Bid Opening Bidder Attendance";
        BidTabulationLine: Record "Bid Tabulation Line";
        BidLines: Record "Bid Tabulation Line";
    begin
        ///Notifying Procurement Team on supplier Request
        BidTabulationLine.Reset;
        BidTabulationLine.SetRange("Tabulation ID", BidTabulation.Code);
        BidTabulationLine.SetRange("Evaluation Committee Recomm", BidTabulationLine."evaluation committee recomm"::Unsuccesful);
        if BidTabulationLine.FindSet then begin
            repeat

                vend.Reset;
                vend.SetRange("No.", BidTabulationLine."Bidder No");
                if vend.FindSet then begin
                    /*BidopeningRegister.RESET;
                    BidopeningRegister.SETRANGE(Code,BidOpening.Code);*/

                    CompInfo.Get;
                    HRSetup.Get;
                    PPayableSetup.Get;

                    vend.TestField("E-Mail");
                    RequesterEmail := vend."E-Mail";
                    RequesterName := vend.Name;

                    Window.Open('Notifying the Sender...');

                    WindowisOpen := true;


                    Counter := Counter + 1;

                    //Create message
                    if HRSetup."E-Mail" = '' then
                        Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                    SenderAddress := HRSetup."E-Mail";

                    if PPayableSetup."Default Proc Email Contact" = '' then
                        Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                    CustEmail := PPayableSetup."Default Proc Email Contact";

                    CompanyDetails := 'Dear,  ' + RequesterName + '<BR>' + vend."No.";
                    SenderMessage := '<BR>Thank You for participating in the Tender (Reference No:' + BidTabulation.Code + ') Submitted on ' + Format(BidTabulation."Bid Opening Date") +
                    'as summarized below: </BR>';
                    SupplierDetails := '<BR>Tender invitation Notice No:' + BidTabulation."IFS Code" + '</BR>' + '<BR> Tender Name:' + BidTabulation."Tender Name" + '</BR>';
                    LoginDetails := '<BR> This is to notify you that the above mentioned tender was not successful and you have, Attached is the E-Regret Letter </BR>';


                    ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";
                    BidLines.Reset;
                    BidLines.SetRange("Tabulation ID", BidTabulation.Code);
                    BidLines.SetRange("Bidder No", BidTabulationLine."Bidder No");
                    if BidLines.FindSet then
                        FileDirectory := 'C:\DOCS\';
                    FileName := 'RegretLetter_' + BidTabulation.Code + '.pdf';
                    //   //Report.SaveAsPdf(70045, FileDirectory + FileName, BidLines);


                    if CustEmail = '' then
                        exit;

                    //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                    emailhdr := 'Regret Letter (Reference No: ' + BidTabulation.Code + ')';

                    // cu400.Create(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
                    // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
                    // cu400.AddAttachment(FileDirectory + FileName, FileName);
                    /*IFSPrebidAttendees.RESET;
                    IFSPrebidAttendees.SETRANGE("Vendor No.",vend."No.");
                    IFSPrebidAttendees.SETRANGE(Code,BidOpening.Code);
                    IF IFSPrebidAttendees.FINDSET THEN BEGIN
                      REPEAT
                      cu400.AddCC(IFSPrebidAttendees."Representative Email");
                     IFSPrebidAttendees."Notified By Email":=TRUE;
                    IFSPrebidAttendees."Date/Time Notified":=TODAY;
                    IFSPrebidAttendees.MODIFY(TRUE);
                      UNTIL IFSPrebidAttendees.NEXT=0;
                      END;*/
                    // cu400.AddCC(CustEmail);

                    // cu400.AppendToBody(ProcNote);


                    // cu400.Send;
                    SendingDate := Today;
                    SendingTime := Time;
                    /*BidTabulation.Notified:=TRUE;
                    BidTabulation."Date/Time Notified":=TODAY;
                    BidTabulation.MODIFY(TRUE);*/



                    Sleep(1000);
                    Window.Close;

                    //UNTIL vend.NEXT=0;
                end;

            until BidTabulationLine.Next = 0;
        end;

    end;


    procedure PostNOA(NOA: Record "Bid Tabulation Header")
    var
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        Purch: Record "Purchase Header";
        CopyPurchDoc: Report "Copy Purchase Document";
        Purch2: Record "Purchase Header";
        PurchLines: Record "Purchase Line";
        PurchLines1: Record "Purchase Line";
        Purch3: Record "Purchase Header";
        IFS: Record "Standard Purchase Code";
        CompanyInfo: Record "Company Information";
        IFSLines: Record "Standard Purchase Line";
    begin



        Vendor.Reset;
        Vendor.SetRange("No.", NOA."Awarded Bidder No.");
        if Vendor.FindSet then begin
            Purch.Init;
            Purch."Document Type" := Purch."document type"::"Blanket Order";
            Purch."Awarded Bid No" := NOA."Awarded Bid No";
            Purch."Awarded Bid No" := NOA."Awarded Bidder No.";
            Purch."Award Tender Sum Inc Taxes" := NOA."Award Tender Sum Inc Taxes";
            Purch."Invitation For Supply No" := NOA."IFS Code";
            Purch.Validate("Buy-from Vendor No.", NOA."Awarded Bidder No.");
            Purch."Building/House No" := Vendor."Building/House No";
            Purch."Plot No" := Vendor."Plot No";
            Purch.Street := Vendor.Street;
            Purch."Nature of Business" := Vendor."Nature of Business";
            Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
            Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
            Purch."Max Value of Business" := Vendor."Max Value of Business";
            Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
            Purch."Business Type" := Vendor."Business Type";
            Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
            Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
            IFS.Reset;
            IFS.SetRange(Code, NOA."IFS Code");
            if IFS.FindSet then begin
                //Purch.INIT;


                Purch."Bid Envelope Type" := IFS."Bid Envelop Type";
                Purch."Tender Description" := IFS."Tender Summary";
                Purch."Responsibility Center" := IFS."Responsibility Center";
                Purch.Validate("Location Code", IFS."Location Code");
                Purch."Language Code" := IFS."Language Code";
                Purch.Validate("Purchaser Code", IFS."Purchaser Code");
                Purch."Currency Code" := IFS."Currency Code";
                Purch."IFS Code" := NOA."IFS Code";
                Purch."Bid Charge Code" := IFS."Bid Charge Code";
                Purch."Bid Charge (LCY)" := IFS."Bid Charge (LCY)";
                Purch."Works Category" := IFS."Works Category";
                Purch."Road Code" := IFS."Road Code";
                Purch."Link Name" := IFS."Road Link Name";
                Purch.Consitituency := IFS."Constituency ID";
                Purch."Engineer Estimate (LCY)" := IFS."Engineer Estimate (LCY)";
                Purch."Max Works Completion Duration" := IFS."Max Works Completion Duration";
                Purch."Max Works Kickoff Duration" := IFS."Max Works Kickoff Duration";
                Purch."Max Works Charter Duration" := IFS."Max Works Charter Duration";
                Purch.Validate("Payment Terms Code", IFS."Payment Terms Code");
                Purch."Defects Liability Period" := IFS."Defects Liability Period";
                Purch."Daily Liquidated Dam Unit Cost" := IFS."Daily Liquidated Dam Unit Cost";
                Purch."Liquidated Damages Limit %" := IFS."Liquidated Damages Limit %";
                Purch."Payment Retention %" := IFS."Payment Retention %";
                Purch."Retention Amount Limit %" := IFS."Retention Amount Limit %";
                Purch."Min Interim Certificate Amount" := IFS."Min Interim Certificate Amount";
            end;
            CompanyInfo.Get;
            Purch."Procuring Entity (PE) Name" := CompanyInfo.Name;






            Purch.Insert(true);

            /*Purch2.RESET;
            Purch2.SETRANGE("No.",NOA."Awarded Bid No");
            IF Purch2.FINDSET THEN BEGIN
            Purch.COPY(NOA);
             //Purch.VALIDATE("Invitation For Supply No",NOA."IFS Code");
              Purch.MODIFY;
              END;*/
            PurchLines.Reset;
            PurchLines.SetRange("Document No.", Purch."No.");
            if PurchLines.FindSet then begin
                PurchLines.DeleteAll;
            end;
            IFSLines.Reset;
            IFSLines.SetRange("Standard Purchase Code", NOA."IFS Code");
            if IFSLines.FindSet then begin
                repeat

                    PurchLines.Init;
                    PurchLines.Validate("Document Type", PurchLines."document type"::"Blanket Order");
                    PurchLines.Validate("Document No.", Purch."No.");
                    PurchLines.Validate("Line No.", IFSLines."Line No.");
                    PurchLines.Validate(Type, IFSLines.Type);
                    PurchLines.Validate("No.", IFSLines."No.");
                    //  PurchLines.Description := CopyStr(IFSLines.Description, 0, 50);
                    PurchLines."Item Details" := IFSLines.Description;
                    PurchLines.Validate(Description, IFSLines.Description);
                    PurchLines.Validate(Quantity, IFSLines.Quantity);
                    PurchLines.Validate("Unit of Measure Code", IFSLines."Unit of Measure Code");
                    PurchLines.Validate("Shortcut Dimension 1 Code", IFSLines."Shortcut Dimension 1 Code");
                    PurchLines.Validate("Shortcut Dimension 2 Code", IFSLines."Shortcut Dimension 2 Code");
                    //PurchLines.VALIDATE("Variant Code",IFSLines."Variant Code");
                    PurchLines.Validate("Dimension Set ID", IFSLines."Dimension Set ID");
                    PurchLines.Validate("Item Category", IFSLines."Item Category");
                    if PurchLines.Insert(true) then begin
                        PurchLines.Validate("No.", IFSLines."No.");
                        PurchLines.Modify;
                    end;

                /* PurchLines.INIT;
                PurchLines."Document Type":=PurchLines."Document Type"::"Blanket Order";
                 PurchLines."Document No.":=Purch."No.";
                 PurchLines."Line No.":=IFSLines."Line No.";
                 PurchLines."Buy-from Vendor No.":=Purch."Buy-from Vendor No.";
                 PurchLines.Type:=IFSLines.Type;
                 PurchLines."No.":=IFSLines."No.";
                 //PurchLines."Location Code":=IFSLines.
                 //PurchLines."Posting Group":=IFSLines
                 PurchLines.VALIDATE(Description,IFSLines.Description);
                 PurchLines."Description 2":=IFSLines.Description;
                 //PurchLines."Unit of Measure":=IFSLines."Unit of Measure Code";
                 //PurchLines.VALIDATE(PurchLines.Quantity,IFSLines.Quantity);
                 PurchLines.Quantity:=IFSLines.Quantity;
                 PurchLines.Amount:=IFSLines."Amount Excl. VAT";
                 PurchLines."Unit of Measure Code":=IFSLines."Unit of Measure Code";
                 PurchLines."Shortcut Dimension 1 Code":=IFSLines."Shortcut Dimension 2 Code";
                 PurchLines."Shortcut Dimension 2 Code":=IFSLines."Shortcut Dimension 2 Code";
                 PurchLines."Variant Code":=IFSLines."Variant Code";
                 PurchLines."Dimension Set ID":=IFSLines."Dimension Set ID";
                 PurchLines."Item Category":=IFSLines."Item Category";
                 PurchLines.INSERT(TRUE);*/

                until IFSLines.Next = 0;
            end;




            //END;

            Page.Run(75284, Purch);
        end;

    end;


    procedure UnsealFinancialBid(BidOpeningRegister: Record "Bid Opening Register")
    var
        IFSDetails: Record "Standard Vendor Purchase Code";
        BidOpeningLines: Record "Bid Opening Register Line";
        Bids: Record "Purchase Header";
        BidsSecurity: Record "Bid_Contract Security Register";
    begin
        BidOpeningRegister.TestField("Opening Person 1");
        BidOpeningRegister.TestField("Opening Person 2");
        BidOpeningRegister.TestField("Opening Person 3");
        Bids.Reset;
        Bids.SetRange("Invitation For Supply No", BidOpeningRegister."IFS Code");
        Bids.SetRange("Document Type", Bids."document type"::Quote);
        Bids.SetRange("Passed Tech Evaluation", true);
        if Bids.FindSet then begin
            repeat


                BidOpeningLines.Reset;
                BidOpeningLines.SetRange("Bid No.", Bids."No.");
                BidOpeningLines.SetRange("IFS Code", BidOpeningRegister."IFS Code");
                BidOpeningLines.SetRange(Code, BidOpeningRegister.Code);
                if not BidOpeningLines.FindSet then begin
                    BidOpeningLines.Init;
                    BidOpeningLines.Code := BidOpeningRegister.Code;
                    BidOpeningLines."Vendor No." := Bids."Buy-from Vendor No.";
                    BidOpeningLines."IFS Code" := BidOpeningRegister."IFS Code";
                    BidOpeningLines."Bidder Name" := Bids."Buy-from Vendor Name";
                    BidOpeningLines."Bid No." := Bids."No.";
                    BidOpeningLines."External Bid Reference No" := BidOpeningRegister."IFS Code";
                    BidsSecurity.Reset;
                    BidsSecurity.SetRange("No.", Bids."No.");
                    if BidsSecurity.FindSet then begin
                        if BidsSecurity."Security Amount (LCY)" > 0 then
                            BidOpeningLines."Valid Bid Security Provided" := true;
                        BidOpeningLines."Bid Security Issuer" := BidsSecurity."Issuer/Guarantor Name";
                        BidOpeningLines."Bid Security Amount (LCY)" := BidsSecurity."Security Amount (LCY)";
                        //MESSAGE('%1 %2',BidsSecurity."Security Amount (LCY)",BidsSecurity."Issuer/Guarantor Name");
                        if BidOpeningLines."Bid Security Amount (LCY)" >= BidsSecurity."Security Amount (LCY)" then
                            BidOpeningLines."Bid Security Amount Pass" := true
                        else
                            BidOpeningLines."Bid Security Amount Pass" := false;
                    end;
                    Bids.CalcFields(Bids."Amount Including VAT");
                    BidOpeningLines."Total Tender Price (LCY)" := Bids."Amount Including VAT";
                    //BidOpeningLines."Complete Bid Doc Submitted":=
                    //BidOpeningLines."Late Bid":=
                    // BidOpeningLines."Late Bid Submission Time":=
                    BidOpeningLines."Bid Withdrawal Notice No." := Bids."Withdrawal Notice No";
                    //BidOpeningLines."Bid Modification Notice No.":=Bids.bid
                    BidOpeningLines."Bid Withdrawal Notice No." := Bids."Withdrawal Notice No";
                    if BidOpeningLines."Bid Modification Notice No." <> '' then
                        BidOpeningLines."Bid Modification Exists" := true
                    else
                        BidOpeningLines."Bid Modification Exists" := false;
                    if BidOpeningLines."Bid Withdrawal Notice No." <> '' then
                        BidOpeningLines."Bid Withdrawal Exists" := true
                    else
                        BidOpeningLines."Bid Withdrawal Exists" := false;
                    //BidOpeningLines."Final Bid Opening Result":=
                    //BidOpeningLines."Tender Opening Com Remarks":=
                    BidOpeningLines.Insert(true);

                end;

            until Bids.Next = 0;
        end;
        /*BidOpeningRegister.Posted:=TRUE;
        BidOpeningRegister."Posted By":=USERID;
        BidOpeningRegister."Posted Date":=TODAY;*/

    end;

    procedure FnSendSecretCodeOnIFSBidOpening(IFS: Record "Bid Opening Register")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        ////"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        RandomDigit: Text[50];
        IFSCommitteMembers: Record "Bid Opening Tender Committee";
        IFSTenderCommitte: Record "IFS Tender Committee";
        EvaluationRegister: Record "Bid Evaluation Register";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Body: Text;
    begin
        ///Notifying Procurement Team on supplier Request
        Password := '';
        IFSCommitteMembers.Reset;
        IFSCommitteMembers.SetRange("Document No.", IFS.Code);
        if IFSCommitteMembers.FindSet then begin
            repeat
                CompInfo.Get;
                HRSetup.Get;
                PPayableSetup.Get;

                /*UserSetup.RESET;
                UserSetup.SETRANGE("User ID",User1);
                IF UserSetup.FINDSET THEN*/
                RequesterEmail := IFSCommitteMembers.Email;
                RequesterName := IFSCommitteMembers."Member Name";
                Window.Open('Notifying the Sender...');
                WindowisOpen := true;


                RandomDigit := CreateGuid;
                RandomDigit := DelChr(RandomDigit, '=', '{}-01');
                RandomDigit := CopyStr(RandomDigit, 1, 8);

                Counter := Counter + 1;

                Password := RandomDigit;
                if IFSCommitteMembers."Nominated Bid Opening" = IFSCommitteMembers."nominated bid opening"::"Member 1" then
                    IFSCommitteMembers."Opening Person 1" := Password
                else
                    if IFSCommitteMembers."Nominated Bid Opening" = IFSCommitteMembers."nominated bid opening"::"Member 2 " then
                        IFSCommitteMembers."Opening Person 2" := Password
                    else
                        if IFSCommitteMembers."Nominated Bid Opening" = IFSCommitteMembers."nominated bid opening"::"Member 3" then
                            IFSCommitteMembers."Opening Person 3" := Password
                        else
                            if IFSCommitteMembers."Nominated Bid Opening" = IFSCommitteMembers."nominated bid opening"::"Member 4" then
                                IFSCommitteMembers."Opening Person 4" := Password
                            else
                                if IFSCommitteMembers."Nominated Bid Opening" = IFSCommitteMembers."nominated bid opening"::"Member 5" then
                                    IFSCommitteMembers."Opening Person 5" := Password;
                //Create message
                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'Dear Sir/Madam</BR>' + CompInfo.City;
                SenderMessage := '<BR>Please find below system Generated Bid Opening Secret code to be used in Process:</BR>' + '<BR></BR>';
                LoginDetails := 'Password:' + Password;
                ActivationDetails := '<BR>Please fill the Secret Code on the Bid Opening to be able to proceed :' + Format(IFSCommitteMembers."Nominated Bid Opening") + '</BR>';

                if CustEmail = '' then
                    exit;

                //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
                emailhdr := 'Bid Opening Activation (Bid Opening No:' + IFS.Code + ')';

                EmailMessage.Create(RequesterEmail, emailhdr, CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
                if (IFSCommitteMembers."Role Type" <> IFSCommitteMembers."Role Type"::Secretary) then
                    Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                Sleep(1000);
                Window.Close;
                //IFS."Sent Cancellation Secret Code":=Password;
                IFSCommitteMembers.Passcode := Password;
                IFSCommitteMembers.Modify(true);
            until IFSCommitteMembers.Next = 0;
        end;
    end;

    procedure SuggestPlannedPPSchedule(ProcPlan: Record "Procurement Plan")
    var
        PPPurchaseActivitySchedule: Record "PP Purchase Activity Schedule";
        PPActivities: Record "Procurement Activity Code";
        PPLines: Record "Procurement Plan Lines";
        LineNo: Integer;
    begin
        PPPurchaseActivitySchedule.Reset;
        if PPPurchaseActivitySchedule.FindLast then
            LineNo := PPPurchaseActivitySchedule."Line no";
        PPLines.Reset;
        PPLines.SetRange("Procurement Plan ID", ProcPlan.Code);
        if PPLines.FindSet then begin
            repeat
                with PPActivities do begin
                    PPPurchaseActivitySchedule.Init;
                    PPPurchaseActivitySchedule."Procurement Plan ID" := PPLines."Procurement Plan ID";
                    PPPurchaseActivitySchedule."PP Entry" := PPLines."PP Line No";
                    PPPurchaseActivitySchedule."Planning Category" := PPLines."Planning Category";
                    PPPurchaseActivitySchedule."Line no" := LineNo + 1;
                    PPPurchaseActivitySchedule."Procurement Method" := PPLines."Procurement Method";
                    PPPurchaseActivitySchedule."Activity Code" := PPActivities."Activity Code";
                    PPPurchaseActivitySchedule."Solicitation Type" := PPLines."Solicitation Type";
                    PPPurchaseActivitySchedule."Activity Description" := PPActivities.Description;
                    PPPurchaseActivitySchedule.Insert(true);
                    LineNo += 1;
                end;

            until PPLines.Next = 0;
        end;
    end;

    //"Workplan Workings"


    procedure PostToConsolidatedPlan(Plan: Record "Procurement Plan")
    var
        PPEntry: Record "Procurement Plan Entry";
        FPPEntry: Record "Procurement Plan Entry";
        ProcurementPlanLines: Record "Procurement Plan Lines";
        LineNo: Integer;
        PPProcurementLines: Record "Procurement Plan Lines";
        LineNo1: Integer;
    begin
        // if not ConfirmManagement.ConfirmProcess(Text001, true) then
        //     exit;
        ProcurementPlanLines.Reset;
        if ProcurementPlanLines.FindLast then
            LineNo := ProcurementPlanLines."PP Line No" + 1;

        ProcurementPlanLines.Reset;
        ProcurementPlanLines.SetRange("Procurement Plan ID", Plan.Code);
        if ProcurementPlanLines.FindSet then begin
            repeat
                PPProcurementLines.Reset;
                PPProcurementLines.SetRange("Planning Category", ProcurementPlanLines."Planning Category");
                PPProcurementLines.SetRange("Procurement Plan ID", Plan."Consolidated Procurement Plan");
                if not PPProcurementLines.FindSet then begin

                    PPProcurementLines.Init;
                    PPProcurementLines.TransferFields(ProcurementPlanLines);
                    PPProcurementLines."Procurement Plan ID" := Plan."Consolidated Procurement Plan";
                    PPProcurementLines."PP Line No" := 0;
                    PPProcurementLines.Insert(true);
                    LineNo += 1;
                end;

            until ProcurementPlanLines.Next = 0;
        end;

        LineNo1 := 0;
        FPPEntry.Reset;
        if FPPEntry.FindLast then
            LineNo1 := FPPEntry."Entry No.";


        FPPEntry.Reset;
        FPPEntry.SetRange("Procurement Plan ID", Plan.Code);
        FPPEntry.SetRange(Posted, false);
        if FPPEntry.FindSet then begin
            repeat
                /*ProcurementPlanLines.RESET;
                ProcurementPlanLines.SETRANGE("Procurement Plan ID",Plan."Consolidated Procurement Plan");
                ProcurementPlanLines.SETRANGE("Planning Category",FPPEntry."Planning Category");
                IF NOT ProcurementPlanLines.FINDSET THEN BEGIN
                ProcurementPlanLines.INIT;
                ProcurementPlanLines.TRANSFERFIELDS(FPPEntry);
                ProcurementPlanLines."Procurement Plan ID":=Plan."Consolidated Procurement Plan";
                ProcurementPlanLines.INSERT(TRUE);

                ProcurementPlanLines.VALIDATE(ProcurementPlanLines."Procurement Plan ID",FPPEntry."Procurement Plan ID");
                ProcurementPlanLines."PP Line No":=LineNo+1;
                ProcurementPlanLines.VALIDATE("Planning Category",FPPEntry."Planning Category");
                ProcurementPlanLines.VALIDATE("Procurement Type",FPPEntry."Procurement Type");
                ProcurementPlanLines.VALIDATE("Procurement Method",FPPEntry."Procurement Method");
                ProcurementPlanLines.VALIDATE("Primary Source of Funds",FPPEntry."Funding Source ID");
                ProcurementPlanLines.VALIDATE("Solicitation Type",FPPEntry."Solicitation Type");
                 ProcurementPlanLines.INSERT(TRUE);
                 LineNo+=1;
                 END;*/
                PPEntry.Init;
                PPEntry.TransferFields(FPPEntry);
                PPEntry."Procurement Plan ID" := Plan."Consolidated Procurement Plan";
                PPEntry."Entry No." := 0;
                PPEntry.Insert(true);
                LineNo1 += 1;
            until FPPEntry.Next = 0;
            Message('Posted Successfully');
        end;

    end;


    procedure PostDueDiligienceEvaluation(EvaluationHeader: Record "Bid Evaluation Register")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        IFSDetails: Record "Standard Vendor Purchase Code";
        ProcuremnetSetup: Record "Procurement Setup";
        IFS: Record "Standard Purchase Code";
        Bids: Record "Purchase Header";
    begin

        // if not ConfirmManagement.ConfirmProcess(Text001, true) then
        //     exit;
        EvaluationHeader.TestField("IFS Code");
        EvaluationHeader.TestField("Bid No.");
        EvaluationHeader.TestField("Evaluation Date");
        EvaluationHeader.TestField("Evaluation Lead");
        //EvaluationHeader.TESTFIELD("Due Diligence Report ID");


        EvaluationHeader.Posted := true;
        EvaluationHeader."Posted By" := UserId;
        EvaluationHeader."Posted Date" := Today;
        EvaluationHeader."Due Dilgence Date" := EvaluationHeader."Evaluation Date";
        Bids.Reset;
        Bids.SetRange("No.", EvaluationHeader."Bid No.");
        Bids.SetRange("IFS Code", EvaluationHeader."IFS Code");
        if Bids.FindSet then begin
            EvaluationHeader.CalcFields(EvaluationHeader."Due Diligence Rating");
            Bids."Due Dilgence Date" := EvaluationHeader."Evaluation Date";
            Bids."Due Diligence Rating" := Format(EvaluationHeader."Due Diligence Rating");
            Bids."Due Diligence Report ID" := EvaluationHeader."Due Diligence Report ID";
            Bids."Due Diligence Voucher" := EvaluationHeader.Code;
            Bids.Modify;
        end;

        IFSDetails.Reset;
        IFSDetails.SetRange(Code, EvaluationHeader."IFS Code");
        IFSDetails.SetRange("Vendor No.", EvaluationHeader."Vendor No.");
        if IFSDetails.FindSet then begin
            IFSDetails."Due Dilgence Date" := EvaluationHeader."Evaluation Date";
            IFSDetails."Due Diligence Rating" := Format(EvaluationHeader."Due Diligence Rating");
            IFSDetails."Due Diligence Report ID" := EvaluationHeader."Due Diligence Report ID";
            IFSDetails."Due Diligence Voucher" := EvaluationHeader.Code;
            IFSDetails.Modify(true);
        end;


        /*ProcuremnetSetup.GET;
        IF ProcuremnetSetup."Notify Committe Members"=TRUE THEN
        FnSendBidEvaluationNotification(EvaluationHeader);*/

        IFS.Reset;
        IFS.SetRange(Code, EvaluationHeader."IFS Code");
        if IFS.FindSet then begin
            IFS."Document Status" := IFS."document status"::Evaluation;
            IFS.Modify;
        end;
        Message('Posted Successfully');

    end;


    procedure SuggestPreliminaryEvaluationEntries(EvaluationHeader: Record "Bid Evaluation Register")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Evaluation Score Entry";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidEvalHeader: Record "Bid Evaluation Register";
        EvaluationFindings: Code[50];
        EvaluationResults: Boolean;
    begin

        EvaluationHeader.TestField("Bid Scoring Document No.");



        Bidevaluationscore.Reset;
        if Bidevaluationscore.FindLast then
            LineNo := Bidevaluationscore."Line No";

        Bidevaluationscore.Reset;
        Bidevaluationscore.SetRange("Bid Scoring Document No.", EvaluationHeader."Bid Scoring Document No.");
        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
        if Bidevaluationscore.FindSet then begin
            Bidevaluationscore.DeleteAll;
        end;

        BidEvaluationCriteria.Reset;
        BidEvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvaluationCriteria.SetRange("Document No", EvaluationHeader.Code);
        if BidEvaluationCriteria.FindSet then begin
            BidEvaluationCriteria.DeleteAll;
        end;

        BidEvalScore.Reset;
        BidEvalScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvalScore.SetRange("Document No", EvaluationHeader.Code);
        if BidEvalScore.FindSet then begin
            BidEvalScore.DeleteAll;
        end;
        //check for different values
        BidEvalHeader.Reset;
        BidEvalHeader.SetRange("IFS Code", EvaluationHeader."IFS Code");
        BidEvalHeader.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        BidEvalHeader.SetFilter(Code, '<>%1', EvaluationHeader.Code);
        BidEvalHeader.SetRange("Bid No.", EvaluationHeader."Bid No.");
        BidEvalHeader.SetRange("Vendor No.", EvaluationHeader."Vendor No.");
        if BidEvalHeader.FindSet then begin
            repeat
                BidSCoreGuide.Reset;
                BidSCoreGuide.SetRange(Code, BidEvalHeader.Code);
                if BidSCoreGuide.FindSet then begin
                    repeat
                        Bidevaluationscore.Reset;
                        Bidevaluationscore.SetRange("Requirement ID", BidSCoreGuide."Requirement ID");
                        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
                        if not Bidevaluationscore.FindSet then begin
                            Bidevaluationscore.Init;
                            Bidevaluationscore.TransferFields(BidSCoreGuide);
                            Bidevaluationscore.Code := EvaluationHeader.Code;
                            Bidevaluationscore."Bid No." := EvaluationHeader."Bid No.";
                            Bidevaluationscore."Vendor No." := EvaluationHeader."Vendor No.";
                            Bidevaluationscore."Bid Scoring Document No." := EvaluationHeader."Bid Scoring Document No.";
                            Bidevaluationscore."Response Value" := BidSCoreGuide."Response Value";
                            Bidevaluationscore.Insert(true);
                            EvaluationFindings := Bidevaluationscore."Response Value";
                            EvaluationResults := ReturnValue(Bidevaluationscore);
                            if EvaluationResults = false then begin
                                Bidevaluationscore."Response Value" := '';
                                Bidevaluationscore.Modify(true);
                            end;
                        end;
                        Bidevaluationscore.Reset;
                        Bidevaluationscore.SetRange("Requirement ID", BidSCoreGuide."Requirement ID");
                        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
                        if Bidevaluationscore.FindSet then begin
                            //Bidevaluationscore.INIT;
                            //Bidevaluationscore.TRANSFERFIELDS(BidSCoreGuide);
                            //Bidevaluationscore.Code:=EvaluationHeader.Code;
                            ///Bidevaluationscore."Bid No.":=EvaluationHeader."Bid No.";
                            // Bidevaluationscore."Vendor No.":=EvaluationHeader."Vendor No.";
                            //Bidevaluationscore."Bid Scoring Document No.":=EvaluationHeader."Bid Scoring Document No.";
                            Bidevaluationscore."Score %" := (Bidevaluationscore."Score %" + BidSCoreGuide."Score %") / 2;
                            Bidevaluationscore.Validate(Bidevaluationscore."Score %");

                            Bidevaluationscore.Modify;
                            EvaluationFindings := Bidevaluationscore."Response Value";
                            EvaluationResults := ReturnValue(Bidevaluationscore);

                            /*IF Bidevaluationscore."Response Value"=BidSCoreGuide."Response Value" THEN
                              BEGIN
                                Bidevaluationscore.VALIDATE(Bidevaluationscore."Response Value",'');
                                Bidevaluationscore.MODIFY(TRUE);
                              END;*/
                        end;

                        LineNo += 1;
                    until BidSCoreGuide.Next = 0;
                end;
            until BidEvalHeader.Next = 0;
        end;
        /*
        //add bid evaluation criteria
        EvaluationCriteria.RESET;
        EvaluationCriteria.SETRANGE("Template ID",EvaluationHeader."Bid Scoring Document No.");
        EvaluationCriteria.SETRANGE("Evaluation Type",EvaluationHeader."Evaluation Type");
        IF EvaluationCriteria.FINDSET THEN BEGIN
          REPEAT
            BidEvaluationCriteria.INIT;
            BidEvaluationCriteria."Template ID":=EvaluationCriteria."Template ID";
            BidEvaluationCriteria."Criteria Group ID":=EvaluationCriteria."Criteria Group ID";
            BidEvaluationCriteria."Document No":=EvaluationHeader.Code;
            BidEvaluationCriteria."Evaluation Type":=EvaluationCriteria."Evaluation Type";
            BidEvaluationCriteria.Description:=EvaluationCriteria.Description;
            BidEvaluationCriteria."Total Weight %":=EvaluationCriteria."Total Weight %";
            BidEvaluationCriteria.INSERT(TRUE);
            UNTIL EvaluationCriteria.NEXT=0;
          END;
        
        //add Bid Evaluation Score Guide
          BidScore.RESET;
          BidScore.SETRANGE("Template ID",EvaluationHeader."Bid Scoring Document No.");
          BidScore.SETRANGE("Evaluation Type",EvaluationHeader."Evaluation Type");
          IF BidScore.FINDSET THEN BEGIN
            REPEAT
            BidEvalScore.INIT;
            BidEvalScore."Template ID":=BidScore."Template ID";
            BidEvalScore."Criteria Group ID":=BidScore."Criteria Group ID";
            BidEvalScore."Requirement ID":=BidScore."Requirement ID";
            BidEvalScore."Entry No":=BidScore."Entry No";
            BidEvalScore."Response Value":=BidScore."Response Value";
            BidEvalScore."Document No":=EvaluationHeader.Code;
            BidEvalScore."Target Qty":=BidScore."Target Qty";
            BidEvalScore."Rating Type":=BidScore."Rating Type";
            BidEvalScore."Evaluation Type":=BidScore."Evaluation Type";
            BidEvalScore."Desired Perfomance Direction":=BidScore."Desired Perfomance Direction";
            BidEvalScore."Min Bid Value":=BidScore."Min Bid Value";
            BidEvalScore."Max Bid Value":=BidScore."Max Bid Value";
            BidEvalScore."Min Date Value":=BidScore."Min Date Value";
            BidEvalScore."Max Date Value":=BidScore."Max Date Value";
            BidEvalScore."Score %":=BidScore."Score %";
            BidEvalScore.INSERT(TRUE);
            UNTIL BidScore.NEXT=0;
            END;
        */

    end;

    local procedure ReturnValue(BidEvaluationScoreEntry: Record "Bid Evaluation Score Entry") Feedback: Boolean
    var
        BidEvaluationScore: Record "Bid Evaluation Score Entry";
        BidValue: Code[30];
    begin
        BidEvaluationScore.Reset;
        BidEvaluationScore.SetRange("Bid No.", BidEvaluationScoreEntry."Bid No.");
        BidEvaluationScore.SetRange("Requirement ID", BidEvaluationScoreEntry."Requirement ID");
        BidEvaluationScore.SetRange("Vendor No.", BidEvaluationScoreEntry."Vendor No.");
        if BidEvaluationScore.FindSet then begin
            Feedback := false;
            BidValue := BidEvaluationScore."Response Value";
            repeat
                if BidValue <> BidEvaluationScore."Response Value" then
                    Feedback := true;
            until BidEvaluationScore.Next = 0;
        end;
        exit(Feedback);
    end;


    procedure FnGetVendorNo(ObjVendor: Record Vendor): Code[20]
    var
        Vendor: Record Vendor;
    begin
        with ObjVendor do begin
            repeat
                exit(ObjVendor."No.");
            until ObjVendor.Next = 0;
        end;
    end;


    procedure FnSendEmail(SenderEmailAddress: Text; SenderName: Text; RecepientsMail: Text; Subject: Text; Body: Text)
    var
        SMTPMail: Codeunit "Email Message";
    begin
        // if (SenderEmailAddress <> '') and (RecepientsMail <> '') and (Subject <> '') then begin
        //     SMTPMail.Create(SenderName, SenderEmailAddress, RecepientsMail, Subject, Body, true);
        //     SMTPMail.Send();
        // end;
    end;

    procedure FnSuggestRFQBids(var EvaluationHeader: Record "Bid Evaluation Register"; var PurchaseHdr: Record "Purchase Header")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidRegister: Record "Bid Evaluation Register";
        FinEvaluationLine: Record "Finance Evaluation Line";
        Bids: Record "Purchase Header";
    begin

        EvaluationHeader.TestField("Bid Scoring Document No.");

        FinEvaluationLine.Reset;
        FinEvaluationLine.SetRange("Document ID", EvaluationHeader.Code);
        if FinEvaluationLine.FindSet then begin
            FinEvaluationLine.DeleteAll;
        end;

        //add finance evaluation line
        PurchaseHdr.Reset;
        PurchaseHdr.SetRange("IFS Code", EvaluationHeader."IFS Code");
        PurchaseHdr.SetRange(PurchaseHdr."Document Type", PurchaseHdr."document type"::Quote);
        if PurchaseHdr.FindSet then begin
            //BidRegister.RESET;
            //BidRegister.SETRANGE("IFS Code",EvaluationHeader."IFS Code");
            //BidRegister.SETRANGE("IFS Code",PurchaseHdr."IFS Code");
            //BidRegister.SETRANGE("Evaluation Type",BidRegister."Evaluation Type"::"Technical Evaluation");
            //BidRegister.SETRANGE("Technical Evaluation  Decision",BidRegister."Technical Evaluation  Decision"::Pass);
            //IF BidRegister.FINDSET THEN BEGIN
            repeat
                FinEvaluationLine.Init;
                FinEvaluationLine."Document ID" := EvaluationHeader.Code;
                FinEvaluationLine."Document Type" := FinEvaluationLine."document type"::Quote;
                FinEvaluationLine."No." := PurchaseHdr."No.";
                FinEvaluationLine."Bidder Name" := PurchaseHdr."Buy-from Vendor Name";
                FinEvaluationLine."Bidder No" := PurchaseHdr."Buy-from Vendor No.";
                FinEvaluationLine."Invitation For Supply No" := PurchaseHdr."IFS Code";
                FinEvaluationLine."Bid Currency Code" := PurchaseHdr."Currency Code";
                PurchaseHdr.CalcFields("Amount Including VAT");
                FinEvaluationLine."Read-out Bid Price (A)" := PurchaseHdr."Amount Including VAT";
                FinEvaluationLine."Final Evaluated Bid Price" := PurchaseHdr."Amount Including VAT";

                //FinEvaluationLine."Bid Currency Code":=BidRegister
                //BidRegister.CALCFIELDS(BidRegister."Weighted Technical Eval Score");
                //FinEvaluationLine."Preliminary Evaluation Date":=BidRegister."Evaluation Date";
                FinEvaluationLine."Responsive Bid" := true;
                //FinEvaluationLine."Technical Evaluation Date":=BidRegister."Evaluation Date";
                //FinEvaluationLine."Weighted Tech Score %":=BidRegister."Weighted Technical Eval Score";
                //Bids.CALCFIELDS(Bids."Amount Including VAT");
                //FinEvaluationLine."Final Evaluated Bid Price":=Bids."Amount Including VAT";
                //FinEvaluationLine."Read-out Bid Price (A)":=Bids."Amount Including VAT";
                FinEvaluationLine."Passed Tech Evaluation" := true;
                //FinEvaluationLine."Tech Evaluation Ranking":=BidRegister."Tech Evaluation Ranking";
                FinEvaluationLine."Financial Evaluation Date" := Today;
                FinEvaluationLine.Insert(true);
            until PurchaseHdr.Next = 0;
        end;



        Bidevaluationscore.Reset;
        if Bidevaluationscore.FindLast then
            LineNo := Bidevaluationscore."Line No";

        Bidevaluationscore.Reset;
        Bidevaluationscore.SetRange("Bid Scoring Document No.", EvaluationHeader."Bid Scoring Document No.");
        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
        if Bidevaluationscore.FindSet then begin
            Bidevaluationscore.DeleteAll;

        end;

        BidEvaluationCriteria.Reset;
        BidEvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvaluationCriteria.SetRange("Document No", EvaluationHeader.Code);
        if BidEvaluationCriteria.FindSet then begin
            BidEvaluationCriteria.DeleteAll;
        end;

        BidEvalScore.Reset;
        BidEvalScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvalScore.SetRange("Document No", EvaluationHeader.Code);
        if BidEvalScore.FindSet then begin
            BidEvalScore.DeleteAll;
        end;


        BidSCoreGuide.Reset;
        BidSCoreGuide.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidSCoreGuide.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if BidSCoreGuide.FindSet then begin
            repeat
                Bidevaluationscore.Init;
                Bidevaluationscore.Code := EvaluationHeader.Code;
                Bidevaluationscore."Line No" := LineNo + 1;
                ;
                Bidevaluationscore."Bid No." := EvaluationHeader."Bid No.";
                Bidevaluationscore."Vendor No." := EvaluationHeader."Vendor No.";
                Bidevaluationscore."Criteria Group" := BidSCoreGuide."Criteria Group ID";
                Bidevaluationscore."Requirement ID" := BidSCoreGuide."Requirement ID";
                Bidevaluationscore."Evaluation Requirement" := BidSCoreGuide."Evaluation Requirement";
                Bidevaluationscore."Rating Type" := BidSCoreGuide."Rating Type";
                Bidevaluationscore."Target Qty" := BidSCoreGuide."Target Qty";
                Bidevaluationscore."Target Value/KPI" := BidSCoreGuide."Target Value";
                Bidevaluationscore."Unit of Measure" := BidSCoreGuide."Unit of Measure";
                //Bidevaluationscore."Response Value":=Bid
                //Bidevaluationscore."Bid Response Actual Qty":=BidSCoreGuide.
                //Bidevaluationscore."Score %":=
                Bidevaluationscore."Assigned Weight %" := BidSCoreGuide."Assigned Weight %";
                //Bidevaluationscore."Weighted Line Score":=BidSCoreGuide.
                Bidevaluationscore."Equipment Type" := BidSCoreGuide."Equipment Type";
                Bidevaluationscore."Desired Perfomance Direction" := BidSCoreGuide."Desired Perfomance Direction";
                Bidevaluationscore."Bid Scoring Document No." := EvaluationHeader."Bid Scoring Document No.";
                Bidevaluationscore.Insert(true);
                LineNo += 1;
            until BidSCoreGuide.Next = 0;
        end;

        //add bid evaluation criteria
        EvaluationCriteria.Reset;
        EvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        EvaluationCriteria.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if EvaluationCriteria.FindSet then begin
            repeat
                BidEvaluationCriteria.Init;
                BidEvaluationCriteria."Template ID" := EvaluationCriteria."Template ID";
                BidEvaluationCriteria."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                BidEvaluationCriteria."Document No" := EvaluationHeader.Code;
                BidEvaluationCriteria."Evaluation Type" := EvaluationCriteria."Evaluation Type";
                BidEvaluationCriteria.Description := EvaluationCriteria.Description;
                BidEvaluationCriteria."Total Weight %" := EvaluationCriteria."Total Weight %";
                BidEvaluationCriteria.Insert(true);
            until EvaluationCriteria.Next = 0;
        end;

        //add Bid Evaluation Score Guide
        BidScore.Reset;
        BidScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidScore.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if BidScore.FindSet then begin
            repeat
                BidEvalScore.Init;
                BidEvalScore."Template ID" := BidScore."Template ID";
                BidEvalScore."Criteria Group ID" := BidScore."Criteria Group ID";
                BidEvalScore."Requirement ID" := BidScore."Requirement ID";
                BidEvalScore."Entry No" := BidScore."Entry No";
                BidEvalScore."Response Value" := BidScore."Response Value";
                BidEvalScore."Document No" := EvaluationHeader.Code;
                BidEvalScore."Target Qty" := BidScore."Target Qty";
                BidEvalScore."Rating Type" := BidScore."Rating Type";
                BidEvalScore."Evaluation Type" := BidScore."Evaluation Type";
                BidEvalScore."Desired Perfomance Direction" := BidScore."Desired Perfomance Direction";
                BidEvalScore."Min Bid Value" := BidScore."Min Bid Value";
                BidEvalScore."Max Bid Value" := BidScore."Max Bid Value";
                BidEvalScore."Min Date Value" := BidScore."Min Date Value";
                BidEvalScore."Max Date Value" := BidScore."Max Date Value";
                BidEvalScore."Score %" := BidScore."Score %";
                BidEvalScore.Insert(true);
            until BidScore.Next = 0;
        end;
    end;

    procedure FnSuggestRFQBids222(var EvaluationHeader: Record "Bid Evaluation Register"; var PurchaseHdr: Record "Purchase Header")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidRegister: Record "Bid Evaluation Register";
        FinEvaluationLine: Record "Finance Evaluation Line";
        Bids: Record "Purchase Header";
    begin

        EvaluationHeader.TestField("Bid Scoring Document No.");

        FinEvaluationLine.Reset;
        FinEvaluationLine.SetRange("Document ID", EvaluationHeader.Code);
        if FinEvaluationLine.FindSet then begin
            FinEvaluationLine.DeleteAll;
        end;

        //add finance evaluation line
        PurchaseHdr.Reset;
        PurchaseHdr.SetRange("IFS Code", EvaluationHeader."IFS Code");
        PurchaseHdr.SetRange(PurchaseHdr."Document Type", PurchaseHdr."document type"::Quote);
        if PurchaseHdr.FindSet then begin
            //BidRegister.RESET;
            //BidRegister.SETRANGE("IFS Code",EvaluationHeader."IFS Code");
            //BidRegister.SETRANGE("IFS Code",PurchaseHdr."IFS Code");
            //BidRegister.SETRANGE("Evaluation Type",BidRegister."Evaluation Type"::"Technical Evaluation");
            //BidRegister.SETRANGE("Technical Evaluation  Decision",BidRegister."Technical Evaluation  Decision"::Pass);
            //IF BidRegister.FINDSET THEN BEGIN
            repeat
                FinEvaluationLine.Init;
                FinEvaluationLine."Document ID" := EvaluationHeader.Code;
                FinEvaluationLine."Document Type" := FinEvaluationLine."document type"::Quote;
                FinEvaluationLine."No." := PurchaseHdr."No.";
                FinEvaluationLine."Bidder Name" := PurchaseHdr."Buy-from Vendor Name";
                FinEvaluationLine."Bidder No" := PurchaseHdr."Buy-from Vendor No.";
                FinEvaluationLine."Invitation For Supply No" := PurchaseHdr."IFS Code";
                FinEvaluationLine."Bid Currency Code" := PurchaseHdr."Currency Code";
                PurchaseHdr.CalcFields("Amount Including VAT");
                FinEvaluationLine."Read-out Bid Price (A)" := PurchaseHdr."Amount Including VAT";
                FinEvaluationLine."Final Evaluated Bid Price" := PurchaseHdr."Amount Including VAT";

                //FinEvaluationLine."Bid Currency Code":=BidRegister
                //BidRegister.CALCFIELDS(BidRegister."Weighted Technical Eval Score");
                //FinEvaluationLine."Preliminary Evaluation Date":=BidRegister."Evaluation Date";
                FinEvaluationLine."Responsive Bid" := true;
                //FinEvaluationLine."Technical Evaluation Date":=BidRegister."Evaluation Date";
                //FinEvaluationLine."Weighted Tech Score %":=BidRegister."Weighted Technical Eval Score";
                //Bids.CALCFIELDS(Bids."Amount Including VAT");
                //FinEvaluationLine."Final Evaluated Bid Price":=Bids."Amount Including VAT";
                //FinEvaluationLine."Read-out Bid Price (A)":=Bids."Amount Including VAT";
                FinEvaluationLine."Passed Tech Evaluation" := true;
                //FinEvaluationLine."Tech Evaluation Ranking":=BidRegister."Tech Evaluation Ranking";
                FinEvaluationLine."Financial Evaluation Date" := Today;
                FinEvaluationLine.Insert(true);
            until PurchaseHdr.Next = 0;
        end;



        Bidevaluationscore.Reset;
        if Bidevaluationscore.FindLast then
            LineNo := Bidevaluationscore."Line No";

        Bidevaluationscore.Reset;
        Bidevaluationscore.SetRange("Bid Scoring Document No.", EvaluationHeader."Bid Scoring Document No.");
        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
        if Bidevaluationscore.FindSet then begin
            Bidevaluationscore.DeleteAll;

        end;

        BidEvaluationCriteria.Reset;
        BidEvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvaluationCriteria.SetRange("Document No", EvaluationHeader.Code);
        if BidEvaluationCriteria.FindSet then begin
            BidEvaluationCriteria.DeleteAll;
        end;

        BidEvalScore.Reset;
        BidEvalScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvalScore.SetRange("Document No", EvaluationHeader.Code);
        if BidEvalScore.FindSet then begin
            BidEvalScore.DeleteAll;
        end;


        BidSCoreGuide.Reset;
        BidSCoreGuide.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidSCoreGuide.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if BidSCoreGuide.FindSet then begin
            repeat
                Bidevaluationscore.Init;
                Bidevaluationscore.Code := EvaluationHeader.Code;
                Bidevaluationscore."Line No" := LineNo + 1;
                ;
                Bidevaluationscore."Bid No." := EvaluationHeader."Bid No.";
                Bidevaluationscore."Vendor No." := EvaluationHeader."Vendor No.";
                Bidevaluationscore."Criteria Group" := BidSCoreGuide."Criteria Group ID";
                Bidevaluationscore."Requirement ID" := BidSCoreGuide."Requirement ID";
                Bidevaluationscore."Evaluation Requirement" := BidSCoreGuide."Evaluation Requirement";
                Bidevaluationscore."Rating Type" := BidSCoreGuide."Rating Type";
                Bidevaluationscore."Target Qty" := BidSCoreGuide."Target Qty";
                Bidevaluationscore."Target Value/KPI" := BidSCoreGuide."Target Value";
                Bidevaluationscore."Unit of Measure" := BidSCoreGuide."Unit of Measure";
                //Bidevaluationscore."Response Value":=Bid
                //Bidevaluationscore."Bid Response Actual Qty":=BidSCoreGuide.
                //Bidevaluationscore."Score %":=
                Bidevaluationscore."Assigned Weight %" := BidSCoreGuide."Assigned Weight %";
                //Bidevaluationscore."Weighted Line Score":=BidSCoreGuide.
                Bidevaluationscore."Equipment Type" := BidSCoreGuide."Equipment Type";
                Bidevaluationscore."Desired Perfomance Direction" := BidSCoreGuide."Desired Perfomance Direction";
                Bidevaluationscore."Bid Scoring Document No." := EvaluationHeader."Bid Scoring Document No.";
                Bidevaluationscore.Insert(true);
                LineNo += 1;
            until BidSCoreGuide.Next = 0;
        end;

        //add bid evaluation criteria
        EvaluationCriteria.Reset;
        EvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        EvaluationCriteria.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if EvaluationCriteria.FindSet then begin
            repeat
                BidEvaluationCriteria.Init;
                BidEvaluationCriteria."Template ID" := EvaluationCriteria."Template ID";
                BidEvaluationCriteria."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                BidEvaluationCriteria."Document No" := EvaluationHeader.Code;
                BidEvaluationCriteria."Evaluation Type" := EvaluationCriteria."Evaluation Type";
                BidEvaluationCriteria.Description := EvaluationCriteria.Description;
                BidEvaluationCriteria."Total Weight %" := EvaluationCriteria."Total Weight %";
                BidEvaluationCriteria.Insert(true);
            until EvaluationCriteria.Next = 0;
        end;

        //add Bid Evaluation Score Guide
        BidScore.Reset;
        BidScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidScore.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        if BidScore.FindSet then begin
            repeat
                BidEvalScore.Init;
                BidEvalScore."Template ID" := BidScore."Template ID";
                BidEvalScore."Criteria Group ID" := BidScore."Criteria Group ID";
                BidEvalScore."Requirement ID" := BidScore."Requirement ID";
                BidEvalScore."Entry No" := BidScore."Entry No";
                BidEvalScore."Response Value" := BidScore."Response Value";
                BidEvalScore."Document No" := EvaluationHeader.Code;
                BidEvalScore."Target Qty" := BidScore."Target Qty";
                BidEvalScore."Rating Type" := BidScore."Rating Type";
                BidEvalScore."Evaluation Type" := BidScore."Evaluation Type";
                BidEvalScore."Desired Perfomance Direction" := BidScore."Desired Perfomance Direction";
                BidEvalScore."Min Bid Value" := BidScore."Min Bid Value";
                BidEvalScore."Max Bid Value" := BidScore."Max Bid Value";
                BidEvalScore."Min Date Value" := BidScore."Min Date Value";
                BidEvalScore."Max Date Value" := BidScore."Max Date Value";
                BidEvalScore."Score %" := BidScore."Score %";
                BidEvalScore.Insert(true);
            until BidScore.Next = 0;
        end;
    end;


    procedure SuggestTechnicalEvaluationEntries(EvaluationHeader: Record "Bid Evaluation Register")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Evaluation Score Entry";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidEvalHeader: Record "Bid Evaluation Register";
        EvaluationFindings: Code[50];
        EvaluationResults: Boolean;
    begin

        EvaluationHeader.TestField("Bid Scoring Document No.");



        Bidevaluationscore.Reset;
        if Bidevaluationscore.FindLast then
            LineNo := Bidevaluationscore."Line No";

        Bidevaluationscore.Reset;
        Bidevaluationscore.SetRange("Bid Scoring Document No.", EvaluationHeader."Bid Scoring Document No.");
        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
        if Bidevaluationscore.FindSet then begin
            Bidevaluationscore.DeleteAll;
        end;

        BidEvaluationCriteria.Reset;
        BidEvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvaluationCriteria.SetRange("Document No", EvaluationHeader.Code);
        if BidEvaluationCriteria.FindSet then begin
            BidEvaluationCriteria.DeleteAll;
        end;

        BidEvalScore.Reset;
        BidEvalScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvalScore.SetRange("Document No", EvaluationHeader.Code);
        if BidEvalScore.FindSet then begin
            BidEvalScore.DeleteAll;
        end;
        //check for different values
        BidEvalHeader.Reset;
        BidEvalHeader.SetRange("IFS Code", EvaluationHeader."IFS Code");
        BidEvalHeader.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        BidEvalHeader.SetFilter(Code, '<>%1', EvaluationHeader.Code);
        BidEvalHeader.SetRange("Bid No.", EvaluationHeader."Bid No.");
        BidEvalHeader.SetRange("Vendor No.", EvaluationHeader."Vendor No.");
        BidEvalHeader.SetRange("Evaluator Category", BidEvalHeader."evaluator category"::"Individual Evaluator");
        if BidEvalHeader.FindSet then begin
            repeat

                BidSCoreGuide.Reset;
                BidSCoreGuide.SetRange(Code, BidEvalHeader.Code);
                if BidSCoreGuide.FindSet then begin
                    repeat
                        Bidevaluationscore.Reset;
                        Bidevaluationscore.SetRange("Requirement ID", BidSCoreGuide."Requirement ID");
                        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
                        if not Bidevaluationscore.FindSet then begin
                            Bidevaluationscore.Init;
                            Bidevaluationscore.TransferFields(BidSCoreGuide);
                            Bidevaluationscore.Code := EvaluationHeader.Code;
                            Bidevaluationscore."Bid No." := EvaluationHeader."Bid No.";
                            Bidevaluationscore."Vendor No." := EvaluationHeader."Vendor No.";
                            Bidevaluationscore."Bid Scoring Document No." := EvaluationHeader."Bid Scoring Document No.";
                            Bidevaluationscore."Response Value" := BidSCoreGuide."Response Value";
                            Bidevaluationscore.Insert(true);
                            EvaluationFindings := Bidevaluationscore."Response Value";
                            EvaluationResults := ReturnValue(Bidevaluationscore);
                            //MESSAGE('%1 %2 %3',EvaluationResults,BidEvalHeader.Code,Bidevaluationscore."Response Value");
                            if EvaluationResults = false then begin
                                Bidevaluationscore."Response Value" := '';
                                Bidevaluationscore.Modify(true);
                            end;
                        end;
                        Bidevaluationscore.Reset;
                        Bidevaluationscore.SetRange("Requirement ID", BidSCoreGuide."Requirement ID");
                        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
                        if Bidevaluationscore.FindSet then begin
                            //Bidevaluationscore.INIT;
                            //Bidevaluationscore.TRANSFERFIELDS(BidSCoreGuide);
                            //Bidevaluationscore.Code:=EvaluationHeader.Code;
                            ///Bidevaluationscore."Bid No.":=EvaluationHeader."Bid No.";
                            // Bidevaluationscore."Vendor No.":=EvaluationHeader."Vendor No.";
                            //Bidevaluationscore."Bid Scoring Document No.":=EvaluationHeader."Bid Scoring Document No.";
                            Bidevaluationscore."Score %" := (Bidevaluationscore."Score %" + BidSCoreGuide."Score %") / 2;
                            Bidevaluationscore.Validate(Bidevaluationscore."Score %");

                            Bidevaluationscore.Modify;
                            EvaluationFindings := Bidevaluationscore."Response Value";
                            EvaluationResults := ReturnValue(Bidevaluationscore);

                            /*IF Bidevaluationscore."Response Value"=BidSCoreGuide."Response Value" THEN
                              BEGIN
                                Bidevaluationscore.VALIDATE(Bidevaluationscore."Response Value",'');
                                Bidevaluationscore.MODIFY(TRUE);
                              END;*/
                        end;


                        LineNo += 1;
                    until BidSCoreGuide.Next = 0;
                end;
            until BidEvalHeader.Next = 0;
        end;
        /*
        //add bid evaluation criteria
        EvaluationCriteria.RESET;
        EvaluationCriteria.SETRANGE("Template ID",EvaluationHeader."Bid Scoring Document No.");
        EvaluationCriteria.SETRANGE("Evaluation Type",EvaluationHeader."Evaluation Type");
        IF EvaluationCriteria.FINDSET THEN BEGIN
          REPEAT
            BidEvaluationCriteria.INIT;
            BidEvaluationCriteria."Template ID":=EvaluationCriteria."Template ID";
            BidEvaluationCriteria."Criteria Group ID":=EvaluationCriteria."Criteria Group ID";
            BidEvaluationCriteria."Document No":=EvaluationHeader.Code;
            BidEvaluationCriteria."Evaluation Type":=EvaluationCriteria."Evaluation Type";
            BidEvaluationCriteria.Description:=EvaluationCriteria.Description;
            BidEvaluationCriteria."Total Weight %":=EvaluationCriteria."Total Weight %";
            BidEvaluationCriteria.INSERT(TRUE);
            UNTIL EvaluationCriteria.NEXT=0;
          END;
        
        //add Bid Evaluation Score Guide
          BidScore.RESET;
          BidScore.SETRANGE("Template ID",EvaluationHeader."Bid Scoring Document No.");
          BidScore.SETRANGE("Evaluation Type",EvaluationHeader."Evaluation Type");
          IF BidScore.FINDSET THEN BEGIN
            REPEAT
            BidEvalScore.INIT;
            BidEvalScore."Template ID":=BidScore."Template ID";
            BidEvalScore."Criteria Group ID":=BidScore."Criteria Group ID";
            BidEvalScore."Requirement ID":=BidScore."Requirement ID";
            BidEvalScore."Entry No":=BidScore."Entry No";
            BidEvalScore."Response Value":=BidScore."Response Value";
            BidEvalScore."Document No":=EvaluationHeader.Code;
            BidEvalScore."Target Qty":=BidScore."Target Qty";
            BidEvalScore."Rating Type":=BidScore."Rating Type";
            BidEvalScore."Evaluation Type":=BidScore."Evaluation Type";
            BidEvalScore."Desired Perfomance Direction":=BidScore."Desired Perfomance Direction";
            BidEvalScore."Min Bid Value":=BidScore."Min Bid Value";
            BidEvalScore."Max Bid Value":=BidScore."Max Bid Value";
            BidEvalScore."Min Date Value":=BidScore."Min Date Value";
            BidEvalScore."Max Date Value":=BidScore."Max Date Value";
            BidEvalScore."Score %":=BidScore."Score %";
            BidEvalScore.INSERT(TRUE);
            UNTIL BidScore.NEXT=0;
            END;
        */

    end;


    procedure SuggestPrequalificationEvaluationEntries(EvaluationHeader: Record "Prequalification Score Header")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Evaluation Score Entry";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidEvalHeader: Record "Bid Evaluation Register";
        EvaluationFindings: Code[50];
        EvaluationResults: Boolean;
    begin
        /*
        EvaluationHeader.TESTFIELD("Bid Scoring Document No.");
        
        
        
        Bidevaluationscore.RESET;
        IF Bidevaluationscore.FINDLAST THEN
        LineNo:=Bidevaluationscore."Line No";
        
        Bidevaluationscore.RESET;
        Bidevaluationscore.SETRANGE("Bid Scoring Document No.",EvaluationHeader."Bid Scoring Document No.");
        Bidevaluationscore.SETRANGE(Code,EvaluationHeader.Code);
        IF Bidevaluationscore.FINDSET THEN BEGIN
          Bidevaluationscore.DELETEALL;
          END;
        
        BidEvaluationCriteria.RESET;
        BidEvaluationCriteria.SETRANGE("Template ID",EvaluationHeader."Bid Scoring Document No.");
        BidEvaluationCriteria.SETRANGE("Document No",EvaluationHeader.Code);
        IF BidEvaluationCriteria.FINDSET THEN BEGIN
          BidEvaluationCriteria.DELETEALL;
          END;
        
        BidEvalScore.RESET;
        BidEvalScore.SETRANGE("Template ID",EvaluationHeader."Bid Scoring Document No.");
        BidEvalScore.SETRANGE("Document No",EvaluationHeader.Code);
        IF BidEvalScore.FINDSET THEN BEGIN
          BidEvalScore.DELETEALL;
        END;
        //check for different values
            BidEvalHeader.RESET;
            BidEvalHeader.SETRANGE("IFS Code",EvaluationHeader."IFS Code");
            BidEvalHeader.SETRANGE("Evaluation Type",EvaluationHeader."Evaluation Type");
            BidEvalHeader.SETFILTER(Code,'<>%1',EvaluationHeader.Code);
            BidEvalHeader.SETRANGE("Bid No.",EvaluationHeader."Bid No.");
            BidEvalHeader.SETRANGE("Vendor No.",EvaluationHeader."Vendor No.");
            BidEvalHeader.SETRANGE("Evaluator Category",BidEvalHeader."Evaluator Category"::"Individual Evaluator");
            IF BidEvalHeader.FINDSET THEN BEGIN
             REPEAT
        
                    BidSCoreGuide.RESET;
                    BidSCoreGuide.SETRANGE(Code,BidEvalHeader.Code);
                    IF BidSCoreGuide.FINDSET THEN BEGIN
                      REPEAT
                            Bidevaluationscore.RESET;
                            Bidevaluationscore.SETRANGE("Requirement ID",BidSCoreGuide."Requirement ID");
                            Bidevaluationscore.SETRANGE(Code,EvaluationHeader.Code);
                            IF NOT Bidevaluationscore.FINDSET THEN BEGIN
                                Bidevaluationscore.INIT;
                                Bidevaluationscore.TRANSFERFIELDS(BidSCoreGuide);
                                Bidevaluationscore.Code:=EvaluationHeader.Code;
                                Bidevaluationscore."Bid No.":=EvaluationHeader."Bid No.";
                                Bidevaluationscore."Vendor No.":=EvaluationHeader."Vendor No.";
                                Bidevaluationscore."Bid Scoring Document No.":=EvaluationHeader."Bid Scoring Document No.";
                                Bidevaluationscore."Response Value":=BidSCoreGuide."Response Value";
                                Bidevaluationscore.INSERT(TRUE);
                                EvaluationFindings:=Bidevaluationscore."Response Value";
                                EvaluationResults:=ReturnValue(Bidevaluationscore);
                                //MESSAGE('%1 %2 %3',EvaluationResults,BidEvalHeader.Code,Bidevaluationscore."Response Value");
                                IF EvaluationResults=FALSE THEN
                                  BEGIN
                                    Bidevaluationscore."Response Value":='';
                                    Bidevaluationscore.MODIFY(TRUE);
                                  END;
                            END;
                            Bidevaluationscore.RESET;
                            Bidevaluationscore.SETRANGE("Requirement ID",BidSCoreGuide."Requirement ID");
                            Bidevaluationscore.SETRANGE(Code,EvaluationHeader.Code);
                            IF Bidevaluationscore.FINDSET THEN BEGIN
                                //Bidevaluationscore.INIT;
                                //Bidevaluationscore.TRANSFERFIELDS(BidSCoreGuide);
                                //Bidevaluationscore.Code:=EvaluationHeader.Code;
                                ///Bidevaluationscore."Bid No.":=EvaluationHeader."Bid No.";
                               // Bidevaluationscore."Vendor No.":=EvaluationHeader."Vendor No.";
                                //Bidevaluationscore."Bid Scoring Document No.":=EvaluationHeader."Bid Scoring Document No.";
                                Bidevaluationscore."Score %":=(Bidevaluationscore."Score %"+BidSCoreGuide."Score %")/2;
                                Bidevaluationscore.VALIDATE(Bidevaluationscore."Score %");
        
                                Bidevaluationscore.MODIFY;
                                EvaluationFindings:=Bidevaluationscore."Response Value";
                                EvaluationResults:=ReturnValue(Bidevaluationscore);
        
                                {IF Bidevaluationscore."Response Value"=BidSCoreGuide."Response Value" THEN
                                  BEGIN
                                    Bidevaluationscore.VALIDATE(Bidevaluationscore."Response Value",'');
                                    Bidevaluationscore.MODIFY(TRUE);
                                  END;}
                            END;
        
        
                        LineNo+=1;
                      UNTIL BidSCoreGuide.NEXT=0;
                      END;
               UNTIL BidEvalHeader.NEXT=0;
           END;*/
        /*
        //add bid evaluation criteria
        EvaluationCriteria.RESET;
        EvaluationCriteria.SETRANGE("Template ID",EvaluationHeader."Bid Scoring Document No.");
        EvaluationCriteria.SETRANGE("Evaluation Type",EvaluationHeader."Evaluation Type");
        IF EvaluationCriteria.FINDSET THEN BEGIN
          REPEAT
            BidEvaluationCriteria.INIT;
            BidEvaluationCriteria."Template ID":=EvaluationCriteria."Template ID";
            BidEvaluationCriteria."Criteria Group ID":=EvaluationCriteria."Criteria Group ID";
            BidEvaluationCriteria."Document No":=EvaluationHeader.Code;
            BidEvaluationCriteria."Evaluation Type":=EvaluationCriteria."Evaluation Type";
            BidEvaluationCriteria.Description:=EvaluationCriteria.Description;
            BidEvaluationCriteria."Total Weight %":=EvaluationCriteria."Total Weight %";
            BidEvaluationCriteria.INSERT(TRUE);
            UNTIL EvaluationCriteria.NEXT=0;
          END;
        
        //add Bid Evaluation Score Guide
          BidScore.RESET;
          BidScore.SETRANGE("Template ID",EvaluationHeader."Bid Scoring Document No.");
          BidScore.SETRANGE("Evaluation Type",EvaluationHeader."Evaluation Type");
          IF BidScore.FINDSET THEN BEGIN
            REPEAT
            BidEvalScore.INIT;
            BidEvalScore."Template ID":=BidScore."Template ID";
            BidEvalScore."Criteria Group ID":=BidScore."Criteria Group ID";
            BidEvalScore."Requirement ID":=BidScore."Requirement ID";
            BidEvalScore."Entry No":=BidScore."Entry No";
            BidEvalScore."Response Value":=BidScore."Response Value";
            BidEvalScore."Document No":=EvaluationHeader.Code;
            BidEvalScore."Target Qty":=BidScore."Target Qty";
            BidEvalScore."Rating Type":=BidScore."Rating Type";
            BidEvalScore."Evaluation Type":=BidScore."Evaluation Type";
            BidEvalScore."Desired Perfomance Direction":=BidScore."Desired Perfomance Direction";
            BidEvalScore."Min Bid Value":=BidScore."Min Bid Value";
            BidEvalScore."Max Bid Value":=BidScore."Max Bid Value";
            BidEvalScore."Min Date Value":=BidScore."Min Date Value";
            BidEvalScore."Max Date Value":=BidScore."Max Date Value";
            BidEvalScore."Score %":=BidScore."Score %";
            BidEvalScore.INSERT(TRUE);
            UNTIL BidScore.NEXT=0;
            END;
        */

    end;


    procedure PostLPO(NOA: Record "Bid Tabulation Header")
    var
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        Purch: Record "Purchase Header";
        CopyPurchDoc: Report "Copy Purchase Document";
        Purch2: Record "Purchase Header";
        PurchLines: Record "Purchase Line";
        PurchLines1: Record "Purchase Line";
        Purch3: Record "Purchase Header";
        IFS: Record "Standard Purchase Code";
        CompanyInfo: Record "Company Information";
        IFSLines: Record "Standard Purchase Line";
    begin



        Vendor.Reset;
        Vendor.SetRange("No.", NOA."Awarded Bidder No.");
        if Vendor.FindSet then begin
            Purch.Init;
            Purch."Document Type" := Purch."document type"::Order;
            Purch."Awarded Bid No" := NOA."Awarded Bid No";
            Purch."Awarded Bid No" := NOA."Awarded Bidder No.";
            Purch."Award Tender Sum Inc Taxes" := NOA."Award Tender Sum Inc Taxes";
            Purch."Invitation For Supply No" := NOA."IFS Code";
            Purch.Validate("Buy-from Vendor No.", NOA."Awarded Bidder No.");
            Purch."Building/House No" := Vendor."Building/House No";
            Purch."Plot No" := Vendor."Plot No";
            Purch.Street := Vendor.Street;
            Purch."Nature of Business" := Vendor."Nature of Business";
            Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
            Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
            Purch."Max Value of Business" := Vendor."Max Value of Business";
            Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
            Purch."Business Type" := Vendor."Business Type";
            Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
            Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
            IFS.Reset;
            IFS.SetRange(Code, NOA."IFS Code");
            if IFS.FindSet then begin
                //Purch.INIT;


                Purch."Bid Envelope Type" := IFS."Bid Envelop Type";
                Purch."Tender Description" := IFS."Tender Summary";
                Purch."Responsibility Center" := IFS."Responsibility Center";
                Purch.Validate("Location Code", IFS."Location Code");
                Purch."Language Code" := IFS."Language Code";
                Purch.Validate("Purchaser Code", IFS."Purchaser Code");
                Purch."Currency Code" := IFS."Currency Code";
                Purch."IFS Code" := NOA."IFS Code";
                Purch."Bid Charge Code" := IFS."Bid Charge Code";
                Purch."Bid Charge (LCY)" := IFS."Bid Charge (LCY)";
                Purch."Works Category" := IFS."Works Category";
                Purch."Road Code" := IFS."Road Code";
                Purch."Link Name" := IFS."Road Link Name";
                Purch.Consitituency := IFS."Constituency ID";
                Purch."Engineer Estimate (LCY)" := IFS."Engineer Estimate (LCY)";
                Purch."Max Works Completion Duration" := IFS."Max Works Completion Duration";
                Purch."Max Works Kickoff Duration" := IFS."Max Works Kickoff Duration";
                Purch."Max Works Charter Duration" := IFS."Max Works Charter Duration";
                Purch.Validate("Payment Terms Code", IFS."Payment Terms Code");
                Purch."Defects Liability Period" := IFS."Defects Liability Period";
                Purch."Daily Liquidated Dam Unit Cost" := IFS."Daily Liquidated Dam Unit Cost";
                Purch."Liquidated Damages Limit %" := IFS."Liquidated Damages Limit %";
                Purch."Payment Retention %" := IFS."Payment Retention %";
                Purch."Retention Amount Limit %" := IFS."Retention Amount Limit %";
                Purch."Min Interim Certificate Amount" := IFS."Min Interim Certificate Amount";
            end;
            CompanyInfo.Get;
            Purch."Procuring Entity (PE) Name" := CompanyInfo.Name;






            Purch.Insert(true);

            /*Purch2.RESET;
            Purch2.SETRANGE("No.",NOA."Awarded Bid No");
            IF Purch2.FINDSET THEN BEGIN
            Purch.COPY(NOA);
             //Purch.VALIDATE("Invitation For Supply No",NOA."IFS Code");
              Purch.MODIFY;
              END;*/
            PurchLines.Reset;
            PurchLines.SetRange("Document No.", Purch."No.");
            if PurchLines.FindSet then begin
                PurchLines.DeleteAll;
            end;
            IFSLines.Reset;
            IFSLines.SetRange("Standard Purchase Code", NOA."IFS Code");
            if IFSLines.FindSet then begin
                repeat

                    PurchLines.Init;
                    PurchLines.Validate("Document Type", PurchLines."document type"::Order);
                    PurchLines.Validate("Document No.", Purch."No.");
                    PurchLines.Validate("Line No.", IFSLines."Line No.");
                    PurchLines.Validate(Type, IFSLines.Type);
                    PurchLines.Validate("No.", IFSLines."No.");
                    PurchLines.Validate(Description, IFSLines.Description);
                    PurchLines.Validate(Quantity, IFSLines.Quantity);
                    PurchLines.Validate("Unit of Measure Code", IFSLines."Unit of Measure Code");
                    PurchLines.Validate("Shortcut Dimension 1 Code", IFSLines."Shortcut Dimension 1 Code");
                    PurchLines.Validate("Shortcut Dimension 2 Code", IFSLines."Shortcut Dimension 2 Code");
                    //PurchLines.VALIDATE("Variant Code",IFSLines."Variant Code");
                    PurchLines.Validate("Dimension Set ID", IFSLines."Dimension Set ID");
                    PurchLines.Validate("Item Category", IFSLines."Item Category");
                    if PurchLines.Insert(true) then begin
                        PurchLines.Validate("No.", IFSLines."No.");
                        PurchLines.Modify;
                    end;

                /* PurchLines.INIT;
                PurchLines."Document Type":=PurchLines."Document Type"::"Blanket Order";
                 PurchLines."Document No.":=Purch."No.";
                 PurchLines."Line No.":=IFSLines."Line No.";
                 PurchLines."Buy-from Vendor No.":=Purch."Buy-from Vendor No.";
                 PurchLines.Type:=IFSLines.Type;
                 PurchLines."No.":=IFSLines."No.";
                 //PurchLines."Location Code":=IFSLines.
                 //PurchLines."Posting Group":=IFSLines
                 PurchLines.VALIDATE(Description,IFSLines.Description);
                 PurchLines."Description 2":=IFSLines.Description;
                 //PurchLines."Unit of Measure":=IFSLines."Unit of Measure Code";
                 //PurchLines.VALIDATE(PurchLines.Quantity,IFSLines.Quantity);
                 PurchLines.Quantity:=IFSLines.Quantity;
                 PurchLines.Amount:=IFSLines."Amount Excl. VAT";
                 PurchLines."Unit of Measure Code":=IFSLines."Unit of Measure Code";
                 PurchLines."Shortcut Dimension 1 Code":=IFSLines."Shortcut Dimension 2 Code";
                 PurchLines."Shortcut Dimension 2 Code":=IFSLines."Shortcut Dimension 2 Code";
                 PurchLines."Variant Code":=IFSLines."Variant Code";
                 PurchLines."Dimension Set ID":=IFSLines."Dimension Set ID";
                 PurchLines."Item Category":=IFSLines."Item Category";
                 PurchLines.INSERT(TRUE);*/

                until IFSLines.Next = 0;
            end;




            //END;

            Page.Run(75284, Purch);
        end;

    end;


    procedure FnHCASendEmailNotification(PurchaseHeader: Record "Purchase Header")
    begin
        InsuranceReg.Reset;
        InsuranceReg.SetRange("Document No.", PurchaseHeader."No.");
        InsuranceReg.SetRange(Type, InsuranceReg.Type::"Fixed Asset");
        if InsuranceReg.FindSet then begin
            repeat
                CompInfo.Get;
                HRSetup.Get;
                RequesterEmail := HRSetup."HR E-mail Address";
                RequesterName := HRSetup."HR E-mail Address";
                Window.Open('Sending...');
                WindowisOpen := true;
                //Create message
                if HRSetup."HR E-mail Address" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."HR E-mail Address";
                CustEmail := HRSetup."HR E-mail Address";
                CompanyDetails := 'Dear Sir/Madam,';
                SenderMessage := '<BR>Fixed asset No: ' + InsuranceReg."No." + ' ' + InsuranceReg.Description + ' has been Acquired</BR>';
                SupplierDetails := 'Kindly proceed for tagging and Update the relevant Asset details<BR/>';
                LoginDetails := '';
                ProcNote := '<BR> If you require any assistance, please contact Supply Chain Management';
                if CustEmail = '' then
                    exit;
                emailhdr := 'Fixed Asset No ' + InsuranceReg."No." + ')';
                // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
                // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails, true);
                // cu400.AddCC(RequesterEmail);
                // cu400.AppendToBody(ProcNote);
                // cu400.Send;
                SendingDate := Today;
                SendingTime := Time;
                Sleep(1000);
                Window.Close;
            until InsuranceReg.Next = 0;
        end else begin
            Message('The Order must have a fixed asset Line');
        end;
    end;


    procedure FnLegalSendEmailNotification(PurchaseHeader: Record "Purchase Header")
    begin
        CompInfo.Get;
        HRSetup.Get;
        RequesterEmail := HRSetup."HR E-mail Address";
        RequesterName := HRSetup."HR E-mail Address";
        Window.Open('Sending...');
        WindowisOpen := true;
        //Create message
        if HRSetup."HR E-mail Address" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := HRSetup."HR E-mail Address";
        //CustEmail := CompInfo."Legal Head Email";
        CompanyDetails := 'Dear Sir/Madam,';
        SenderMessage := '<BR>Contract: ' + PurchaseHeader."No." + '</BR>';
        SupplierDetails := 'Kindly Note that this is a new contract to be worked on. Login to the ERP System to view Details<BR/>';
        LoginDetails := '';
        ProcNote := '<BR> If you require any assistance, please contact Supply Chain Management';
        if CustEmail = '' then
            exit;
        emailhdr := 'Contract Number: ' + PurchaseHeader."No." + '';
        // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails, true);
        // cu400.AddCC(RequesterEmail);
        // cu400.AppendToBody(ProcNote);
        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;
        Sleep(1000);
        Window.Close;

        Message('Done.');
    end;

    procedure FnGenerateLPODirect(NOA: Record "Standard Purchase Code")
    var
        PurchaseH: Record "Purchase Header";
        PurchaseHead: Record "Purchase Header";
        Procurement: Codeunit "Procurement Processing";
        IFSList: Record "Standard Purchase Code";
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        Purch: Record "Purchase Header";
        CopyPurchDoc: Report "Copy Purchase Document";
        Purch2: Record "Purchase Header";
        PurchLines: Record "Purchase Line";
        PurchLines1: Record "Purchase Line";
        Purch3: Record "Purchase Header";
        IFS: Record "Standard Purchase Code";
        CompanyInfo: Record "Company Information";
        IFSLines: Record "Purchase Line";
        ContractSecurity: Record "Bid_Contract Security Register";
        BidContractSecurity: Record "Bid_Contract Security Register";
        //  PurchaseContractEntries: Record "Purchase Contract Entries";
        IFSE: Record "Purchase Header";
    // PurchaseContractEntries2: Record "Purchase Contract Entries";
    begin
        //IF NOT ConfirmManagement.ConfirmProcess(Text001,TRUE) THEN
        //  EXIT;
        //if Contract
        //mtr
        if Confirm('Are you sure you want to Generate LPO/LSO or Contracts?', true) then begin


            Vendor.Reset;
            Vendor.SetRange("No.", NOA."Awarded Bidder No");
            if Vendor.FindSet then begin
                Purch.Init;
                Purch."Document Type" := Purch."document type"::Order;
                Purch."Awarded Bid No" := NOA."Awarded Bidder No";
                //Purch."Awarded Bid No":=NOA."Awarded Bidder No.";
                //Purch."Award Tender Sum Inc Taxes":=NOA."Award Tender Sum Inc Taxes";
                Purch."Invitation For Supply No" := NOA.Code;
                Purch.Validate("Buy-from Vendor No.", NOA."Awarded Bidder No");
                Purch."Building/House No" := Vendor."Building/House No";
                Purch."Plot No" := Vendor."Plot No";
                Purch.Street := Vendor.Street;
                Purch."Nature of Business" := Vendor."Nature of Business";
                Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
                Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
                Purch."Max Value of Business" := Vendor."Max Value of Business";
                Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
                Purch."Business Type" := Vendor."Business Type";
                Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
                Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
                IFS.Reset;
                IFS.SetRange(Code, NOA.Code);
                if IFS.FindSet then begin
                    //Purch.INIT;


                    Purch."Bid Envelope Type" := IFS."Bid Envelop Type";
                    Purch."Requisition No" := IFS."PRN No.";
                    Purch."Purchaser Code" := IFS."Purchaser Code";
                    Purch.Validate("Purchaser Code", IFS."Purchaser Code");
                    Purch."Procurement Plan ID" := IFS."Procurement Plan ID";
                    Purch."Procurement Plan Entry No" := IFS."Procurement Plan Entry No";
                    Purch."Tender Description" := IFS."Tender Summary";
                    Purch."Responsibility Center" := IFS."Responsibility Center";
                    Purch.Validate("Location Code", IFS."Location Code");
                    Purch."Language Code" := IFS."Language Code";
                    Purch.Validate("Purchaser Code", IFS."Purchaser Code");
                    Purch."Currency Code" := IFS."Currency Code";
                    Purch."IFS Code" := NOA.Code;
                    Purch."Bid Charge Code" := IFS."Bid Charge Code";
                    Purch."Bid Charge (LCY)" := IFS."Bid Charge (LCY)";
                    Purch."Works Category" := IFS."Works Category";
                    Purch."Road Code" := IFS."Road Code";
                    Purch."Link Name" := IFS."Road Link Name";
                    Purch.Consitituency := IFS."Constituency ID";
                    Purch."Framework Agreement No" := IFS."Framework Agreement No";
                    //  Purch."Engineer Estimate (LCY)" := IFS."Engineer Estimate (LCY)";
                    //Purch."Max Works Completion Duration":=IFS."Max Works Completion Duration";
                    Purch."Max Works Kickoff Duration" := IFS."Max Works Kickoff Duration";
                    Purch."Max Works Charter Duration" := IFS."Max Works Charter Duration";
                    Purch.Validate("Payment Terms Code", IFS."Payment Terms Code");
                    //Purch."Defects Liability Period":=IFS."Defects Liability Period";
                    Purch."Daily Liquidated Dam Unit Cost" := IFS."Daily Liquidated Dam Unit Cost";
                    Purch."Liquidated Damages Limit %" := IFS."Liquidated Damages Limit %";
                    Purch."Payment Retention %" := IFS."Payment Retention %";
                    Purch."Retention Amount Limit %" := IFS."Retention Amount Limit %";
                    Purch."Min Interim Certificate Amount" := IFS."Min Interim Certificate Amount";
                end;
                CompanyInfo.Get;
                Purch."Procuring Entity (PE) Name" := CompanyInfo.Name;


                Purch."Contract Description" := NOA."Tender Name";
                Purch."Contract Start Date" := NOA."Document Date";
                Purch."Tender Name" := NOA."Tender Name";
                Purch."Notice of Award No." := NOA.Code;



                Purch.Insert(true);

                /*Purch2.RESET;
                Purch2.SETRANGE("No.",NOA."Awarded Bid No");
                IF Purch2.FINDSET THEN BEGIN
                Purch.COPY(NOA);
                 //Purch.VALIDATE("Invitation For Supply No",NOA."IFS Code");
                  Purch.MODIFY;
                  END;*/
                /* PurchaseContractEntries.RESET;
                 PurchaseContractEntries.SETRANGE("IFS Code",NOA.Code);
                 PurchaseContractEntries.SETRANGE(Archived,FALSE);
                 IF PurchaseContractEntries.FINDSET THEN BEGIN
                 PurchaseContractEntries.Archived:=TRUE;
                 PurchaseContractEntries."Archived By":=USERID;
                 PurchaseContractEntries."Archived On":=CREATEDATETIME(TODAY,TIME);
                 PurchaseContractEntries.MODIFY(TRUE);
                END ELSE  BEGIN
                PurchaseContractEntries2.RESET;
                IF PurchaseContractEntries2.FINDLAST THEN
                PurchaseContractEntries.INIT;
                PurchaseContractEntries."Entry No":=PurchaseContractEntries2."Entry No"+1;
                //PurchaseContractEntries."NOA No":=NOA.Code;
                PurchaseContractEntries."Created By":=USERID;
                PurchaseContractEntries."Created On":=CREATEDATETIME(TODAY,TIME);
                //PurchaseContractEntries."Professional Opinion No":=NOA."Professional Opinion ID";
                //PurchaseContractEntries."Evaluation Report No":=NOA."Final Evaluation Report ID";
                PurchaseContractEntries."IFS Code":=NOA.Code;
                PurchaseContractEntries."Awarded Bidder No":=NOA."Awarded Bidder No";
                //PurchaseContractEntries."Awarded Bidder Name":=NOA."Awarded Bidder Name";
                //PurchaseContractEntries."Awarded Bid Sum":=NOA."Award Tender Sum Inc Taxes";
                PurchaseContractEntries."Awarded Bid No":=NOA."Awarded Quote No";
                PurchaseContractEntries."Tender Name":=NOA."Tender Name";
                PurchaseContractEntries."Framework Agreement No":=NOA."Framework Agreement No";
                PurchaseContractEntries."Purchase Agreement Type":=PurchaseContractEntries."Purchase Agreement Type"::"LPO/LSO";
                PurchaseContractEntries."Purchase Agreement No":=Purch."No.";
                PurchaseContractEntries."PRN No":=NOA."PRN No.";
                IFSE.RESET;
                IFSE.SETRANGE("No.",NOA."Awarded Quote No");
                IF IFSE.FINDSET THEN BEGIN
                IFSE.CALCFIELDS("Amount Including VAT");
                PurchaseContractEntries."Awarded Bid Sum":=IFSE."Amount Including VAT";
                PurchaseContractEntries."Awarded Bidder Name":=IFSE."Buy-from Vendor Name";
                END;
                PurchaseContractEntries.INSERT(TRUE);
                END;
                */

                PurchLines.Reset;
                PurchLines.SetRange("Document No.", Purch."No.");
                if PurchLines.FindSet then begin
                    PurchLines.DeleteAll;
                end;
                IFSLines.Reset;
                IFSLines.SetRange("Document No.", NOA."Awarded Quote No");
                if IFSLines.FindSet then begin
                    repeat

                        PurchLines.Init;
                        PurchLines.TransferFields(IFSLines);
                        PurchLines."Document Type" := PurchLines."document type"::Order;
                        PurchLines."Document No." := Purch."No.";
                        //posting groups
                        MyItem.Reset;
                        MyItem.SetRange("No.", PurchLines."No.");
                        if MyItem.FindSet then begin
                            PurchLines."Gen. Prod. Posting Group" := MyItem."Gen. Prod. Posting Group";
                        end;
                        MyVendor.Reset;
                        MyVendor.SetRange("No.", NOA."Awarded Bidder No");
                        if MyVendor.FindSet then begin
                            PurchLines."Gen. Bus. Posting Group" := MyVendor."Gen. Bus. Posting Group";
                        end;
                        //posting groups
                        if PurchLines.Insert(true) then begin
                            PurchLines.Validate("Direct Unit Cost");
                        end;


                    until IFSLines.Next = 0;
                end;



                Page.Run(50, Purch);

            end;
            /////
            // IFSList.Reset;
            // IFSList.SetRange(Code, NOA.Code);
            // if IFSList.FindSet then begin
            //     PurchaseHead.Reset;
            //     PurchaseHead.SetRange("No.", IFSList."PRN No.");
            //     if PurchaseHead.FindSet then begin
            //         FnUncommitPRN(PurchaseHead);
            //     end;
            // end;
            // PurchaseH.Reset;
            // PurchaseH.SetRange("No.", Purch."No.");
            // if PurchaseH.FindSet then begin
            //     //REPEAT
            //     FnLPOCommittment(PurchaseH);
            //     //UNTIL PurchaseH.NEXT=0
            // end;
            ///
        end;
        Message('Successful %1', Purch."No.");

    end;

    procedure CreateInvitationNoticeRetender(Purch: Record "Purchase Header")
    var
        UserSetup: Record "User Setup";
        IFS: Record "Standard Purchase Code";
        ProcSetup: Record "Procurement Setup";
        PurchLines: Record "Purchase Line";
        IFSPurchLines: Record "Standard Purchase Line";
        IFSMajorWorkDeliverable: Record "IFS Major Work_Deliverable";
        PRNMajorWorkDeliverable: Record "PRN Major Work Deliverable";
        IFSKeyStaff: Record "IFS Key Staff";
        PRNPersonnelSpecification: Record "PRN Personnel Specification";
        IFSStaffQualification: Record "IFS Staff Min Qualification";
        PRNStaffQualification: Record "PRN Personnel Qualification";
        PRNPersonnelExperience: Record "PRN Personnel Experience";
        IFSPersonnelExperience: Record "IFS Staff Min Experience";
        PRNEquipmentsSpecification: Record "PRN Equipment Specification";
        IFSEquipmentsSpecification: Record "IFS Required Equipment";
        //  EmailNotification: Codeunit UnknownCodeunit50004;
        CompInfo: Record "Company Information";
        IFSS: Record "Standard Purchase Code";
        UserSetup2: Record "User Setup";

    begin
        //MESSAGE('Creating retender');
        if Purch."PRN Conversion Procedure" <> Purch."prn conversion procedure"::"Invitation For Supply" then
            Error('The PRN %1  must be one that supports direct creation of Invitation Notices', Purch."No.");
        ProcSetup.Get;
        //Check Procurement User
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            // UserSetup.TESTFIELD("Purchase Resp. Ctr. Filter");
            if UserSetup."Authorize IFS Creator" = false then
                Error('You Must be an Authorized IFS Creator in the User Setup, Kindly contact system administrator');
            // IF UserSetup."Purchase Resp. Ctr. Filter"<>Purch."Responsibility Center" THEN
            //   ERROR('You are not authorized to create IFS for this resonsibility center %1',Purch."Responsibility Center");
        end;

        //check if the PRN has associated IFS Notice
        //   IF (Purch."Ordered PRN"=TRUE) OR (Purch."Linked IFS No."<>'') THEN
        //     ERROR('The PRN %1 has been already ordered',Purch."No.");

        //The total value of the PRN request must be within the available procurement budget
        if Purch."Total PRN Amount (LCY)" > Purch."PP Total Available Budget" then
            Error('The total value of the PRN request must be within the available procurement budget');

        //Testfields no blanks allowed
        Purch.TestField("PP  Invitation Notice Type");
        Purch.TestField("PP Solicitation Type");
        Purch.TestField("PP Procurement Method");

        //Action should automatically create an Invitation For Supply (IFS)
        IFS.Reset;
        IFS.SetFilter(Code, '<>%1', '');
        if IFS.FindSet then begin
            IFS.Init;
            //ProcSetup
            //    IFSS.RESET;
            //    IFSS.SETRANGE(Code,Purch."Linked IFS No.");
            //    IFSS.SETRANGE("Document Status",IFSS."Document Status"::"Re-Tendered");
            //    IF IFSS.FINDFIRST THEN BEGIN
            //      IFS.Code:=Purch."Linked IFS No."+'R';
            //      END ELSE BEGIN
            // IF (Purch."Ordered PRN"=TRUE) OR (Purch."Linked IFS No."<>'') THEN
            //    ERROR('The PRN %1 has been already ordered',Purch."No.");

            if Purch."PP Procurement Method" = Purch."pp procurement method"::"Framework Agreement" then begin
                IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."Framework ITT No. Series", Today, true);
            end else begin
                IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."ITT No. Series", Today, true);
            end;
            // END;
            IFS.Validate("Invitation Notice Type", Purch."PP  Invitation Notice Type");
            IFS.Validate(Description, Purch.Description);
            IFS.Validate("Tender Name", Purch.Description);
            IFS.Validate(Name, Purch.Description);
            IFS.Validate("Tender Summary", Purch.Description);

            //IFS."Location Code":=Purch."Location Code";
            IFS.Validate("Location Code", Purch."Location Code");
            IFS.Validate("Requisition Product Group", Purch."Requisition Product Group");
            IFS.Validate("Document Date", Today);
            IFS.Validate("PRN No.", Purch."No.");
            IFS.Validate("Responsibility Center", Purch."Responsibility Center");
            IFS.Validate("Requisition Product Group", Purch."Requisition Product Group");
            IFS.Validate("Requisition Template ID", Purch."Requisition Template ID");
            IFS.Validate("Solicitation Type", Purch."PP Solicitation Type");
            IFS.Validate("Bid Selection Method", Purch."PP Bid Selection Method");
            IFS.Validate("Procurement Method", Purch."PP Procurement Method");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Single  Stage Tender" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default Single Stage Tender");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Two Stage Tender" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default Two Stage Tender valid");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::RFQ then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default RFQ Validity Duration");
            if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Low Value Procurement" then
                IFS.Validate("Tender Validity Duration", ProcSetup."Default LVP Validity Duration");
            IFS.Validate("Purchaser Code", Purch."Purchaser Code");
            IFS.Validate("Language Code", ProcSetup."Default Language Code");
            IFS.Validate("Appointer of Bid Arbitrator", ProcSetup."Default Arbitrator Appointer");
            IFS.Validate("Directorate Code", Purch."Directorate Code1");
            IFS.Validate("Department Code", Purch."Department Code");
            IFS.Validate("Procurement Plan ID", Purch."Procurement Plan ID");
            IFS.Validate("Procurement Plan Entry No", Purch."Procurement Plan Entry No");
            IFS.Validate(Job, Purch.Job);
            IFS.Validate("Job Task No.", Purch."Job Task No.");
            IFS.Validate("PP Planning Category", Purch."PP Planning Category");
            //IFS.VALIDATE("PP Funding Source ID",Purch."PP Funding Source ID");
            IFS.Validate("PP Total Budget", Purch."PP Total Budget");
            IFS.Validate("PP Total Actual Costs", Purch."PP Total Actual Costs");
            IFS.Validate("PP Total Commitments", Purch."PP Total Commitments");
            IFS.Validate("PP Total Available Budget", Purch."PP Total Available Budget");
            IFS.Validate("PP Preference/Reservation Code", Purch."PP Preference/Reservation Code");
            //IFS.VALIDATE("Financial Year Code",ProcSetup.
            IFS.Validate("Works Category", Purch."Works Category");
            IFS.Validate("Road Code", Purch."Road Code");
            IFS.Validate("Road Link Name", Purch."Link Name");
            IFS.Validate("Constituency ID", Purch.Consitituency);
            //IFS.VALIDATE("Procurement Type",Purch."Procurement Type");
            IFS.Validate("Procurement Category ID", Purch."PP Planning Category");
            IFS.Validate("Project ID", Purch.Job);
            IFS.Validate("Requesting Directorate", Purch."Directorate Code1");
            IFS.Validate("Requesting Department", Purch."Department Code");

            CompInfo.Get;
            IFS.Address := CompInfo.Address;
            IFS."Procuring Entity Name/Contact" := CompInfo.Name;
            IFS."Address 2" := CompInfo."Address 2";
            IFS."Post Code" := CompInfo."Post Code";
            IFS.City := CompInfo.City;
            IFS."Country/Region Code" := CompInfo."Country/Region Code";
            IFS."Phone No." := CompInfo."Phone No.";
            IFS."E-Mail" := CompInfo."E-Mail";
            IFS."Primary Tender Submission" := CompInfo.Address;
            IFS."Primary Engineer Contact" := CompInfo.Address;


            if IFS.Insert(true) then begin
                PurchLines.Reset;
                PurchLines.SetRange("Document No.", Purch."No.");
                PurchLines.SetRange("Document Type", Purch."Document Type");
                if PurchLines.FindSet then begin
                    repeat
                        //2.IFS Purchase Lines (T174)-Default values shall be inherited from PRN Lines (T39)
                        IFSPurchLines.Init;
                        IFSPurchLines.Validate("Standard Purchase Code", IFS.Code);
                        IFSPurchLines.Validate("Line No.", PurchLines."Line No.");
                        IFSPurchLines.Validate(Type, PurchLines.Type);
                        IFSPurchLines.Validate("No.", PurchLines."No.");
                        IFSPurchLines.Validate(Description, PurchLines.Description);
                        // IFSPurchLines.VALIDATE(Quantity,PurchLines.Quantity);
                        IFSPurchLines.Quantity := PurchLines.Quantity;
                        IFSPurchLines.Validate("Unit of Measure Code", PurchLines."Unit of Measure Code");
                        IFSPurchLines.Validate("Shortcut Dimension 1 Code", PurchLines."Shortcut Dimension 1 Code");
                        IFSPurchLines.Validate("Shortcut Dimension 2 Code", PurchLines."Shortcut Dimension 2 Code");
                        IFSPurchLines.Validate("Variant Code", PurchLines."Variant Code");
                        IFSPurchLines.Validate("Dimension Set ID", PurchLines."Dimension Set ID");
                        IFSPurchLines.Validate("Item Category", PurchLines."Item Category Code");
                        IFSPurchLines.Validate("Directorate Code", PurchLines."Directorate Code");
                        //MESSAGE('"Directorate Code" %1',Purch."Directorate Code");
                        IFSPurchLines.Validate("Department Code", PurchLines."Department Code");
                        IFSPurchLines.Validate("Procurement Plan ID", PurchLines."Procurement Plan ID");
                        IFSPurchLines."Procurement Plan Entry No" := PurchLines."Procurement Plan Entry No";
                        IFSPurchLines.Validate("Job No.", PurchLines."Job No.");
                        IFSPurchLines.Validate("Job Task No.", PurchLines."Job Task No.");
                        IFSPurchLines.Validate("PP Planning Category", PurchLines."PP Planning Category");
                        IFSPurchLines.Validate("PP Funding Source ID", PurchLines."PP Funding Source ID");
                        IFSPurchLines.Validate("PP Total Budget", PurchLines."PP Total Budget");
                        IFSPurchLines.Validate("Technical Specifications", PurchLines."Technical Specifications");
                        IFSPurchLines.Validate("PP Total Actual Costs", PurchLines."PP Total Actual Costs");
                        IFSPurchLines.Validate("PP Total Commitments", PurchLines."PP Total Commitments");
                        IFSPurchLines.Validate("PP Total Available Budget", PurchLines."PP Total Available Budget");
                        IFSPurchLines.Validate("PP Preference/Reservation Code", PurchLines."PP Preference/Reservation Code");
                        IFSPurchLines.Insert(true);
                    until PurchLines.Next = 0;
                end;

                //3.IFS Major Work Deliverables table-Default values shall be inherited from the PRN Major Work Deliverable table
                PRNMajorWorkDeliverable.Reset;
                PRNMajorWorkDeliverable.SetRange("Document No.", Purch."No.");
                if PRNMajorWorkDeliverable.FindSet then begin
                    repeat
                        IFSMajorWorkDeliverable.Init;
                        IFSMajorWorkDeliverable.Validate("Document No", IFS.Code);
                        IFSMajorWorkDeliverable.Validate("Entry No", PRNMajorWorkDeliverable."Entry No");
                        IFSMajorWorkDeliverable.Validate("Major Activity Description", PRNMajorWorkDeliverable.Description);
                        IFSMajorWorkDeliverable.Insert(true);
                    until PRNMajorWorkDeliverable.Next = 0;
                end;

                //4.IFS Key Staff table-Default values shall be inherited from the PRN Personnel Specification IFS Key Staff Table FieldsMapping Rules
                PRNPersonnelSpecification.Reset;
                PRNPersonnelSpecification.SetRange("Document No.", Purch."No.");
                if PRNPersonnelSpecification.FindSet then begin
                    repeat
                        IFSKeyStaff.Init;
                        IFSKeyStaff."IFS Code" := IFS.Code;
                        IFSKeyStaff."Staff Role Code" := PRNPersonnelSpecification."Staff Role Code";
                        IFSKeyStaff."Title/Designation Description" := PRNPersonnelSpecification."Title/Designation Description";
                        IFSKeyStaff."Staff Category" := PRNPersonnelSpecification."Staff Category";
                        IFSKeyStaff."Min No. of Recomm Staff" := PRNPersonnelSpecification."Min No. of Recomm Staff";
                        IFSKeyStaff.Insert(true);
                    until PRNPersonnelSpecification.Next = 0;
                end;

                //5.IFS Staff Min Qualification-Default values shall be inherited from the PRN Personnel Qualification
                PRNStaffQualification.Reset;
                PRNStaffQualification.SetRange("Document No.", Purch."No.");
                if PRNStaffQualification.FindSet then begin
                    repeat
                        IFSStaffQualification.Init;
                        IFSStaffQualification."IFS Code" := IFS.Code;
                        IFSStaffQualification."Project Role Code" := PRNStaffQualification."Staff Role Code";
                        IFSStaffQualification."Entry No" := PRNStaffQualification."Entry No";
                        IFSStaffQualification."Qualification Category" := PRNStaffQualification."Qualification Category";
                        IFSStaffQualification."Minimum Qualification Req" := PRNStaffQualification."Minimum Qualification Req";
                        IFSStaffQualification.Insert(true);
                    until PRNStaffQualification.Next = 0;
                end;

                //6.IFS Staff Min Experience -Default values shall be inherited from the PRN Personnel Experience
                PRNPersonnelExperience.Reset;
                PRNPersonnelExperience.SetRange("Document No.", Purch."No.");
                if PRNPersonnelExperience.FindSet then begin
                    repeat
                        IFSPersonnelExperience.Init;
                        IFSPersonnelExperience."IFS Code" := IFS.Code;
                        IFSPersonnelExperience."Project Role Code" := PRNPersonnelExperience."Staff Role Code";
                        IFSPersonnelExperience."Experience Category" := PRNPersonnelExperience."Experience Category";
                        IFSPersonnelExperience."Entry No" := PRNPersonnelExperience."Entry No";
                        IFSPersonnelExperience."Minimum Years of Experience" := PRNPersonnelExperience."Minimum Years of Experience";
                        IFSPersonnelExperience."Minimum Experience Req" := PRNPersonnelExperience."Minimum Experience Req";
                        IFSPersonnelExperience.Insert(true);

                    until PRNPersonnelExperience.Next = 0;
                end;

                //7.IFS Required Equipment- Default values shall be inherited from the PRN Equipment Specification
                PRNEquipmentsSpecification.Reset;
                PRNEquipmentsSpecification.SetRange("Document No.", Purch."No.");
                if PRNEquipmentsSpecification.FindSet then begin
                    repeat

                        IFSEquipmentsSpecification.Init;
                        IFSEquipmentsSpecification."Document No" := IFS.Code;
                        IFSEquipmentsSpecification."Equipment Type Code" := PRNEquipmentsSpecification."Equipment Type";
                        IFSEquipmentsSpecification.Category := PRNEquipmentsSpecification.Category;
                        IFSEquipmentsSpecification.Description := PRNEquipmentsSpecification.Description;
                        IFSEquipmentsSpecification."Minimum Required Qty" := PRNEquipmentsSpecification."Minimum Required Qty";
                        IFSEquipmentsSpecification.Insert(true);
                    until PRNEquipmentsSpecification.Next = 0;
                end;
            end;
            Message('Re-Tender Invitation Notice No: %1 Created Successfully. Please check', IFS.Code);
            if IFS."Procurement Method" = IFS."procurement method"::"Open Tender" then begin
                Page.Run(75078, IFS);
            end;
            if IFS."Procurement Method" = IFS."procurement method"::RFQ then begin
                Page.Run(75121, IFS);
            end;
            Purch."Ordered PRN" := true;
            Purch."PRN Order Date/Time" := CurrentDatetime;
            Purch."Linked IFS No." := IFS.Code;
            Purch.Modify(true);
            //Back Email Notification to requestor.
            // EmailNotification.SendPRNApprovedMailAfterIFSCreation(Purch);

        end;
    end;

    procedure FnSendDirectnvitation(IFS: Record "Standard Purchase Code"; ObjVend: Record Vendor)
    var
        IFSList: Record "Standard Purchase Code";
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectoryQ: Text[100];
        FileNameQ: Text[100];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        CustQ: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        // FileDialog: Codeunit "SMTP Test Mail";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        // cu400: Codeunit "SMTP Mail";
        // DocLog: Record UnknownRecord50004;
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmailQ: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        //PayPeriod: Record UnknownRecord69000;
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        //EmailVerifier: Codeunit UnknownCodeunit69002;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        //PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        RFQReqVendors: Record "Standard Vendor Purchase Code";
        StandardPurchaseCode: Record "Standard Purchase Code";
        RFQReqVendors1: Record "Standard Vendor Purchase Code";
        FileDirectoryX: Text[100];
        FileNameX: Text[100];
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        Recipients: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;

        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        ///Notifying Procurement Team on supplier Request


        IFS.TestField("Bid Scoring Template");
        CompInfo.Get;
        HRSetup.Get;
        PPayableSetup.Get;
        RFQReqVendors.Reset;
        RFQReqVendors.SetRange(RFQReqVendors.Code, IFS.Code);
        if RFQReqVendors.FindSet then begin
            repeat
                RFQReqVendors.TestField("Primary Email");
                RequesterEmail := RFQReqVendors."Primary Email";
                RequesterName := RFQReqVendors."Vendor Name";


                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := PPayableSetup."Default Proc Email Contact";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'Dear: ' + RequesterName;
                SenderMessage := '<BR>You are hereby invited to submit your Bid Response for the Request: ' + IFS.Code + ' That is summarized as follows:</BR>';
                SupplierDetails := '<BR>Invitation Notice Number: ' + IFS.Code + '</BR>' + '<BR> Description: ' + IFS.Description + '</BR>' +
                '<BR>Submission Due Date: ' + Format(IFS."Submission End Date") + '</BR>' +
                '<BR>Submission Due Time: ' + Format(IFS."Submission End Time") + '</BR>' +
                '<BR>Procuring Entity Name: ' + IFS."Procuring Entity Name/Contact" + '</BR>';
                LoginDetails := 'Kindly find the attached request for your action+' + '</BR>' +
                ' Your response should be DROPPED IN THE QUOTATION BOX  before the deadline as indicated on the instructions.' + '</BR>' +
                'Please acknowledge receipt of this request.' + '</BR>';
                ProcNote := '<BR> If you require any assistance, please contact our Supply Chain Management Team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";

                IFSList.Reset;
                IFSList.SetRange(Code, IFS.Code);
                if IFSList.FindSet then begin
                    RFQReqVendors1.Reset;
                    RFQReqVendors1.SetRange(Code, IFSList.Code);
                    RFQReqVendors1.SetRange("Vendor No.", RFQReqVendors."Vendor No.");
                    if RFQReqVendors1.FindSet then begin

                        RecRef.GetTable(RFQReqVendors1);
                        TempBlob.CreateOutStream(OutStr);
                        Report.SaveAs(Report::"Direct Procurement Report", '', ReportFormat::Pdf, OutStr, RecRef);
                        TempBlob.CreateInStream(InStr);
                        InStr.ReadText(BodyTxt);
                        emailhdr := 'Invitation Notice Reference No: (' + IFS.Code + ')';
                        EmailMessage.Create(RequesterEmail, emailhdr, CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails + ProcNote, true);

                        // add attachment for with pdf
                        TempBlob.CreateOutStream(OutStr2);
                        Report.SaveAs(Report::"Direct Procurement Report", '', ReportFormat::Pdf, OutStr, RecRef);
                        TempBlob.CreateInStream(InStr2);
                        EmailMessage.AddAttachment('attachment.pdf', 'PDF', InStr2);
                        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                    end;
                end;
                RFQReqVendors."Invitation Email Sent" := true;
                RFQReqVendors."Date/Time Notified" := CurrentDatetime;
                RFQReqVendors.Modify(true);
            until RFQReqVendors.Next = 0;
        end;
        //END;
        Message('Request Sent Successfully');
    end;

    procedure FnPostPlanRevisions(ProcurementPlan: Record "Procurement Plan")
    var
        ProcurementPlanLines: Record "Procurement Plan Lines";
        ProcurementPlanLines1: Record "Procurement Plan Lines";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        ProcurementPlanEntry1: Record "Procurement Plan Entry";
        TXT002: label 'Are you sure to Post the Procurement plan Revisions ?';
        PlanEntry: Record "Procurement Plan Entry";
        PlanEntry1: Record "Procurement Plan Entry";
    begin
        if Confirm(TXT002) = true then begin
            PlanEntry.Reset;
            PlanEntry.SetRange("Procurement Plan ID", ProcurementPlan.Code);
            if PlanEntry.FindSet then begin
                repeat
                    PlanEntry1.Reset;
                    PlanEntry1.SetRange("Procurement Plan ID", ProcurementPlan."Plan No");
                    PlanEntry1.SetRange("Entry No.", PlanEntry."Vote Item");
                    if PlanEntry1.FindSet then begin
                        PlanEntry1.Blocked := true;
                        PlanEntry1.Modify(true);
                    end;
                until PlanEntry.Next = 0;
            end;
            ProcurementPlanLines.Reset;
            ProcurementPlanLines.SetRange("Procurement Plan ID", ProcurementPlan.Code);
            if ProcurementPlanLines.FindSet then begin
                repeat
                    ProcurementPlanLines1.Reset;
                    ProcurementPlanLines1.SetRange("Procurement Plan ID", ProcurementPlan."Plan No");
                    ProcurementPlanLines1.SetRange("Planning Category", ProcurementPlanLines."Planning Category");
                    if not ProcurementPlanLines1.FindSet then begin
                        //      REPEAT
                        //  ProcurementPlanLines1.INIT;
                        //  ProcurementPlanLines1."Document Type":=ProcurementPlan."Document Type"::"Procurement Plan";
                        //  ProcurementPlanLines1."Procurement Plan ID":=ProcurementPlan."Plan No";
                        // // ProcurementPlanLines1."PP Line No":=ProcurementPlanLines."PP Line No";
                        //  ProcurementPlanLines1."Planning Category":=ProcurementPlanLines."Planning Category";
                        //  ProcurementPlanLines1.Description:=ProcurementPlanLines.Description;
                        //  ProcurementPlanLines1."Procurement Method":=ProcurementPlanLines."Procurement Method";
                        //  ProcurementPlanLines1."Procurement Type":=ProcurementPlanLines."Procurement Type";
                        //  ProcurementPlanLines1."Solicitation Type":=ProcurementPlanLines."Solicitation Type";
                        //  ProcurementPlanLines1."Primary Source of Funds":=ProcurementPlanLines."Primary Source of Funds";
                        //  ProcurementPlanLines1.MODIFY:=TRUE;
                        //  UNTIL ProcurementPlanLines.NEXT=0;
                        // END   ELSE BEGIN
                        //   REPEAT
                        ProcurementPlanLines1.Init;
                        ProcurementPlanLines1."Document Type" := ProcurementPlan."document type"::"Procurement Plan";
                        ProcurementPlanLines1."Procurement Plan ID" := ProcurementPlan."Plan No";
                        // ProcurementPlanLines1."PP Line No":=ProcurementPlanLines."PP Line No";
                        ProcurementPlanLines1."Planning Category" := ProcurementPlanLines."Planning Category";
                        ProcurementPlanLines1.Description := ProcurementPlanLines.Description;
                        ProcurementPlanLines1."Procurement Method" := ProcurementPlanLines."Procurement Method";
                        ProcurementPlanLines1."Procurement Type" := ProcurementPlanLines."Procurement Type";
                        ProcurementPlanLines1."Solicitation Type" := ProcurementPlanLines."Solicitation Type";
                        ProcurementPlanLines1."Primary Source of Funds" := ProcurementPlanLines."Primary Source of Funds";
                        ProcurementPlanLines1.Insert(true);
                    end;
                until ProcurementPlanLines.Next = 0;
            end;


            ProcurementPlanEntry.Reset;
            ProcurementPlanEntry.SetRange("Procurement Plan ID", ProcurementPlan.Code);
            if ProcurementPlanEntry.FindSet then begin
                repeat
                    ProcurementPlanEntry1.Init;
                    ProcurementPlanEntry1."Procurement Plan ID" := ProcurementPlan."Plan No";
                    ProcurementPlanEntry1."Entry No." := ProcurementPlanEntry1."Entry No." + 1;
                    ProcurementPlanEntry1."Document Type" := ProcurementPlan."document type"::"Procurement Plan";
                    ProcurementPlanEntry1."Planning Category" := ProcurementPlanEntry."Planning Category";
                    ProcurementPlanEntry1."Plan Item Type" := ProcurementPlanEntry."Plan Item Type";
                    ProcurementPlanEntry1."Plan Item No" := ProcurementPlanEntry."Plan Item No";
                    ProcurementPlanEntry1.Description := ProcurementPlanEntry.Description;
                    ProcurementPlanEntry1."Solicitation Type" := ProcurementPlanEntry."Solicitation Type";
                    ProcurementPlanEntry1."Procurement Method" := ProcurementPlanEntry."Procurement Method";
                    ProcurementPlanEntry1.Quantity := ProcurementPlanEntry.Quantity;
                    ProcurementPlanEntry1."Unit Cost" := ProcurementPlanEntry."Unit Cost";
                    ProcurementPlanEntry1."Line Budget Cost" := ProcurementPlanEntry."Line Budget Cost";
                    ProcurementPlanEntry1.Directorate := ProcurementPlanEntry.Directorate;
                    ProcurementPlanEntry1.Department := ProcurementPlanEntry.Department;
                    ProcurementPlanEntry1."Global Dimension 1 Code" := ProcurementPlanEntry."Global Dimension 1 Code";
                    ProcurementPlanEntry1."Global Dimension 2 Code" := ProcurementPlanEntry."Global Dimension 2 Code";
                    ProcurementPlanEntry1."Budget Control Job No" := ProcurementPlanEntry."Budget Control Job No";
                    ProcurementPlanEntry1."Budget Control Job Task No." := ProcurementPlanEntry."Budget Control Job Task No.";
                    ProcurementPlanEntry1."Budget Account" := ProcurementPlanEntry."Budget Account";
                    ProcurementPlanEntry1."Procurement Type" := ProcurementPlanEntry."Procurement Type";
                    ProcurementPlanEntry1."Procurement Use" := ProcurementPlanEntry."Procurement Use";
                    ProcurementPlanEntry1."Preference/Reservation Code" := ProcurementPlanEntry."Preference/Reservation Code";
                    ProcurementPlanEntry1."Vendor Group" := ProcurementPlanEntry."Vendor Group";
                    ProcurementPlanEntry1."Vendor Type" := ProcurementPlanEntry."Vendor Type";
                    ProcurementPlanEntry1."Work Plan Project ID" := ProcurementPlanEntry."Work Plan Project ID";
                    ProcurementPlanEntry1."Workplan Task No." := ProcurementPlanEntry."Workplan Task No.";
                    ProcurementPlanEntry1."Q1 Amount" := ProcurementPlanEntry."Q1 Amount";
                    ProcurementPlanEntry1."Q1 Quantity" := ProcurementPlanEntry."Q1 Quantity";
                    ProcurementPlanEntry1."Q2 Amount" := ProcurementPlanEntry."Q2 Amount";
                    ProcurementPlanEntry1."Q2 Quantity" := ProcurementPlanEntry."Q2 Quantity";
                    ProcurementPlanEntry1."Q3 Amount" := ProcurementPlanEntry."Q3 Amount";
                    ProcurementPlanEntry1."Q3 Quantity" := ProcurementPlanEntry."Q3 Quantity";
                    ProcurementPlanEntry1."Q4 Amount" := ProcurementPlanEntry."Q4 Amount";
                    ProcurementPlanEntry1."Q4 Quantity" := ProcurementPlanEntry."Q4 Quantity";
                    ProcurementPlanEntry1."Invite Tender" := ProcurementPlanEntry."Invite Tender";
                    ProcurementPlanEntry1."Open Tender" := ProcurementPlanEntry."Open Tender";
                    ProcurementPlanEntry1."Revision  No" := ProcurementPlanEntry."Revision  No" + 1;
                    ProcurementPlanEntry1."Bid Evaluation" := ProcurementPlanEntry."Bid Evaluation";
                    ProcurementPlanEntry1."Tender Committee Action" := ProcurementPlanEntry."Tender Committee Action";
                    ProcurementPlanEntry1."Notification of Award" := ProcurementPlanEntry."Notification of Award";
                    ProcurementPlanEntry1."Signing of Contract" := ProcurementPlanEntry."Signing of Contract";
                    ProcurementPlanEntry1."Completion of works" := ProcurementPlanEntry."Completion of works";
                    ProcurementPlanEntry1."Procurement Duration (Days)" := ProcurementPlanEntry."Procurement Duration (Days)";
                    ProcurementPlanEntry1."Procurement Start Date" := ProcurementPlanEntry."Procurement Start Date";
                    ProcurementPlanEntry1."Procurement End Date" := ProcurementPlanEntry."Procurement End Date";
                    ProcurementPlanEntry1.Insert(true);
                until ProcurementPlanEntry.Next = 0;
                // END;
            end;


        end;
        Message('Posted Successfully');
    end;

    procedure FnSuggestPlanLines(ProcurementPlan: Record "Procurement Plan")
    var
        ProcurementPlanLines: Record "Procurement Plan Lines";
        ProcurementPlanLines1: Record "Procurement Plan Lines";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        ProcurementPlanEntry1: Record "Procurement Plan Entry";
        TXT001: label 'Are you sure to suggest Procurement plan Lines ?';
        PlanAmt: decimal;
    begin
        if Confirm(TXT001) = true then begin
            ProcurementPlanEntry.Reset;
            ProcurementPlanEntry.SetRange("Procurement Plan ID", ProcurementPlan.Code);
            if ProcurementPlanEntry.FindSet then begin
                ProcurementPlanEntry.DeleteAll;
            end;
            ProcurementPlanLines.Reset;
            ProcurementPlanLines.SetRange("Procurement Plan ID", ProcurementPlan.Code);
            if ProcurementPlanLines.FindSet then begin
                ProcurementPlanLines.DeleteAll;
            end;
            ProcurementPlan.TestField("Plan No");
            ProcurementPlan.TestField("Global Dimension 1 Code");
            ProcurementPlan.TestField("Global Dimension 1 Code");
            ProcurementPlanLines.Reset;
            ProcurementPlanLines.SetRange("Procurement Plan ID", ProcurementPlan."Plan No");
            if ProcurementPlanLines.FindSet then begin
                repeat
                    ProcurementPlanLines1.Init;
                    ProcurementPlanLines1."Document Type" := ProcurementPlan."Document Type";
                    ProcurementPlanLines1."Procurement Plan ID" := ProcurementPlan.Code;
                    ProcurementPlanLines1."PP Line No" := ProcurementPlanLines."PP Line No";
                    ProcurementPlanLines1."Planning Category" := ProcurementPlanLines."Planning Category";
                    ProcurementPlanLines1.Description := ProcurementPlanLines.Description;
                    ProcurementPlanLines1."Procurement Method" := ProcurementPlanLines."Procurement Method";
                    ProcurementPlanLines1."Procurement Type" := ProcurementPlanLines."Procurement Type";
                    ProcurementPlanLines1."Solicitation Type" := ProcurementPlanLines."Solicitation Type";
                    ProcurementPlanLines1."Primary Source of Funds" := ProcurementPlanLines."Primary Source of Funds";
                    ProcurementPlanLines1.Insert();
                until ProcurementPlanLines.Next = 0;


            end;
            ProcurementPlanEntry.Reset;
            ProcurementPlanEntry.SetRange("Procurement Plan ID", ProcurementPlan."Plan No");
            ProcurementPlanEntry.SetRange("Global Dimension 1 Code", ProcurementPlan."Global Dimension 1 Code");
            ProcurementPlanEntry.SetRange("Global Dimension 2 Code", ProcurementPlan."Global Dimension 2 Code");
            ProcurementPlanEntry.SetRange(Blocked, false);
            if ProcurementPlanEntry.FindSet then begin
                repeat
                    ProcurementPlanEntry1.Init;
                    ProcurementPlanEntry1."Procurement Plan ID" := ProcurementPlan.Code;
                    ProcurementPlanEntry1."Entry No." := ProcurementPlanEntry1."Entry No." + 100;
                    ProcurementPlanEntry1."Revised Plan No" := ProcurementPlan."Plan No";
                    ProcurementPlanEntry1."Document Type" := ProcurementPlan."Document Type";
                    ProcurementPlanEntry1."Plan Item Type" := ProcurementPlanEntry."Plan Item Type";
                    ProcurementPlanEntry1."Plan Item No" := ProcurementPlanEntry."Plan Item No";
                    ProcurementPlanEntry1."Vote Item" := ProcurementPlanEntry."Entry No.";
                    ProcurementPlanEntry1."Planning Category" := ProcurementPlanEntry."Planning Category";
                    ProcurementPlanEntry1.Description := ProcurementPlanEntry.Description;
                    ProcurementPlanEntry1."Solicitation Type" := ProcurementPlanEntry."Solicitation Type";
                    ProcurementPlanEntry1."Procurement Method" := ProcurementPlanEntry."Procurement Method";
                    ProcurementPlanEntry1.Quantity := ProcurementPlanEntry.Quantity;
                    ProcurementPlanEntry1."Revision  No" := ProcurementPlanEntry."Revision  No";
                    ProcurementPlanEntry1."Unit Cost" := ProcurementPlanEntry."Unit Cost";
                    ProcurementPlanEntry1."Line Budget Cost" := ProcurementPlanEntry."Line Budget Cost";
                    ProcurementPlanEntry1.Directorate := ProcurementPlanEntry.Directorate;
                    ProcurementPlanEntry1.Department := ProcurementPlanEntry.Department;
                    ProcurementPlanEntry1."Global Dimension 1 Code" := ProcurementPlanEntry."Global Dimension 1 Code";
                    ProcurementPlanEntry1."Global Dimension 2 Code" := ProcurementPlanEntry."Global Dimension 2 Code";
                    ProcurementPlanEntry1."Budget Control Job No" := ProcurementPlanEntry."Budget Control Job No";
                    ProcurementPlanEntry1."Budget Control Job Task No." := ProcurementPlanEntry."Budget Control Job Task No.";
                    ProcurementPlanEntry1."Budget Account" := ProcurementPlanEntry."Budget Account";
                    ProcurementPlanEntry1."Procurement Type" := ProcurementPlanEntry."Procurement Type";
                    ProcurementPlanEntry1."Procurement Use" := ProcurementPlanEntry."Procurement Use";
                    ProcurementPlanEntry1."Preference/Reservation Code" := ProcurementPlanEntry."Preference/Reservation Code";
                    ProcurementPlanEntry1."Vendor Group" := ProcurementPlanEntry."Vendor Group";
                    ProcurementPlanEntry1."Vendor Type" := ProcurementPlanEntry."Vendor Type";
                    ProcurementPlanEntry1."Work Plan Project ID" := ProcurementPlanEntry."Work Plan Project ID";
                    ProcurementPlanEntry1."Workplan Task No." := ProcurementPlanEntry."Workplan Task No.";
                    ProcurementPlanEntry1."Q1 Amount" := ProcurementPlanEntry."Q1 Amount";
                    ProcurementPlanEntry1."Q1 Quantity" := ProcurementPlanEntry."Q1 Quantity";
                    ProcurementPlanEntry1."Q2 Amount" := ProcurementPlanEntry."Q2 Amount";
                    ProcurementPlanEntry1."Q2 Quantity" := ProcurementPlanEntry."Q2 Quantity";
                    ProcurementPlanEntry1."Q3 Amount" := ProcurementPlanEntry."Q3 Amount";
                    ProcurementPlanEntry1."Q3 Quantity" := ProcurementPlanEntry."Q3 Quantity";
                    ProcurementPlanEntry1."Q4 Amount" := ProcurementPlanEntry."Q4 Amount";
                    ProcurementPlanEntry1."Q4 Quantity" := ProcurementPlanEntry."Q4 Quantity";
                    ProcurementPlanEntry1."Invite Tender" := ProcurementPlanEntry."Invite Tender";
                    ProcurementPlanEntry1."Open Tender" := ProcurementPlanEntry."Open Tender";
                    ProcurementPlanEntry1."Bid Evaluation" := ProcurementPlanEntry."Bid Evaluation";
                    ProcurementPlanEntry1."Tender Committee Action" := ProcurementPlanEntry."Tender Committee Action";
                    ProcurementPlanEntry1."Notification of Award" := ProcurementPlanEntry."Notification of Award";
                    ProcurementPlanEntry1."Signing of Contract" := ProcurementPlanEntry."Signing of Contract";
                    ProcurementPlanEntry1."Completion of works" := ProcurementPlanEntry."Completion of works";
                    ProcurementPlanEntry1."Procurement Duration (Days)" := ProcurementPlanEntry."Procurement Duration (Days)";
                    ProcurementPlanEntry1."Procurement Start Date" := ProcurementPlanEntry."Procurement Start Date";
                    ProcurementPlanEntry1."Procurement End Date" := ProcurementPlanEntry."Procurement End Date";
                    ProcurementPlanEntry1.Modified := true;
                    ProcurementPlanEntry1.Insert();
                until ProcurementPlanEntry.Next = 0;
            end;


        end;
        Message('Suggested Successfully');
    end;

    procedure FnInitiateDisposalMethod(DisposalHeader: Record "Disposal Header")
    var
        Disp: Record "Standard Sales Code";
        DisposalLines: Record "Disposal Lines";
        DispLine: Record "Standard Sales Line";
        CompanyInfo: Record "Company Information";
        DispLine1: Record "Standard Sales Line";
    begin
        ProctSetup.Get;
        DisposalLines.Reset;
        DisposalLines.SetRange("Document No.", DisposalHeader.No);
        DisposalLines.SetRange(Generated, false);
        if DisposalLines.FindSet then begin
            repeat
                DisposalLines.TestField("Disposal Type");
                // DisposalLines.TESTFIELD("Method of Disposal");
                Disp.Reset;
                Disp.SetRange("Disposal Requisition No", DisposalHeader.No);
                Disp.SetRange("Method of Disposal", DisposalLines."Method of Disposal");
                Disp.SetRange(Status, Disp.Status::Open);
                if not Disp.Find('-') then begin
                    Disp.Init;
                    Disp.Code := NoSeriesManagement.GetNextNo(ProctSetup."Disposal Invitation Nos", Today, true);
                    Disp.Description := 'Asset Disposal';
                    Disp."Tender Name" := DisposalLines."Disposal Methods" + ' Asset Disposal';
                    Disp."Tender Summary" := DisposalLines."Disposal Methods" + ' Asset Disposal';
                    Disp."Created by" := UserId;
                    Disp."Document Date" := Today;
                    Disp."Created Date/Time" := CreateDatetime(Today, Time);
                    Disp."Disposal Requisition No" := DisposalHeader.No;
                    Disp."Method of Disposal" := DisposalLines."Method of Disposal";
                    Disp."Disposal Type" := DisposalLines."Disposal Type";
                    Disp."Disposal  Plan ID" := DisposalLines."Disposal Plan";
                    Disp."Disposal  Plan Line No." := DisposalLines."Disposal Item No";
                    CompanyInfo.Get;
                    // Disp."Procuring Entity Name/Contact" := CompanyInfo.Name;
                    Disp.Address := CompanyInfo.Address;
                    Disp."Address 2" := CompanyInfo."Address 2";
                    Disp."Phone No." := CompanyInfo."Phone No.";
                    Disp."Tender Box Location Code" := CompanyInfo.Address + ' ' + CompanyInfo."Address 2";
                    Disp."E-Mail" := CompanyInfo."E-Mail";
                    Disp."Post Code" := CompanyInfo."Post Code";
                    Disp.City := CompanyInfo.City;
                    Disp.County := CompanyInfo.County;
                    Disp."Country/Region Code" := CompanyInfo."Country/Region Code";
                    if Disp.Insert(true) then begin
                        DispLine.Init;
                        DispLine."Standard Sales Code" := Disp.Code;
                        DispLine."Line No." := DisposalLines."Disposal Item No";
                        if DisposalLines.Type = DisposalLines.Type::"Fixed Asset" then begin
                            DispLine.Type := DispLine.Type::"Fixed Asset"
                        end;
                        if DisposalLines.Type = DisposalLines.Type::Item then begin
                            DispLine.Type := DispLine.Type::Item
                        end;
                        DispLine."No." := DisposalLines."Fixed Asset/Item No.";
                        DispLine.Description := DisposalLines."Description of Item";
                        DispLine.Quantity := DisposalLines.Quantity;
                        DispLine."Unit of Measure Code" := DisposalLines."Unit of Issue";
                        DispLine."Amount Excl. VAT" := DisposalLines."Estimated current value";
                        DispLine."Disposal Plan" := DisposalLines."Disposal Plan";
                        DispLine."Disposal Requisition No" := DisposalLines."Document No.";
                        DispLine."Disposal Type" := DisposalLines."Disposal Type";
                        DispLine."Disposal Methods" := DisposalLines."Disposal Methods";
                        DispLine."Method of Disposal" := DisposalLines."Method of Disposal";
                        DispLine."Disposal Item No" := DisposalLines."Disposal Item No";
                        DispLine."Estimated current value" := DisposalLines."Estimated current value";
                        if DispLine.Insert(true) then begin
                            DisposalLines.Generated := true;
                            DisposalLines."IFD No" := Disp.Code;
                            Message('DISP %1', Disp.Code);
                            DisposalLines.Modify(true);
                        end;
                    end else begin
                        //
                        DispLine1.Init;
                        DispLine1."Standard Sales Code" := Disp.Code;
                        DispLine1."Line No." := DisposalLines."Disposal Item No";
                        if DisposalLines.Type = DisposalLines.Type::"Fixed Asset" then begin
                            DispLine1.Type := DispLine1.Type::"Fixed Asset"
                        end;
                        if DisposalLines.Type = DisposalLines.Type::Item then begin
                            DispLine1.Type := DispLine1.Type::Item
                        end;
                        DispLine1."No." := DisposalLines."Fixed Asset/Item No.";
                        DispLine1.Description := DisposalLines."Description of Item";
                        DispLine1.Quantity := DisposalLines.Quantity;
                        DispLine1."Unit of Measure Code" := DisposalLines."Unit of Issue";
                        DispLine1."Disposal Type" := DisposalLines."Disposal Type";
                        DispLine1."Disposal Methods" := DisposalLines."Disposal Methods";
                        DispLine1."Method of Disposal" := DisposalLines."Method of Disposal";
                        DispLine1."Amount Excl. VAT" := DisposalLines."Estimated current value";
                        DispLine1."Disposal Plan" := DisposalLines."Disposal Plan";
                        DispLine1."Disposal Requisition No" := DisposalLines."Document No.";
                        DispLine1."Disposal Item No" := DisposalLines."Disposal Item No";
                        DispLine1."Estimated current value" := DisposalLines."Estimated current value";
                        if DispLine1.Insert(true) then begin
                            DisposalLines.Generated := true;
                            DisposalLines."IFD No" := Disp.Code;
                            Message('DISP %1', Disp.Code);
                            DisposalLines.Modify(true);
                        end;
                    end;
                end;
            until DisposalLines.Next = 0;
        end;
    end;

    procedure SuggestPreliminaryEvaluationEntries1(EvaluationHeader: Record "Bid Evaluation Register")
    var
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Evaluation Score Entry";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidEvalHeader: Record "Bid Evaluation Register";
        EvaluationFindings: Code[50];
        EvaluationResults: Boolean;
    begin

        EvaluationHeader.TestField("Bid Scoring Document No.");
        Bidevaluationscore.Reset;
        if Bidevaluationscore.FindLast then
            LineNo := Bidevaluationscore."Line No";

        Bidevaluationscore.Reset;
        Bidevaluationscore.SetRange("Bid Scoring Document No.", EvaluationHeader."Bid Scoring Document No.");
        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
        if Bidevaluationscore.FindSet then begin
            Bidevaluationscore.DeleteAll;
        end;
        BidEvaluationCriteria.Reset;
        BidEvaluationCriteria.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvaluationCriteria.SetRange("Document No", EvaluationHeader.Code);
        if BidEvaluationCriteria.FindSet then begin
            BidEvaluationCriteria.DeleteAll;
        end;

        BidEvalScore.Reset;
        BidEvalScore.SetRange("Template ID", EvaluationHeader."Bid Scoring Document No.");
        BidEvalScore.SetRange("Document No", EvaluationHeader.Code);
        if BidEvalScore.FindSet then begin
            BidEvalScore.DeleteAll;
        end;
        //check for different values
        BidEvalHeader.Reset;
        BidEvalHeader.SetRange("IFS Code", EvaluationHeader."IFS Code");
        BidEvalHeader.SetRange("Evaluation Type", EvaluationHeader."Evaluation Type");
        BidEvalHeader.SetFilter(Code, '<>%1', EvaluationHeader.Code);
        BidEvalHeader.SetRange("Bid No.", EvaluationHeader."Bid No.");
        BidEvalHeader.SetRange("Vendor No.", EvaluationHeader."Vendor No.");
        BidEvalHeader.SetRange("Evaluator Category", BidEvalHeader."evaluator category"::"Individual Evaluator");
        if BidEvalHeader.FindSet then begin
            repeat
                // MESSAGE('%1',BidEvalHeader.Code);
                BidSCoreGuide.Reset;
                BidSCoreGuide.SetRange(Code, BidEvalHeader.Code);
                if BidSCoreGuide.FindSet then begin
                    repeat
                        // Message('%1', BidEvalHeader.Code);
                        Bidevaluationscore.Reset;
                        Bidevaluationscore.SetRange("Requirement ID", BidSCoreGuide."Requirement ID");
                        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
                        if not Bidevaluationscore.FindSet then begin
                            Bidevaluationscore.Init;
                            Bidevaluationscore.TransferFields(BidSCoreGuide);
                            Bidevaluationscore.Code := EvaluationHeader.Code;
                            Bidevaluationscore."Bid No." := EvaluationHeader."Bid No.";
                            Bidevaluationscore."Vendor No." := EvaluationHeader."Vendor No.";
                            Bidevaluationscore."Bid Scoring Document No." := EvaluationHeader."Bid Scoring Document No.";
                            // Bidevaluationscore."Response Value" := BidSCoreGuide."Response Value";
                            Bidevaluationscore.Insert(true);
                            EvaluationFindings := Bidevaluationscore."Response Value";
                            EvaluationResults := ReturnValue(Bidevaluationscore);
                            if EvaluationResults = false then begin
                                Bidevaluationscore."Response Value" := '';
                                Bidevaluationscore.Modify(true);
                            end;
                        end;
                        Bidevaluationscore.Reset;
                        Bidevaluationscore.SetRange("Requirement ID", BidSCoreGuide."Requirement ID");
                        Bidevaluationscore.SetRange(Code, EvaluationHeader.Code);
                        if Bidevaluationscore.FindSet then begin
                            //Bidevaluationscore.INIT;
                            //Bidevaluationscore.TRANSFERFIELDS(BidSCoreGuide);
                            //Bidevaluationscore.Code:=EvaluationHeader.Code;
                            ///Bidevaluationscore."Bid No.":=EvaluationHeader."Bid No.";
                            // Bidevaluationscore."Vendor No.":=EvaluationHeader."Vendor No.";
                            //Bidevaluationscore."Bid Scoring Document No.":=EvaluationHeader."Bid Scoring Document No.";
                            Bidevaluationscore."Score %" := (Bidevaluationscore."Score %" + BidSCoreGuide."Score %") / 2;
                            Bidevaluationscore.Validate(Bidevaluationscore."Score %");
                            // MESSAGE('%1 %2 %3',EvaluationResults,BidEvalHeader.Code,Bidevaluationscore."Response Value");
                            Bidevaluationscore.Modify(true);
                            EvaluationFindings := Bidevaluationscore."Response Value";
                            EvaluationResults := ReturnValue(Bidevaluationscore);

                            /*IF Bidevaluationscore."Response Value"=BidSCoreGuide."Response Value" THEN
                              BEGIN
                                Bidevaluationscore.VALIDATE(Bidevaluationscore."Response Value",'');
                                Bidevaluationscore.MODIFY(TRUE);
                              END;*/
                        end;

                        LineNo += 1;
                    until BidSCoreGuide.Next = 0;
                end;
            until BidEvalHeader.Next = 0;
        end;
        /*
        //add bid evaluation criteria
        EvaluationCriteria.RESET;
        EvaluationCriteria.SETRANGE("Template ID",EvaluationHeader."Bid Scoring Document No.");
        EvaluationCriteria.SETRANGE("Evaluation Type",EvaluationHeader."Evaluation Type");
        IF EvaluationCriteria.FINDSET THEN BEGIN
          REPEAT
            BidEvaluationCriteria.INIT;
            BidEvaluationCriteria."Template ID":=EvaluationCriteria."Template ID";
            BidEvaluationCriteria."Criteria Group ID":=EvaluationCriteria."Criteria Group ID";
            BidEvaluationCriteria."Document No":=EvaluationHeader.Code;
            BidEvaluationCriteria."Evaluation Type":=EvaluationCriteria."Evaluation Type";
            BidEvaluationCriteria.Description:=EvaluationCriteria.Description;
            BidEvaluationCriteria."Total Weight %":=EvaluationCriteria."Total Weight %";
            BidEvaluationCriteria.INSERT(TRUE);
            UNTIL EvaluationCriteria.NEXT=0;
          END;
        
        //add Bid Evaluation Score Guide
          BidScore.RESET;
          BidScore.SETRANGE("Template ID",EvaluationHeader."Bid Scoring Document No.");
          BidScore.SETRANGE("Evaluation Type",EvaluationHeader."Evaluation Type");
          IF BidScore.FINDSET THEN BEGIN
            REPEAT
            BidEvalScore.INIT;
            BidEvalScore."Template ID":=BidScore."Template ID";
            BidEvalScore."Criteria Group ID":=BidScore."Criteria Group ID";
            BidEvalScore."Requirement ID":=BidScore."Requirement ID";
            BidEvalScore."Entry No":=BidScore."Entry No";
            BidEvalScore."Response Value":=BidScore."Response Value";
            BidEvalScore."Document No":=EvaluationHeader.Code;
            BidEvalScore."Target Qty":=BidScore."Target Qty";
            BidEvalScore."Rating Type":=BidScore."Rating Type";
            BidEvalScore."Evaluation Type":=BidScore."Evaluation Type";
            BidEvalScore."Desired Perfomance Direction":=BidScore."Desired Perfomance Direction";
            BidEvalScore."Min Bid Value":=BidScore."Min Bid Value";
            BidEvalScore."Max Bid Value":=BidScore."Max Bid Value";
            BidEvalScore."Min Date Value":=BidScore."Min Date Value";
            BidEvalScore."Max Date Value":=BidScore."Max Date Value";
            BidEvalScore."Score %":=BidScore."Score %";
            BidEvalScore.INSERT(TRUE);
            UNTIL BidScore.NEXT=0;
            END;
        */

    end;

    procedure FnInitiateDisposalContract(StandardSalesCode: Record "Standard Sales Code")
    var
        StandardSalesLine: Record "Standard Sales Line";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
    begin
        StandardSalesCode.TestField(Status, StandardSalesCode.Status::Released);
        StandardSalesCode.TestField(Posted, false);
        StandardSalesLine.Reset;
        StandardSalesLine.SetRange("Standard Sales Code", StandardSalesCode.Code);
        StandardSalesLine.SetRange(Generated, false);
        if StandardSalesLine.FindSet then begin
            repeat
                StandardSalesLine.TestField("Sell to Customer No");
                SalesHeader.Reset;
                SalesHeader.SetRange("Document Type", SalesHeader."document type"::Order);
                SalesHeader.SetRange("Sell-to Customer No.", StandardSalesLine."Sell to Customer No");
                SalesHeader.SetFilter("Method of Disposal", '<>%1', SalesHeader."method of disposal"::" ");
                SalesHeader.SetRange(Status, SalesHeader.Status::Open);
                if SalesHeader.FindFirst then begin
                    SalesLine.Init;
                    SalesLine."Document Type" := SalesLine."document type"::Order;
                    SalesLine."Document No." := SalesHeader."No.";
                    SalesLine."Line No." := StandardSalesLine."Line No.";
                    SalesLine.Type := StandardSalesLine.Type;
                    SalesLine."No." := StandardSalesLine."No.";
                    SalesLine.Description := StandardSalesLine.Description;
                    //SalesLine.Quantity:=StandardSalesLine.Quantity;
                    SalesLine.Validate(Quantity, StandardSalesLine.Quantity);
                    SalesLine."Location Code" := StandardSalesLine."Location Code";
                    SalesLine.Validate("Unit Price", StandardSalesLine."Actual Unit Cost(LCY)");
                    //SalesLine."Unit Price":=StandardSalesLine."Actual Unit Cost(LCY)";
                    SalesLine."Line Amount" := StandardSalesLine.Quantity * StandardSalesLine."Actual Unit Cost(LCY)";
                    SalesLine.Validate("Unit Price");
                    SalesLine."Unit of Measure Code" := StandardSalesLine."Unit of Measure Code";
                    SalesLine."FA Posting Date" := Today;
                    if SalesLine.Insert(true) then begin
                        SalesLine.Validate("Unit Price");
                    end;
                    StandardSalesLine.Generated := true;
                    StandardSalesLine."Sale Contract No" := SalesHeader."No.";
                    StandardSalesLine.Modify(true);


                end else begin
                    SalesHeader.Init;
                    SalesReceivablesSetup.Get;
                    SalesHeader."No." := NoSeriesManagement.GetNextNo(SalesReceivablesSetup."Order Nos.", Today, true);
                    SalesHeader."Document Type" := SalesHeader."document type"::Order;
                    SalesHeader."Sell-to Customer No." := StandardSalesLine."Sell to Customer No";
                    SalesHeader."Disposal Invitation No" := StandardSalesLine."Disposal Requisition No";
                    SalesHeader."Disposal Invitation No" := StandardSalesLine."Standard Sales Code";
                    SalesHeader."Disposal Type" := StandardSalesLine."Disposal Type";
                    SalesHeader."Method of Disposal" := StandardSalesLine."Method of Disposal";
                    if SalesHeader.Insert(true) then begin
                        SalesHeader.Validate("Sell-to Customer No.");
                        SalesLine.Init;
                        SalesLine."Document Type" := SalesLine."document type"::Order;
                        SalesLine."Document No." := SalesHeader."No.";
                        SalesLine."Line No." := StandardSalesLine."Line No.";
                        SalesLine.Type := StandardSalesLine.Type;
                        SalesLine."No." := StandardSalesLine."No.";
                        SalesLine.Description := StandardSalesLine.Description;
                        //SalesLine.Quantity:=StandardSalesLine.Quantity;
                        SalesLine.Validate(Quantity, StandardSalesLine.Quantity);
                        SalesLine."Location Code" := StandardSalesLine."Location Code";
                        SalesLine.Validate("Unit Price", StandardSalesLine."Actual Unit Cost(LCY)");
                        //SalesLine."Unit Price":=StandardSalesLine."Actual Unit Cost(LCY)";
                        SalesLine."Line Amount" := StandardSalesLine.Quantity * StandardSalesLine."Actual Unit Cost(LCY)";
                        SalesLine."Unit of Measure Code" := StandardSalesLine."Unit of Measure Code";
                        SalesLine."FA Posting Date" := Today;
                        if SalesLine.Insert(true) then begin

                            SalesLine.Validate(Quantity);
                        end;
                        StandardSalesLine.Generated := true;
                        StandardSalesLine."Sale Contract No" := SalesHeader."No.";
                        StandardSalesLine.Modify(true);

                    end;

                end;
            until StandardSalesLine.Next = 0;
        end;
        StandardSalesCode.Posted := true;
        StandardSalesCode."Posted BY" := UserId;
        StandardSalesCode."Posted On" := CreateDatetime(Today, Time);
    end;


    procedure exportToExcel(pplan: Record "Procurement Plan")
    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        ServerFileName: Text;
        x: Codeunit "Excel Management";
        WorkplanLines: Record "Procurement Plan Entry";
    begin
        ExcelBuffer.Reset();
        ExcelBuffer.deleteAll();
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Procurement Plan ID"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Entry No."), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Planning Category"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption(Modified), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Revised Plan No"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);

        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Vote Item"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Plan Item Type"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Plan Item No"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption(Description), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Procurement Type"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Procurement Method"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption(Quantity), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Unit Cost"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Line Budget Cost"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Global Dimension 1 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Global Dimension 2 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Shortcut Dimension 3 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Shortcut Dimension 4 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Shortcut Dimension 5 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Shortcut Dimension 6 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q1 Quantity"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q1 Amount"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q2 Quantity"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q2 Amount"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q3 Quantity"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q3 Amount"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q4 Quantity"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q4 Amount"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);

        WorkplanLines.Reset;
        WorkplanLines.SetRange("Procurement Plan ID", pplan.Code);
        if WorkplanLines.FindSet() then
            repeat
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn(WorkplanLines."Procurement Plan ID", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Entry No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);

                ExcelBuffer.AddColumn(WorkplanLines."Planning Category", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines.Modified, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Revised Plan No", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);

                ExcelBuffer.AddColumn(WorkplanLines."Vote Item", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Plan Item Type", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Plan Item No", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Procurement Type", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Procurement Method", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines.Quantity, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Unit Cost", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Line Budget Cost", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Global Dimension 1 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Global Dimension 2 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Shortcut Dimension 3 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Shortcut Dimension 4 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Shortcut Dimension 5 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Shortcut Dimension 6 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Q1 Quantity", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Q1 Amount", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Q2 Quantity", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Q2 Amount", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Q3 Quantity", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Q3 Amount", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Q4 Quantity", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Q4 Amount", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);


            until WorkplanLines.Next() = 0;
        ExcelBuffer.CreateNewBook('Plan Revision');
        ExcelBuffer.WriteSheet(pplan.Description, CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.SetFriendlyFilename(pplan.Description);
        ExcelBuffer.OpenExcel();

    end;

    procedure FnSuggestWorkPlanLines(ProcurementPlan: Record "Procurement Plan")
    var
        ProcurementPlanLines: Record "Procurement Plan Lines";
        ProcurementPlanLines1: Record "Procurement Plan Lines";
        ProcurementPlanEntry: Record "Workplan Workings";
        ProcurementPlanEntry1: Record "Procurement Plan Entry";
        ProcurementPlanEntry2: Record "Procurement Plan Entry";
        ProcurementPlanEntry3: Record "Procurement Plan Entry";
        Pcat: Record "Procurement Category";

        TXT001: label 'Are you sure to suggest Procurement plan Lines ?';
    begin
        if Confirm(TXT001) = true then begin

            ProcurementPlanLines.Reset;
            ProcurementPlanLines.SetRange("Procurement Plan ID", ProcurementPlan.Code);
            if ProcurementPlanLines.FindSet then begin
                ProcurementPlanLines.DeleteAll;
            end;
            ProcurementPlan.TestField("Annual Workplan Plan ID");
            Pcat.Reset();
            Pcat.SetRange(Blocked, false);
            if Pcat.FindSet then begin
                repeat
                    ProcurementPlanLines1.Init;
                    ProcurementPlanLines1."Document Type" := ProcurementPlan."Document Type";
                    ProcurementPlanLines1."Procurement Plan ID" := ProcurementPlan.Code;
                    ProcurementPlanLines.reset();
                    ProcurementPlanLines.setfilter("Procurement Plan ID", '<>%1', '');
                    if ProcurementPlanLines.findlast() then
                        ProcurementPlanLines1."PP Line No" := ProcurementPlanLines."PP Line No" + 1;
                    ProcurementPlanLines1."Planning Category" := Pcat.Code;
                    ProcurementPlanLines1.Description := Pcat.Description;
                    ProcurementPlanLines1."Procurement Type" := Pcat."Procurement Type";
                    ProcurementPlanLines1.Insert(true);
                until Pcat.Next = 0;

            end;


        end;
    end;

    procedure FnSuggestWorkPlanLinesENTRY(ProcurementPlan: Record "Procurement Plan")
    var
        ProcurementPlanLines: Record "Procurement Plan Lines";
        ProcurementPlanLines1: Record "Procurement Plan Lines";
        ProcurementPlanEntry: Record "Workplan Workings";
        ProcurementPlanEntry1: Record "Procurement Plan Entry";
        ProcurementPlanEntry2: Record "Procurement Plan Entry";
        ProcurementPlanEntry3: Record "Procurement Plan Entry";
        Pcat: Record "Procurement Category";

        TXT001: label 'Are you sure to suggest Procurement plan Lines ?';
    begin

        ProcurementPlanEntry3.Reset();
        ProcurementPlanEntry3.SetRange("Procurement Plan ID", ProcurementPlan.Code);
        if ProcurementPlanEntry3.FindSet then begin
            ProcurementPlanEntry3.DeleteAll;
        end;

        ProcurementPlanEntry.Reset;
        ProcurementPlanEntry.SetRange("Strategy Plan ID", ProcurementPlan."Annual Workplan Plan ID");
        ProcurementPlanEntry.setrange("Type", ProcurementPlanEntry."Type"::Procurable);
        if ProcurementPlanEntry.FindSet then begin
            repeat
                ProcurementPlanEntry1.Init;
                ProcurementPlanEntry1."Procurement Plan ID" := ProcurementPlan.Code;
                ProcurementPlanEntry2.reset();
                ProcurementPlanEntry2.setfilter("Procurement Plan ID", '<>%1', '');
                if ProcurementPlanEntry2.findlast() then
                    ProcurementPlanEntry1."Entry No." := ProcurementPlanEntry2."Entry No." + 1;
                ProcurementPlanEntry1.Validate("Planning Category", ProcurementPlanEntry."Budget Item");
                ProcurementPlanEntry1."Document Type" := ProcurementPlan."Document Type";
                ProcurementPlanEntry1."Plan Item Type" := ProcurementPlanEntry."Item Type";
                ProcurementPlanEntry1."Plan Item No" := ProcurementPlanEntry."Item No";
                ProcurementPlanEntry1.Description := ProcurementPlanEntry.Description;
                ProcurementPlanEntry1.Quantity := ProcurementPlanEntry.Unit;
                ProcurementPlanEntry1."Unit Cost" := ProcurementPlanEntry."Unit Cost";
                ProcurementPlanEntry1."Line Budget Cost" := ProcurementPlanEntry."Total Amount";
                ProcurementPlanEntry1."Global Dimension 1 Code" := ProcurementPlan."Global Dimension 1 Code";
                ProcurementPlanEntry1."Global Dimension 2 Code" := ProcurementPlan."Global Dimension 2 Code";
                ProcurementPlanEntry1."Budget Control Job No" := ProcurementPlan."Financial Budget ID";
                ProcurementPlanEntry1."Budget Control Job Task No." := ProcurementPlanEntry."Budget Item";
                ProcurementPlanEntry1."Q1 Amount" := ProcurementPlanEntry."Q1 Amount";
                ProcurementPlanEntry1."Q1 Quantity" := ProcurementPlanEntry."Q1 Quantity";
                ProcurementPlanEntry1."Q2 Amount" := ProcurementPlanEntry."Q2 Amount";
                ProcurementPlanEntry1."Q2 Quantity" := ProcurementPlanEntry."Q2 Quantity";
                ProcurementPlanEntry1."Q3 Amount" := ProcurementPlanEntry."Q3 Amount";
                ProcurementPlanEntry1."Q3 Quantity" := ProcurementPlanEntry."Q3 Quantity";
                ProcurementPlanEntry1."Q4 Amount" := ProcurementPlanEntry."Q4 Amount";
                ProcurementPlanEntry1."Q4 Quantity" := ProcurementPlanEntry."Q4 Quantity";
                ProcurementPlanEntry1.Insert(true);
            until ProcurementPlanEntry.Next = 0;
        end;



        Message('Suggested Successfully');
    end;



    procedure assignPurchaserCode(var IFSRec: Record "Standard Purchase Code"; purchaserCode: Code[20])
    var
        SalesOrder: Record "Salesperson/Purchaser";

    begin


        SalesOrder.reset;
        SalesOrder.SetRange(SalesOrder.Code, purchaserCode);
        if SalesOrder.findfirst then begin
            IFSRec."Purchaser Code" := SalesOrder."Employee No";
            IFSRec."Purchaser Name" := SalesOrder.name;
        end;
    end;




}

