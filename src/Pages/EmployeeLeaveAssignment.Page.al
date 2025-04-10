Page 52194089 "Employee Leave Assignment"
{
    PageType = ListPart;
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
                field(Entitlement;Entitlement)
                {
                    ApplicationArea = Basic;
                }
                field(TotalDaysTaken;"Total Days Taken")
                {
                    ApplicationArea = Basic;
                }
                field(BalanceBroughtForward;"Balance Brought Forward")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledDays;"Recalled Days")
                {
                    ApplicationArea = Basic;
                }
                field(Balance;Balance)
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

