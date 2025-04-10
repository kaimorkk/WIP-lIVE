Codeunit 52193436 "Payment Management"
{

    trigger OnRun()
    begin
        //PostPayments(CashierPayment);
    end;

    var
        Text001: label 'Share transfer to';
        MemberName: Text[100];
        StaffNo: Code[20];
        Cust: Record Customer;
        Gnljnline: Record "Gen. Journal Line";
        GenBatches: Record "Gen. Journal Batch";
        "GL Account": Record "G/L Account";
        LoanApp: Record Charges;
        CashierPayment: Record Payments1;
        PayLine: Record "Payment Lines";
        // Rschedule: Record "Loan Repayment Schedule";
        // LoanTypes: Record "Loan Product Types";
        BosaSetup: Record "Bosa Setup";
        // LoanG: Record "Loan Guarantors";
        "Paying Bank": Record "Cheque Disbursment Table";
        // LoanDisburse: Record Loans;
        "Cheque Disbursment Table": Record "Cheque Disbursment Table";
        ChequeAmount: Decimal;
        GenSetUp: Record "Sales & Receivables Setup";
        SetUp: Record "General Set-Up";
        DActivity: Code[20];
        DBranch: Code[20];
        PCharges: Record "Precious Insurance Brokers";
        TCharges: Decimal;
        TopUpComm: Decimal;
        TotalTopupComm: Decimal;
        BatchTopUpAmount: Decimal;
        BatchTopUpComm: Decimal;
        "Processing Charges": Decimal;
        BatchTopUpAmountINT: Decimal;
        // LoanTopUp: Record "Loans Top up";
        // LoanType: Record "Loan Product Types";
        // LoanMgt: Codeunit "Loan Management";
        Batch: Record "Gen. Journal Batch";
        CMSetup: Record CMSetup;
        LineNo: Integer;
        Amnt: Decimal;
        // Loans2: Record Loans;
        StartDate: Date;
        ProdCharge: Record "Product Charges";
        LoanToped: Code[20];
        Text002: label 'Share transfer from';
        Text003: label 'Transaction No. %1 is already posted';


    procedure PostPayments(var CashierPayment: Record Payments1)
    var
        PayLine: Record "Payment Lines";
        CHEQUE: Code[50];
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        ActualLoanAmnt: Decimal;
        PayLine1: Record "Payment Lines";
    begin
        //Posting Payments
        BosaSetup.Reset;
        if BosaSetup.Find('-') then begin

            with CashierPayment do begin
                //Validation
                CashierPayment.TestField("Payment To");
                CashierPayment.TestField("Bank Account");
                CashierPayment.TestField("Payment Mode");

                if CashierPayment."Payment Mode" = 'CHEQUE' then begin
                    CashierPayment.TestField("Cheque No.");
                    CashierPayment.TestField("Cheque Date");
                end;

                if CashierPayment.Amount = 0 then
                    Error('Amount received cannot be equal to zero');

                if Posted = true then
                    Error('Transaction No. %1 is already posted', No);
                Gnljnline.Reset;
                Gnljnline.SetRange("Journal Template Name", BosaSetup."Payments Journal Template");
                Gnljnline.SetRange("Journal Batch Name", CashierPayment.No);
                Gnljnline.DeleteAll;
                //end of deletion
                GenBatches.Reset;
                GenBatches.SetRange(GenBatches."Journal Template Name", BosaSetup."Payments Journal Template");
                GenBatches.SetRange(GenBatches.Name, CashierPayment.No);
                if GenBatches.Find('-') = false then begin
                    GenBatches.Init;
                    GenBatches."Journal Template Name" := BosaSetup."Payments Journal Template";
                    GenBatches.Name := CashierPayment.No;
                    GenBatches.Description := "Member Name";
                    GenBatches.Validate(GenBatches."Journal Template Name");
                    GenBatches.Validate(GenBatches.Name);
                    //GenBatches.CALCSUMS(GenBatches."Total Amount");
                    GenBatches.Insert;
                end;

                //Payments
                PayLine.Reset;
                PayLine.SetRange(PayLine.No, No);
                if PayLine.Find('-') then begin //--First Begin
                    repeat

                        if PayLine."Transaction Type" = PayLine."transaction type"::"Processing Fee" then begin
                            if PayLine."Account No" <> '' then begin
                                // if LoanType.Get(PayLine."Loan Product Type Code") then begin
                                LineNo := LineNo + 1000;
                                Gnljnline.Init;
                                Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
                                Gnljnline."Journal Batch Name" := CashierPayment.No;
                                Gnljnline."Line No." := LineNo;
                                Gnljnline."Account Type" := PayLine."Account Type";
                                Gnljnline."Account No." := PayLine."Account No";
                                Gnljnline.Validate(Gnljnline."Account No.");
                                Gnljnline."Document No." := CashierPayment.No;
                                Gnljnline."Posting Date" := CashierPayment."Payment Date";
                                Gnljnline.Description := PayLine.Description;
                                Gnljnline."Loan No" := PayLine."Loan No.";
                                Gnljnline."Transaction Type" := PayLine."transaction type"::"Processing Fee";
                                Gnljnline."Sacco Transaction Type" := PayLine.Type;
                                Gnljnline.Amount := PayLine.Amount;
                                Gnljnline.Validate(Gnljnline.Amount);
                                Gnljnline."Loan No" := PayLine."Loan No.";
                                Gnljnline."External Document No." := "Cheque No.";
                                Gnljnline."Currency Code" := CashierPayment."Currency Code";
                                Gnljnline.Validate("Currency Code");
                                /*ProdCharge.RESET;
                                ProdCharge.SETRANGE(ProdCharge."Product Code",PayLine."Loan Product Type Code");
                                IF ProdCharge.FIND('-')THEN
                                Gnljnline."Posting Group":=ProdCharge."Customer Posting Group";
                                Gnljnline.VALIDATE("Posting Group");*///Not Necessary
                                Gnljnline."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                                Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                Gnljnline."Shortcut Dimension 2 Code" := PayLine."Global Dimension 2 Code";
                                Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                if Gnljnline.Amount <> 0 then
                                    Gnljnline.Insert;
                            end;
                        end;


                        if (PayLine."Transaction Type" <> PayLine."transaction type"::Loan) and
                        (PayLine."Transaction Type" <> PayLine."transaction type"::"Processing Fee") then begin
                            LineNo := LineNo + 1000;
                            Gnljnline.Init;
                            Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
                            Gnljnline."Journal Batch Name" := CashierPayment.No;
                            Gnljnline."Line No." := LineNo;
                            Gnljnline."Account Type" := PayLine."Account Type";
                            Gnljnline."Account No." := PayLine."Account No";
                            Gnljnline.Validate(Gnljnline."Account No.");
                            Gnljnline."Document No." := No;
                            Gnljnline."Posting Date" := CashierPayment."Payment Date";
                            Gnljnline.Description := PayLine.Description;
                            Gnljnline."Transaction Type" := PayLine."Transaction Type";
                            Gnljnline."Sacco Transaction Type" := PayLine.Type;
                            Gnljnline.Amount := PayLine.Amount;
                            // LoanDisburse."Loan Disbursement Date" := CashierPayment."Payment Date";
                            Gnljnline.Validate(Gnljnline.Amount);
                            Gnljnline."Loan No" := PayLine."Loan No.";
                            Gnljnline."External Document No." := "Cheque No.";
                            Gnljnline."Currency Code" := CashierPayment."Currency Code";
                            Gnljnline.Validate("Currency Code");
                            Gnljnline."Posting Group" := PayLine."Posting Group";
                            Gnljnline.Validate(Gnljnline."Posting Group");
                            Gnljnline."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                            Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                            Gnljnline."Shortcut Dimension 2 Code" := PayLine."Global Dimension 2 Code";
                            Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                            if Gnljnline.Amount <> 0 then
                                Gnljnline.Insert;

                        end else if PayLine."Transaction Type" = PayLine."transaction type"::Loan then begin
                            PayLine.TestField("Transactions Code");
                            LineNo := LineNo + 1000;
                            Gnljnline.Init;
                            Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
                            Gnljnline."Journal Batch Name" := CashierPayment.No;
                            Gnljnline."Line No." := LineNo;
                            Gnljnline."Account Type" := PayLine."Account Type";
                            Gnljnline."Account No." := PayLine."Account No";
                            Gnljnline.Validate(Gnljnline."Account No.");
                            Gnljnline."Document No." := CashierPayment.No;
                            Gnljnline."Posting Date" := CashierPayment."Payment Date";
                            Gnljnline.Description := PayLine.Description + '-' + PayLine."Loan No.";
                            Gnljnline."Loan No" := PayLine."Loan No.";
                            Gnljnline."Transaction Type" := PayLine."transaction type"::Loan;
                            Gnljnline."Sacco Transaction Type" := PayLine.Type;
                            Gnljnline.Amount := PayLine.Amount;
                            Gnljnline.Validate(Gnljnline.Amount);
                            Gnljnline."Loan No" := PayLine."Loan No.";
                            Gnljnline."External Document No." := "Cheque No.";
                            Gnljnline."Currency Code" := CashierPayment."Currency Code";
                            Gnljnline.Validate("Currency Code");
                            // if LoanType.Get(PayLine."Loan Product Type Code") then
                            //     Gnljnline."Posting Group" := LoanType."Loan Posting Group";
                            Gnljnline.Validate("Posting Group");
                            Gnljnline."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                            Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                            Gnljnline."Shortcut Dimension 2 Code" := PayLine."Global Dimension 2 Code";
                            Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                            if Gnljnline.Amount <> 0 then
                                Gnljnline.Insert;

                            /*IF LoanType.GET(PayLine."Loan Product Type Code") THEN BEGIN
                               IF LoanType.Action = LoanType.Action::"Off Set Commitments" THEN BEGIN
                               END ELSE BEGIN
                                  IF LoanDisburse.GET(PayLine."Loan No.") THEN BEGIN
                                  LoanDisburse.CALCFIELDS("Top Up Amount");
                                     IF LoanDisburse."Top Up Amount" > 0 THEN BEGIN //Repaying the Topup Amount--Refinancing
                                      LoanTopUp.RESET;
                                      LoanTopUp.SETRANGE(LoanTopUp."Loan No.",PayLine."Loan No.");
                                          IF LoanTopUp.FIND('-') THEN BEGIN
                                          LineNo:=LineNo+10000;
                                          Gnljnline.INIT;
                                          Gnljnline."Journal Template Name":=BosaSetup."Payments Journal Template";
                                          Gnljnline."Journal Batch Name":=CashierPayment.No;
                                          Gnljnline."Line No.":=LineNo;
                                          Gnljnline."Account Type":=Gnljnline."Account Type"::Customer;
                                          Gnljnline."Account No.":=PayLine."Account No";
                                          Gnljnline.VALIDATE(Gnljnline."Account No.");
                                          Gnljnline."Document No.":=CashierPayment.No;
                                          Gnljnline."Posting Date":=CashierPayment."Payment Date";
                                          Gnljnline.Description:='Off Set By - ' +PayLine."Loan No.";
                                          Gnljnline.Amount:=LoanTopUp."Principle Top Up" * -1;
                                          Gnljnline."External Document No.":="Cheque No.";
                                          Gnljnline.VALIDATE(Gnljnline.Amount);
                                          Gnljnline."Transaction Type":=Gnljnline."Transaction Type"::"Loan Repayment";
                                          Gnljnline."Sacco Transaction Type":=PayLine.Type;
                                          Gnljnline."Loan No":=LoanTopUp."Loan Top Up";
                                          Gnljnline."Posting Group":=PayLine."Posting Group";
                                          Gnljnline.VALIDATE(Gnljnline."Posting Group");
                                          Gnljnline."Currency Code":=CashierPayment."Currency Code" ;
                                          Gnljnline.VALIDATE("Currency Code");
                                          Gnljnline."Bal. Account Type":=Gnljnline."Bal. Account Type"::"G/L Account";
                                          IF LoanType.GET(PayLine."Loan Product Type Code") THEN
                                          Gnljnline."Bal. Account No.":=LoanType."Loan Account";
                                          Gnljnline.VALIDATE(Gnljnline."Bal. Account No.");
                                          Gnljnline."Shortcut Dimension 1 Code":=PayLine."Global Dimension 1 Code";
                                          Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 1 Code");
                                          Gnljnline."Shortcut Dimension 2 Code":=PayLine."Global Dimension 2 Code";
                                          Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 2 Code");
                                          IF Gnljnline.Amount<>0 THEN
                                          Gnljnline.INSERT;

                                              //Interest (Paid if top up)
                                              LineNo:=LineNo+1000;
                                              Gnljnline.INIT;
                                              Gnljnline."Journal Template Name":=BosaSetup."Payments Journal Template";
                                              Gnljnline."Journal Batch Name":=CashierPayment.No;
                                              Gnljnline."Line No.":=LineNo;
                                              Gnljnline."Account Type":=Gnljnline."Bal. Account Type"::Customer;
                                              Gnljnline."Account No.":=PayLine."Account No";
                                              Gnljnline.VALIDATE(Gnljnline."Account No.");
                                              Gnljnline."Document No.":=CashierPayment.No;
                                              Gnljnline."Posting Date":=CashierPayment."Payment Date";
                                              Loans2.RESET;
                                              Loans2.SETRANGE(Loans2."Loan No.",LoanTopUp."Loan Top Up");
                                              IF Loans2.FIND('-') THEN
                                              Gnljnline.Description:=COPYSTR('Interest Due reversed on top up ' +  Loans2."Loan Product Type Name",1,50);
                                              Gnljnline.Amount:=LoanTopUp."Interest Top Up";
                                              Gnljnline."External Document No.":="Cheque No.";
                                              Gnljnline.VALIDATE(Gnljnline.Amount);
                                              Gnljnline."Bal. Account Type":=Gnljnline."Bal. Account Type"::"G/L Account";
                                              Gnljnline."Bal. Account No.":=LoanTypes."Accrued Interest Account";
                                              Gnljnline.VALIDATE(Gnljnline."Bal. Account No.");
                                              Gnljnline."Transaction Type":=Gnljnline."Transaction Type"::"Interest Paid";
                                              Gnljnline."Sacco Transaction Type":=Gnljnline."Sacco Transaction Type"::Repayment;
                                              Gnljnline."Loan No":=LoanTopUp."Loan Top Up";
                                              Gnljnline."Posting Group":=LoanType."Loan Customer Posting Group";
                                              Gnljnline.VALIDATE(Gnljnline."Posting Group");
                                              Gnljnline."Currency Code":=CashierPayment."Currency Code" ;
                                              Gnljnline.VALIDATE("Currency Code");
                                              Gnljnline."Shortcut Dimension 1 Code":=PayLine."Global Dimension 1 Code";
                                              Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 1 Code");
                                              Gnljnline."Shortcut Dimension 2 Code":=PayLine."Global Dimension 2 Code";
                                              Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 2 Code");
                                              IF Gnljnline.Amount<>0 THEN
                                              Gnljnline.INSERT;

                                                  //Commision
                                                    IF LoanType."Top Up Commision" > 0 THEN BEGIN
                                                    LineNo:=LineNo+1000;
                                                    Gnljnline.INIT;
                                                    Gnljnline."Journal Template Name":=BosaSetup."Payments Journal Template";
                                                    Gnljnline."Journal Batch Name":=CashierPayment.No;
                                                    Gnljnline."Line No.":=LineNo;
                                                    Gnljnline."Account Type":=Gnljnline."Bal. Account Type"::"G/L Account";
                                                    Gnljnline."Account No.":=LoanType."Top Up Commision Account";
                                                    Gnljnline.VALIDATE(Gnljnline."Account No.");
                                                    Gnljnline."Document No.":=CashierPayment.No;
                                                    Gnljnline."Posting Date":=CashierPayment."Payment Date";
                                                    Gnljnline.Description:='Commision on Loan Top Up';
                                                    Gnljnline."Sacco Transaction Type":=Gnljnline."Sacco Transaction Type"::Other;
                                                    TopUpComm:=(LoanTopUp."Principle Top Up") * (LoanType."Top Up Commision"/100);
                                                    Gnljnline.Amount:=TopUpComm*-1;
                                                    Gnljnline.VALIDATE(Amount);
                                                    Gnljnline."External Document No.":="Cheque No.";
                                                    Gnljnline."Currency Code":=CashierPayment."Currency Code" ;
                                                    Gnljnline.VALIDATE("Currency Code");
                                                    Gnljnline."Shortcut Dimension 1 Code":=PayLine."Global Dimension 1 Code";
                                                    Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 1 Code");
                                                    Gnljnline."Shortcut Dimension 2 Code":=PayLine."Global Dimension 2 Code";
                                                    Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 2 Code");
                                                    IF Gnljnline.Amount<>0 THEN
                                                    Gnljnline.INSERT;

                                                    Gnljnline.INIT;
                                                    Gnljnline."Journal Template Name":=BosaSetup."Payments Journal Template";
                                                    Gnljnline."Journal Batch Name":=CashierPayment.No;
                                                    Gnljnline."Line No.":=LineNo;
                                                    Gnljnline."Account Type":=Gnljnline."Bal. Account Type"::Customer;
                                                    Gnljnline."Account No.":=PayLine."Account No";
                                                    Gnljnline.VALIDATE(Gnljnline."Account No.");
                                                    Gnljnline."Document No.":=CashierPayment.No;
                                                    Gnljnline."Posting Date":=CashierPayment."Payment Date";
                                                    Gnljnline.Description:='Commision on Loan Top Up';
                                                    Gnljnline."Sacco Transaction Type":=Gnljnline."Sacco Transaction Type"::Other;
                                                    Gnljnline.Amount:=TopUpComm;
                                                    Gnljnline.VALIDATE(Amount);
                                                    Gnljnline."External Document No.":="Cheque No.";
                                                    Gnljnline."Currency Code":=CashierPayment."Currency Code" ;
                                                    Gnljnline.VALIDATE("Currency Code");
                                                    Gnljnline."Posting Group":=LoanType."Loan Posting Group";
                                                    Gnljnline.VALIDATE(Gnljnline."Posting Group");
                                                    Gnljnline."Shortcut Dimension 1 Code":=PayLine."Global Dimension 1 Code";
                                                    Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 1 Code");
                                                    Gnljnline."Shortcut Dimension 2 Code":=PayLine."Global Dimension 2 Code";
                                                    Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 2 Code");
                                                    IF Gnljnline.Amount<>0 THEN
                                                    Gnljnline.INSERT;
                                                    END;
                                          END;
                                     END;//Repaying the Topup Amount--Refinancing
                                  END;
                               END;
                            END; */

                            // if LoanDisburse.Get(PayLine."Loan No.") then begin
                            //     StartDate := LoanDisburse."Repayment Start Date";
                            //     if LoanDisburse."Repayment Method" <> LoanDisburse."repayment method"::"Straight Line" then begin
                            //         Rschedule.Reset;
                            //         Rschedule.SetCurrentkey(Rschedule."Instalment No", Rschedule."Repayment Code");
                            //         Rschedule.SetRange(Rschedule."Loan No.", PayLine."Loan No.");
                            //         Rschedule.SetRange(Rschedule."Fully Paid", false);
                            //         Rschedule.SetRange(Rschedule."Partially Paid", false);
                            //         Rschedule.SetRange(Rschedule."Repayment Date", StartDate);
                            //         if Rschedule.Find('-') then begin
                            //             //Pass interest due entry for the month
                            //             LineNo := LineNo + 1000;
                            //             Gnljnline.Init;
                            //             Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
                            //             Gnljnline."Journal Batch Name" := CashierPayment.No;
                            //             Gnljnline."Line No." := LineNo;
                            //             Gnljnline."Account Type" := Gnljnline."account type"::Customer;
                            //             Gnljnline."Account No." := PayLine."Account No";
                            //             Gnljnline.Validate(Gnljnline."Account No.");
                            //             Gnljnline."Transaction Type" := Gnljnline."transaction type"::"Interest Due";
                            //             Gnljnline."Sacco Transaction Type" := PayLine.Type;
                            //             Gnljnline."Document No." := CashierPayment.No;
                            //             Gnljnline."Posting Date" := CashierPayment."Payment Date";
                            //             Gnljnline.Description := 'Interest Due';
                            //             // Gnljnline.Amount := Rschedule."Monthly Interest";//("Approved Amount"*Interest)/1200;
                            //             Gnljnline.Validate(Gnljnline.Amount);
                            //             Gnljnline."Loan No" := PayLine."Loan No.";
                            //             Gnljnline."Bal. Account Type" := Gnljnline."bal. account type"::"G/L Account";
                            //             // if LoanType.Get(PayLine."Loan Product Type Code") then begin
                            //             Gnljnline."Bal. Account No." := LoanType."Received Interest Account";
                            //             Gnljnline.Validate(Gnljnline."Bal. Account No.");
                            //             // Gnljnline."Posting Group" := LoanType."Loan Posting Group";
                            //             Gnljnline.Validate("Posting Group");
                            //             // end;
                            //             Gnljnline."Currency Code" := CashierPayment."Currency Code";
                            //             Gnljnline.Validate("Currency Code");
                            //             Gnljnline."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                            //             Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                            //             Gnljnline."Shortcut Dimension 2 Code" := PayLine."Global Dimension 2 Code";
                            //             Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                            //             if Gnljnline.Amount <> 0 then
                            //                 Gnljnline.Insert;
                            //             // Rschedule."Accrued Interest Calculated" := true;
                            //             // Rschedule.Modify;
                            //         end;

                            //     end else if LoanDisburse."Repayment Method" = LoanDisburse."repayment method"::"Straight Line" then begin
                            //         Rschedule.Reset;
                            //         Rschedule.SetCurrentkey(Rschedule."Instalment No", Rschedule."Repayment Code");
                            //         Rschedule.SetRange(Rschedule."Loan No.", PayLine."Loan No.");
                            //         Rschedule.SetRange(Rschedule."Fully Paid", false);
                            //         Rschedule.SetRange(Rschedule."Partially Paid", false);
                            //         if Rschedule.Find('-') then begin
                            //             //Pass interest due entry for the whole period of the Loan -- Only Straight Line Loan
                            //             LineNo := LineNo + 1000;
                            //             Gnljnline.Init;
                            //             Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
                            //             Gnljnline."Journal Batch Name" := CashierPayment.No;
                            //             Gnljnline."Line No." := LineNo;
                            //             Gnljnline."Account Type" := Gnljnline."account type"::Customer;
                            //             Gnljnline."Account No." := PayLine."Account No";
                            //             Gnljnline.Validate(Gnljnline."Account No.");
                            //             Gnljnline."Transaction Type" := Gnljnline."transaction type"::"Interest Due";
                            //             Gnljnline."Sacco Transaction Type" := PayLine.Type;
                            //             Gnljnline."Document No." := CashierPayment.No;
                            //             Gnljnline."Posting Date" := CashierPayment."Payment Date";
                            //             Gnljnline.Description := 'Interest Due';
                            //             Gnljnline.Amount := (Rschedule."Monthly Interest" * LoanDisburse.Installments);
                            //             Gnljnline.Validate(Gnljnline.Amount);
                            //             Gnljnline."Loan No" := PayLine."Loan No.";
                            //             Gnljnline."Bal. Account Type" := Gnljnline."bal. account type"::"G/L Account";
                            //             if LoanType.Get(PayLine."Loan Product Type Code") then begin
                            //                 Gnljnline."Bal. Account No." := LoanType."Received Interest Account";
                            //                 Gnljnline.Validate(Gnljnline."Bal. Account No.");
                            //                 Gnljnline."Posting Group" := LoanType."Loan Posting Group";
                            //                 Gnljnline.Validate("Posting Group");
                            //             end;
                            //             Gnljnline."Currency Code" := CashierPayment."Currency Code";
                            //             Gnljnline.Validate("Currency Code");
                            //             Gnljnline."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                            //             Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                            //             Gnljnline."Shortcut Dimension 2 Code" := PayLine."Global Dimension 2 Code";
                            //             Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                            //             if Gnljnline.Amount <> 0 then
                            //                 Gnljnline.Insert;

                            //             repeat //Update all the Accrued int Cal to True only on Straight Line
                            //                    // Rschedule."Accrued Interest Calculated" := true;
                            //                    // Rschedule.Modify;
                            //             until Rschedule.Next = 0;
                            //         end;
                            //     end;

                            //     //*****Part Disbursement
                            //     if LoanType.Get(PayLine."Loan Product Type Code") then
                            //         if PayLine.Type = PayLine.Type::Loan then begin
                            //             if PayLine."Transactions Code" = LoanType."Transaction Code for Part Dis" then begin
                            //                 LoanType.TestField("Account for Part Disbursement");

                            //                 LineNo := LineNo + 1000;
                            //                 Gnljnline.Init;
                            //                 Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
                            //                 Gnljnline."Journal Batch Name" := CashierPayment.No;
                            //                 Gnljnline."Line No." := LineNo;
                            //                 Gnljnline."Account Type" := Gnljnline."account type"::Customer;
                            //                 Gnljnline."Account No." := PayLine."Account No";
                            //                 Gnljnline.Validate(Gnljnline."Account No.");
                            //                 Gnljnline."Transaction Type" := Gnljnline."transaction type"::Loan;
                            //                 Gnljnline."Sacco Transaction Type" := PayLine.Type;
                            //                 Gnljnline."Document No." := CashierPayment.No;
                            //                 Gnljnline."Posting Date" := CashierPayment."Payment Date";
                            //                 Gnljnline.Description := 'Part Disbursement';
                            //                 Gnljnline.Amount := (LoanDisburse."Approved Amount" - PayLine.Amount);
                            //                 Gnljnline.Validate(Gnljnline.Amount);
                            //                 Gnljnline."Loan No" := PayLine."Loan No.";
                            //                 Gnljnline."Bal. Account Type" := Gnljnline."bal. account type"::"G/L Account";
                            //                 Gnljnline."Bal. Account No." := LoanType."Account for Part Disbursement";
                            //                 Gnljnline.Validate(Gnljnline."Bal. Account No.");
                            //                 Gnljnline."Posting Group" := LoanType."Loan Posting Group";
                            //                 Gnljnline.Validate("Posting Group");
                            //                 Gnljnline."Currency Code" := CashierPayment."Currency Code";
                            //                 Gnljnline.Validate("Currency Code");
                            //                 Gnljnline."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                            //                 Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                            //                 Gnljnline."Shortcut Dimension 2 Code" := PayLine."Global Dimension 2 Code";
                            //                 Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                            //                 if Gnljnline.Amount <> 0 then
                            //                     Gnljnline.Insert;
                            //             end;
                            //         end;
                            // end;

                        end;//--End of First Begin

                        //Post VAT
                        if BosaSetup."Post VAT" then begin
                            if PayLine."VAT Code" <> '' then begin
                                PayLine.Validate(PayLine.Amount);
                                Gnljnline."Line No." := 10000 + PayLine."Line No";
                                Gnljnline.Init;
                                if BosaSetup.Get then
                                    Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
                                Gnljnline."Journal Batch Name" := CashierPayment.No;
                                Gnljnline."Line No." := 10000 + PayLine."Line No";
                                Gnljnline."Account Type" := PayLine."Account Type";
                                Gnljnline."Account No." := PayLine."Account No";
                                Gnljnline.Validate(Gnljnline."Account No.");
                                Gnljnline."Posting Date" := CashierPayment."Posted Date";
                                Gnljnline."Document No." := CashierPayment.No;
                                Gnljnline."External Document No." := CashierPayment."Cheque No";
                                Gnljnline.Description := PayLine.Description;
                                Gnljnline.Amount := PayLine."VAT Amount";
                                Gnljnline.Validate(Gnljnline.Amount);
                                //Set these fields to blanks
                                Gnljnline."Gen. Posting Type" := Gnljnline."gen. posting type"::" ";
                                Gnljnline.Validate("Gen. Posting Type");
                                Gnljnline."Gen. Bus. Posting Group" := '';
                                Gnljnline.Validate("Gen. Bus. Posting Group");
                                Gnljnline."Gen. Prod. Posting Group" := '';
                                Gnljnline.Validate("Gen. Prod. Posting Group");
                                Gnljnline."VAT Bus. Posting Group" := '';
                                Gnljnline.Validate("VAT Bus. Posting Group");
                                Gnljnline."VAT Prod. Posting Group" := '';
                                Gnljnline.Validate("VAT Prod. Posting Group");
                                if CashierPayment."Payment Mode" = 'CHEQUE' then
                                    //Gnljnline."Pay Mode":=CashierPayment."Payment Mode";
                                    Gnljnline."Applies-to Doc. No." := CashierPayment."Applies- To Doc No.";
                                Gnljnline.Validate(Gnljnline."Applies-to Doc. Type");
                                Gnljnline."Currency Code" := CashierPayment."Currency Code";
                                Gnljnline.Validate("Currency Code");
                                Gnljnline."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                                Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                Gnljnline."Shortcut Dimension 2 Code" := PayLine."Global Dimension 2 Code";
                                Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                if Gnljnline.Amount <> 0 then
                                    Gnljnline.Insert;

                                Gnljnline."Line No." := 10000 + PayLine."Line No";
                                Gnljnline.Init;
                                if BosaSetup.Get then
                                    Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
                                Gnljnline."Journal Batch Name" := CashierPayment.No;
                                Gnljnline."Line No." := PayLine."Line No";
                                Gnljnline."Account Type" := Gnljnline."account type"::"G/L Account";
                                case PayLine."Account Type" of
                                    PayLine."account type"::"G/L Account":
                                        begin
                                            GLAccount.Get(PayLine."Account No");
                                            GLAccount.TestField("VAT Bus. Posting Group");
                                            if VATSetup.Get(GLAccount."VAT Bus. Posting Group", PayLine."VAT Code") then
                                                Gnljnline."Account No." := VATSetup."Purchase VAT Account";
                                            Gnljnline.Validate(Gnljnline."Account No.");
                                        end;
                                    PayLine."account type"::Vendor:
                                        begin
                                            Vendor.Get(PayLine."Account No");
                                            Vendor.TestField("VAT Bus. Posting Group");
                                            if VATSetup.Get(Vendor."VAT Bus. Posting Group", PayLine."VAT Code") then
                                                Gnljnline."Account No." := VATSetup."Purchase VAT Account";
                                            Gnljnline.Validate(Gnljnline."Account No.");
                                        end;
                                    PayLine."account type"::Customer:
                                        begin
                                            Customer.Get(PayLine."Account No");
                                            Customer.TestField("VAT Bus. Posting Group");
                                            if VATSetup.Get(Customer."VAT Bus. Posting Group", PayLine."VAT Code") then
                                                Gnljnline."Account No." := VATSetup."Purchase VAT Account";
                                            Gnljnline.Validate(Gnljnline."Account No.");
                                        end;
                                end;

                                Gnljnline."Posting Date" := CashierPayment."Posted Date";
                                Gnljnline."Document No." := CashierPayment.No;
                                Gnljnline."External Document No." := CashierPayment."Cheque No";
                                Gnljnline.Description := PayLine.Description;
                                Gnljnline.Amount := -PayLine."VAT Amount";
                                Gnljnline.Validate(Gnljnline.Amount);
                                //Set these fields to blanks
                                Gnljnline."Gen. Posting Type" := Gnljnline."gen. posting type"::" ";
                                Gnljnline.Validate("Gen. Posting Type");
                                Gnljnline."Gen. Bus. Posting Group" := '';
                                Gnljnline.Validate("Gen. Bus. Posting Group");
                                Gnljnline."Gen. Prod. Posting Group" := '';
                                Gnljnline.Validate("Gen. Prod. Posting Group");
                                Gnljnline."VAT Bus. Posting Group" := '';
                                Gnljnline.Validate("VAT Bus. Posting Group");
                                Gnljnline."VAT Prod. Posting Group" := '';
                                Gnljnline.Validate("VAT Prod. Posting Group");
                                Gnljnline."Currency Code" := CashierPayment."Currency Code";
                                Gnljnline.Validate("Currency Code");

                                //
                                if CashierPayment."Payment Mode" = 'CHEQUE' then
                                    //Gnljnline."Pay Mode":=PV."Pay Mode";
                                    Gnljnline."Applies-to Doc. No." := CashierPayment."Applies- To Doc No.";
                                Gnljnline.Validate(Gnljnline."Applies-to Doc. No.");
                                Gnljnline."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                                Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                                Gnljnline."Shortcut Dimension 2 Code" := PayLine."Global Dimension 2 Code";
                                Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                                if Gnljnline.Amount <> 0 then
                                    Gnljnline.Insert;
                            end;
                            //End of Posting VAT
                        end;

                        //Post Withholding Tax
                        if PayLine."W/Tax Code" <> '' then begin
                            PayLine.Validate(PayLine.Amount);
                            PayLine."Line No" := PayLine."Line No" + 10000;
                            Gnljnline.Init;
                            if BosaSetup.Get then
                                Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
                            Gnljnline."Journal Batch Name" := CashierPayment.No;
                            Gnljnline."Line No." := PayLine."Line No";
                            Gnljnline."Account Type" := PayLine."Account Type";
                            Gnljnline."Account No." := PayLine."Account No";
                            Gnljnline.Validate(Gnljnline."Account No.");
                            Gnljnline."Posting Date" := CashierPayment."Posted Date";
                            Gnljnline."Document No." := PayLine.No;
                            Gnljnline."External Document No." := CashierPayment."Cheque No.";
                            Gnljnline.Description := PayLine.Description;
                            Gnljnline.Amount := PayLine."W/Tax Amount";
                            Gnljnline.Validate(Gnljnline.Amount);
                            //Set these fields to blanks
                            Gnljnline."Gen. Posting Type" := Gnljnline."gen. posting type"::" ";
                            Gnljnline.Validate("Gen. Posting Type");
                            Gnljnline."Gen. Bus. Posting Group" := '';
                            Gnljnline.Validate("Gen. Bus. Posting Group");
                            Gnljnline."Gen. Prod. Posting Group" := '';
                            Gnljnline.Validate("Gen. Prod. Posting Group");
                            Gnljnline."VAT Bus. Posting Group" := '';
                            Gnljnline.Validate("VAT Bus. Posting Group");
                            Gnljnline."VAT Prod. Posting Group" := '';
                            Gnljnline.Validate("VAT Prod. Posting Group");
                            //
                            if CashierPayment."Payment Mode" = 'CHEQUE' then
                                //GenJnLine."Pay Mode":=PV."Pay Mode";
                                Gnljnline."Applies-to Doc. No." := CashierPayment."Applies- To Doc No.";
                            Gnljnline."Currency Code" := CashierPayment."Currency Code";
                            Gnljnline.Validate("Currency Code");
                            Gnljnline.Validate(Gnljnline."Applies-to Doc. No.");
                            Gnljnline."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                            Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                            Gnljnline."Shortcut Dimension 2 Code" := PayLine."Global Dimension 2 Code";
                            Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                            if Gnljnline.Amount <> 0 then
                                Gnljnline.Insert;

                            PayLine."Line No" := PayLine."Line No" + 10000;
                            Gnljnline.Init;
                            if BosaSetup.Get then
                                Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
                            Gnljnline."Journal Batch Name" := CashierPayment.No;
                            Gnljnline."Line No." := PayLine."Line No";
                            Gnljnline."Account Type" := Gnljnline."account type"::"G/L Account";
                            case PayLine."Account Type" of
                                PayLine."account type"::"G/L Account":
                                    begin
                                        GLAccount.Get(PayLine."Account No");
                                        GLAccount.TestField("VAT Bus. Posting Group");
                                        if VATSetup.Get(GLAccount."VAT Bus. Posting Group", PayLine."W/Tax Code") then
                                            Gnljnline."Account No." := VATSetup."Purchase VAT Account";
                                        Gnljnline.Validate(Gnljnline."Account No.");
                                    end;
                                PayLine."account type"::Vendor:
                                    begin
                                        Vendor.Get(PayLine."Account No");
                                        Vendor.TestField("VAT Bus. Posting Group");
                                        if VATSetup.Get(Vendor."VAT Bus. Posting Group", PayLine."W/Tax Code") then
                                            Gnljnline."Account No." := VATSetup."Purchase VAT Account";
                                        Gnljnline.Validate(Gnljnline."Account No.");
                                    end;
                                PayLine."account type"::Customer:
                                    begin
                                        Customer.Get(PayLine."Account No");
                                        Customer.TestField("VAT Bus. Posting Group");
                                        if VATSetup.Get(Customer."VAT Bus. Posting Group", PayLine."W/Tax Code") then
                                            Gnljnline."Account No." := VATSetup."Purchase VAT Account";
                                        Gnljnline.Validate(Gnljnline."Account No.");
                                    end;
                            end;
                            //IF PV.Date=0D THEN
                            //ERROR('You must specify the PV date');
                            Gnljnline."Posting Date" := CashierPayment."Posted Date";
                            Gnljnline."Document No." := CashierPayment.No;
                            Gnljnline."External Document No." := CashierPayment."Cheque No.";
                            Gnljnline.Description := PayLine.Description;
                            Gnljnline.Amount := -PayLine."W/Tax Amount";
                            Gnljnline.Validate(Gnljnline.Amount);
                            //Set these fields to blanks
                            Gnljnline."Gen. Posting Type" := Gnljnline."gen. posting type"::" ";
                            Gnljnline.Validate("Gen. Posting Type");
                            Gnljnline."Gen. Bus. Posting Group" := '';
                            Gnljnline.Validate("Gen. Bus. Posting Group");
                            Gnljnline."Gen. Prod. Posting Group" := '';
                            Gnljnline.Validate("Gen. Prod. Posting Group");
                            Gnljnline."VAT Bus. Posting Group" := '';
                            Gnljnline.Validate("VAT Bus. Posting Group");
                            Gnljnline."VAT Prod. Posting Group" := '';
                            Gnljnline.Validate("VAT Prod. Posting Group");
                            //
                            if CashierPayment."Payment Mode" = 'CHEQUE' then
                                Gnljnline."Pay Mode" := CashierPayment."Payment Mode";
                            Gnljnline."Applies-to Doc. No." := CashierPayment."Applies- To Doc No.";
                            Gnljnline."Currency Code" := CashierPayment."Currency Code";
                            Gnljnline.Validate("Currency Code");
                            Gnljnline.Validate(Gnljnline."Applies-to Doc. No.");
                            Gnljnline."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                            Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
                            Gnljnline."Shortcut Dimension 2 Code" := PayLine."Global Dimension 2 Code";
                            Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
                            if Gnljnline.Amount <> 0 then
                                Gnljnline.Insert;
                        end;
                    //End of Posting Withholding Tax
                    ////
                    until PayLine.Next = 0
                end;
                CashierPayment.CalcFields(CashierPayment.Amount);
                Gnljnline.Init;
                Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";//GenBatches."Journal Template Name";
                Gnljnline."Journal Batch Name" := CashierPayment.No;//GenBatches.Name;
                Gnljnline."Line No." := 10000 + Gnljnline."Line No.";
                Gnljnline."Posting Date" := CashierPayment."Payment Date";
                Gnljnline."Document No." := CashierPayment.No;
                Gnljnline."Account Type" := CashierPayment."account type"::"Bank Account";
                Gnljnline."Account No." := CashierPayment."Bank Account";
                Gnljnline.Description := CashierPayment."Payment To" + ' ' + CashierPayment.Remarks;
                Gnljnline."External Document No." := "Cheque No.";
                Gnljnline.Amount := -CashierPayment.Amount;
                Gnljnline."Shortcut Dimension 1 Code" := CashierPayment."Activity Code";
                Gnljnline.Description := CashierPayment.Remarks;// GenBatches."Total Amount"
                Gnljnline."Currency Code" := CashierPayment."Currency Code";
                Gnljnline.Validate("Currency Code");

                if Gnljnline.Amount <> 0 then
                    Gnljnline.Insert;
            end;


        end;


        //Post Transaction
        if Confirm('Are you sure you want to post') = true then begin
            Gnljnline.Reset;
            Gnljnline.SetRange(Gnljnline."Journal Template Name", BosaSetup."Payments Journal Template");
            Gnljnline.SetRange(Gnljnline."Journal Batch Name", CashierPayment.No);
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", Gnljnline);
            CashierPayment.Posted := true;
            CashierPayment."Posted By" := UserId;
            CashierPayment."Posted Date" := Today;
            CashierPayment."Time Posted" := Time;
            CashierPayment.Modify;

            //Updating the Loans Card
            // LoanDisburse.Reset;
            // LoanDisburse.SetRange(LoanDisburse."Loan No.", PayLine."Loan No.");
            // if LoanDisburse.Find('-') then begin
            //     LoanDisburse."Mode of Disbursement" := CashierPayment."Payment Mode";
            //     LoanDisburse."Loan Disbursement Date" := CashierPayment."Payment Date";
            //     LoanDisburse."User Id" := CashierPayment.Cashier;

            //     //Update Fully Disbursed
            //     PayLine.Reset;
            //     PayLine.SetRange(PayLine.No, CashierPayment.No);
            //     if PayLine.Find('-') then begin
            //         repeat
            //             // if LoanType.Get(PayLine."Loan Product Type Code") then
            //             //     if PayLine.Type = PayLine.Type::Loan then
            //             //         if PayLine."Transactions Code" = LoanType."Transaction Code for Part Dis" then
            //             //             LoanDisburse."Fully Disbursed" := false
            //             //         else
            //             //             LoanDisburse."Fully Disbursed" := true;
            //         until PayLine.Next = 0;
            //     end;
            //     //Update Fully Disbursed**

            //     // LoanDisburse.Posted := true;
            //     // LoanDisburse.Modify;

            //     //Top Up
            //     // LoanDisburse.CalcFields("Top Up Amount");
            //     // if LoanDisburse."Top Up Amount" > 0 then begin
            //     //     LoanTopUp.Reset;
            //     //     LoanTopUp.SetRange(LoanTopUp."Loan No.", LoanDisburse."Loan No.");
            //     //     if LoanTopUp.Find('-') then begin
            //         LoanToped := LoanTopUp."Loan Top Up";

            //         Loans2.Reset;
            //         Loans2.SetRange(Loans2."Loan No.", LoanToped);
            //         if Loans2.Find('-') then begin
            //             Loans2."Fully Paid" := true;
            //             Loans2.Modify;
            //         end;
            //     end;
            // end;
        end;

        // end else
        //     exit;

    end;


    procedure "Post Payment Voucher"(PV: Record "Payments HeaderFin")
    var
        PVLines: Record "PV Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TarriffCodes: Record "Petty Cash Lines";
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
    begin
        if Confirm('Are u sure u want to post the Payment Voucher No. ' + PV."No." + ' ?') = true then begin
            /*IF PV.Status<>PV.Status::Released THEN
             ERROR('The Payment Voucher No %1 has not been fully approved',PV."No.");*/
            if PV.Posted then
                Error('Payment Voucher %1 has been posted', PV."No.");
            PV.TestField(Date);
            PV.TestField("Paying Bank Account");
            PV.TestField(PV.Payee);
            PV.TestField(PV."Pay Mode");
            if PV."Pay Mode" = 'CHEQUE' then begin
                PV.TestField(PV."Cheque No");
                PV.TestField(PV."Cheque Date");
            end;

            //Check Lines
            PV.CalcFields("Total Amount");
            if PV."Total Amount" = 0 then
                Error('Amount is cannot be zero');
            PVLines.Reset;
            PVLines.SetRange(PVLines."PV No", PV."No.");
            if not PVLines.FindLast then
                Error('Payment voucher Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Payment Voucher Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", PV."No.");
            GenJnLine.DeleteAll;

            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Payment Voucher Template";
            Batch.Name := PV."No.";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            //Bank Entries
            LineNo := LineNo + 10000;
            PV.CalcFields(PV."Total Amount");
            PVLines.Reset;
            PVLines.SetRange(PVLines."PV No", PV."No.");
            PVLines.Validate(PVLines.Amount);
            PVLines.CalcSums(PVLines.Amount);
            PVLines.CalcSums(PVLines."W/Tax Amount");
            PVLines.CalcSums(PVLines."VAT Amount");
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Payment Voucher Template";
            GenJnLine."Journal Batch Name" := PV."No.";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := PV."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if PV.Date = 0D then
                Error('You must specify the PV date');
            GenJnLine."Posting Date" := PV.Date;
            GenJnLine."Document No." := PV."No.";
            GenJnLine."External Document No." := PV."Cheque No";
            GenJnLine.Description := PV.Payee;
            GenJnLine.Amount := -PV."Total Amount";
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Pay Mode" := PV."Pay Mode";
            if PV."Pay Mode" = 'CHEQUE' then
                GenJnLine."Cheque Date" := PV."Cheque Date";
            GenJnLine."Shortcut Dimension 1 Code" := PV."Global Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PV."Global Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //PV Lines Entries
            PVLines.Reset;
            PVLines.SetRange(PVLines."PV No", PV."No.");
            if PVLines.FindFirst then begin
                repeat
                    PVLines.Validate(PVLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Payment Voucher Template";
                    GenJnLine."Journal Batch Name" := PV."No.";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV.Date = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV.Date;
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine.Description := PVLines.Description;
                    GenJnLine."Cheque Date" := PV."Cheque Date";
                    GenJnLine.Amount := PVLines."Net Amount";
                    GenJnLine.Validate(GenJnLine.Amount);
                    if PV."Pay Mode" = 'CHEQUE' then
                        GenJnLine."Pay Mode" := PV."Pay Mode";
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                    GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                    GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //Post VAT
                    if CMSetup."Post VAT" then begin
                        if PVLines."VAT Code" <> '' then begin
                            PVLines.Validate(PVLines.Amount);
                            LineNo := LineNo + 10000;
                            GenJnLine.Init;
                            if CMSetup.Get then
                                GenJnLine."Journal Template Name" := CMSetup."Payment Voucher Template";
                            GenJnLine."Journal Batch Name" := PV."No.";
                            GenJnLine."Line No." := LineNo;
                            GenJnLine."Account Type" := PVLines."Account Type";
                            GenJnLine."Account No." := PVLines."Account No";
                            GenJnLine.Validate(GenJnLine."Account No.");
                            if PV.Date = 0D then
                                Error('You must specify the PV date');
                            GenJnLine."Posting Date" := PV.Date;
                            GenJnLine."Document No." := PV."No.";
                            GenJnLine."External Document No." := PV."Cheque No";
                            GenJnLine.Description := PVLines.Description;
                            GenJnLine.Amount := PVLines."VAT Amount";
                            GenJnLine.Validate(GenJnLine.Amount);
                            //Set these fields to blanks
                            GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                            GenJnLine.Validate("Gen. Posting Type");
                            GenJnLine."Gen. Bus. Posting Group" := '';
                            GenJnLine.Validate("Gen. Bus. Posting Group");
                            GenJnLine."Gen. Prod. Posting Group" := '';
                            GenJnLine.Validate("Gen. Prod. Posting Group");
                            GenJnLine."VAT Bus. Posting Group" := '';
                            GenJnLine.Validate("VAT Bus. Posting Group");
                            GenJnLine."VAT Prod. Posting Group" := '';
                            GenJnLine.Validate("VAT Prod. Posting Group");
                            //
                            if PV."Pay Mode" = 'CHEQUE' then
                                GenJnLine."Pay Mode" := PV."Pay Mode";
                            GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                            GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                            //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                            //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                            //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                            if GenJnLine.Amount <> 0 then
                                GenJnLine.Insert;

                            LineNo := LineNo + 10000;
                            GenJnLine.Init;
                            if CMSetup.Get then
                                GenJnLine."Journal Template Name" := CMSetup."Payment Voucher Template";
                            GenJnLine."Journal Batch Name" := PV."No.";
                            GenJnLine."Line No." := LineNo;
                            GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
                            case PVLines."Account Type" of
                                PVLines."account type"::"G/L Account":
                                    begin
                                        GLAccount.Get(PVLines."Account No");
                                        GLAccount.TestField("VAT Bus. Posting Group");
                                        if VATSetup.Get(GLAccount."VAT Bus. Posting Group", PVLines."VAT Code") then
                                            GenJnLine."Account No." := VATSetup."Purchase VAT Account";
                                        GenJnLine.Validate(GenJnLine."Account No.");
                                    end;
                                PVLines."account type"::Vendor:
                                    begin
                                        Vendor.Get(PVLines."Account No");
                                        Vendor.TestField("VAT Bus. Posting Group");
                                        if VATSetup.Get(Vendor."VAT Bus. Posting Group", PVLines."VAT Code") then
                                            GenJnLine."Account No." := VATSetup."Purchase VAT Account";
                                        GenJnLine.Validate(GenJnLine."Account No.");
                                    end;
                                PVLines."account type"::Customer:
                                    begin
                                        Customer.Get(PVLines."Account No");
                                        Customer.TestField("VAT Bus. Posting Group");
                                        if VATSetup.Get(Customer."VAT Bus. Posting Group", PVLines."VAT Code") then
                                            GenJnLine."Account No." := VATSetup."Purchase VAT Account";
                                        GenJnLine.Validate(GenJnLine."Account No.");
                                    end;
                            end;
                            if PV.Date = 0D then
                                Error('You must specify the PV date');
                            GenJnLine."Posting Date" := PV.Date;
                            GenJnLine."Document No." := PV."No.";
                            GenJnLine."External Document No." := PV."Cheque No";
                            GenJnLine.Description := PVLines.Description;
                            GenJnLine.Amount := -PVLines."VAT Amount";
                            GenJnLine.Validate(GenJnLine.Amount);
                            //Set these fields to blanks
                            GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                            GenJnLine.Validate("Gen. Posting Type");
                            GenJnLine."Gen. Bus. Posting Group" := '';
                            GenJnLine.Validate("Gen. Bus. Posting Group");
                            GenJnLine."Gen. Prod. Posting Group" := '';
                            GenJnLine.Validate("Gen. Prod. Posting Group");
                            GenJnLine."VAT Bus. Posting Group" := '';
                            GenJnLine.Validate("VAT Bus. Posting Group");
                            GenJnLine."VAT Prod. Posting Group" := '';
                            GenJnLine.Validate("VAT Prod. Posting Group");
                            //
                            if PV."Pay Mode" = 'CHEQUE' then
                                GenJnLine."Pay Mode" := PV."Pay Mode";
                            GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                            GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 1 Code";
                            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                            //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                            //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                            //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                            if GenJnLine.Amount <> 0 then
                                GenJnLine.Insert;

                        end;
                        //End of Posting VAT
                    end;
                    //Post Withholding Tax
                    if PVLines."W/Tax Code" <> '' then begin
                        PVLines.Validate(PVLines.Amount);
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."Payment Voucher Template";
                        GenJnLine."Journal Batch Name" := PV."No.";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV.Date = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV.Date;
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine.Description := PVLines.Description;
                        GenJnLine.Amount := PVLines."W/Tax Amount";
                        GenJnLine.Validate(GenJnLine.Amount);
                        //Set these fields to blanks
                        GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                        GenJnLine.Validate("Gen. Posting Type");
                        GenJnLine."Gen. Bus. Posting Group" := '';
                        GenJnLine.Validate("Gen. Bus. Posting Group");
                        GenJnLine."Gen. Prod. Posting Group" := '';
                        GenJnLine.Validate("Gen. Prod. Posting Group");
                        GenJnLine."VAT Bus. Posting Group" := '';
                        GenJnLine.Validate("VAT Bus. Posting Group");
                        GenJnLine."VAT Prod. Posting Group" := '';
                        GenJnLine.Validate("VAT Prod. Posting Group");
                        //
                        if PV."Pay Mode" = 'CHEQUE' then
                            GenJnLine."Pay Mode" := PV."Pay Mode";
                        GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;

                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."Payment Voucher Template";
                        GenJnLine."Journal Batch Name" := PV."No.";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
                        case PVLines."Account Type" of
                            PVLines."account type"::"G/L Account":
                                begin
                                    GLAccount.Get(PVLines."Account No");
                                    GLAccount.TestField("VAT Bus. Posting Group");
                                    if VATSetup.Get(GLAccount."VAT Bus. Posting Group", PVLines."W/Tax Code") then
                                        GenJnLine."Account No." := VATSetup."Purchase VAT Account";
                                    GenJnLine.Validate(GenJnLine."Account No.");
                                end;
                            PVLines."account type"::Vendor:
                                begin
                                    Vendor.Get(PVLines."Account No");
                                    Vendor.TestField("VAT Bus. Posting Group");
                                    if VATSetup.Get(Vendor."VAT Bus. Posting Group", PVLines."W/Tax Code") then
                                        GenJnLine."Account No." := VATSetup."Purchase VAT Account";
                                    GenJnLine.Validate(GenJnLine."Account No.");
                                end;
                            PVLines."account type"::Customer:
                                begin
                                    Customer.Get(PVLines."Account No");
                                    Customer.TestField("VAT Bus. Posting Group");
                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", PVLines."W/Tax Code") then
                                        GenJnLine."Account No." := VATSetup."Purchase VAT Account";
                                    GenJnLine.Validate(GenJnLine."Account No.");
                                end;
                        end;
                        if PV.Date = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV.Date;
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine.Description := PVLines.Description;
                        GenJnLine.Amount := -PVLines."W/Tax Amount";
                        GenJnLine.Validate(GenJnLine.Amount);
                        //Set these fields to blanks
                        GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                        GenJnLine.Validate("Gen. Posting Type");
                        GenJnLine."Gen. Bus. Posting Group" := '';
                        GenJnLine.Validate("Gen. Bus. Posting Group");
                        GenJnLine."Gen. Prod. Posting Group" := '';
                        GenJnLine.Validate("Gen. Prod. Posting Group");
                        GenJnLine."VAT Bus. Posting Group" := '';
                        GenJnLine.Validate("VAT Bus. Posting Group");
                        GenJnLine."VAT Prod. Posting Group" := '';
                        GenJnLine.Validate("VAT Prod. Posting Group");
                        //
                        if PV."Pay Mode" = 'CHEQUE' then
                            GenJnLine."Pay Mode" := PV."Pay Mode";
                        GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                        //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                        //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                        //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end;
                //End of Posting Withholding Tax

                until PVLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", PV."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                PV.Posted := true;
                PV."Posted By" := UserId;
                PV."Posted Date" := Today;
                PV."Time Posted" := Time;
                PV.Modify;
                //Create Imprest Surrender in the event the document originated from an imprest.
                if PV."Original Document" = PV."original document"::Imprest then begin
                    PV."Payment Type" := PV."payment type"::"Imprest Surrender";
                    PV.Status := PV.Status::Open;
                    PV.Modify;
                end;
            end;
        end;

    end;


    procedure "Post Imprest"(var Imprest: Record "Payments HeaderFin")
    var
        ImprestLines: Record "Payments HeaderFin";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
    begin

        if Confirm('Are you sure you want to post Imprest No ' + Imprest."No." + '?', false) = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error('The Imprest No ' + Imprest."No." + ' has not been fully approved');


            Imprest.TestField("Account No.");
            Imprest.TestField("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Pay Mode");
            if Imprest."Pay Mode" = 'CHEQUE' then begin
                Imprest.TestField("Cheque No");
                Imprest.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.SetRange(ImprestLines."No.", Imprest."No.");
            if not ImprestLines.FindLast then
                Error('The Imprest Lines are empty');

            Imprest.CalcFields("Imprest Amount");
            if Imprest."Imprest Amount" = 0 then
                Error('Amount cannot be zero');

            if Imprest.Posted then
                Error('Imprest %1 has been posted', Imprest."No.");

            CMSetup.Get();
            CMSetup.TestField("Imprest Due Date");
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", Imprest."No.");
            GenJnLine.DeleteAll;

            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Imprest Template";
            Batch.Name := Imprest."No.";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Template";
            GenJnLine."Journal Batch Name" := Imprest."No.";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := Imprest."Paying Bank Account";
            GenJnLine."Posting Date" := Imprest.Date;
            GenJnLine."Document No." := Imprest."No.";
            GenJnLine."External Document No." := Imprest."Cheque No";
            GenJnLine.Description := Imprest.Payee;
            GenJnLine.Amount := -Imprest."Imprest Amount";
            GenJnLine.Validate(Amount);
            GenJnLine."Shortcut Dimension 1 Code" := Imprest."Global Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Imprest."Global Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::Customer;
            GenJnLine."Bal. Account No." := Imprest."Account No.";
            GenJnLine.Validate("Bal. Account No.");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", Imprest."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            GLEntry.SetRange("Posting Date", Imprest.Date);
            if GLEntry.FindFirst then begin
                Imprest.Posted := true;
                Imprest."Posted By" := UserId;
                Imprest."Posted Date" := Today;
                Imprest."Time Posted" := Time;
                Imprest.Status := Imprest.Status::Open;
                Imprest."Payment Type" := Imprest."payment type"::"Imprest Surrender";
                //Update the Imprest Deadline
                Imprest."Imprest Deadline" := CalcDate(CMSetup."Imprest Due Date", Today);
                Imprest.Modify;
            end;

        end;
    end;


    procedure "Post ImprestSurrender"(var ImprestSurrender: Record "Payments HeaderFin")
    var
        ImprestLines: Record "Imprest Lines";
        LineNo: Integer;
        GenJnLine: Record "Gen. Journal Line";
        GLEntry: Record "G/L Entry";
        ReceiptHeader: Record "Receipts HeaderFin";
        ReceiptLine: Record "Receipt LinesFin";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLSetup: Record "General Ledger Setup";
        Window: Dialog;
        Selection: Integer;
    begin

        if Confirm('Are u sure u want to post Imprest Surrender No. ' + ImprestSurrender."No." + '?', false) = true then begin
            //Check if amount surrendered is less than amount advanced
            ImprestSurrender.CalcFields("Remaining Amount");
            if ImprestSurrender."Remaining Amount" > 0 then
                Selection := StrMenu(Text001, 1);
            if ImprestSurrender.Status <> ImprestSurrender.Status::Released then
                Error('The Imprest Surrender No. ' + ImprestSurrender."No." + ' has not been fully approved');

            ImprestSurrender.TestField("Account No.");
            ImprestSurrender.TestField("Paying Bank Account");
            ImprestSurrender.TestField(Date);
            ImprestSurrender.TestField(Payee);
            ImprestSurrender.TestField("Pay Mode");
            if ImprestSurrender."Pay Mode" = 'CHEQUE' then begin
                ImprestSurrender.TestField("Cheque No");
                ImprestSurrender.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            if not ImprestLines.FindLast then
                Error('The Imprest Surrender Lines are empty');

            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            ImprestLines.CalcSums("Actual Spent");
            /*IF ImprestLines."Actual Spent"=0 THEN
             ERROR('Actual Spent Amount cannot be zero');*/

            if ImprestSurrender.Surrendered then
                Error('Imprest %1 has been surrendered', ImprestSurrender."No.");

            GLSetup.Get;

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Surrender Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", ImprestSurrender."No.");
            GenJnLine.DeleteAll;

            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Imprest Surrender Template";
            Batch.Name := ImprestSurrender."No.";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            //Staff entries
            LineNo := 10000;
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            ImprestLines.CalcSums("Actual Spent");
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
            GenJnLine."Journal Batch Name" := ImprestSurrender."No.";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Customer;
            GenJnLine."Account No." := ImprestSurrender."Account No.";
            GenJnLine."Posting Date" := ImprestSurrender."Imprest Surrender Date";
            GenJnLine."Document No." := ImprestSurrender."No.";
            GenJnLine."External Document No." := ImprestSurrender."Cheque No";
            GenJnLine.Description := ImprestSurrender.Payee;
            GenJnLine.Amount := -ImprestLines."Actual Spent";
            GenJnLine.Validate(Amount);
            GenJnLine."Applies-to Doc. No." := ImprestSurrender."Applies- To Doc No.";
            GenJnLine."Shortcut Dimension 1 Code" := ImprestSurrender."Global Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ImprestSurrender."Global Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            //Create Receipt IF Chosen
            if Selection = 1 then begin
                //Insert Header
                ImprestSurrender.CalcFields("Remaining Amount");
                if ImprestSurrender."Remaining Amount" > 0 then begin
                    if ImprestSurrender."Receipt Created" = false then begin
                        ReceiptHeader.Init;
                        ReceiptHeader."No." := NoSeriesMgt.GetNextNo(GLSetup."Receipt Nos", Today, true);
                        ReceiptHeader.Date := ImprestSurrender."Imprest Surrender Date";
                        ReceiptHeader."Received From" := ImprestSurrender.Payee;
                        ReceiptHeader."On Behalf Of" := ImprestSurrender."On behalf of";
                        ReceiptHeader."Global Dimension 1 Code" := ImprestSurrender."Global Dimension 1 Code";
                        ReceiptHeader."Global Dimension 2 Code" := ImprestSurrender."Global Dimension 2 Code";
                        if not ReceiptHeader.Get(ReceiptHeader."No.") then
                            ReceiptHeader.Insert;
                    end;
                end;
            end;

            //Expenses
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
                    GenJnLine."Journal Batch Name" := ImprestSurrender."No.";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := ImprestLines."Account Type";
                    if GenJnLine."Account Type" = ImprestLines."account type"::"Fixed Asset" then
                        GenJnLine."FA Posting Type" := GenJnLine."fa posting type"::"Acquisition Cost";
                    GenJnLine."Account No." := ImprestLines."Account No.";
                    GenJnLine.Validate("Account No.");
                    GenJnLine."Posting Date" := ImprestSurrender."Imprest Surrender Date";
                    GenJnLine."Document No." := ImprestSurrender."No.";
                    GenJnLine.Description := ImprestLines.Description;
                    GenJnLine.Amount := ImprestLines."Actual Spent";
                    GenJnLine.Validate(Amount);
                    //Set these fields to blanks
                    GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                    GenJnLine.Validate("Gen. Posting Type");
                    GenJnLine."Gen. Bus. Posting Group" := '';
                    GenJnLine.Validate("Gen. Bus. Posting Group");
                    GenJnLine."Gen. Prod. Posting Group" := '';
                    GenJnLine.Validate("Gen. Prod. Posting Group");
                    GenJnLine."VAT Bus. Posting Group" := '';
                    GenJnLine.Validate("VAT Bus. Posting Group");
                    GenJnLine."VAT Prod. Posting Group" := '';
                    GenJnLine.Validate("VAT Prod. Posting Group");
                    //
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                    GenJnLine.Validate("Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestLines."Global Dimension 2 Code";
                    GenJnLine.Validate("Shortcut Dimension 2 Code");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //Insert Receipt Lines
                    if Selection = 1 then begin
                        if ImprestLines."Remaining Amount" > 0 then begin
                            if ImprestSurrender."Receipt Created" = false then begin
                                ReceiptLine.Init;
                                ReceiptLine."Line No" := LineNo;
                                ReceiptLine."Receipt No." := ReceiptHeader."No.";
                                ReceiptLine."Account Type" := ImprestSurrender."Account Type";
                                ReceiptLine."Account No." := ImprestSurrender."Account No.";
                                ReceiptLine."Account Name" := ImprestSurrender."Account Name";
                                ReceiptLine.Description := ImprestLines.Description;
                                ReceiptLine.Amount := ImprestLines."Remaining Amount";
                                ReceiptLine."Global Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                                ReceiptLine."Global Dimension 2 Code" := ImprestLines."Global Dimension 2 Code";
                                if not ReceiptLine.Get(ReceiptLine."Line No", ReceiptLine."Receipt No.") then
                                    ReceiptLine.Insert;
                            end;
                        end;
                    end;
                until ImprestLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", ImprestSurrender."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            GLEntry.SetRange("Posting Date", ImprestSurrender."Imprest Surrender Date");
            if GLEntry.FindFirst then begin
                ImprestSurrender.Surrendered := true;
                if Selection = 1 then
                    ImprestSurrender."Receipt Created" := true;
                ImprestSurrender.Modify;
                //Uncommit Entries made to the varoius expenses accounts
                /*Committment.UncommitImprest(ImprestSurrender);*/
            end;
        end;

    end;


    procedure PostPettyCash(var PettyCash: Record "Payments HeaderFin")
    var
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        PettyCashLines: Record "Petty Cash Lines";
        GLEntry: Record "G/L Entry";
    begin

        if Confirm('Are you sure you want to post Petty Cash ' + PettyCash."No." + '?', false) = true then begin
            if PettyCash.Status <> PettyCash.Status::Released then
                Error('The Petty Cash No ' + PettyCash."No." + 'has not been fully approved');
            PettyCash.TestField(Date);
            PettyCash.TestField(Payee);
            PettyCash.TestField("Pay Mode");
            PettyCash.TestField("Paying Bank Account");
            if PettyCash."Pay Mode" = 'CHEQUE' then begin
                PettyCash.TestField("Cheque No");
                PettyCash.TestField("Cheque Date");
            end;
            //Check if the petty cash Lines have been populated
            PettyCashLines.Reset;
            PettyCashLines.SetRange(PettyCashLines.No, PettyCash."No.");
            if not PettyCashLines.FindLast then
                Error('The Petty Cash Lines are empty');

            if PettyCash.Posted then
                Error('Petty Cash %1 has been posted', PettyCash."No.");

            CMSetup.Get;
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Petty Cash Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", PettyCash."No.");
            GenJnLine.DeleteAll;

            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Petty Cash Template";
            Batch.Name := PettyCash."No.";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            PettyCashLines.Reset;
            PettyCashLines.SetRange(PettyCashLines.No, PettyCash."No.");
            PettyCashLines.CalcSums(Amount);
            if PettyCashLines.Amount = 0 then
                Error('Amount cannot be zero');
            PettyCash.CalcFields("Petty Cash Amount");
            //Bank Entries
            LineNo := 10000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Petty Cash Template";
            GenJnLine."Journal Batch Name" := PettyCash."No.";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := PettyCash."Paying Bank Account";
            GenJnLine."Posting Date" := PettyCash.Date;
            GenJnLine."Document No." := PettyCash."No.";
            GenJnLine.Description := PettyCash.Payee;
            GenJnLine.Amount := -PettyCash."Petty Cash Amount";
            GenJnLine."Shortcut Dimension 1 Code" := PettyCash."Global Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PettyCash."Global Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Insert Petty Cash Lines
            PettyCashLines.Reset;
            PettyCashLines.SetRange(PettyCashLines.No, PettyCash."No.");
            if PettyCashLines.FindFirst then begin
                repeat
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Petty Cash Template";
                    GenJnLine."Journal Batch Name" := PettyCash."No.";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PettyCashLines."Account Type";
                    GenJnLine."Account No." := PettyCashLines."Account No";
                    GenJnLine.Validate("Account No.");
                    GenJnLine."Posting Date" := PettyCash.Date;
                    GenJnLine."Document No." := PettyCash."No.";
                    GenJnLine.Description := PettyCashLines.Description;
                    GenJnLine.Amount := PettyCashLines.Amount;
                    //Set these fields to blanks
                    GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                    GenJnLine.Validate("Gen. Posting Type");
                    GenJnLine."Gen. Bus. Posting Group" := '';
                    GenJnLine.Validate("Gen. Bus. Posting Group");
                    GenJnLine."Gen. Prod. Posting Group" := '';
                    GenJnLine.Validate("Gen. Prod. Posting Group");
                    GenJnLine."VAT Bus. Posting Group" := '';
                    GenJnLine.Validate("VAT Bus. Posting Group");
                    GenJnLine."VAT Prod. Posting Group" := '';
                    GenJnLine.Validate("VAT Prod. Posting Group");
                    //
                    GenJnLine."Shortcut Dimension 1 Code" := PettyCashLines."Global Dimension 1 Code";
                    GenJnLine.Validate("Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PettyCashLines."Global Dimension 2 Code";
                    GenJnLine.Validate("Shortcut Dimension 2 Code");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until PettyCashLines.Next = 0;

            end;

            //Post Entries
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", PettyCash."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                PettyCash.Posted := true;
                PettyCash."Posted By" := UserId;
                PettyCash."Posted Date" := Today;
                PettyCash."Time Posted" := Time;
                PettyCash.Modify;
            end;
        end;
    end;


    // procedure PostOffsetting(var OffSetHeader: Record "Offsetting Header")
    // var
    //     OffSetContrib: Record "Offsetting Contributions";
    //     OffSetLoans: Record "Offsetting Loans";
    //     Text0001: label 'Please select a Loan to Offset';
    //     BosaProd: Record "Bosa Products";
    //     CustPost: Record "Customer Posting Group";
    //     AmntRemain: Decimal;
    // begin

    //     BosaSetup.Get;

    //     with OffSetHeader do begin

    //         if Posted = true then
    //             Error(Text003, "No.");

    //         Gnljnline.Reset;
    //         Gnljnline.SetRange("Journal Template Name", BosaSetup."Payments Journal Template");
    //         Gnljnline.SetRange("Journal Batch Name", OffSetHeader."No.");
    //         Gnljnline.DeleteAll;

    //         //end of deletion
    //         GenBatches.Reset;
    //         GenBatches.SetRange(GenBatches."Journal Template Name", BosaSetup."Payments Journal Template");
    //         GenBatches.SetRange(GenBatches.Name, OffSetHeader."No.");
    //         if GenBatches.Find('-') = false then begin
    //             GenBatches.Init;
    //             GenBatches."Journal Template Name" := BosaSetup."Payments Journal Template";
    //             GenBatches.Name := OffSetHeader."No.";
    //             GenBatches.Description := "Member Name";
    //             GenBatches.Validate(GenBatches."Journal Template Name");
    //             GenBatches.Validate(GenBatches.Name);
    //             GenBatches.Insert;
    //         end;

    //         //Payments
    //         OffSetLoans.Reset;
    //         OffSetLoans.SetRange(OffSetLoans.Code, "No.");
    //         //OffSetLoans.SETRANGE(OffSetLoans.Offset,TRUE);
    //         if OffSetLoans.Find('-') then begin
    //             repeat

    //                 if OffSetLoans."Shares Available" > OffSetLoans."Interest Due" then begin
    //                     //Loan Interest
    //                     LineNo := LineNo + 1000;
    //                     Gnljnline.Init;
    //                     Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
    //                     Gnljnline."Journal Batch Name" := OffSetHeader."No.";
    //                     Gnljnline."Line No." := LineNo;
    //                     Gnljnline."Account Type" := Gnljnline."account type"::Customer;
    //                     Gnljnline."Account No." := OffSetLoans."Member No.";
    //                     Gnljnline.Validate("Account No.");
    //                     Gnljnline."Document No." := OffSetHeader."No.";
    //                     Gnljnline."Posting Date" := Today;
    //                     Gnljnline.Description := 'Interest Paid on loan offsetting';
    //                     Gnljnline."Loan No" := OffSetLoans."Loan No";
    //                     //Gnljnline."Transaction Type":=PayLine."Transaction Type"::"Interest Paid";
    //                     Gnljnline."Sacco Transaction Type" := Gnljnline."sacco transaction type"::Repayment;
    //                     Gnljnline.Amount := Abs(OffSetLoans."Interest Due");
    //                     Gnljnline.Validate(Amount);
    //                     if BosaProd.Get(BosaSetup."Default Product Code") then begin
    //                         Gnljnline."Posting Group" := BosaProd."Default Grouping";
    //                         Gnljnline.Validate("Posting Group");
    //                         Gnljnline."Shortcut Dimension 2 Code" := BosaProd."Global Dimension 2 Code";
    //                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
    //                     end;
    //                     Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
    //                     Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
    //                     if Gnljnline.Amount <> 0 then
    //                         Gnljnline.Insert;


    //                     LineNo := LineNo + 1000;
    //                     Gnljnline.Init;
    //                     Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
    //                     Gnljnline."Journal Batch Name" := OffSetHeader."No.";
    //                     Gnljnline."Line No." := LineNo;
    //                     Gnljnline."Account Type" := Gnljnline."account type"::Customer;
    //                     Gnljnline."Account No." := OffSetLoans."Member No.";
    //                     Gnljnline.Validate("Account No.");
    //                     Gnljnline."Document No." := OffSetHeader."No.";
    //                     Gnljnline."Posting Date" := Today;
    //                     Gnljnline.Description := 'Interest Paid';
    //                     Gnljnline."Loan No" := OffSetLoans."Loan No";
    //                     Gnljnline."Transaction Type" := PayLine."transaction type"::"Interest Paid";
    //                     Gnljnline."Sacco Transaction Type" := Gnljnline."sacco transaction type"::Repayment;
    //                     Gnljnline.Amount := Abs(OffSetLoans."Interest Due") * -1;
    //                     Gnljnline.Validate(Amount);
    //                     Gnljnline."Posting Group" := BosaSetup."Posting Group - Interest Due";
    //                     Gnljnline.Validate("Posting Group");
    //                     Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
    //                     Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
    //                     Gnljnline."Shortcut Dimension 2 Code" := '';
    //                     Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
    //                     if Gnljnline.Amount <> 0 then
    //                         Gnljnline.Insert;
    //                 end;


    //                 if OffSetLoans."Shares Available" > OffSetLoans."Outstanding Balance" then
    //                     AmntRemain := Abs(OffSetLoans."Shares Available") - Abs(OffSetLoans."Interest Due");
    //                 if OffSetLoans."Shares Available" < OffSetLoans."Outstanding Balance" then
    //                     AmntRemain := Abs(OffSetLoans."Shares Available") - Abs(OffSetLoans."Interest Due");
    //                 if OffSetLoans."Shares Available" = OffSetLoans."Outstanding Balance" then
    //                     AmntRemain := Abs(OffSetLoans."Shares Available") - Abs(OffSetLoans."Interest Due");



    //                 if AmntRemain >= OffSetLoans."Outstanding Balance" then begin
    //                     //Loan Principal Repayment
    //                     LineNo := LineNo + 1000;
    //                     Gnljnline.Init;
    //                     Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
    //                     Gnljnline."Journal Batch Name" := OffSetHeader."No.";
    //                     Gnljnline."Line No." := LineNo;
    //                     Gnljnline."Account Type" := Gnljnline."account type"::Customer;
    //                     Gnljnline."Account No." := OffSetLoans."Member No.";
    //                     Gnljnline.Validate("Account No.");
    //                     Gnljnline."Document No." := OffSetHeader."No.";
    //                     Gnljnline."Posting Date" := Today;
    //                     Gnljnline.Description := 'Principal repayment on Loan Offsetting';
    //                     Gnljnline."Loan No" := OffSetLoans."Loan No";
    //                     //Gnljnline."Transaction Type":=PayLine."Transaction Type"::"Loan Repayment";
    //                     Gnljnline."Sacco Transaction Type" := Gnljnline."sacco transaction type"::Repayment;
    //                     Gnljnline.Amount := Abs(OffSetLoans."Outstanding Balance");
    //                     Gnljnline.Validate(Amount);
    //                     if BosaProd.Get(BosaSetup."Default Product Code") then begin
    //                         Gnljnline."Posting Group" := BosaProd."Default Grouping";
    //                         Gnljnline.Validate("Posting Group");
    //                         Gnljnline."Shortcut Dimension 2 Code" := BosaProd."Global Dimension 2 Code";
    //                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
    //                     end;
    //                     Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
    //                     Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
    //                     if Gnljnline.Amount <> 0 then
    //                         Gnljnline.Insert;

    //                     LineNo := LineNo + 1000;
    //                     Gnljnline.Init;
    //                     Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
    //                     Gnljnline."Journal Batch Name" := OffSetHeader."No.";
    //                     Gnljnline."Line No." := LineNo;
    //                     Gnljnline."Account Type" := Gnljnline."account type"::Customer;
    //                     Gnljnline."Account No." := OffSetLoans."Member No.";
    //                     Gnljnline.Validate("Account No.");
    //                     Gnljnline."Document No." := OffSetHeader."No.";
    //                     Gnljnline."Posting Date" := Today;
    //                     Gnljnline.Description := 'Offsetting Loan';
    //                     Gnljnline."Loan No" := OffSetLoans."Loan No";
    //                     Gnljnline."Transaction Type" := PayLine."transaction type"::"Loan Repayment";
    //                     Gnljnline."Sacco Transaction Type" := Gnljnline."sacco transaction type"::Repayment;
    //                     Gnljnline.Amount := Abs(OffSetLoans."Outstanding Balance") * -1;
    //                     Gnljnline.Validate(Amount);
    //                     // if LoanDisburse.Get(OffSetLoans."Loan No") then begin
    //                     //     if LoanType.Get(LoanDisburse."Loan Product Type") then
    //                     //         Gnljnline."Posting Group" := LoanType."Loan Posting Group";
    //                     //     Gnljnline.Validate("Posting Group");
    //                     // end;
    //                     Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
    //                     Gnljnline.Validate("Shortcut Dimension 1 Code");
    //                     Gnljnline."Shortcut Dimension 2 Code" := '';
    //                     Gnljnline.Validate("Shortcut Dimension 2 Code");
    //                     if Gnljnline.Amount <> 0 then
    //                         Gnljnline.Insert;

    //                 end else if AmntRemain < OffSetLoans."Outstanding Balance" then begin

    //                     //Loan Principal Repayment
    //                     LineNo := LineNo + 1000;
    //                     Gnljnline.Init;
    //                     Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
    //                     Gnljnline."Journal Batch Name" := OffSetHeader."No.";
    //                     Gnljnline."Line No." := LineNo;
    //                     Gnljnline."Account Type" := Gnljnline."account type"::Customer;
    //                     Gnljnline."Account No." := OffSetLoans."Member No.";
    //                     Gnljnline.Validate("Account No.");
    //                     Gnljnline."Document No." := OffSetHeader."No.";
    //                     Gnljnline."Posting Date" := Today;
    //                     Gnljnline.Description := 'Principal repayment on Loan Offsetting';
    //                     Gnljnline."Loan No" := OffSetLoans."Loan No";
    //                     //Gnljnline."Transaction Type":=PayLine."Transaction Type"::"Loan Repayment";
    //                     Gnljnline."Sacco Transaction Type" := Gnljnline."sacco transaction type"::Repayment;
    //                     Gnljnline.Amount := Abs(AmntRemain);
    //                     Gnljnline.Validate(Amount);
    //                     if BosaProd.Get(BosaSetup."Default Product Code") then begin
    //                         Gnljnline."Posting Group" := BosaProd."Default Grouping";
    //                         Gnljnline.Validate("Posting Group");
    //                         Gnljnline."Shortcut Dimension 2 Code" := BosaProd."Global Dimension 2 Code";
    //                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
    //                     end;
    //                     Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
    //                     Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
    //                     if Gnljnline.Amount <> 0 then
    //                         Gnljnline.Insert;

    //                     LineNo := LineNo + 1000;
    //                     Gnljnline.Init;
    //                     Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
    //                     Gnljnline."Journal Batch Name" := OffSetHeader."No.";
    //                     Gnljnline."Line No." := LineNo;
    //                     Gnljnline."Account Type" := Gnljnline."account type"::Customer;
    //                     Gnljnline."Account No." := OffSetLoans."Member No.";
    //                     Gnljnline.Validate("Account No.");
    //                     Gnljnline."Document No." := OffSetHeader."No.";
    //                     Gnljnline."Posting Date" := Today;
    //                     Gnljnline.Description := 'Offsetting Loan';
    //                     Gnljnline."Loan No" := OffSetLoans."Loan No";
    //                     Gnljnline."Transaction Type" := PayLine."transaction type"::"Loan Repayment";
    //                     Gnljnline."Sacco Transaction Type" := Gnljnline."sacco transaction type"::Repayment;
    //                     Gnljnline.Amount := Abs(AmntRemain) * -1;
    //                     Gnljnline.Validate(Amount);
    //                     // if LoanDisburse.Get(OffSetLoans."Loan No") then begin
    //                     //     if LoanType.Get(LoanDisburse."Loan Product Type") then
    //                     //         Gnljnline."Posting Group" := LoanType."Loan Posting Group";
    //                     //     Gnljnline.Validate("Posting Group");
    //                     // end;
    //                     Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
    //                     Gnljnline.Validate("Shortcut Dimension 1 Code");
    //                     Gnljnline."Shortcut Dimension 2 Code" := '';
    //                     Gnljnline.Validate("Shortcut Dimension 2 Code");
    //                     if Gnljnline.Amount <> 0 then
    //                         Gnljnline.Insert;



    //                 end;

    //             until OffSetLoans.Next = 0;
    //         end;
    //         //END ELSE ERROR((Text001));


    //         //Post Transaction
    //         if Confirm('Are you sure you want to post ?') = true then begin
    //             Gnljnline.Reset;
    //             Gnljnline.SetRange(Gnljnline."Journal Template Name", BosaSetup."Payments Journal Template");
    //             Gnljnline.SetRange(Gnljnline."Journal Batch Name", OffSetHeader."No.");
    //             Codeunit.Run(Codeunit::"Gen. Jnl.-Post", Gnljnline);
    //             OffSetHeader.Posted := true;
    //             OffSetHeader.Modify;

    //             OffSetLoans.Reset;
    //             OffSetLoans.SetRange(OffSetLoans.Code, "No.");
    //             if OffSetLoans.Find('-') then begin
    //                 repeat
    //                 // if LoanDisburse.Get(OffSetLoans."Loan No") then begin
    //                 //     LoanDisburse.CalcFields("Outstanding Balance");
    //                 //     if LoanDisburse."Outstanding Balance" = 0 then begin
    //                 //         LoanDisburse."Fully Paid" := true;
    //                 //         LoanDisburse.Modify;
    //                 //     end;
    //                 // end;
    //                 until OffSetLoans.Next = 0;
    //             end;

    //         end else
    //             exit;

    //     end;
    // end;


    //     procedure PostShareTransfer(var ShareTransHeader: Record "Share Transfer Header")
    //     var
    //         ShareTransLines: Record "Share Transfer Lines";
    //         Text0001: label 'Please select a Loan to Offset';
    //         BosaProd: Record "Bosa Products";
    //         CustPost: Record "Customer Posting Group";
    //     begin

    //         BosaSetup.Get;

    //         with ShareTransHeader do begin

    //             if Posted = true then
    //                 Error('Transaction No. %1 is already posted', "No.");

    //             Gnljnline.Reset;
    //             Gnljnline.SetRange("Journal Template Name", BosaSetup."Payments Journal Template");
    //             Gnljnline.SetRange("Journal Batch Name", ShareTransHeader."No.");
    //             Gnljnline.DeleteAll;

    //             //end of deletion
    //             GenBatches.Reset;
    //             GenBatches.SetRange(GenBatches."Journal Template Name", BosaSetup."Payments Journal Template");
    //             GenBatches.SetRange(GenBatches.Name, ShareTransHeader."No.");
    //             if GenBatches.Find('-') = false then begin
    //                 GenBatches.Init;
    //                 GenBatches."Journal Template Name" := BosaSetup."Payments Journal Template";
    //                 GenBatches.Name := ShareTransHeader."No.";
    //                 GenBatches.Description := 'Share Transfer';
    //                 GenBatches.Validate(GenBatches."Journal Template Name");
    //                 GenBatches.Validate(GenBatches.Name);
    //                 GenBatches.Insert;
    //             end;

    //             //Share Transfer
    //             ShareTransLines.Reset;
    //             ShareTransLines.SetRange(ShareTransLines.Code, "No.");
    //             if ShareTransLines.Find('-') then begin
    //                 repeat

    //                     LineNo := LineNo + 1000;
    //                     Gnljnline.Init;
    //                     Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
    //                     Gnljnline."Journal Batch Name" := ShareTransHeader."No.";
    //                     Gnljnline."Line No." := LineNo;
    //                     Gnljnline."Account Type" := Gnljnline."account type"::Customer;
    //                     Gnljnline."Account No." := ShareTransLines."Source Member No.";
    //                     Gnljnline.Validate("Account No.");
    //                     Gnljnline."Document No." := ShareTransHeader."No.";
    //                     Gnljnline."Posting Date" := Today;
    //                     Gnljnline.Description := (Text001) + Format(ShareTransLines."Destination Product Code");
    //                     Gnljnline."Sacco Transaction Type" := Gnljnline."sacco transaction type"::Contribution;
    //                     Gnljnline.Amount := ShareTransLines.Amount;
    //                     Gnljnline.Validate(Amount);
    //                     if BosaProd.Get(ShareTransLines."Source Product Code") then begin
    //                         Gnljnline."Posting Group" := BosaProd."Default Grouping";
    //                         Gnljnline.Validate("Posting Group");
    //                         Gnljnline."Shortcut Dimension 2 Code" := BosaProd."Global Dimension 2 Code";
    //                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
    //                     end;
    //                     Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
    //                     Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
    //                     if Gnljnline.Amount <> 0 then
    //                         Gnljnline.Insert;


    //                     LineNo := LineNo + 1000;
    //                     Gnljnline.Init;
    //                     Gnljnline."Journal Template Name" := BosaSetup."Payments Journal Template";
    //                     Gnljnline."Journal Batch Name" := ShareTransHeader."No.";
    //                     Gnljnline."Line No." := LineNo;
    //                     Gnljnline."Account Type" := Gnljnline."account type"::Customer;
    //                     Gnljnline."Account No." := ShareTransLines."Destination Member No.";
    //                     Gnljnline.Validate("Account No.");
    //                     Gnljnline."Document No." := ShareTransHeader."No.";
    //                     Gnljnline."Posting Date" := Today;
    //                     Gnljnline.Description := (Text002) + Format(ShareTransLines."Source Product Code");
    //                     Gnljnline."Sacco Transaction Type" := Gnljnline."sacco transaction type"::Contribution;
    //                     Gnljnline.Amount := ShareTransLines.Amount * -1;
    //                     Gnljnline.Validate(Amount);
    //                     if BosaProd.Get(ShareTransLines."Destination Product Code") then begin
    //                         Gnljnline."Posting Group" := BosaProd."Default Grouping";
    //                         Gnljnline.Validate("Posting Group");
    //                         Gnljnline."Shortcut Dimension 2 Code" := BosaProd."Global Dimension 2 Code";
    //                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
    //                     end;
    //                     Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
    //                     Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
    //                     if Gnljnline.Amount <> 0 then
    //                         Gnljnline.Insert;

    //                     //Post Transaction
    //                     if Confirm('Are you sure you want to post ?') = true then begin
    //                         Gnljnline.Reset;
    //                         Gnljnline.SetRange(Gnljnline."Journal Template Name", BosaSetup."Payments Journal Template");
    //                         Gnljnline.SetRange(Gnljnline."Journal Batch Name", ShareTransHeader."No.");
    //                         Codeunit.Run(Codeunit::"Gen. Jnl.-Post", Gnljnline);
    //                         ShareTransHeader.Posted := true;
    //                         ShareTransHeader.Modify;
    //                     end else
    //                         exit;

    //                 until ShareTransLines.Next = 0;
    //             end;


    //         end;
    //     end;
}

