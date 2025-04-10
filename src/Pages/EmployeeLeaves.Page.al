Page 52194213 EmployeeLeaves
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Employee Leaves1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
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
                field(TotalDaysTaken;"Total Days Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Entitlement;Entitlement)
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
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

