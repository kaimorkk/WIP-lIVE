page 96067 "Tender Alert Role Center"
{
    ApplicationArea = All;
    Caption = 'Tender Alert Role Center';
    PageType = RoleCenter;
    
    layout
    {
        area(RoleCenter)
        {
            part(Control76; "Headline RC Accountant")
            {
                ApplicationArea = Basic, Suite;
            }
            part(AlertsSentActivities; "Tender Alerts Sent Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(AlertsCostActivities; "Tender Alerts Cost Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group("User Plans")
            {
                Caption = 'Subscriptions';

                action("User Tender Subscriptions")
                {
                    ApplicationArea = Basic;
                    Caption = 'User Subscriptions';
                    RunObject = page "User Tender Subscriptions";
                    ToolTip = 'Executes the User Tender Subscriptions action.';
                }
            }
        }

        area(Embedding)
        {
            action("Tender Alert Setups")
            {
                ApplicationArea = Basic;
                Caption = 'Tender Alert Setups';
                Image = Setup;
                RunObject = page "Tender Alert Setups";
                ToolTip = 'Executes the Tender Alert Setup action.';
            }
            action("Preference Types")
            {
                ApplicationArea = Basic;
                Caption = 'Preference Types';
                Image = Setup;
                RunObject = page "Preference Types";
                ToolTip = 'Executes the Preference Types action.';
            }
            action("Tender Alert Preferences")
            {
                ApplicationArea = Basic;
                Caption = 'Preferences';
                Image = Setup;
                RunObject = page "Tender Alert Preferences";
                ToolTip = 'Executes the Tender Alert Preferences action.';
            }
            action("Tender Alert Subscriptions")
            {
                ApplicationArea = Basic;
                Caption = 'Plans';
                Image = Setup;
                RunObject = page "Tender Alert Subscriptions";
                ToolTip = 'Executes the Tender Alert Subscriptions action.';
            }
            action("Tender Alert Portal Users")
            {
                ApplicationArea = Basic;
                Caption = 'Portal Users';
                Image = Category;
                RunObject = page "Tender Alert Portal Users";
                ToolTip = 'Executes the Tender Alert Portal Users action.';   
            }
            action("Tender Alert Invoices")
            {
                ApplicationArea = Basic;
                Caption = 'Invoices';
                Image = Category;
                // RunObject = page "Tender Alert Invoices";
                ToolTip = 'Executes the Tender Alert Invoices action.';   
            }
        }
    }
}

profile TenderAlertManager
{
    Caption = 'Tender Alert Manager';
    ProfileDescription = 'Tender Alert Profile';
    RoleCenter = "Tender Alert Role Center";
}
