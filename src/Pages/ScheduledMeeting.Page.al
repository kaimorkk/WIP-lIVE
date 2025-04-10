Page 52193813 "Scheduled Meeting"
{
    PageType = Card;
    SourceTable = Campaign;
    SourceTableView = where("Meeting Type"=const(Meeting));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(CommitteeName;"Committee Name")
                {
                    ApplicationArea = Basic;
                }
                field(StartingDate;"Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndingDate;"Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field(StartTime;"Start Time")
                {
                    ApplicationArea = Basic;
                }
                field(EndTime;"End Time")
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

