Page 52194096 "Employee Leave Look Up"
{
    PageType = Card;
    SourceTable = "Employee Leaves1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(LeaveCode;"Leave Code")
                {
                    ApplicationArea = Basic;
                }
                field(MaturityDate;"Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field(Balance;Balance)
                {
                    ApplicationArea = Basic;
                }
                field(AcruedDays;"Acrued Days")
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

