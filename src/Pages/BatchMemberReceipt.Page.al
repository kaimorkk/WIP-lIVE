Page 52193734 "Batch Member Receipt"
{
    PageType = Card;
    SourceTable = Receipts;

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
                field(EmployerCode;"Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivedFrom;"Received From")
                {
                    ApplicationArea = Basic;
                }
                field(PostingDate;"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(EnteredBy;"Entered By")
                {
                    ApplicationArea = Basic;
                }
                field(EnteredDate;"Entered Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(LineTotals;"Line Totals")
                {
                    ApplicationArea = Basic;
                }
                field(TotalLineAmount;"Total Line Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Imported List";"Imported List")
            {
                SubPageLink = No=field(No);
            }
        }
    }

    actions
    {
    }
}

