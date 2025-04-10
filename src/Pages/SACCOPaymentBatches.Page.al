Page 52193732 "SACCO Payment Batches"
{
    PageType = List;
    SourceTable = "Sacco Payment Batch";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(JournalBatchName;"Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field(Company;Company)
                {
                    ApplicationArea = Basic;
                }
                field(PostingDate;"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(SlipRcptNo;"Slip/Rcpt No")
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount;"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccount;"Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(DateFilter;"Date Filter")
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

