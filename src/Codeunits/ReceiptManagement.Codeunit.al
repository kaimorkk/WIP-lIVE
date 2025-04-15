Codeunit 52193435 "Receipt Management"
{

    trigger OnRun()
    begin
        PostReceipts(CashierReceipt);
    end;

    var
        "member name": Text[100];
        StaffNo: Code[20];
        Cust: Record Customer;
        Gnljnline: Record "Gen. Journal Line";
        GenBatches: Record "Gen. Journal Batch";
        RecLine: Record "Receipts Lines";
        "cashier receipt": Record Receipts;
        name: Text[100];
        "GL Account": Record "G/L Account";
        LoanApp: Record Charges;
        MonthlyInt: Decimal;
        "Amount Received": Decimal;
        Text001: label 'Checking Duplicate Member Nos for ###########1 ###########2';
        CashierReceipt: Record Receipts;
        CashierPayment: Record Payments1;
        PayLine: Record "Payment Lines";
        // Rschedule: Record "Loan Repayment Schedule";
        // LoanTypes: Record "Loan Product Types";
        BosaSetup: Record "Bosa Setup";
        CMSetup: Record CMSetup;
        LoanAcc: Code[30];
        LoanTypeCode: Code[30];
        Nextmonth: Date;
        InstallNo: Integer;
        // Rsched: Record "Loan Repayment Schedule";
        TotalMRepay: Decimal;
        LInterest: Decimal;
        LPrincipal: Decimal;
        LoanAmount: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Integer;
        LBalance: Decimal;
        ActualOutBal: Decimal;
        LineNo: Integer;
        GenSetup: Record "General Set-Up";
        MontContrib: Record "Monthly Contributions";
        ShareAmnt: Decimal;
        RemainAmnt: Decimal;
        BosaProd: Record "Bosa Products";
        ShareGroup: Code[20];
        Desc: Text;
        Text002: label 'The Member must deposit atleast % 1';
        Dim2: Code[20];
        RemainAmnt1: Decimal;
        ShareDiff: Decimal;
        // LGuaran: Record "Loan Guarantors";
        MinShareCap: Decimal;


    procedure PostReceipts(var CashierReceipts: Record Receipts)
    var
        CHEQUE: Code[50];
        GLEntry: Record "G/L Entry";
        // LoanRec: Record Loans;
        LoanRecNo: Code[20];
        MemberRecNo: Code[20];
        RecLine1: Record "Receipts Lines";
        Allocate: Record "Receipts Header1";
        RcptLine: Record "Receipts Lines";
        AllocateReceipt: Record "Allocated Receipts";
        NextNo: Integer;
        NextAdded: Integer;
        AddedNo: Code[20];
    begin
        BosaSetup.Reset;
        GenSetup.Get;

        if BosaSetup.Find('-') then begin

            with CashierReceipts do begin
                //Validation
                CashierReceipts.TestField("Received From");
                CashierReceipts.TestField("Bank Account");
                CashierReceipts.TestField("Receipt Mode");

                if CashierReceipts."Receipt Mode" = 'CHEQUE' then begin
                    CashierReceipts.TestField("Cheque No.");
                    CashierReceipts.TestField("Cheque Date");
                end;

                if "Total Line Amount" = 0 then
                    Error('Amount received cannot be equal to zero');

                //Code to Post the Money Received
                if CashierReceipts.Posted = true then
                    Error('Transaction No. %1 is already posted', No);

                BosaSetup.Get();
                if BosaProd.Get(BosaSetup."Share Capital Product Code") then
                    Dim2 := BosaProd."Global Dimension 2 Code";


                Gnljnline.Reset;
                Gnljnline.SetRange("Journal Template Name", BosaSetup."Receipts Journal Template");
                Gnljnline.SetRange("Journal Batch Name", CashierReceipts.No);
                Gnljnline.DeleteAll;
                //end of deletion

                GenBatches.Reset;
                GenBatches.SetRange(GenBatches."Journal Template Name", BosaSetup."Receipts Journal Template");
                GenBatches.SetRange(GenBatches.Name, CashierReceipts.No);
                if GenBatches.Find('-') = false then begin
                    GenBatches.Init;
                    GenBatches."Journal Template Name" := BosaSetup."Receipts Journal Template";
                    GenBatches.Name := CashierReceipts.No;
                    GenBatches.Description := CashierReceipts.Description;
                    GenBatches.Validate(GenBatches."Journal Template Name");
                    GenBatches.Validate(GenBatches.Name);
                    //GenBatches.CALCSUMS(GenBatches."Total Amount");
                    GenBatches.Insert;
                end;

                //All Other Receipts
                RecLine.Reset;
                RecLine.SetRange(RecLine.No, No);
                if RecLine.Find('-') then begin
                    repeat

                        RecLine.TestField(Description);



                        case RecLine."Account Type" of
                            RecLine."account type"::Customer:
                                begin
                                    LineNo := LineNo + 1000;
                                    if RecLine."Transaction Type" <> RecLine."transaction type"::"Loan Repayment" then begin
                                        RecLine.TestField(Type);

                                        //Minimum Share
                                        BosaProd.Reset;
                                        BosaProd.SetRange("Share Capital", true);
                                        if BosaProd.Find('-') then
                                            MinShareCap := BosaProd."Min. Contribution";

                                        //Trial Julius

                                        //Reg Fee
                                        Cust.Reset;
                                        Cust.SetRange("No.", RecLine."Account No.");
                                        // Cust.SetRange("Registration Fee Paid", false);
                                        if Cust.Find('-') then begin
                                            if GenSetup."Registration Fee" > 0 then begin
                                                if (RecLine.Amount >= GenSetup."Registration Fee") then begin
                                                    if (RecLine.Amount >= MinShareCap) then begin
                                                        RemainAmnt := RecLine.Amount;//-GenSetup."Registration Fee";//Not needed because we are depositing money to account then transfering to reg acc
                                                                                     //RegFee:=GenSetup."Registration Fee";

                                                        //LineNo:=LineNo+1000;
                                                        Gnljnline.Init;
                                                        Gnljnline."Line No." := LineNo;
                                                        Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                        Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                        Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                        Gnljnline."Document No." := CashierReceipts.No;
                                                        Gnljnline."Account Type" := RecLine."Account Type";
                                                        Gnljnline."Account No." := RecLine."Account No.";
                                                        Gnljnline.Validate("Account No.");
                                                        Gnljnline.Description := RecLine.Description;
                                                        //Gnljnline."Transaction Type" := RecLine."Transaction Type";
                                                        //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                        Gnljnline.Amount := (RecLine.Amount - MinShareCap) * -1;
                                                        Gnljnline.Validate(Amount);
                                                        Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                        Gnljnline.Validate("Currency Code");
                                                        //Gnljnline."Loan No" := RecLine."Loan No.";
                                                        Gnljnline."Posting Group" := RecLine."Posting Group";
                                                        Gnljnline.Validate("Posting Group");
                                                        //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                        //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                        //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                        Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                        if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                            //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                            //Gnljnline."Received From" := CashierReceipts."Received From";
                                                            //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                        Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                        Gnljnline."Shortcut Dimension 2 Code" := RecLine."Global Dimension 2 Code";
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                        if Gnljnline.Amount <> 0 then
                                                            Gnljnline.Insert;


                                                        LineNo := LineNo + 1000;
                                                        Gnljnline.Init;
                                                        Gnljnline."Line No." := LineNo;
                                                        Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                        Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                        Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                        Gnljnline."Document No." := CashierReceipts.No;
                                                        Gnljnline."Account Type" := RecLine."Account Type";
                                                        Gnljnline."Account No." := RecLine."Account No.";
                                                        Gnljnline.Validate("Account No.");
                                                        Gnljnline.Description := 'Membership/Registration Fee';
                                                        //Gnljnline."Transaction Type" := //Gnljnline."Transaction Type"::"Registration Fee";
                                                        //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                        Gnljnline.Amount := GenSetup."Registration Fee";
                                                        Gnljnline.Validate(Amount);
                                                        Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                        Gnljnline.Validate(Gnljnline."Currency Code");
                                                        //Gnljnline."Loan No" := RecLine."Loan No.";
                                                        //Gnljnline."Posting Group":=GenSetup."Reg Fee Posting Group";
                                                        //Gnljnline.VALIDATE("Posting Group");
                                                        //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                        //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                        Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                        //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                        if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                            //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                            //Gnljnline."Received From" := CashierReceipts."Received From";
                                                            //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                        Gnljnline."Bal. Account Type" := Gnljnline."bal. account type"::"G/L Account";
                                                        Gnljnline."Bal. Account No." := GenSetup."Reg Fee Account";
                                                        Gnljnline.Validate("Bal. Account No.");
                                                        Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                        Gnljnline."Shortcut Dimension 2 Code" := RecLine."Global Dimension 2 Code";
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                        if Gnljnline.Amount <> 0 then
                                                            Gnljnline.Insert;



                                                        MontContrib.Reset;
                                                        MontContrib.SetRange("Member No.", RecLine."Account No.");
                                                        MontContrib.SetRange("Share Capital", true);
                                                        if MontContrib.Find('-') then begin
                                                            if BosaProd.Get(MontContrib."Product Code") then begin
                                                                ShareGroup := BosaProd."Default Grouping";
                                                                Desc := BosaProd."Product Name";
                                                            end;

                                                            MontContrib.CalcFields(Amount);
                                                            //LineNo:=LineNo+1000;
                                                            if MontContrib.Amount < MinShareCap then begin
                                                                // IF MinShareCap > 0 THEN BEGIN
                                                                ShareDiff := MinShareCap - MontContrib.Amount;
                                                                if RemainAmnt > ShareDiff then begin
                                                                    RemainAmnt1 := RemainAmnt - ShareDiff;
                                                                    Gnljnline.Init;
                                                                    Gnljnline."Line No." := LineNo;
                                                                    Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                                    Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                                    Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                                    Gnljnline."Document No." := CashierReceipts.No;
                                                                    Gnljnline."Account Type" := RecLine."Account Type";
                                                                    Gnljnline."Account No." := RecLine."Account No.";
                                                                    Gnljnline.Validate("Account No.");
                                                                    Gnljnline.Description := Desc;
                                                                    //Gnljnline."Transaction Type" := //Gnljnline."Transaction Type"::"Share Contribution";
                                                                    //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                                    Gnljnline.Amount := -ShareDiff;
                                                                    Gnljnline.Validate(Amount);
                                                                    Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                                    Gnljnline.Validate("Currency Code");
                                                                    //Gnljnline."Loan No" := RecLine."Loan No.";
                                                                    Gnljnline."Posting Group" := ShareGroup;
                                                                    Gnljnline.Validate("Posting Group");
                                                                    //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                                    //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                                    Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                                    //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                                    if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                                        //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                                        //Gnljnline."Received From" := CashierReceipts."Received From";
                                                                        //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                                        //Gnljnline."Bal. Account Type":=Gnljnline."Bal. Account Type"::"G/L Account";
                                                                        //Gnljnline."Bal. Account No.":=GenSetup."Reg Fee Account";
                                                                        Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                                    Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                                    Gnljnline."Shortcut Dimension 2 Code" := Dim2;
                                                                    Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                                    if Gnljnline.Amount <> 0 then
                                                                        Gnljnline.Insert;

                                                                end else if RemainAmnt <= ShareDiff then begin
                                                                    Gnljnline.Init;
                                                                    Gnljnline."Line No." := LineNo;
                                                                    Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                                    Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                                    Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                                    Gnljnline."Document No." := CashierReceipts.No;
                                                                    Gnljnline."Account Type" := RecLine."Account Type";
                                                                    Gnljnline."Account No." := RecLine."Account No.";
                                                                    Gnljnline.Validate("Account No.");
                                                                    Gnljnline.Description := Desc;
                                                                    //Gnljnline."Transaction Type" := //Gnljnline."Transaction Type"::"Share Contribution";
                                                                    //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                                    Gnljnline.Amount := -RemainAmnt;
                                                                    Gnljnline.Validate(Amount);
                                                                    Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                                    Gnljnline.Validate(Gnljnline."Currency Code");
                                                                    //Gnljnline."Loan No" := RecLine."Loan No.";
                                                                    Gnljnline."Posting Group" := ShareGroup;
                                                                    Gnljnline.Validate("Posting Group");
                                                                    //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                                    //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                                    Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                                    //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                                    if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                                        //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                                        //Gnljnline."Received From" := CashierReceipts."Received From";
                                                                        //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                                    Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                                    Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                                    Gnljnline."Shortcut Dimension 2 Code" := Dim2;
                                                                    Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                                    if Gnljnline.Amount <> 0 then
                                                                        Gnljnline.Insert;
                                                                end;
                                                            end;
                                                        end;

                                                    end else if (RecLine.Amount < MinShareCap) then begin
                                                        RemainAmnt := RecLine.Amount - GenSetup."Registration Fee";

                                                        //LineNo:=LineNo+1000;
                                                        Gnljnline.Init;
                                                        Gnljnline."Line No." := LineNo;
                                                        Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                        Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                        Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                        Gnljnline."Document No." := CashierReceipts.No;
                                                        Gnljnline."Account Type" := RecLine."Account Type";
                                                        Gnljnline."Account No." := RecLine."Account No.";
                                                        Gnljnline.Validate("Account No.");
                                                        Gnljnline.Description := RecLine.Description;
                                                        //Gnljnline."Transaction Type" := RecLine."Transaction Type";
                                                        //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                        Gnljnline.Amount := GenSetup."Registration Fee" * -1;
                                                        Gnljnline.Validate(Amount);
                                                        Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                        Gnljnline.Validate("Currency Code");
                                                        //Gnljnline."Loan No" := RecLine."Loan No.";
                                                        Gnljnline."Posting Group" := RecLine."Posting Group";
                                                        Gnljnline.Validate("Posting Group");
                                                        //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                        //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                        //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                        Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                        if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                            //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                            //Gnljnline."Received From" := CashierReceipts."Received From";
                                                            //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                        Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                        Gnljnline."Shortcut Dimension 2 Code" := RecLine."Global Dimension 2 Code";
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                        if Gnljnline.Amount <> 0 then
                                                            Gnljnline.Insert;


                                                        //LineNo:=LineNo+1000;
                                                        Gnljnline.Init;
                                                        Gnljnline."Line No." := LineNo;
                                                        Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                        Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                        Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                        Gnljnline."Document No." := CashierReceipts.No;
                                                        Gnljnline."Account Type" := RecLine."Account Type";
                                                        Gnljnline."Account No." := RecLine."Account No.";
                                                        Gnljnline.Validate("Account No.");
                                                        Gnljnline.Description := 'Membership/Registration Fee';
                                                        //Gnljnline."Transaction Type" := //Gnljnline."Transaction Type"::"Registration Fee";
                                                        //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                        Gnljnline.Amount := GenSetup."Registration Fee";
                                                        Gnljnline.Validate(Amount);
                                                        Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                        Gnljnline.Validate(Gnljnline."Currency Code");
                                                        //Gnljnline."Loan No" := RecLine."Loan No.";
                                                        //Gnljnline."Posting Group":=GenSetup."Reg Fee Posting Group";
                                                        //Gnljnline.VALIDATE("Posting Group");
                                                        //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                        //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                        Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                        //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                        if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                            //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                            //Gnljnline."Received From" := CashierReceipts."Received From";
                                                            //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                        Gnljnline."Bal. Account Type" := Gnljnline."bal. account type"::"G/L Account";
                                                        Gnljnline."Bal. Account No." := GenSetup."Reg Fee Account";
                                                        Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                        Gnljnline."Shortcut Dimension 2 Code" := RecLine."Global Dimension 2 Code";
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                        if Gnljnline.Amount <> 0 then
                                                            Gnljnline.Insert;

                                                        MontContrib.Reset;
                                                        MontContrib.SetRange("Member No.", RecLine."Account No.");
                                                        MontContrib.SetRange("Share Capital", true);
                                                        if MontContrib.Find('-') then begin
                                                            if BosaProd.Get(MontContrib."Product Code") then begin
                                                                ShareGroup := BosaProd."Default Grouping";
                                                                Desc := BosaProd."Product Name";
                                                            end;

                                                            MontContrib.CalcFields(Amount);
                                                            //LineNo:=LineNo+1000;
                                                            if MontContrib.Amount < MinShareCap then begin
                                                                // IF MinShareCap > 0 THEN BEGIN
                                                                ShareDiff := MinShareCap - MontContrib.Amount;
                                                                //IF RemainAmnt > ShareDiff THEN BEGIN
                                                                RemainAmnt1 := RemainAmnt - ShareDiff;
                                                                Gnljnline.Init;
                                                                Gnljnline."Line No." := LineNo;
                                                                Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                                Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                                Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                                Gnljnline."Document No." := CashierReceipts.No;
                                                                Gnljnline."Account Type" := RecLine."Account Type";
                                                                Gnljnline."Account No." := RecLine."Account No.";
                                                                Gnljnline.Validate("Account No.");
                                                                Gnljnline.Description := Desc;
                                                                //Gnljnline."Transaction Type" := //Gnljnline."Transaction Type"::"Share Contribution";
                                                                //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                                Gnljnline.Amount := (RecLine.Amount - GenSetup."Registration Fee") * -1;//-ShareDiff;
                                                                Gnljnline.Validate(Amount);
                                                                Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                                Gnljnline.Validate("Currency Code");
                                                                //Gnljnline."Loan No" := RecLine."Loan No.";
                                                                Gnljnline."Posting Group" := ShareGroup;
                                                                Gnljnline.Validate("Posting Group");
                                                                //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                                //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                                Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                                //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                                if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                                    //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                                    //Gnljnline."Received From" := CashierReceipts."Received From";
                                                                    //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                                Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                                Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                                Gnljnline."Shortcut Dimension 2 Code" := Dim2;
                                                                Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                                if Gnljnline.Amount <> 0 then
                                                                    Gnljnline.Insert;

                                                            end;
                                                        end;

                                                    end;


                                                end else
                                                    Error((Text002), GenSetup."Registration Fee");
                                            end;
                                        end else begin   //Inserting Share Capital after reg fee was paid up earlier

                                            MontContrib.Reset;
                                            MontContrib.SetRange("Member No.", RecLine."Account No.");
                                            MontContrib.SetRange("Share Capital", true);
                                            if MontContrib.Find('-') then begin
                                                if BosaProd.Get(MontContrib."Product Code") then begin
                                                    ShareGroup := BosaProd."Default Grouping";
                                                    Desc := BosaProd."Product Name";
                                                end;

                                                MontContrib.CalcFields(Amount);
                                                //LineNo:=LineNo+1000;
                                                if MontContrib.Amount < MinShareCap then begin
                                                    // IF MinShareCap > 0 THEN BEGIN
                                                    ShareDiff := MinShareCap - MontContrib.Amount;
                                                    RemainAmnt := RecLine.Amount;

                                                    if RemainAmnt > ShareDiff then begin
                                                        RemainAmnt1 := RemainAmnt - ShareDiff;
                                                        Gnljnline.Init;
                                                        Gnljnline."Line No." := LineNo;
                                                        Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                        Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                        Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                        Gnljnline."Document No." := CashierReceipts.No;
                                                        Gnljnline."Account Type" := RecLine."Account Type";
                                                        Gnljnline."Account No." := RecLine."Account No.";
                                                        Gnljnline.Validate("Account No.");
                                                        Gnljnline.Description := Desc;
                                                        //Gnljnline."Transaction Type" := //Gnljnline."Transaction Type"::"Share Contribution";
                                                        //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                        Gnljnline.Amount := -ShareDiff;
                                                        Gnljnline.Validate(Amount);
                                                        Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                        Gnljnline.Validate("Currency Code");
                                                        //Gnljnline."Loan No" := RecLine."Loan No.";
                                                        Gnljnline."Posting Group" := ShareGroup;
                                                        Gnljnline.Validate("Posting Group");
                                                        //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                        //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                        Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                        //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                        if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                            //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                            //Gnljnline."Received From" := CashierReceipts."Received From";
                                                            //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                        Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                        Gnljnline."Shortcut Dimension 2 Code" := Dim2;
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                        if Gnljnline.Amount <> 0 then
                                                            Gnljnline.Insert;


                                                        //Extra Insertion Remaining Amount after all Share Capital is Paid Up
                                                        if RemainAmnt1 > 0 then begin
                                                            //LineNo:=LineNo+1000;
                                                            Gnljnline.Init;
                                                            Gnljnline."Line No." := LineNo;
                                                            Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                            Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                            Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                            Gnljnline."Document No." := CashierReceipts.No;
                                                            Gnljnline."Account Type" := RecLine."Account Type";
                                                            Gnljnline."Account No." := RecLine."Account No.";
                                                            Gnljnline.Validate("Account No.");
                                                            Gnljnline.Description := RecLine.Description;
                                                            //Gnljnline."Transaction Type" := RecLine."Transaction Type";
                                                            //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                            Gnljnline.Amount := -RemainAmnt1;
                                                            Gnljnline.Validate(Amount);
                                                            Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                            Gnljnline.Validate("Currency Code");
                                                            //Gnljnline."Loan No" := RecLine."Loan No.";
                                                            Gnljnline."Posting Group" := RecLine."Posting Group";
                                                            Gnljnline.Validate("Posting Group");
                                                            //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                            //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                            //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                            Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                            if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                                //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                                //Gnljnline."Received From" := CashierReceipts."Received From";
                                                                //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                            Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                            Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                            Gnljnline."Shortcut Dimension 2 Code" := RecLine."Global Dimension 2 Code";
                                                            Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                            if Gnljnline.Amount <> 0 then
                                                                Gnljnline.Insert;
                                                        end;


                                                    end else if RemainAmnt <= ShareDiff then begin
                                                        Gnljnline.Init;
                                                        Gnljnline."Line No." := LineNo;
                                                        Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                        Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                        Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                        Gnljnline."Document No." := CashierReceipts.No;
                                                        Gnljnline."Account Type" := RecLine."Account Type";
                                                        Gnljnline."Account No." := RecLine."Account No.";
                                                        Gnljnline.Validate("Account No.");
                                                        Gnljnline.Description := Desc;
                                                        //Gnljnline."Transaction Type" := //Gnljnline."Transaction Type"::"Share Contribution";
                                                        //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                        Gnljnline.Amount := -RemainAmnt;
                                                        Gnljnline.Validate(Amount);
                                                        Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                        Gnljnline.Validate(Gnljnline."Currency Code");
                                                        //Gnljnline."Loan No" := RecLine."Loan No.";
                                                        Gnljnline."Posting Group" := ShareGroup;
                                                        Gnljnline.Validate("Posting Group");
                                                        //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                        //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                        Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                        //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                        if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                            //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                            //Gnljnline."Received From" := CashierReceipts."Received From";
                                                            //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                        Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                        Gnljnline."Shortcut Dimension 2 Code" := Dim2;
                                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                        if Gnljnline.Amount <> 0 then
                                                            Gnljnline.Insert;
                                                    end;
                                                end else if MontContrib.Amount >= MinShareCap then begin
                                                    // IF MinShareCap > 0 THEN BEGIN
                                                    Gnljnline.Init;
                                                    Gnljnline."Line No." := LineNo;
                                                    Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                    Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                    Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                    Gnljnline."Document No." := CashierReceipts.No;
                                                    Gnljnline."Account Type" := RecLine."Account Type";
                                                    Gnljnline."Account No." := RecLine."Account No.";
                                                    Gnljnline.Validate("Account No.");
                                                    Gnljnline.Description := RecLine.Description;
                                                    //Gnljnline."Transaction Type" := RecLine."Transaction Type";
                                                    //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                    Gnljnline.Amount := -RecLine.Amount;
                                                    Gnljnline.Validate(Amount);
                                                    Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                    Gnljnline.Validate(Gnljnline."Currency Code");
                                                    //Gnljnline."Loan No" := RecLine."Loan No.";
                                                    Gnljnline."Posting Group" := RecLine."Posting Group";
                                                    Gnljnline.Validate("Posting Group");
                                                    //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                    //Gnljnline."Cheque No" := CashierReceipts."Cheque No.";
                                                    Gnljnline."External Document No." := CashierReceipts."Ext. Document No.";
                                                    //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                    if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                        //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                        //Gnljnline."Received From" := CashierReceipts."Received From";
                                                        //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                    Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                    Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                    Gnljnline."Shortcut Dimension 2 Code" := RecLine."Global Dimension 2 Code";
                                                    Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                    if Gnljnline.Amount <> 0 then
                                                        Gnljnline.Insert;

                                                end;
                                            end;

                                        end;
                                        //End Trial Julius

                                    end; //-- End of Begin inside CASE of Customer

                                    ///Next if inside Customer CASE

                                    //Loan Repayment Receipt   //Principal Repayment and Interest
                                    if RecLine."Transaction Type" = RecLine."transaction type"::"Loan Repayment" then begin
                                        Gnljnline.Init;
                                        Gnljnline."Line No." := LineNo;
                                        Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                        Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                        Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                        Gnljnline."Document No." := CashierReceipts.No;
                                        Gnljnline."Account Type" := RecLine."Account Type";
                                        Gnljnline."Account No." := RecLine."Account No.";
                                        Gnljnline.Validate("Account No.");
                                        Gnljnline.Description := RecLine.Description;
                                        //Gnljnline."Transaction Type" := //Gnljnline."Transaction Type"::"Loan Repayment";
                                        //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                        Gnljnline.Amount := -(RecLine.Principal);
                                        Gnljnline.Validate(Amount);
                                        Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                        Gnljnline.Validate(Gnljnline."Currency Code");
                                        //Gnljnline."Loan No" := RecLine."Loan No.";
                                        Gnljnline."Posting Group" := RecLine."Posting Group";
                                        Gnljnline.Validate("Posting Group");
                                        //Gnljnline.Remarks := CashierReceipts.Remarks;
                                        //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                        if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                            //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                            //Gnljnline."Received From" := CashierReceipts."Received From";
                                            //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                        Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                        Gnljnline."Shortcut Dimension 2 Code" := RecLine."Global Dimension 2 Code";
                                        Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                        Gnljnline."External Document No." := "Cheque No.";
                                        if Gnljnline.Amount <> 0 then
                                            Gnljnline.Insert;


                                        //Interest Repayment Receipt
                                        // LoanRec.Reset;
                                        // LoanRec.SetRange(LoanRec."Loan No.", RecLine."Loan No.");
                                        // if LoanRec.Find('-') then begin
                                        //     LoanTypeCode := LoanRec."Loan Product Type";
                                        //     if LoanTypes.Get(LoanTypeCode) then begin
                                        //         LoanAcc := LoanTypes."Loan Account";
                                        if CashierReceipts."Account No." <> '' then begin
                                            if CashierReceipts."Account No." <> '' then begin


                                                LineNo := LineNo + 1000;
                                                Gnljnline.Init;
                                                Gnljnline."Line No." := LineNo;
                                                Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                                Gnljnline."Document No." := CashierReceipts.No;
                                                Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                                Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                                //Gnljnline."Account Type":=Gnljnline."Account Type"::"G/L Account";
                                                //Gnljnline."Account No.":=LoanAcc;
                                                Gnljnline."Account Type" := RecLine."Account Type";
                                                Gnljnline."Account No." := RecLine."Account No.";
                                                Gnljnline.Validate(Gnljnline."Account No.");
                                                Gnljnline.Amount := -RecLine.Interest;
                                                Gnljnline.Validate(Gnljnline.Amount);
                                                Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                                Gnljnline.Validate("Currency Code");
                                                //Gnljnline."Transaction Type" := //Gnljnline."Transaction Type"::"Interest Paid";
                                                //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                                // Gnljnline.Description := Format(//Gnljnline."Transaction Type"::"Interest Paid");
                                                //Gnljnline."Loan No" := RecLine."Loan No.";
                                                // Gnljnline."Posting Group" := LoanTypes."Interest Receivd Posting Group";
                                                // Gnljnline.Validate("Posting Group");
                                                //Gnljnline.Remarks := CashierReceipts.Remarks;
                                                //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                                // if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                                //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                                //Gnljnline."Received From" := CashierReceipts."Received From";
                                                //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                                Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                                Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                                Gnljnline."Shortcut Dimension 2 Code" := RecLine."Global Dimension 2 Code";
                                                Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                                if Gnljnline.Amount <> 0 then
                                                    Gnljnline.Insert;


                                            end;
                                        end;
                                    end;




                                    //Get the Schedule
                                    // Rschedule.Reset;
                                    // Rschedule.SetCurrentkey(Rschedule."Instalment No", Rschedule."Repayment Code");
                                    // Rschedule.SetRange(Rschedule."Loan No.", RecLine."Loan No.");
                                    // Rschedule.SetRange(Rschedule."Fully Paid", false);
                                    // if Rschedule.Find('-') then begin

                                    //     Rschedule."Actual Installment Paid" := Abs(RecLine.Amount);
                                    //     Rschedule."Actual Principal Paid" := Abs(RecLine.Principal);
                                    //     Rschedule."Actual Interest Paid" := Abs(RecLine.Interest);
                                    //     Rschedule."Actual Loan Repayment Date" := CashierReceipts."Receipt Date";

                                    //     if Rschedule."Principal Repayment" = Rschedule."Actual Principal Paid" then begin
                                    //         Rschedule."Closed Date" := CashierReceipts."Receipt Date";
                                    //     end else
                                    //         Rschedule."Remaining Debt" := Rschedule."Monthly Repayment" - Rschedule."Actual Installment Paid";

                                    //     if LoanRec.Get(RecLine."Loan No.") then
                                    //         if LoanRec."Repayment Method" <> LoanRec."repayment method"::"Straight Line" then begin


                                    //             LoanRec.CalcFields("Outstanding Balance");
                                    //             LoanAmount := LoanRec."Outstanding Balance";
                                    //             InterestRate := LoanRec.Interest;
                                    //             RepayPeriod := LoanRec.Installments;

                                    //             LoanRec.TestField(Interest);
                                    //             LoanRec.TestField(Installments);
                                    //             if LoanRec."Repayment Method" = LoanRec."repayment method"::Amortised then begin
                                    //                 TotalMRepay := ROUND((InterestRate / 12 / 100) / (1 - Power((1 + (InterestRate / 12 / 100)), -RepayPeriod)) * LoanAmount, 0.05, '>');
                                    //                 LInterest := ROUND(LoanAmount / 100 / 12 * InterestRate, 0.05, '>');
                                    //                 LPrincipal := TotalMRepay - LInterest;
                                    //             end;

                                    //             if LoanRec."Repayment Method" = LoanRec."repayment method"::"Reducing Balance" then begin
                                    //                 LPrincipal := ROUND(LoanAmount / RepayPeriod, 0.05, '>');
                                    //                 LInterest := ROUND((InterestRate / 12 / 100) * LBalance, 0.05, '>');
                                    //             end;


                                    //             //Pass interest due entry for the next month
                                    //             //IF Rschedule."Instalment No" < InstallNo THEN BEGIN
                                    //             //Nextmonth:=CALCDATE('+1M',Rschedule."Repayment Date");
                                    //             ActualOutBal := LoanRec."Outstanding Balance" - RecLine.Amount;

                                    //             if ActualOutBal > 0 then begin
                                    //                 LineNo := LineNo + 1000;
                                    //                 Gnljnline.Init;
                                    //                 Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";//GenBatches."Journal Template Name";
                                    //                 Gnljnline."Journal Batch Name" := CashierReceipts.No;//GenBatches.Name;
                                    //                 Gnljnline."Line No." := LineNo;//0000 + Gnljnline."Line No.";
                                    //                 Gnljnline."Account Type" := Gnljnline."account type"::Customer;
                                    //                 Gnljnline."Account No." := RecLine."Account No.";
                                    //                 //Gnljnline."Transaction Type" := //Gnljnline."Transaction Type"::"Interest Due";
                                    //                 //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                    //                 Gnljnline.Validate(Gnljnline."Account No.");
                                    //                 Gnljnline."Document No." := CashierReceipts.No;
                                    //                 Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                    //                 Gnljnline.Description := 'Interest Due' + ' - ' + Format(Nextmonth);

                                    //                 /*Rsched.RESET;
                                    //                 Rsched.SETCURRENTKEY(Rsched."Instalment No",Rsched."Repayment Code");
                                    //                 Rsched.SETRANGE(Rsched."Loan No.",LoanRec."Loan No.");
                                    //                 Rsched.SETRANGE(Rsched."Fully Paid",FALSE);
                                    //                 Rsched.SETRANGE(Rsched."Repayment Date",Nextmonth);
                                    //                 IF Rsched.FIND('-') THEN BEGIN*/

                                    //                 Gnljnline.Amount := LInterest;//Rsched."Monthly Interest";
                                    //                 Gnljnline.Validate(Gnljnline.Amount);
                                    //                 //END;

                                    //                 Gnljnline."Bal. Account Type" := Gnljnline."bal. account type"::"G/L Account";
                                    //                 // if LoanTypes.Get(RecLine."Loan Type") then
                                    //                 //     Gnljnline."Bal. Account No." := LoanTypes."Received Interest Account";
                                    //                 Gnljnline.Validate(Gnljnline."Bal. Account No.");
                                    //                 //Gnljnline."Loan No" := RecLine."Loan No.";
                                    //                 Gnljnline."Posting Group" := RecLine."Posting Group";
                                    //                 Gnljnline.Validate("Posting Group");
                                    //                 //Gnljnline.Remarks := CashierReceipts.Remarks;
                                    //                 //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                    //                 if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                    //                     //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                    //                 //Gnljnline."Received From" := CashierReceipts."Received From";
                                    //                 //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                    //                 Gnljnline."Shortcut Dimension 1 Code" := CashierReceipts."Global Dimension 1 Code";
                                    //                 Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                    //                 Gnljnline."Shortcut Dimension 2 Code" := CashierReceipts."Global Dimension 2 Code";
                                    //                 Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                    //                 if Gnljnline.Amount <> 0 then
                                    //                     Gnljnline.Insert;
                                    //             end;
                                    //         end;
                                    //     // End of Accrued Interest

                                    //     // Rschedule."Fully Paid" := true;
                                    //     // Rschedule.Modify;
                                    // end;

                                end;// End Of Case Customer


                            RecLine."account type"::Vendor, RecLine."account type"::"Bank Account", RecLine."account type"::"Fixed Asset",
                            RecLine."account type"::"G/L Account":
                                begin
                                    LineNo := LineNo + 1000;
                                    Gnljnline.Init;
                                    Gnljnline."Line No." := LineNo;
                                    Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";
                                    Gnljnline."Journal Batch Name" := CashierReceipts.No;
                                    Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                                    Gnljnline."Document No." := CashierReceipts.No;
                                    Gnljnline."Account Type" := RecLine."Account Type";
                                    Gnljnline."Account No." := RecLine."Account No.";
                                    Gnljnline.Validate("Account No.");
                                    Gnljnline.Description := RecLine.Description;
                                    ////Gnljnline."Transaction Type":=RecLine."Transaction Type";
                                    //Gnljnline."Sacco Transaction Type" := RecLine.Type;
                                    Gnljnline.Amount := -RecLine.Amount;
                                    Gnljnline.Validate(Amount);
                                    Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                                    Gnljnline.Validate(Gnljnline."Currency Code");
                                    //Gnljnline."Loan No" := RecLine."Loan No.";
                                    Gnljnline."Posting Group" := RecLine."Posting Group";
                                    Gnljnline.Validate("Posting Group");
                                    //Gnljnline.Remarks := CashierReceipts.Remarks;
                                    //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                                    if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                                        //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                                        //Gnljnline."Received From" := CashierReceipts."Received From";
                                        //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                                    Gnljnline."Shortcut Dimension 1 Code" := RecLine."Global Dimension 1 Code";
                                    Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                    Gnljnline."Shortcut Dimension 2 Code" := RecLine."Global Dimension 2 Code";
                                    Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                    Gnljnline."External Document No." := "Cheque No.";
                                    if Gnljnline.Amount <> 0 then
                                        Gnljnline.Insert;
                                end;
                        end; //----- End of all Cases


                    //END;----Intital

                    //END;

                    until RecLine.Next = 0;
                end;


                CashierReceipts.CalcFields(CashierReceipts."Total Line Amount");
                LineNo := LineNo + 1000;
                Gnljnline.Init;
                Gnljnline."Line No." := LineNo;
                Gnljnline."Posting Date" := CashierReceipts."Receipt Date";
                Gnljnline."Document No." := CashierReceipts.No;
                Gnljnline."Journal Template Name" := BosaSetup."Receipts Journal Template";//GenBatches."Journal Template Name";
                Gnljnline."Journal Batch Name" := CashierReceipts.No;//GenBatches.Name;
                Gnljnline."Account Type" := CashierReceipts."account type"::"Bank Account";
                Gnljnline."Account No." := CashierReceipts."Bank Account";
                Gnljnline."External Document No." := "Cheque No.";
                Gnljnline.Amount := CashierReceipts."Total Line Amount";
                Gnljnline.Validate(Amount);
                //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                Gnljnline."Currency Code" := CashierReceipts."Currency Code";
                Gnljnline.Validate("Currency Code");
                Gnljnline.Description := CashierReceipts.Remarks;// GenBatches."Total Amount"
                //Gnljnline.Remarks := CashierReceipts.Remarks;
                //Gnljnline."Pay Mode" := CashierReceipts."Receipt Mode";
                if CashierReceipts."Receipt Mode" = 'CHEQUE' then
                    //Gnljnline."Cheque Date" := CashierReceipts."Cheque Date";
                    //Gnljnline."Received From" := CashierReceipts."Received From";
                    //Gnljnline."On Behalf Of" := CashierReceipts."On Behalf Of";
                Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
                Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                Gnljnline."Shortcut Dimension 2 Code" := CashierReceipts."Global Dimension 2 Code";
                Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                if Gnljnline.Amount <> 0 then
                    Gnljnline.Insert;
            end;


            //Post Transaction
            if Confirm('Are you sure you want to post') = true then begin
                Gnljnline.Reset;
                Gnljnline.SetRange(Gnljnline."Journal Template Name", BosaSetup."Receipts Journal Template");
                Gnljnline.SetRange(Gnljnline."Journal Batch Name", CashierReceipts.No);
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", Gnljnline);
                GLEntry.Reset;
                GLEntry.SetRange(GLEntry."Document No.", CashierReceipts.No);
                GLEntry.SetRange(GLEntry.Reversed, false);
                if GLEntry.FindFirst then begin
                    CashierReceipts.Posted := true;
                    CashierReceipts."Posting Date" := Today;
                    CashierReceipts."Posting Time" := Time;
                    CashierReceipts."Posted By" := UserId;
                    CashierReceipts.Modify;

                    RecLine.Reset;
                    RecLine.SetRange(No, RecLine.No);
                    RecLine.SetRange("Account Type", RecLine."account type"::Customer);
                    if RecLine.Find('-') then begin
                        repeat
                            if Cust.Get(RecLine."Account No.") then begin
                                // Cust.CalcFields("Registration Fee");
                                //Updating the Reg Fee paid in Customer details
                                // if not Cust."Registration Fee Paid" then begin
                                //     if Abs(Cust."Registration Fee") = GenSetup."Registration Fee" then begin
                                //         Cust."Registration Fee Paid" := true;
                                //         Cust.Modify;
                                //     end;
                                // end;
                                //Updating Fully repaid Loans in Customer details
                                // LoanRec.Reset;
                                // LoanRec.SetRange("Member No.", RecLine."Loan No.");
                                // LoanRec.SetRange(Source, LoanRec.Source::BOSA);
                                // LoanRec.SetRange(Posted, true);
                                // LoanRec.SetRange("Fully Paid", false);
                                // if LoanRec.Find('-') then begin
                                //     LoanRec.CalcFields("Outstanding Balance");

                                //     //Update Guarantors Liability
                                //     if LoanRec."Outstanding Balance" > 0 then begin
                                //         LGuaran.Reset;
                                //         LGuaran.SetRange("Loan No", RecLine."Loan No.");
                                //         LGuaran.SetRange(LGuaran.Substituted, false);
                                //         if LGuaran.Find('-') then begin
                                //             repeat
                                //                 LGuaran."Balance of Guaranteed Amount" := (ROUND((LGuaran."Amount Guaranteed" / LoanRec."Approved Amount") * LoanRec."Outstanding Balance", 0.05));
                                //                 LGuaran.Modify(true);
                                //             until LGuaran.Next = 0;
                                //         end;
                                //     end;

                                // if LoanRec."Outstanding Balance" <= 0 then begin
                                //     LoanRec."Fully Paid" := true;
                                //     LoanRec.Modify(true);
                                //     //Releasing Gurantors Liability
                                //     LGuaran.Reset;
                                //     LGuaran.SetRange("Loan No", RecLine."Loan No.");
                                //     LGuaran.SetRange(LGuaran.Substituted, false);
                                //     if LGuaran.Find('-') then begin
                                //         repeat
                                //             LGuaran.Substituted := true;
                                //             LGuaran.Modify(true);
                                //         until LGuaran.Next = 0;
                                //     end;


                                // end;
                                // end;
                            end;

                        until RecLine.Next = 0;
                    end;
                    //End Updating the Reg Fee paid in Customer details


                    //Updating the Receipt allocated
                    /*IF Allocate.GET(CashierReceipts."Unallocated Receipt") THEN BEGIN
                    Allocate."Unallocated Receipt":=TRUE;
                    Allocate.MODIFY;

                    AllocateReceipt.INIT;
                    AllocateReceipt.No:='';
                    CashierReceipt.CALCFIELDS("Total Line Amount");
                    AllocateReceipt.Amount:=CashierReceipt."Total Line Amount";
                    AllocateReceipt."Receipt No":=CashierReceipt.No;

                    AllocateReceipt.RESET;
                    AllocateReceipt.SETRANGE("Receipt No",CashierReceipt.No);
                    IF NOT AllocateReceipt.FINDLAST THEN
                    AllocateReceipt.No:=FORMAT(AllocateReceipt."Receipt No")+ '-1'
                    ELSE BEGIN
                    EVALUATE(NextNo,FORMAT(AllocateReceipt.No));
                    NextAdded:=NextNo+1;

                   // EVALUATE(AddedNo,NextAdded);
                    //AllocateReceipt.No:=;
                    END;
                    AllocateReceipt.INSERT(TRUE);

                    END; */


                end;
            end else
                exit;


        end;

    end;


    procedure CheckDuplicateNumbers(var ContributionRec: Record Receipts)
    var
        ContribLines: Record "Receipts Lines";
        ContribLinesCopy: Record "Receipts Lines";
        Counter: Integer;
        Window: Dialog;
        Names: Text[130];
    begin
        ContribLines.Reset;
        ContribLines.SetCurrentkey(ContribLines."Account No.");
        //ContribLines.SETRANGE(ContribLines."Document No",ContributionRec."No.");
        ContribLines.SetFilter(ContribLines."Account No.", '<>%1', '');
        Window.Open(Text001, Names, Counter);
        if ContribLines.Find('-') then
            repeat
                ContribLinesCopy.Reset;
                ContribLinesCopy.SetCurrentkey(ContribLinesCopy."Account No.");
                //ContribLinesCopy.SETRANGE(ContribLinesCopy."Document No",ContribLines."Document No");
                ContribLinesCopy.SetRange(ContribLinesCopy."Account No.", ContribLines."Account No.");
                Counter := ContribLinesCopy.Count;
                if Counter > 1 then begin
                    if ContribLinesCopy.Find('-') then
                        repeat
                            ContribLinesCopy."Duplicate Nos" := true;
                            ContribLinesCopy.Modify;
                        until ContribLinesCopy.Next = 0;
                end;
                Window.Update(1, ContribLinesCopy."Account Name");
                Window.Update(2, Counter);
            //SLEEP(2000);
            until ContribLines.Next = 0;
        Window.Close;
    end;


    procedure PostReceiptFinance(RptHeader: Record "Receipts HeaderFin")
    var
        GenJnLine: Record "Gen. Journal Line";
        RcptLine: Record "Receipt LinesFin";
        LineNo: Integer;
        Batch: Record "Gen. Journal Batch";
        GLEntry: Record "G/L Entry";
    begin

        if Confirm('Are you sure you want to post the receipt no ' + RptHeader."No." + ' ?') = true then begin

            if RptHeader.Posted then
                Error('The Receipt has been posted');

            RptHeader.TestField("Bank Code");
            RptHeader.TestField("Pay Mode");
            RptHeader.TestField("Received From");
            RptHeader.TestField(Date);

            if RptHeader."Pay Mode" = 'CHEQUE' then begin
                RptHeader.TestField("Cheque No");
                RptHeader.TestField("Cheque Date");
            end;

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", RptHeader."No.");
            GenJnLine.DeleteAll;

            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Receipt Template";
            Batch.Name := RptHeader."No.";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            //Post Bank entries
            RptHeader.CalcFields(RptHeader.Amount);
            LineNo := LineNo + 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := RptHeader."No.";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := RptHeader."Bank Code";
            GenJnLine."Posting Date" := RptHeader.Date;
            GenJnLine."Document No." := RptHeader."No.";
            GenJnLine.Description := RptHeader."Received From";
            GenJnLine.Amount := RptHeader.Amount;
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."External Document No." := RptHeader."Cheque No";
            GenJnLine."Currency Code" := RptHeader."Currency Code";
            GenJnLine.Validate(GenJnLine."Currency Code");
            //GenJnLine."Pay Mode" := RptHeader."Pay Mode";
            if RptHeader."Pay Mode" = 'CHEQUE' then
                //GenJnLine."Cheque Date" := RptHeader."Cheque Date";
            GenJnLine."Shortcut Dimension 1 Code" := RptHeader."Global Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := RptHeader."Global Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Post the receipt lines
            RcptLine.SetRange(RcptLine."Receipt No.", RptHeader."No.");
            if RcptLine.FindFirst then begin
                repeat
                    RcptLine.Validate(Amount);
                    LineNo := LineNo + 1000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := RptHeader."No.";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLine."Account Type";
                    GenJnLine."Account No." := RcptLine."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := RptHeader.Date;
                    GenJnLine."Document No." := RptHeader."No.";
                    GenJnLine.Description := RcptLine.Description;
                    GenJnLine.Amount := -RcptLine."Net Amount";
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."External Document No." := RptHeader."Cheque No";
                    GenJnLine."Currency Code" := RptHeader."Currency Code";
                    GenJnLine.Validate(GenJnLine."Currency Code");
                    GenJnLine."Shortcut Dimension 1 Code" := RcptLine."Global Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := RcptLine."Global Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                until
                 RcptLine.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", RptHeader."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                RptHeader.Posted := true;
                RptHeader."Posted Date" := Today;
                RptHeader."Posted Time" := Time;
                RptHeader."Posted By" := UserId;
                RptHeader.Modify;
            end;
        end;
    end;
}

