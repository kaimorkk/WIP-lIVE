Page 52193882 "Posted Payment Voucher"
{
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type"=const(Normal),
                            Posted=const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankAccount;"Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(BankName;"Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                }
                field(PayMode;"Pay Mode")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Payment Modes111";
                }
                field(ChequeNo;"Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ExchangeRate;"Exchange Rate")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DatePosted;"Date Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TimePosted;"Time Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PostedBy;"Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Cashier;Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(WithholdingTaxCode;"Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field(Currency;Currency)
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount;"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Collected;Collected)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000049;"PV Lines")
            {
                SubPageLink = "PV No"=field(No);
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
                action(SuggestClaimstobePaid)
                {
                    ApplicationArea = Basic;
                    Caption = 'Suggest Claims to be Paid';

                    trigger OnAction()
                    begin
                         // Suggestpay.GetPaymentRec(Rec);
                         // Suggestpay.RUN;
                    end;
                }
                action(RemittanceAdvice)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remittance Advice';

                    trigger OnAction()
                    begin
                        /*
                        RESET;
                        SETFILTER(No,No);
                        REPORT.RUN(53097,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
                action(ClaimAdvice)
                {
                    ApplicationArea = Basic;
                    Caption = 'Claim Advice';

                    trigger OnAction()
                    begin
                        /*
                        RESET;
                        SETFILTER(No,No);
                        REPORT.RUN(53029,TRUE,TRUE,Rec);
                        RESET;
                        */

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
                    if Status<>Status::Open then
                    Error('The document has already been processed.');

                    if Amount<0 then
                    Error('Amount cannot be less than zero.');

                    if Amount=0 then
                    Error('Please enter amount.');


                    if "Pay Mode"='CHEQUE' then begin
                    TestField("Paying Bank Account");
                    //TESTFIELD("Cheque No");
                    //TESTFIELD("Cheque Date");
                    //TESTFIELD("Cheque Type");
                    //TESTFIELD("Bank Code");
                    end;
                    TestField("Paying Bank Account");
                    TestField("Transaction Name");
                    TestField("Pay Mode");
                    TestField(Payee);
                    TestField(Amount);
                    TestField("VAT Code");
                    TestField("Withholding Tax Code");
                    TestField("Global Dimension 1 Code");
                    TestField("Account No.");
                    TestField("Branch Code");
                    TestField("Net Amount");
                    TestField("Paying Bank Account");

                    if Confirm('Are you sure you would like to approve the payment?',false)=true then begin
                    Status:=Status::Released;
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
                begin
                    LineNo:=0;
                    CalcFields("Total Amount");
                    if Posted then
                    Error('The transaction has already been posted.');
                    
                    
                    if "Pay Mode"='CHEQUE' then begin
                    TestField("Paying Bank Account");
                    TestField("Cheque No");
                    //TESTFIELD("Cheque Date");
                    //TESTFIELD("Cheque Type");
                    //TESTFIELD("Bank Code");
                    end;
                    //TESTFIELD(Remarks);
                    TestField("Pay Mode");
                    TestField(Payee);
                    TestField("Total Amount");
                    //TESTFIELD("VAT Code");
                    //TESTFIELD("Withholding Tax Code");
                    //TESTFIELD("Global Dimension 1 Code");
                    //TESTFIELD("Global Dimension 2 Code");
                    
                    /*CashierLinks.RESET;
                    CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
                    IF CashierLinks.FIND('-') THEN BEGIN
                    END
                    ELSE BEGIN
                    ERROR('Please link the user/cashier to a collection account before proceeding.');
                    END;*/
                    
                    
                      // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                      GenJnlLine.Reset;
                      GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'PAYMENTS');
                      GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",No);
                      GenJnlLine.DeleteAll;
                    
                      if DefaultBatch.Get('PAYMENTS',No) then
                       DefaultBatch.Delete;
                    
                      DefaultBatch.Reset;
                      DefaultBatch."Journal Template Name":='PAYMENTS';
                      DefaultBatch.Name:=No;
                      DefaultBatch.Insert;
                    
                    
                    
                    
                    
                    
                    
                    TarriffCodes.Reset;
                    TarriffCodes.SetRange(TarriffCodes.Code,"VAT Code");
                    if TarriffCodes.Find('-') then begin
                    TarriffCodes.TestField(TarriffCodes."G/L Account");
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";
                    GenJnlLine."Account No.":=TarriffCodes."G/L Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine.Amount:=-"VAT Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:='VAT';
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Validate("Currency Code");
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    end;
                    
                    //  MESSAGE('%1',"Withholding Tax Code");
                    TarriffCodes.Reset;
                    TarriffCodes.SetRange(TarriffCodes.Code,"Withholding Tax Code");
                    if TarriffCodes.Find('-') then begin
                    TarriffCodes.TestField(TarriffCodes."G/L Account");
                    LineNo:=LineNo+1000;
                    
                    //Add PV-Lines
                       PVLines.Reset;
                       PVLines.SetRange(PVLines."PV No",No);
                       if Find('+') then
                       LastPVLine:=PVLines."Line No";
                      CalcFields("Total Amount");
                    
                      PVLines.Init;
                      PVLines."PV No":=No;
                      PVLines."Line No":=LastPVLine+80000;
                      PVLines."Account Type":=PVLines."account type"::"G/L Account";
                      PVLines."Account No":=TarriffCodes."G/L Account";
                      PVLines.Validate(PVLines."Account No");
                      PVLines.Amount:=-(TarriffCodes.Percentage/100)*"Total Amount";
                      PVLines.Description:='Withholding Tax';
                      PVLines.Insert;
                      //MESSAGE('Adding Withholding Tax');
                    //End
                    
                    /*GenJnlLine.INIT;
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
                    GenJnlLine.INSERT;*/
                    end;
                    
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":="Account No.";
                    if GenJnlLine."Account Type"=GenJnlLine."account type"::"Fixed Asset" then
                    begin
                    GenJnlLine."FA Posting Type":=GenJnlLine."fa posting type"::"Acquisition Cost";
                    FaDepreciation.Reset;
                    FaDepreciation.SetRange(FaDepreciation."FA No.",GenJnlLine."Account No.");
                    if FaDepreciation.Find('-') then
                    
                    GenJnlLine."Depreciation Book Code":=FaDepreciation."Depreciation Book Code";
                    GenJnlLine.Validate("Depreciation Book Code");
                    GenJnlLine."FA Posting Date":=GenJnlLine."Posting Date";
                    end;
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=Amount;
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:=Remarks;
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Validate("Currency Code");
                    //GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    
                    PVLines.Reset;
                    PVLines.SetRange(PVLines."PV No",No);
                    if PVLines.Find('-') then
                    repeat
                    /*
                    LineNo:=LineNo+1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=PVLines."Account Type";
                    GenJnlLine."Account No.":=PVLines."Account No.";
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
                    
                    //GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine."Commissioner Name":=PVLines."Policy No";
                    GenJnlLine."Claim No":=PVLines."Claim No";
                    GenJnlLine."Benefit ID":=PVLines."Benefit ID";
                    GenJnlLine."Claimant ID":=PVLines."Claimant ID";
                    GenJnlLine."Claim Line No":=PVLines."Line No";
                    GenJnlLine."Amt Premium Currency":=PVLines."Amt Premium Currency";
                    GenJnlLine."Amt Reporting Currency":=PVLines."Amt Reporting Currency";
                    GenJnlLine."Applies-to Doc. No.":=PVLines."Applies-to Doc. No.";
                    IF GenJnlLine.Amount<>0 THEN
                    
                    //IF ClaimRec.GET(PVLines."Claim No") THEN;
                    
                    
                    GenJnlLine.INSERT;
                    
                    
                    //Commission Splits
                    
                         IF PolicyRec.GET(PVLines."Applies-to Doc. No.") THEN
                         BEGIN
                    
                         PremiumControlAmt:=0;
                         TotalPercent:=100;
                    
                         ProductPlanTax.RESET;
                         ProductPlanTax.SETRANGE(ProductPlanTax."Policy Type",PolicyRec."Policy Type");
                         IF ProductPlanTax.FIND('-') THEN
                         REPEAT
                          TotalPercent:=TotalPercent+ProductPlanTax."Loading %";
                          TotalTaxPercent:=TotalTaxPercent+ProductPlanTax."Loading %";
                         UNTIL ProductPlanTax.NEXT=0;
                    
                         BasePremium:=(100/TotalPercent)*PVLines.Amount;
                    
                         CommissionTab.RESET;
                         CommissionTab.SETRANGE(CommissionTab."Receipt No",PVLines."PV No");
                    
                         //CommissionTab.SETRANGE(CommissionTab."Policy Type",PolicyRec."Policy Type");
                         //IF PolicyRec."Quote Type"<>PolicyRec."Quote Type"::Renewal THEN
                         //CommissionTab.SETRANGE(CommissionTab."Applicable to",CommissionTab."Applicable to"::New)
                         //ELSE
                         //CommissionTab.SETRANGE(CommissionTab."Applicable to",CommissionTab."Applicable to"::Renewals);
                         IF CommissionTab.FIND('-') THEN
                         REPEAT
                    
                    
                    
                    
                         GenJnlLine.INIT;
                         GenJnlLine."Journal Template Name":='PAYMENTS';
                         GenJnlLine."Journal Batch Name":=No;
                         GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
                         GenJnlLine."Account Type":=GenJnlLine."Account Type"::Vendor;
                         GenJnlLine."Account No.":=CommissionTab."UnderWriter/Broker";
                         GenJnlLine."Posting Date":=Date;
                         GenJnlLine."Document Date":=Date;
                         GenJnlLine."Document No.":=No;
                         GenJnlLine.Description:=PolicyRec."Sell-to Customer Name"+ ' '+ 'Premium Split';
                         GenJnlLine."Currency Code":=Currency;
                         GenJnlLine."Currency Factor":="Exchange Factor";
                         GenJnlLine.Amount:=ROUND(BasePremium*(CommissionTab."% age"/100));
                         PremiumControlAmt:=PremiumControlAmt+GenJnlLine.Amount;
                         //GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                         GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                         //IF ProductPlan.GET(PolicyRec."Policy Type",PolicyRec.Underwriter) THEN
                         //GenJnlLine."Bal. Account No.":=ProductPlan."Premium Account";
                         GenJnlLine."Loan No":=Amount;
                         GenJnlLine."ED Code":=PVLines."Policy Type";
                         GenJnlLine."Commissioner Code":=TRUE;
                         GenJnlLine."Meeting ID":=PolicyRec."Sell-to Customer No.";
                         GenJnlLine."Commissioner Name":=PolicyRec."Policy No";
                         GenJnlLine."Commission Percentage":=CommissionTab."% age";
                         GenJnlLine."Meeting ID":=PolicyRec."Sell-to Customer No.";
                         IF PolicyRec."Quote Type"=PolicyRec."Quote Type"::"1" THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"1";
                         IF PolicyRec."Quote Type"=PolicyRec."Quote Type"::"3" THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"2";
                         IF PolicyRec."Quote Type"=PolicyRec."Quote Type"::"2" THEN
                         BEGIN
                         IF PolicyRec."Modification Type"=PolicyRec."Modification Type"::"1"  THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"3";
                         IF PolicyRec."Modification Type"=PolicyRec."Modification Type"::"2" THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"4";
                         END;
                         GenJnlLine."Transaction Type":=GenJnlLine."Transaction Type"::"2";
                         GenJnlLine.VALIDATE(GenJnlLine.Amount);
                         IF GenJnlLine.Amount<>0 THEN
                         GenJnlLine.INSERT;
                         // MESSAGE('Gets here %1 %2',CommissionTab."UnderWriter/Broker",GenJnlLine.Amount);
                         UNTIL CommissionTab.NEXT=0;
                         END;
                    
                         GenJnlLine.INIT;
                         GenJnlLine."Journal Template Name":='PAYMENTS';
                         GenJnlLine."Journal Batch Name":=No;
                         GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
                         GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                         IF ProductPlan.GET(PolicyRec."Policy Type",PolicyRec.Underwriter) THEN
                         GenJnlLine."Account No.":=ProductPlan."Premium Account";
                         GenJnlLine."Posting Date":=Date;
                         GenJnlLine."Document Date":=Date;
                         GenJnlLine."Document No.":=No;
                         GenJnlLine.Description:=PolicyRec."Sell-to Customer Name"+ ' '+ 'Premium Split';
                         GenJnlLine."Currency Code":=Currency;
                        GenJnlLine."Currency Factor":="Exchange Factor";
                         GenJnlLine.Amount:=-ROUND(PremiumControlAmt);
                         PremiumControlAmt:=PremiumControlAmt+GenJnlLine.Amount;
                         //GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                         GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                         IF ProductPlan.GET(PVLines."Policy Type",PVLines.Underwriter) THEN
                         //GenJnlLine."Bal. Account No.":=ProductPlan."Premium Account";
                         GenJnlLine."Loan No":=Amount;
                         GenJnlLine."ED Code":=PVLines."Policy Type";
                         GenJnlLine."Commissioner Code":=TRUE;
                         GenJnlLine."Meeting ID":=PolicyRec."Sell-to Customer No.";
                         GenJnlLine."Commissioner Name":=PolicyRec."Policy No";
                         GenJnlLine."Commission Percentage":=CommissionTab."% age";
                         GenJnlLine."Meeting ID":=PolicyRec."Sell-to Customer No.";
                         IF PolicyRec."Quote Type"=PolicyRec."Quote Type"::"1" THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"1";
                         IF PolicyRec."Quote Type"=PolicyRec."Quote Type"::"3" THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"2";
                         IF PolicyRec."Quote Type"=PolicyRec."Quote Type"::"2" THEN
                         BEGIN
                         IF PolicyRec."Modification Type"=PolicyRec."Modification Type"::"1"  THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"3";
                         IF PolicyRec."Modification Type"=PolicyRec."Modification Type"::"2" THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"4";
                         END;
                         GenJnlLine."Transaction Type":=GenJnlLine."Transaction Type"::"2";
                         GenJnlLine.VALIDATE(GenJnlLine.Amount);
                         IF GenJnlLine.Amount<>0 THEN
                         GenJnlLine.INSERT;
                    
                    
                         ProductPlanTax.RESET;
                    
                         ProductPlanTax.SETRANGE(ProductPlanTax."Policy Type",PolicyRec."Policy Type");
                         IF ProductPlanTax.FIND('-') THEN
                         REPEAT
                         GenJnlLine.INIT;
                         GenJnlLine."Journal Template Name":='PAYMENTS';
                         GenJnlLine."Journal Batch Name":=No;
                         GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
                         GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                         IF ProductPlan.GET(PolicyRec."Policy Type",PolicyRec.Underwriter) THEN
                         GenJnlLine."Account No.":=ProductPlan."Premium Account";
                         GenJnlLine."Posting Date":=Date;
                         GenJnlLine."Document Date":=Date;
                         GenJnlLine."Document No.":=No;
                         GenJnlLine.Description:=COPYSTR(PolicyRec."Sell-to Customer Name"+ ' '+ ProductPlanTax.Description,1,50);
                         GenJnlLine."Currency Code":=Currency;
                        GenJnlLine."Currency Factor":="Exchange Factor";
                         GenJnlLine.Amount:=-ROUND(BasePremium*(ProductPlanTax."Loading %"/100));
                         PremiumControlAmt:=PremiumControlAmt+GenJnlLine.Amount;
                         //GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                         GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                         GenJnlLine."Bal. Account No.":=ProductPlanTax."Account No";
                         GenJnlLine."Loan No":=Amount;
                         GenJnlLine."ED Code":=PVLines."Policy Type";
                         GenJnlLine."Commissioner Code":=TRUE;
                         GenJnlLine."Meeting ID":=PolicyRec."Sell-to Customer No.";
                         GenJnlLine."Commissioner Name":=PolicyRec."Policy No";
                         GenJnlLine."Commission Percentage":=CommissionTab."% age";
                         GenJnlLine."Meeting ID":=PolicyRec."Sell-to Customer No.";
                         IF PolicyRec."Quote Type"=PolicyRec."Quote Type"::"1" THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"1";
                         IF PolicyRec."Quote Type"=PolicyRec."Quote Type"::"3" THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"2";
                         IF PolicyRec."Quote Type"=PolicyRec."Quote Type"::"2" THEN
                         BEGIN
                         IF PolicyRec."Modification Type"=PolicyRec."Modification Type"::"1"  THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"3";
                         IF PolicyRec."Modification Type"=PolicyRec."Modification Type"::"2" THEN
                         GenJnlLine."Meeting Description":=GenJnlLine."Meeting Description"::"4";
                         END;
                         GenJnlLine."Transaction Type":=GenJnlLine."Transaction Type"::"2";
                         GenJnlLine.VALIDATE(GenJnlLine.Amount);
                         IF GenJnlLine.Amount<>0 THEN
                         GenJnlLine.INSERT;
                    
                    
                    
                         UNTIL ProductPlanTax.NEXT=0;
                    
                    */
                    
                    
                    until PVLines.Next=0;
                    
                    
                    CalcFields("Total Amount");
                    
                    //BANK
                    if "Pay Mode"='CASH' then begin
                    //CASH
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"Bank Account";
                    GenJnlLine."Account No.":="Paying Bank Account";
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=-"Total Amount";
                    
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:=Payee;
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Validate(GenJnlLine."Currency Code");
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    //GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    if GenJnlLine.Amount<>0 then
                    
                    GenJnlLine.Insert;
                    end
                    else begin
                    //CHEQUE
                    LineNo:=LineNo+1000;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='PAYMENTS';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=LineNo;
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"Bank Account";
                    GenJnlLine."Account No.":="Paying Bank Account";
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=-"Total Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    GenJnlLine."Bal. Account No.":='';
                    GenJnlLine.Description:=Payee;
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                    GenJnlLine."Currency Code":=Currency;
                    GenJnlLine.Validate("Currency Code");
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    //GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    //GenJnlLine."Investment Code":=Currency;
                    //GenJnlLine."Type of Investment":="Exchange Rate";
                    //GenJnlLine."No. Of Units":="Global Dimension 2 Code";
                    GenJnlLine."Applies-to Doc. No.":="Apply to";
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    end;
                    
                    
                    
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",No);
                    if GenJnlLine.Find('-') then
                    repeat
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    GenJnlLine.Validate(GenJnlLine."Currency Code");
                    if GenJnlLine."Applies-to Doc. No."<> ''then
                    begin
                    GenJnlLine."Allow Application":=true;
                    GenJnlLine."Applies-to Doc. Type":=GenJnlLine."applies-to doc. type"::"Credit Memo";
                    end;
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. Type");
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    
                    GenJnlLine.Modify;
                    until GenJnlLine.Next=0;
                    
                    
                    
                    
                    
                    
                    
                    
                    AdjustConversion.Run(GenJnlLine);
                    
                    
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",No);
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnlLine);
                    /*
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",No);
                    IF GenJnlLine.FIND('-') THEN
                    EXIT;
                    PVLines.RESET;
                    PVLines.SETRANGE(PVLines."PV No",No);
                    IF PVLines.FIND('-') THEN
                    REPEAT
                     ClaimLine.RESET;
                     ClaimLine.SETRANGE(ClaimLine."Claim No.",PVLines."Claim No");
                     ClaimLine.SETRANGE(ClaimLine."Line No.",PVLines."Claim Line Line No");
                     IF ClaimLine.FIND('-') THEN
                     BEGIN
                     ClaimLine.Paid:=TRUE;
                     ClaimLine.MODIFY;
                     //MESSAGE('Doing it');
                     END;
                    UNTIL PVLines.NEXT=0;
                    
                     */
                    
                    
                    
                    Posted:=true;
                    "Date Posted":=Today;
                    "Time Posted":=Time;
                    "Posted By":=UserId;
                    Modify;
                    if BankAcc.Get("Paying Bank Account") then
                    begin
                    BankAcc."Last Check No.":=IncStr(BankAcc."Last Check No.");
                    BankAcc.Modify;
                    end;

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
                    SetFilter(No,No);
                    Report.Run(51511013,true,true,Rec);
                    Reset;
                end;
            }
            action(PrintChequeKES)
            {
                ApplicationArea = Basic;
                Caption = 'Print Cheque KES';

                trigger OnAction()
                begin
                    Reset;
                    SetFilter(No,No);
                    Report.Run(51511013,true,true,Rec);
                    Reset;
                end;
            }
            action(PrintChequeUSD)
            {
                ApplicationArea = Basic;
                Caption = 'Print Cheque USD';

                trigger OnAction()
                begin
                    /*
                    RESET;
                    SETFILTER(No,No);
                    REPORT.RUN(50019,TRUE,TRUE,Rec);
                    RESET;
                     */

                end;
            }
        }
        area(Promoted)
        {
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
                actionref(PrintChequeKES_Promoted; PrintChequeKES)
                {
                }
                actionref(PrintChequeUSD_Promoted; PrintChequeUSD)
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
        "Payment Type":="payment type"::Normal;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
          CurrPage.Editable:=true;
    end;

    trigger OnOpenPage()
    begin
         CurrPage.Editable:=true;
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
        TotalTaxPercent: Decimal;
        TotalPercent: Decimal;
        SalesInvoiceHeadr: Record "Sales Cr.Memo Header";
        AdjustConversion: Codeunit "Adjust Gen. Journal Balance";
}

