Page 52194394 "HODs Role Center"
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
            action("Purchase Requisitions")
            {
                ApplicationArea = Basic;
                RunObject = Page "GS Purchase Requisitions List";
            }
            action("Store Requisitions")
            {
                ApplicationArea = Basic;
                RunObject = Page "GS Store Requisitions List";
            }
            action("Approval Entries")
            {
                ApplicationArea = Basic;
                RunObject = Page "Approval Entries";
            }
            action("Imprest Request")
            {
                ApplicationArea = Basic;
                RunObject = Page "Imprest Request Listing";
            }
            action("Imprest Surrender")
            {
                ApplicationArea = Basic;
                RunObject = Page "Claims Listing";
            }
            action("Claims Refund")
            {
                ApplicationArea = Basic;
                RunObject = Page "Claims_Refunds Listing";
            }
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

