Page 52193555 "Stores Management RC"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control2)
            {
                part(Control3; "Stores Cues")
                {
                    Caption = 'Pending Stores Approvals';
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Budget/Expenditure Report")
            {
                ApplicationArea = Basic;
                Caption = 'Budget/Expenditure Report';
                Image = "Report";
                // RunObject = Report "Budget/Expenditure";
            }
        }
    }
}

