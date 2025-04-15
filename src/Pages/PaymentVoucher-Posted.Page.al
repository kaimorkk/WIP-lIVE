Page 52193756 "Payment Voucher-Posted"
{
    Editable = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where(Posted = const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if Status <> Status::Open then
                            Error('You cannot change this document at this stage');
                    end;
                }
                field(PayingBankAccount; "Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;

                    trigger OnValidate()
                    begin
                        if Status <> Status::Open then
                            Error('You cannot change this document at this stage');
                    end;
                }
                field(BankName; "Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;

                    trigger OnValidate()
                    begin
                        if Status <> Status::Open then
                            Error('You cannot change this document at this stage');
                    end;
                }
                field(Currency; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(PayMode; "Pay Mode")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(ChequeNo; "Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    HideValue = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; "Amount Approved")
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount; "Total Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000049; "PV Lines")
            {
                SubPageLink = No = field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Payments)
            {
                Caption = 'Payments';
                action(IncludeTaxation)
                {
                    ApplicationArea = Basic;
                    Caption = 'Include Taxation';
                    Visible = false;

                    trigger OnAction()
                    begin
                        PVLines.Reset;
                        PVLines.SetRange(PVLines."PV No", "No.");
                        PVLines.SetRange(PVLines.Tax, true);
                        PVLines.DeleteAll;

                        PVLines.Reset;
                        PVLines.SetRange(PVLines."PV No", "No.");
                        if PVLines.Find('+') then
                            LastPVLine := PVLines."Line No";


                        if TarriffCodes.Get("VAT Code") then begin
                            PVLines.Init;
                            PVLines."PV No" := "No.";
                            PVLines."Line No" := LastPVLine + 10000;
                            PVLines."Account Type" := PVLines."account type"::"G/L Account";
                            PVLines."Account No" := TarriffCodes."G/L Account";
                            PVLines.Description := TarriffCodes.Description;
                            PVLines.Validate(PVLines."Account No");
                            PVLines.Tax := true;
                            // CalcFields("Base Amount");
                            // PVLines.Amount := -ROUND(("Base Amount" / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage));
                            if PVLines.Amount <> 0 then
                                PVLines.Insert;

                        end;

                        PVLines.Reset;
                        PVLines.SetRange(PVLines."PV No", "No.");
                        if PVLines.Find('+') then
                            LastPVLine := PVLines."Line No";

                        if TarriffCodes.Get("Withholding Tax Code") then begin
                            PVLines.Init;
                            PVLines."PV No" := "No.";
                            PVLines."Line No" := LastPVLine + 10000;
                            PVLines."Account Type" := PVLines."account type"::"G/L Account";
                            PVLines."Account No" := TarriffCodes."G/L Account";
                            PVLines.Description := TarriffCodes.Description;
                            PVLines.Validate(PVLines."Account No");
                            PVLines.Tax := true;

                            // CalcFields("Base Amount");
                            // PVLines.Amount := -ROUND(("Base Amount" / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage));
                            if PVLines.Amount <> 0 then
                                PVLines.Insert;


                        end;
                    end;
                }
                action(RemittanceAdvice)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remittance Advice';
                    Visible = false;

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter("No.", "No.");
                        Report.Run(53097, true, true, Rec);
                        Reset;
                    end;
                }
                action(ClaimAdvise)
                {
                    ApplicationArea = Basic;
                    Caption = 'Claim Advise';
                    Visible = false;

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter("No.", "No.");
                        Report.Run(53029, true, true, Rec);
                        Reset;
                    end;
                }
                action(VATCertificate)
                {
                    ApplicationArea = Basic;
                    Caption = 'VAT Certificate';
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*IF Status<>Status::Released THEN
                        ERROR('This document is not yet fully approved'); */
                        PVRec.Reset;
                        PVRec.SetRange(PVRec."No.", "No.");
                        Report.RunModal(50010, true, true, PVRec);

                    end;
                }
                action(WithholdingTaxCertificate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Withholding Tax Certificate';
                    Visible = false;

                    trigger OnAction()
                    begin
                        PVRec.Reset;
                        PVRec.SetRange(PVRec."No.", "No.");
                        Report.RunModal(50011, true, true, PVRec);
                    end;
                }
                action(GenerateEFT)
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate  EFT';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //KCBEFT.GetPV(Rec);
                        //KCBEFT.RUN;
                    end;
                }
                action(CBAEFT)
                {
                    ApplicationArea = Basic;
                    Caption = 'CBA EFT';
                    Visible = false;

                    trigger OnAction()
                    begin

                        //CBAEFT.GetPV(Rec);
                        PVRec.Reset;
                        PVRec.SetRange(PVRec."No.", "No.");
                        //REPORT.RUN(51511362,TRUE,TRUE,PVRec);
                        Report.Run(51511374, true, true, PVRec);
                    end;
                }
                action(Action1000000004)
                {
                    ApplicationArea = Basic;
                    Caption = 'CBA EFT';

                    trigger OnAction()
                    begin

                        //start from here
                        PVLines.Reset;
                        PVLines.SetRange(PVLines."PV No", "No.");
                        if PVLines.Find('-') then begin
                            case PVLines."Account Type" of
                                PVLines."account type"::Vendor:
                                    begin
                                        VendBank.Reset;
                                        VendBank.SetRange("Vendor No.", PVLines."Account No");
                                        if VendBank.Find('-') then begin
                                            PVRec.Reset;
                                            PVRec.SetRange(PVRec."No.", "No.");
                                            Report.Run(51511376, true, true, PVRec);
                                        end
                                        else
                                            Error(' Vendor Bank Details do not exist');
                                    end;
                                PVLines."account type"::Customer:
                                    begin
                                        CustBank.Reset;
                                        CustBank.SetRange("Customer No.", PVLines."Account No");
                                        if CustBank.Find('-') then begin
                                            PVRec.Reset;
                                            PVRec.SetRange(PVRec."No.", "No.");
                                            Report.Run(51511376, true, true, PVRec);
                                        end
                                        else
                                            Error(' Customer Bank Details do not exist');
                                    end;
                            end;
                        end;
                    end;
                }
                action("Print Check")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Reset;
                        PVRec.SetRange(PVRec."No.", "No.");
                        Report.RunModal(51511368, true, true, PVRec);
                    end;
                }
                action("Payment Remittance Advice")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        Reset;
                        PVRec.SetRange(PVRec."No.", "No.");
                        Report.RunModal(51511446, true, true, PVRec);
                    end;
                }
                action("Bank Transfer Advice")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        Reset;
                        PVRec.SetRange(PVRec."No.", "No.");
                        Report.RunModal(51511447, true, true, PVRec);
                    end;
                }
                action("Send Remittance Advice")
                {
                    ApplicationArea = Basic;
                    Caption = '   Send Remittance Advice';

                    trigger OnAction()
                    begin
                        CompanyInfo.Get();
                        SenderAddress := CompanyInfo."Administrator Email";
                        SenderName := COMPANYNAME;
                        Subject := StrSubstNo('Payment Remittance Advice');
                        Body := StrSubstNo('Please find attached your Payment Remittance Advice');

                        Vendor.Reset;
                        if Vendor.Get("Account No.") then
                            Recipients := Vendor."E-Mail";

                        SMTPSetup.Create(Recipients, Subject, Body, true);

                        // FileName := FileManagement.ServerTempFileName('.pdf');

                        Reset;
                        PVRec.SetRange(PVRec."No.", "No.");
                        // Report.SaveAsPdf(51511373, FileName, PVRec);

                        //SMTPSetup.AddAttachment(FileName);
                        //SMTPSetup.AddCC(CompanyInfo."Finance Support Email");
                        Email.Send(SMTPSetup);

                        Message('Payment Remittance Advice sent to %1', "Account Name");
                    end;
                }
            }
        }
        area(processing)
        {
            action(SendForApproval)
            {
                ApplicationArea = Basic;
                Caption = 'Send For Approval';
                Visible = false;

                trigger OnAction()
                begin
                    if Status <> Status::Open then
                        Error('The document has already been processed.');

                    if "Amount Approved" < 0 then
                        Error('Amount cannot be less than zero.');

                    if "Amount Approved" = 0 then
                        Error('Please enter amount.');


                    if "Pay Mode" = 'CHEQUE' then begin
                        TestField("Paying Bank Account");
                        //TESTFIELD("Cheque No");
                        //TESTFIELD("Cheque Date");
                        //TESTFIELD("Cheque Type");
                        //TESTFIELD("Bank Code");
                    end;
                    TestField("Paying Bank Account");
                    // TestField("Transaction Name");
                    TestField("Pay Mode");
                    TestField(Payee);
                    // TestField(Amount);
                    TestField("VAT Code");
                    // TestField("Withholding Tax Code");
                    // TestField("Global Dimension 1 Code");
                    TestField("Account No.");
                    // TestField("Branch Code");
                    // TestField("Net Amount");
                    TestField("Paying Bank Account");

                    if Confirm('Are you sure you would like to approve the payment?', false) = true then begin
                        Status := Status::Released;
                        Modify;
                        Message('Document approved successfully.');
                    end;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Visible = true;

                trigger OnAction()
                var
                    PVPost: Codeunit "Payment- Post";
                begin
                    PVPost.PostPayment(Rec);
                    /*
                    LineNo:=0;
                    CALCFIELDS("Total Amount");
                    IF Posted THEN
                    ERROR('The transaction has already been posted.');
                    
                    IF Status<>Status::Released THEN
                    ERROR('The document cannot be posted before it is fully approved');
                    
                    IF "Pay Mode"='CHEQUE' THEN BEGIN
                    TESTFIELD("Paying Bank Account");
                    TESTFIELD("Cheque No");
                    //TESTFIELD("Cheque Date");
                    //TESTFIELD("Cheque Type");
                    //TESTFIELD("Bank Code");
                    END;
                    //TESTFIELD(Remarks);
                    TESTFIELD("Pay Mode");
                    TESTFIELD(Payee);
                    TESTFIELD("Total Amount");
                    //TESTFIELD("VAT Code");
                    //TESTFIELD("Withholding Tax Code");
                    //TESTFIELD("Global Dimension 1 Code");
                    //TESTFIELD("Global Dimension 2 Code");
                    
                    {CashierLinks.RESET;
                    CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
                    IF CashierLinks.FIND('-') THEN BEGIN
                    END
                    ELSE BEGIN
                    ERROR('Please link the user/cashier to a collection account before proceeding.');
                    END;}
                    
                    
                      // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                      GenJnlLine.RESET;
                      GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                      GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",No);
                      GenJnlLine.DELETEALL;
                    
                      IF DefaultBatch.GET('PAYMENTS',No) THEN
                       DefaultBatch.DELETE;
                    
                      DefaultBatch.RESET;
                      DefaultBatch."Journal Template Name":='PAYMENTS';
                      DefaultBatch.Name:=No;
                      DefaultBatch.INSERT;
                    
                    
                    
                    
                    
                    
                    
                    TarriffCodes.RESET;
                    TarriffCodes.SETRANGE(TarriffCodes.Code,"VAT Code");
                    IF TarriffCodes.FIND('-') THEN BEGIN
                    TarriffCodes.TESTFIELD(TarriffCodes."G/L Account");
                    LineNo:=LineNo+1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                    GenJnlLine."Account No.":=TarriffCodes."G/L Account";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine.Amount:=-"VAT Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:='VAT';
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.VALIDATE("Currency Code");
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                    
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    END;
                    
                    {//  MESSAGE('%1',"Withholding Tax Code");
                    TarriffCodes.RESET;
                    TarriffCodes.SETRANGE(TarriffCodes.Code,"Withholding Tax Code");
                    IF TarriffCodes.FIND('-') THEN BEGIN
                    TarriffCodes.TESTFIELD(TarriffCodes."G/L Account");
                    LineNo:=LineNo+1000;
                    
                    //Add PV-Lines
                       PVLines.RESET;
                       PVLines.SETRANGE(PVLines."PV No",No);
                       IF FIND('+') THEN
                       LastPVLine:=PVLines."Line No";
                      CALCFIELDS("Total Amount");
                    
                      PVLines.INIT;
                      PVLines."PV No":=No;
                      PVLines."Line No":=LastPVLine+80000;
                      PVLines."Account Type":=PVLines."Account Type"::"G/L Account";
                      PVLines."Account No.":=TarriffCodes."G/L Account";
                      PVLines.VALIDATE(PVLines."Account No.");
                      PVLines.Amount:=-(TarriffCodes.Percentage/100)*"Total Amount";
                      PVLines.Description:='Withholding Tax';
                      PVLines.INSERT;
                      //MESSAGE('Adding Withholding Tax');
                    //End}
                    
                    {GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                    GenJnlLine."Account No.":=TarriffCodes."G/L Account";
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine.Amount:=-"Withholding Tax Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:=Remarks;
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.VALIDATE("Currency Code");
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                    
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    END; }
                    
                    LineNo:=LineNo+1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":="Account No.";
                    IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::"Fixed Asset" THEN
                    BEGIN
                    GenJnlLine."FA Posting Type":=GenJnlLine."FA Posting Type"::"Acquisition Cost";
                    FaDepreciation.RESET;
                    FaDepreciation.SETRANGE(FaDepreciation."FA No.",GenJnlLine."Account No.");
                    IF FaDepreciation.FIND('-') THEN
                    
                    GenJnlLine."Depreciation Book Code":=FaDepreciation."Depreciation Book Code";
                    GenJnlLine.VALIDATE("Depreciation Book Code");
                    GenJnlLine."FA Posting Date":=GenJnlLine."Posting Date";
                    END;
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=Amount;
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:=Remarks;
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.VALIDATE("Currency Code");
                    //GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                    
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    
                    
                    PVLines.RESET;
                    PVLines.SETRANGE(PVLines."PV No",No);
                    IF PVLines.FIND('-') THEN
                    REPEAT
                    LineNo:=LineNo+1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=PVLines."Account Type";
                    GenJnlLine."Account No.":=PVLines."Account No";
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=PVLines.Amount;
                    
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:=PVLines.Description;
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
                    GenJnlLine."Currency Code":=Currency;
                    
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    GenJnlLine."Loan No":=PVLines."Loan No";
                    
                    //GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    //GenJnlLine."Policy No":=PVLines."Policy No";
                    //GenJnlLine."Claim No":=PVLines."Claim No";
                    //GenJnlLine."Benefit ID":=PVLines."Benefit ID";
                    //GenJnlLine."Claimant ID":=PVLines."Claimant ID";
                    //GenJnlLine."Claim Line No":=PVLines."Claim Line Line No";
                    //GenJnlLine."Amt Premium Currency":=PVLines."Amt Premium Currency";
                    //GenJnlLine."Amt Reporting Currency":=PVLines."Amt Reporting Currency";
                    GenJnlLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //MESSAGE('here');
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                    IF GenJnlLine.Amount<>0 THEN
                    
                    {IF ClaimRec.GET(PVLines."Claim No") THEN
                    BEGIN
                    END;}
                    
                    
                    GenJnlLine.INSERT;
                    
                    
                    
                    UNTIL PVLines.NEXT=0;
                    
                    
                    CALCFIELDS("Total Amount");
                    
                    //BANK
                    IF "Pay Mode"='CASH' THEN BEGIN
                    //CASH
                    LineNo:=LineNo+1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"Bank Account";
                    GenJnlLine."Account No.":="Paying Bank Account";
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    //GenJnlLine.Name:=Payee;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=-"Total Amount";
                    
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:=Payee;
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    //GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                    IF GenJnlLine.Amount<>0 THEN
                    
                    GenJnlLine.INSERT;
                    END
                    ELSE BEGIN
                    //CHEQUE
                    LineNo:=LineNo+1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"Bank Account";
                    GenJnlLine."Account No.":="Paying Bank Account";
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    //GenJnlLine.Name:=Payee;
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=-"Total Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:=Payee;
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.VALIDATE("Currency Code");
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    //GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                    
                    
                    IF GenJnlLine.Amount<>0 THEN
                    GenJnlLine.INSERT;
                    END;
                    
                    
                    
                    
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",No);
                    IF GenJnlLine.FIND('-') THEN
                    REPEAT
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    IF GenJnlLine."Applies-to Doc. No."<> ''THEN
                    BEGIN
                    GenJnlLine."Allow Application":=TRUE;
                    GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                    END;
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. Type");
                    GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                    
                    GenJnlLine.MODIFY;
                    UNTIL GenJnlLine.NEXT=0;
                    
                    
                    
                    
                    
                    
                    
                    
                    AdjustConversion.RUN(GenJnlLine);
                    
                    
                    
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",No);
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);
                    
                    
                    
                    
                    
                    
                    Posted:=TRUE;
                    "Date Posted":=TODAY;
                    "Time Posted":=TIME;
                    "Posted By":=USERID;
                    MODIFY;
                    IF BankAcc.GET("Paying Bank Account") THEN
                    BEGIN
                    BankAcc."Last Check No.":=INCSTR(BankAcc."Last Check No.");
                    BankAcc.MODIFY;
                    END;
                    */

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.", "No.");
                    Report.Run(51511010, true, true, Rec);
                    Reset;
                end;
            }
            action("Reverse posting")
            {
                ApplicationArea = Basic;
                Image = ReverseRegister;

                trigger OnAction()
                begin
                    PVRec.Posted := false;
                    PVRec.Posted := false;
                    Message('The reversal was successfull! You can now post it again');
                end;
            }
            action(ImportPayments)
            {
                ApplicationArea = Basic;
                Caption = 'Import Payments';

                trigger OnAction()
                begin

                    PaymentImport.GetRec(Rec);
                    PaymentImport.Run;
                    Clear(PaymentImport);
                end;
            }
            group(Functions)
            {
                Caption = 'Functions';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //F ApprovalMgt.CancelTrainingNeedsApprovalRequest(Rec) THEN;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Visible = false;

                    trigger OnAction()
                    begin
                        ////if ApprovalMgt.JournalRelease(Rec,TRUE,TRUE) THEN;
                    end;
                }
            }
            action(DMSLink)
            {
                ApplicationArea = Basic;
                Caption = 'DMS Link';
                Enabled = false;
                Visible = false;

                trigger OnAction()
                begin
                    GLSetup.Get();
                    Link := GLSetup."DMS PV Link" + "No.";
                    Hyperlink(Link);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Reverse posting_Promoted"; "Reverse posting")
                {
                }
            }
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
                actionref(SendForApproval_Promoted; SendForApproval)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref(DMSLink_Promoted; DMSLink)
                {
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        if Posted then
            Error('You cannot delete the details of the payment voucher at this stage');
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Posted then
            Error('You cannot change the details of the payment voucher at this stage');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // CurrForm.EDITABLE:=TRUE;
        // "Payment Type" := "payment type"::Normal;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        CurrPage.Editable := true;
    end;

    trigger OnOpenPage()
    begin
        CurrPage.Editable := true;
    end;

    var
        RecPayTypes: Record "Receipts and Payment Types1";
        TarriffCodes: Record "Tarriff Codes1";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        LineNo: Integer;
        CustLedger: Record "Vendor Ledger Entry";
        CustLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        FaDepreciation: Record "FA Depreciation Book";
        BankAcc: Record "Bank Account";
        PVLines: Record "PV Lines1";
        LastPVLine: Integer;
        PolicyRec: Record "Sales Cr.Memo Header";
        PremiumControlAmt: Decimal;
        BasePremium: Decimal;
        TotalTax: Decimal;
        TotalTaxPercentBank: Decimal;
        TotalPercent: Decimal;
        SalesInvoiceHeadr: Record "Sales Cr.Memo Header";
        AdjustConversion: Codeunit "Adjust Gen. Journal Balance";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        //VATCert: Report "VAT Withholding Certificate";
        //WithholdCert: Report "VAT Withholding Certificate";
        PVRec: Record Payments;
        GLSetup: Record "General Ledger Setup";
        Link: Text[250];
        PaymentImport: XmlPort Payments;
        //CBAEFT: Report "CBA EFT";
        VendBank: Record "Vendor Bank Account";
        CustBank: Record "Customer Bank Account";
        CompanyInfo: Record "Company Information";
        SenderAddress: Text[80];
        SenderName: Text[80];
        Subject: Text[100];
        Body: Text[250];
        Recipients: Text[80];
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        FileName: Text[250];
        Vendor: Record Vendor;
        FileManagement: Codeunit "File Management";
}

