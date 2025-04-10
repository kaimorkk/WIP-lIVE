Page 52193592 "Payment Processing"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = Transactions;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionMode; "Transaction Mode")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(ScheduleAmount; "Schedule Amount")
                {
                    ApplicationArea = Basic;
                }
                field(CommissionCharge; "Commission Charge")
                {
                    ApplicationArea = Basic;
                }
                field(Source; Source)
                {
                    ApplicationArea = Basic;
                }
                field(SourceNumber; "Source Number")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(ChequeType; "Cheque Type")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo; "Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate; "Cheque Date")
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
                field(TransactingBranch; "Transacting Branch")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(PostedBy; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(ChargeSalaryCommission; "Charge Salary Commission")
                {
                    ApplicationArea = Basic;
                }
                field(ChargExternalLoanCommission; "Charg External Loan Commission")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Deposited; Deposited)
                {
                    ApplicationArea = Basic;
                }
            }
            part("Transaction Schedue Income"; "Transaction Schedule Income")
            {
                SubPageLink = No = field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control1000000033; Links)
            {
                Visible = true;
            }
            systempart(Control1000000024; Notes)
            {
                Visible = true;
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
                Caption = 'Post';
                Image = Post;

                trigger OnAction()
                begin
                    // TransMngt.IncomeProcessing(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin

                    /*SETFILTER(No,No);
                    REPORT.RUNMODAL(53010,TRUE,FALSE,Rec);
                    RESET;*/

                end;
            }
            action(PrintSchedule)
            {
                ApplicationArea = Basic;
                Caption = 'Print Schedule';

                trigger OnAction()
                begin

                    TransactionsSchedule.SetFilter(TransactionsSchedule.No, No);
                    Report.RunModal(51507344, true, false, TransactionsSchedule);
                    TransactionsSchedule.Reset;
                end;
            }
            action(MarkLoansforPayout)
            {
                ApplicationArea = Basic;
                Caption = 'Mark Loans for Payout';
                Visible = false;

                trigger OnAction()
                begin

                    /*TransactionsSchedule.RESET;
                    TransactionsSchedule.SETRANGE(TransactionsSchedule.No,No);
                    IF TransactionsSchedule.FIND('-') THEN BEGIN
                    
                    REPEAT
                     LoanApplicPAY.RESET;
                     LoanApplicPAY.SETRANGE(LoanApplicPAY."Customer CID. No.",TransactionsSchedule."Customer ID. No.");
                     IF LoanApplicPAY.FIND('-') THEN BEGIN
                     REPEAT
                     LoanApplicPAY."Payout Received?":=TRUE;
                     LoanApplicPAY.MODIFY;
                     UNTIL LoanApplicPAY.NEXT=0;
                     END
                     UNTIL TransactionsSchedule.NEXT=0;
                     END;
                     END ELSE
                     ERROR('This process is for marking for tea processing');
                     */

                end;
            }
            group(Import)
            {
                Caption = 'Import';
                action(ImportPaymentSchedule)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Payment Schedule';
                    Image = Import;

                    trigger OnAction()
                    begin

                        /*RefNoRec.RESET;
                        RefNoRec.SETRANGE(RefNoRec.CurrUserID,USERID);
                        RefNoRec.SETRANGE(RefNoRec."Transaction Type",RefNoRec."Transaction Type"::"Salary Processing");
                        IF RefNoRec.FIND('-') THEN BEGIN
                        RefNoRec."Reference No":=No;
                        RefNoRec.MODIFY;
                        END
                        ELSE BEGIN
                        RefNoRec.INIT;
                        RefNoRec.CurrUserID:=USERID;
                        RefNoRec."Reference No":=No;
                        RefNoRec."Transaction Type":=RefNoRec."Transaction Type"::"Salary Processing";
                        RefNoRec.INSERT;
                        END;
                        
                        
                        REPORT.RUN(51507343,TRUE);
                        DATAPORT.RUN(51507333,TRUE);*/



                        PaySchedule.GetRecHeader(Rec);
                        TransactionsSchedule.Validate("Account No");
                        PaySchedule.Run;

                    end;
                }
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
                actionref(ImportPaymentSchedule_Promoted; ImportPaymentSchedule)
                {
                }
            }
            group(Category_Report)
            {
                actionref(PrintSchedule_Promoted; PrintSchedule)
                {
                }
            }
        }
    }

    var
        TransactionTypes: Record "Transaction Types";
        TransactionsSchedule: Record "Transaction Schedule Income";
        AccountTypes: Record "Account Types";
        GenJournalLine: Record "Gen. Journal Line";
        GenLedgerSetup: Record "General Ledger Setup";
        LineNo: Decimal;
        window: Dialog;
        DefaultBatch: Record "Gen. Journal Batch";
        PostingCode: Codeunit "Gen. Jnl.-Post Line";
        TransactionCharges: Record "Transaction Charges";
        AccountHolders: Record Vendor;
        CompInfo: Record "Company Information";
        SDeductions: Record "Income Processing Deductions";
        DedAmount: Decimal;
        Interest: Decimal;
        Princ: Decimal;
        TCharges: Decimal;
        TotalDed: Decimal;
        BalLessDed: Decimal;
        Vend: Record Vendor;
        AccBal: Decimal;
        AvlBal: Decimal;
        AccTypes: Record "Account Types";
        MinBal: Decimal;
        Vendors: Record Vendor;
        cust: Record Customer;
        CommsCharged: Decimal;
        TransactionsSchedule1: Record "Transaction Schedule Income";
        // LoanApplicPAY: Record Loans;
        SpecStoSchedule: Record "STO Schedule";
        TotalSTOShedule: Decimal;
        // STO//Loans: Record Loans;
        RunningSTO: Decimal;
        TransDescription: Text[30];
        Last3months: Date;
        RefNoRec: Record "Reference Buffer.";
        AvialSTO: Decimal;
        // TransMngt: Codeunit "Transactions Management";
        UsersID: Record User;
        PaySchedule: XmlPort "Payment Processing";
        TranSched: XmlPort "Import Payments";


    procedure TRY()
    begin
    end;
}

