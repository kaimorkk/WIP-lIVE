Page 52194387 "Employee Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                systempart(Control1901420308;Outlook)
                {
                }
            }
            group(Control1900724708)
            {
                part(Control8;"My Job Queue")
                {
                    Visible = false;
                }
                systempart(Control1901377608;MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action(Payslip)
            {
                ApplicationArea = Basic;
                Caption = 'Payslip';
                RunObject = Report "New Payslipx1";
            }
        }
        area(embedding)
        {
        }
        area(sections)
        {
        }
        area(creation)
        {
        }
        area(navigation)
        {
        }
    }
}

