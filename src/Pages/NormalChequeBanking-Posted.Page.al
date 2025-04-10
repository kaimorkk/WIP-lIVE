Page 52193429 "Normal Cheque Banking-Posted"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Cheque Transfers Header";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(BIHNo;"BIH No")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccountNo;"Bank Account No")
                {
                    ApplicationArea = Basic;
                }
                field(TotalBankingAmount;"Total Banking Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(EnteredBy;"Entered By")
                {
                    ApplicationArea = Basic;
                }
                field(Transferred;Transferred)
                {
                    ApplicationArea = Basic;
                }
                field(DateTransferred;"Date Transferred")
                {
                    ApplicationArea = Basic;
                }
                field(TimeTransferred;"Time Transferred")
                {
                    ApplicationArea = Basic;
                }
                field(TransferredBy;"Transferred By")
                {
                    ApplicationArea = Basic;
                }
                field(DateEntered;"Date Entered")
                {
                    ApplicationArea = Basic;
                }
                field(TimeEntered;"Time Entered")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Cheque Transactions";"Cheque Transactions ")
            {
                SubPageLink = "Transfer Header No"=field(No);
            }
        }
    }

    actions
    {
    }

    var
        CHQTransactionRec: Record "Cheque Transactions";
        BankTotal: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        GLPosting: Codeunit "Gen. Jnl.-Post Line";
        window: Dialog;
        ChequeType: Record "Cheque Types";
        Transactions: Record Transactions;
        // wScript: Automation WshShell;
        AccountAmount: Decimal;
        LineNo: Integer;
        TransactionSchedule: Record "Transaction Schedule Income";
        Members: Record Vendor;
        AccountTypes: Record "Account Types";
        MinAccBal: Decimal;
        FeeBelowMinBal: Decimal;
        GenLedgerSetup: Record "General Ledger Setup";
        MembersAmount: Decimal;
        DeductFeeBelowMinBal: Boolean;
        ProcessingCharge: Decimal;
        Diff: Decimal;
        WholeNumber: Decimal;
        TransactionCharges: Record "Transaction Charges";
        ServiceCharge: Decimal;
        RoundOffDiff: Decimal;
        AccountHolders: Record Vendor;
        TransCharges: Decimal;
        PostingCode: Codeunit "Gen. Jnl.-Post Line";
        TotalAmount: Decimal;
        ChargesRec: Record "Charges - FOSA";
        TotalBanking: Decimal;
        TransRec: Record Transactions;
        DActivity: Code[20];
        DBranch: Code[20];
        UsersID: Record User;
}

