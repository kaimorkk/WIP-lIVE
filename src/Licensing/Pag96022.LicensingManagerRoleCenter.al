page 96022 "Licensing Manager Role Center"
{
    ApplicationArea = All;
    Caption = 'Licensing Manager';
    PageType = RoleCenter;
    
    layout
    {
        area(RoleCenter)
        {
            part(Control76; "Headline RC Accountant")
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
            group("Licence Registrations Mgmt.")
            {
                Caption = 'Licence Registrations';

                action("Licence Registrations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Submitted Licence Registrations';
                    RunObject = page "Licence Registrations";
                    ToolTip = 'Executes the Licence Registrations action.';
                }
                action("Approved Licence Registrations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Licence Registrations';
                    RunObject = page "Approved Licence Registrations";
                    ToolTip = 'Executes the Approved Licence Registrations action.';
                }
                action("Closed Licence Registrations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Licence Registrations';
                    RunObject = page "Closed Licence Registrations";
                    ToolTip = 'Executes the Closed Licence Registrations action.';
                }
            }
            group("Licence Renewal Mgmt.")
            {
                Caption = 'Licence Renewal';

                action("Licence Renewals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Submitted Licence Renewals';
                    RunObject = page "Licence Renewals";
                    ToolTip = 'Executes the Licence Renewals action.';
                }
                action("Approved Licence Renewals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Licence Renewals';
                    RunObject = page "Approved Licence Renewals";
                    ToolTip = 'Executes the Approved Licence Renewals action.';
                }
                action("Closed Licence Renewals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Licence Renewals';
                    RunObject = page "Closed Licence Renewals";
                    ToolTip = 'Executes the Closed Licence Renewals action.';
                }
            }
            group("Licence Restoration Mgmt.")
            {
                Caption = 'Licence Restoration';

                action("Licence Restoration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Submitted Licence Restorations';
                    RunObject = page "Licence Restorations";
                    ToolTip = 'Executes the Licence Restoration action.';
                }
                action("Approved Licence Restorations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Licence Restorations';
                    RunObject = page "Approved Licence Restorations";
                    ToolTip = 'Executes the Approved Licence Restorations action.';
                }
                action("Closed Licence Restorations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Licence Restorations';
                    RunObject = page "Closed Licence Restorations";
                    ToolTip = 'Executes the Closed Licence Restorations action.';
                }
            }
            group("Licence Category Mgmt.")
            {
                Caption = 'Licence Categories Management';
                Visible = false;

                action("Licence Practice Categories")
                {
                    ApplicationArea = Basic;
                    Caption = 'Practice Categories';
                    RunObject = page "Licence Practice Categories";
                    ToolTip = 'Executes the Licence Practice Categories action.';
                }
                action("Licence Category Registrations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Licence Category Registrations';
                    RunObject = page "Licence Categories Form";
                    ToolTip = 'Executes the Licence Category Registrations action.';
                }
            }
        }
        area(Embedding)
        {
            action("Licensing Setups")
            {
                ApplicationArea = Basic;
                Caption = 'Licensing Setups';
                Image = Setup;
                RunObject = page "Licensing Setup";
                ToolTip = 'Executes the Licensing Setup action.';
            }
            action("Practice Categories")
            {
                ApplicationArea = Basic;
                Caption = 'Practice Categories';
                Image = Category;
                RunObject = page "Licence Practice Categories";
                ToolTip = 'Executes the Licence Practice Categories action.';
            }
            action("Licensing Portal Users")
            {
                ApplicationArea = Basic;
                Caption = 'Portal Users';
                Image = Category;
                RunObject = page "Licensing Portal Users";
                ToolTip = 'Executes the Licensing Portal Users action.';   
            }
            action(Licences)
            {
                ApplicationArea = Basic;
                Caption = 'Licences';
                Image = Category;
                RunObject = page Licences;
                ToolTip = 'Executes the Licences action.';   
            }
        }
    }
}

profile LicensingManager
{
    Caption = 'Licensing Manager';
    ProfileDescription = 'Licensing Profile';
    RoleCenter = "Licensing Manager Role Center";
}
