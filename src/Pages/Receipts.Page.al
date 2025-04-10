Page 52193750 Receipts
{
    PageType = Card;
    SourceTable = Receipts1;
    SourceTableView = where(Posted=const(false));

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
                    Editable = true;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(ReceivingBankAccount;"Receiving Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier;Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(PayMode;"Pay Mode")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if ("Pay Mode"="pay mode"::Cash) or ("Pay Mode"="pay mode"::EFT) then
                        begin
                          "Cheque NoEditable" :=false;
                          "Cheque DateEditable" :=false;
                        end else begin
                          "Cheque NoEditable" :=true;
                          "Cheque DateEditable" :=true;

                        end;
                    end;
                }
                field(ReceivedFrom;"Received From")
                {
                    ApplicationArea = Basic;
                }
                field(OnBehalfOf;"On Behalf Of")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                    Caption = 'Being Payment for:';
                }
                field(ChequeNo;"Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = "Cheque NoEditable";
                }
                field(ChequeDate;"Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Cheque DateEditable";
                }
                field(Amount;Amount)
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
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Receipt)
            {
                Caption = 'Receipt';
            }
        }
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;

                trigger OnAction()
                begin
                    
                    
                    if Posted then
                    Error('The transaction has already been posted.');
                    if Amount=0 then
                    Error('Please enter amount.');
                    
                    if Amount<0 then
                    Error('Amount cannot be less than zero.');
                    
                    Rec.TestField("Receiving Bank Account");
                    Rec.TestField(Remarks);
                    
                      // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                      GenJnlLine.Reset;
                      GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'CASH RECEI');
                      GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",No);
                      GenJnlLine.DeleteAll;
                    
                      if DefaultBatch.Get('CASH RECEI',No) then
                       DefaultBatch.Delete;
                    
                      DefaultBatch.Reset;
                      DefaultBatch."Journal Template Name":='CASH RECEI';
                      DefaultBatch.Name:=No;
                      DefaultBatch.Insert;
                    
                    if "Pay Mode"<>"pay mode"::"Credit Card" then
                    begin
                    
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='CASH RECEI';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=10000;
                    GenJnlLine."Posting Date":=Date;
                    //GenJnlLine.VALIDATE("Posting Date");
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":="Account No.";
                    
                    GenJnlLine."Currency Code":=Currency;
                    
                    
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    GenJnlLine.Validate(GenJnlLine."Currency Factor");
                    
                    GenJnlLine.Amount:=-Amount;
                    //GenJnlLine.VALIDATE("Currency Code");
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"Bank Account";
                    GenJnlLine."Bal. Account No.":="Receiving Bank Account";
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    //GenJnlLine.Name:="Received From";
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine.Description:=Remarks;
                    GenJnlLine."Applies-to Doc. No.":="Applies-to Doc. No.";
                    GenJnlLine."Applies-to Doc. Type":="Applies-to Doc. Type";
                    if GenJnlLine."Applies-to Doc. No."<>'' then
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    end;
                    
                    if "Pay Mode"="pay mode"::"Credit Card" then
                    begin
                    //InsuranceSetup.GET;
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='CASH RECEI';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=10000;
                    GenJnlLine."Posting Date":=Date;
                    //GenJnlLine.VALIDATE("Posting Date");
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Account Type":="Account Type";
                    GenJnlLine."Account No.":="Account No.";
                    
                    GenJnlLine."Currency Code":=Currency;
                    
                    
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    GenJnlLine.Validate(GenJnlLine."Currency Factor");
                    
                    GenJnlLine.Amount:=-Amount;
                    //GenJnlLine.VALIDATE("Currency Code");
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"Bank Account";
                    //GenJnlLine."Bal. Account No.":="Receiving Bank Account";
                    //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine.Description:=Remarks;
                    GenJnlLine."Applies-to Doc. No.":="Applies-to Doc. No.";
                    GenJnlLine."Applies-to Doc. Type":="Applies-to Doc. Type";
                    if GenJnlLine."Applies-to Doc. No."<>'' then
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='CASH RECEI';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=20000;
                    GenJnlLine."Posting Date":=Date;
                    //GenJnlLine.VALIDATE("Posting Date");
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Account Type":="account type"::"G/L Account";
                    //GenJnlLine."Account No.":=InsuranceSetup."Credit Card Charges A/C";
                    
                    GenJnlLine."Currency Code":=Currency;
                    
                    
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    GenJnlLine.Validate(GenJnlLine."Currency Factor");
                    
                    //GenJnlLine.Amount:=-Amount*(InsuranceSetup."Credit Card % Surcharge"/100);
                    //GenJnlLine.VALIDATE("Currency Code");
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"Bank Account";
                    //GenJnlLine."Bal. Account No.":="Receiving Bank Account";
                    //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine.Description:=Remarks;
                    //GenJnlLine."Applies-to Doc. No.":="Applies-to Doc. No.";
                    //GenJnlLine."Applies-to Doc. Type":="Applies-to Doc. Type";
                    if GenJnlLine."Applies-to Doc. No."<>'' then
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='CASH RECEI';
                    GenJnlLine."Journal Batch Name":=No;
                    GenJnlLine."Line No.":=30000;
                    GenJnlLine."Posting Date":=Date;
                    //GenJnlLine.VALIDATE("Posting Date");
                    GenJnlLine."Document No.":=No;
                    GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Account Type":="account type"::"Bank Account";
                    GenJnlLine."Account No.":="Receiving Bank Account";
                    
                    GenJnlLine."Currency Code":=Currency;
                    
                    
                    GenJnlLine."Currency Factor":="Exchange Factor";
                    GenJnlLine.Validate(GenJnlLine."Currency Factor");
                    
                    //GenJnlLine.Amount:=Amount*(1+(InsuranceSetup."Credit Card % Surcharge"/100));
                    //GenJnlLine.VALIDATE("Currency Code");
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"Bank Account";
                    //GenJnlLine."Bal. Account No.":="Receiving Bank Account";
                    //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine.Description:=Remarks;
                    //GenJnlLine."Applies-to Doc. No.":="Applies-to Doc. No.";
                    //GenJnlLine."Applies-to Doc. Type":="Applies-to Doc. Type";
                    if GenJnlLine."Applies-to Doc. No."<>'' then
                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                    
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    
                    
                    end;
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                     /*
                    
                    //Commission Splits
                    
                         IF PolicyRec.GET("Applies-to Doc. No.") THEN
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
                    
                         BasePremium:=(100/TotalPercent)*Amount;
                    
                         CommissionTab.RESET;
                         CommissionTab.SETRANGE(CommissionTab."Receipt No",No);
                         //CommissionTab.SETRANGE(CommissionTab."Policy Type",PolicyRec."Policy Type");
                         //IF PolicyRec."Quote Type"<>PolicyRec."Quote Type"::Renewal THEN
                         //CommissionTab.SETRANGE(CommissionTab."Applicable to",CommissionTab."Applicable to"::New)
                         //ELSE
                         //CommissionTab.SETRANGE(CommissionTab."Applicable to",CommissionTab."Applicable to"::Renewals);
                         IF CommissionTab.FIND('-') THEN
                         REPEAT
                    
                    
                    
                    
                         GenJnlLine.INIT;
                         GenJnlLine."Journal Template Name":='CASH RECEI';
                         GenJnlLine."Journal Batch Name":=No;
                         GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
                         GenJnlLine."Account Type":=GenJnlLine."Account Type"::Vendor;
                         GenJnlLine."Account No.":=CommissionTab."UnderWriter/Broker";
                         GenJnlLine."Posting Date":=Date;
                         GenJnlLine."Document Date":=Date;
                         GenJnlLine."Document No.":=No;
                         GenJnlLine.Description:=COPYSTR(PolicyRec."Sell-to Customer Name"+ ' '+ 'Premium Split',1,50);
                         GenJnlLine."Currency Code":=Currency;
                         GenJnlLine."Currency Factor":="Exchange Factor";
                         GenJnlLine.Amount:=-ROUND(BasePremium*(CommissionTab."% age"/100));
                         PremiumControlAmt:=PremiumControlAmt+GenJnlLine.Amount;
                         //GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                         GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                         //IF ProductPlan.GET(PolicyRec."Policy Type",PolicyRec.Underwriter) THEN
                         //GenJnlLine."Bal. Account No.":=ProductPlan."Premium Account";
                         GenJnlLine."Loan No":=Amount;
                         GenJnlLine."ED Code":="Policy Type";
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
                    
                         UNTIL CommissionTab.NEXT=0;
                         END;
                    
                         GenJnlLine.INIT;
                         GenJnlLine."Journal Template Name":='CASH RECEI';
                         GenJnlLine."Journal Batch Name":=No;
                         GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
                         GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                         IF ProductPlan.GET(PolicyRec."Policy Type",PolicyRec.Underwriter) THEN
                         GenJnlLine."Account No.":=ProductPlan."Premium Account";
                         GenJnlLine."Posting Date":=Date;
                         GenJnlLine."Document Date":=Date;
                         GenJnlLine."Document No.":=No;
                         GenJnlLine.Description:=COPYSTR(PolicyRec."Sell-to Customer Name"+ ' '+ 'Premium Split',1,50);
                         GenJnlLine."Currency Code":=Currency;
                         GenJnlLine."Currency Factor":="Exchange Factor";
                         GenJnlLine.Amount:=-ROUND(PremiumControlAmt);
                         PremiumControlAmt:=PremiumControlAmt+GenJnlLine.Amount;
                         //GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                         GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                         IF ProductPlan.GET("Policy Type",Underwriter) THEN
                         //GenJnlLine."Bal. Account No.":=ProductPlan."Premium Account";
                         GenJnlLine."Loan No":=Amount;
                         GenJnlLine."ED Code":="Policy Type";
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
                         GenJnlLine."Journal Template Name":='CASH RECEI';
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
                         GenJnlLine.Amount:=ROUND(BasePremium*(ProductPlanTax."Loading %"/100));
                         PremiumControlAmt:=PremiumControlAmt+GenJnlLine.Amount;
                         //GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                         GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                         GenJnlLine."Bal. Account No.":=ProductPlanTax."Account No";
                         GenJnlLine."Loan No":=Amount;
                         GenJnlLine."ED Code":="Policy Type";
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
                    AdjustConversion.Run(GenJnlLine);
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'CASH RECEI');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",No);
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnlLine);
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'CASH RECEI');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",No);
                    if GenJnlLine.Find('-') then
                    exit;
                    
                    Posted:=true;
                    "Date Posted":=Today;
                    "Time Posted":=Time;
                    "Posted By":=UserId;
                    Rec.Modify;

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    if Posted=false then
                    Error('Post the receipt before printing.');
                    Rec.Reset;
                    Rec.SetFilter(No,No);
                    Report.Run(50015,true,true,Rec);
                    Rec.Reset;
                end;
            }
            action(DirectPrinting)
            {
                ApplicationArea = Basic;
                Caption = 'Direct Printing';

                trigger OnAction()
                begin
                    if Posted=false then
                    Error('Post the receipt before printing.');
                    Rec.Reset;
                    Rec.SetFilter(No,No);
                    Report.Run(50015,false,true,Rec);
                    Rec.Reset;
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
                actionref(Print_Promoted; Print)
                {
                }
                actionref(DirectPrinting_Promoted; DirectPrinting)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
         if Posted then
         Error('You cannot delete a posted receipt');
    end;

    trigger OnInit()
    begin
        "Cheque DateEditable" := true;
        "Cheque NoEditable" := true;
    end;

    trigger OnModifyRecord(): Boolean
    begin
          if Posted then
          Error('You cannot change details of a posted receipt');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        RecPayTypes: Record "Receipts and Payment Types1";
        CurrExchRate: Record "Currency Exchange Rate";
        Amt: Decimal;
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        PolicyRec: Record "Sales Invoice Header";
        PremiumControlAmt: Decimal;
        BasePremium: Decimal;
        TotalTax: Decimal;
        TotalTaxPercent: Decimal;
        TotalPercent: Decimal;
        SalesInvoiceHeadr: Record "Sales Invoice Header";
        AdjustConversion: Codeunit "Adjust Gen. Journal Balance";
        
        "Cheque NoEditable": Boolean;
       
        "Cheque DateEditable": Boolean;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        if ("Pay Mode"="pay mode"::Cash) or ("Pay Mode"="pay mode"::EFT) then
        begin
          "Cheque NoEditable" :=false;
          "Cheque DateEditable" :=false;
        end else begin
          "Cheque NoEditable" :=true;
          "Cheque DateEditable" :=true;

        end;
    end;
}
