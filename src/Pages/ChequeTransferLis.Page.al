Page 52193428 "Cheque Transfer Lis"
{
    PageType = List;
    SourceTable = "Cheque Transfers Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(JournalTemplateName;"Journal Template Name")
                {
                    ApplicationArea = Basic;
                }
                field(JournalBatchName;"Journal Batch Name")
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
                field(EnteredBy;"Entered By")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(PayeeBankName;"Payee Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(BankNo;"Bank  No")
                {
                    ApplicationArea = Basic;
                }
                field(Charges;Charges)
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedAmount;"Expected Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeType;"Cheque Type")
                {
                    ApplicationArea = Basic;
                }
                field(DepositSlipNo;"Deposit Slip No")
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
            }
        }
    }

    actions
    {
    }
}

