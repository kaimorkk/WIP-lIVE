Page 52193600 "Microfinance Transaction"
{
    PageType = Card;
    SourceTable = "Micro Fin Transactions";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionDate; "Transaction Date")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionTime; "Transaction Time")
                {
                    ApplicationArea = Basic;
                }
                field(GroupCode; "Group Code")
                {
                    ApplicationArea = Basic;
                }
                field(BankAcount; "Bank  Acount")
                {
                    ApplicationArea = Basic;
                }
                field(SavingsLoanRep; "Savings/Loan Rep")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(PostedBy; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(TransactonsTotal; "Transactons Total")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Micro fin trans subform"; "Micro fin trans Subform")
            {
                SubPageLink = "No." = field("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'purchases');
                    GenJournalLine.SetRange("Journal Batch Name", 'MICRO FIN');
                    GenJournalLine.DeleteAll;
                    //end of deletion

                    DefaultBatch.Reset;
                    DefaultBatch.SetRange(DefaultBatch."Journal Template Name", 'purchases');
                    DefaultBatch.SetRange(DefaultBatch.Name, 'MICRO FIN');
                    if DefaultBatch.Find('-') = false then begin
                        DefaultBatch.Init;
                        DefaultBatch."Journal Template Name" := 'purchases';
                        DefaultBatch.Name := 'MICRO FIN';
                        DefaultBatch.Description := 'Micro Finance Repayment Journal';
                        DefaultBatch.Validate(DefaultBatch."Journal Template Name");
                        DefaultBatch.Validate(DefaultBatch.Name);
                        DefaultBatch.Insert;
                    end;

                    LineNo := 10000;
                    if Posted then
                        Error('The transaction %1 is already posted', "No.");

                    if Amount <> "Transactons Total" then
                        Error('The trasactions total should be equal to the amount Deposited');
                    LineNo := LineNo + 10000;
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := 'PURCHASES';
                    GenJournalLine."Journal Batch Name" := 'MICRO FIN';
                    GenJournalLine."Document No." := "No.";
                    GenJournalLine."Line No." := LineNo;
                    //GenJournalLine."Group Code":="Group Code";
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                    GenJournalLine."Account No." := "Bank  Acount";
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Description := 'Cash Receipt';
                    GenJournalLine.Amount := Amount;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    //GenJournalLine."Loan No" := Transact."Loan No.";
                    GenJournalLine."Shortcut Dimension 1 Code" := 'MICRO';
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    GenJournalLine."Shortcut Dimension 2 Code" := BranchCode;
                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;

                    Transact.Reset;
                    Transact.SetRange(Transact."No.", "No.");
                    if Transact.Find('-') then begin
                        repeat
                            if Transact."Principle Amount" > 0 then begin
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'PURCHASES';
                                GenJournalLine."Journal Batch Name" := 'MICRO FIN';
                                GenJournalLine."Document No." := "No.";
                                GenJournalLine."Line No." := LineNo;
                                //GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Share Contribution";
                                //GenJournalLine."Group Code":=Transact."Group Code";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
                                GenJournalLine."Account No." := Transact."Account Number";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := 'Loan Repayment';
                                GenJournalLine.Amount := -Transact."Principle Amount";
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                //GenJournalLine."Loan No" := Transact."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := 'MICRO';
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine."Shortcut Dimension 2 Code" := BranchCode;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                            end;

                            if Transact."MF Insurance Amount" > 0 then begin
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'PURCHASES';
                                GenJournalLine."Journal Batch Name" := 'MICRO FIN';
                                GenJournalLine."Document No." := "No.";
                                GenJournalLine."Line No." := LineNo;
                                //GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Dividend Paid";
                                //GenJournalLine."Group Code":=Transact."Group Code";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
                                GenJournalLine."Account No." := Transact."Account Number";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := 'Insurance Paid';
                                GenJournalLine.Amount := -Transact."MF Insurance Amount";
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                //GenJournalLine."Loan No" := Transact."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := 'MICRO';
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine."Shortcut Dimension 2 Code" := BranchCode;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                            end;


                            if Transact."Appraisal Amount" > 0 then begin
                                LineNo := LineNo + 10000;
                                GenJournalLine.Init;
                                GenJournalLine."Journal Template Name" := 'PURCHASES';
                                GenJournalLine."Journal Batch Name" := 'MICRO FIN';
                                GenJournalLine."Document No." := "No.";
                                GenJournalLine."Line No." := LineNo;
                                //GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Processing Fee";
                                //GenJournalLine."Group Code":=Transact."Group Code";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
                                GenJournalLine."Account No." := Transact."Account Number";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := 'Appraisal Paid';
                                GenJournalLine.Amount := -Transact."Appraisal Amount";
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                //GenJournalLine."Loan No" := Transact."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := 'MICRO';
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine."Shortcut Dimension 2 Code" := BranchCode;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                            end;

                            if Transact."Interest Amount" > 0 then begin
                                GenJournalLine.Init;
                                LineNo := LineNo + 10000;
                                GenJournalLine."Journal Template Name" := 'PURCHASES';
                                GenJournalLine."Journal Batch Name" := 'MICRO FIN';
                                GenJournalLine."Document No." := "No.";
                                GenJournalLine."Line No." := LineNo;
                                //GenJournalLine."Group Code":=Transact."Group Code";
                                //GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Withdrawal;
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
                                GenJournalLine."Account No." := Transact."Account Number";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := 'Interest Paid';
                                GenJournalLine.Amount := -Transact."Interest Amount";
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                //GenJournalLine."Loan No" := Transact."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := 'MICRO';
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine."Shortcut Dimension 2 Code" := BranchCode;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                            end;

                            if Transact."Penalty Amount" > 0 then begin
                                GenJournalLine.Init;
                                LineNo := LineNo + 10000;
                                GenJournalLine."Journal Template Name" := 'PURCHASES';
                                GenJournalLine."Journal Batch Name" := 'MICRO FIN';
                                GenJournalLine."Document No." := "No.";
                                GenJournalLine."Line No." := LineNo;
                                //GenJournalLine."Group Code":="Group Code";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
                                GenJournalLine."Account No." := Transact."Account Number";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := Today;
                                // GenJournalLine."Transaction Type":=GenJournalLine."transaction type"::"17";
                                GenJournalLine.Description := 'Micro Finance fees';
                                GenJournalLine.Amount := -Transact."Penalty Amount";
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                //GenJournalLine."Loan No" := Transact."Loan No.";
                                GenJournalLine."Shortcut Dimension 1 Code" := 'MICRO';
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine."Shortcut Dimension 2 Code" := BranchCode;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                            end;


                            if Transact.Savings > 0 then begin
                                GenJournalLine.Init;
                                LineNo := LineNo + 10000;
                                GenJournalLine."Journal Template Name" := 'PURCHASES';
                                GenJournalLine."Journal Batch Name" := 'MICRO FIN';
                                GenJournalLine."Document No." := "No.";
                                GenJournalLine."Line No." := LineNo;
                                //GenJournalLine."Group Code":="Group Code";
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                                GenJournalLine."Account No." := Transact."Account Number";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := 'Member Savings';
                                GenJournalLine.Amount := -Transact.Savings;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Shortcut Dimension 1 Code" := 'MICRO';
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine."Shortcut Dimension 2 Code" := BranchCode;
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                            end;

                        until Transact.Next = 0;
                    end;



                    //post

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange(GenJournalLine."Journal Template Name", 'PURCHASES');
                    GenJournalLine.SetRange(GenJournalLine."Journal Batch Name", 'MICRO FIN');
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJournalLine);

                    //window.CLOSE;

                    if DefaultBatch.Get('PURCHASES', 'MICRO FIN') then
                        DefaultBatch.Delete;
                    Posted := true;
                    "Posted By" := UserId;
                    Modify;
                end;
            }
            separator(Action1000000016)
            {
            }
            action(Print)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    Transact.Reset;
                    Transact.SetRange(Transact."No.", "No.");
                    Report.Run(51507347, true, true, Transact);
                end;
            }
        }
    }

    var
        GenJournalLine: Record "Gen. Journal Line";
        Transact: Record "Micro Fin Schedule";
        LineNo: Integer;
        DefaultBatch: Record "Gen. Journal Batch";
        BranchCode: Code[20];
}

