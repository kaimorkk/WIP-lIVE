pageextension 52193423 "Administrator Role Center" extends "Administrator Main Role Center"
{
    layout
    {
        addfirst(RoleCenter)
        {
            part(Control76; "Headline RC Administrator")
            {
                ApplicationArea = Basic, Suite;
            }
            part("Emails"; "Email Activities")
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
        addfirst(Sections)
        {
            group(Setups)
            {
                action(SMSSetup)
                {
                    Caption = 'Integration Setups';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Integration Setups";
                }
                action(ICTSetup)
                {
                    Caption = 'ICT Setups';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "ICT Helpdesk Setup Card";
                }
            }
            group(ICTHelpdesk)
            {
                Caption = 'ICT Helpdesk';

                action(Requests2)
                {
                    Caption = 'Helpdesk Category';
                    ApplicationArea = all;
                    RunObject = page "ICT Category List";
                }
                action(Requests1)
                {
                    Caption = 'Helpdesk Subcategory';
                    ApplicationArea = all;
                    RunObject = page "Helpdesk Subcategory";
                }
                action("ICT Officers Category Mapping")
                {
                    Caption = 'Helpdesk Category Mapping';
                    ApplicationArea = all;
                    RunObject = page "ICT Helpdesk Office Mapping";
                }
                action(Requests)
                {
                    Caption = 'Helpdesk Requests';
                    ApplicationArea = all;
                    RunObject = page "ICT Helpdesk Request List";
                }
                action(Requests3)
                {
                    Caption = 'Helpdesk Assign List';
                    ApplicationArea = all;
                    RunObject = page "ICT Helpdesk Assign List";
                }
                action(Requests4)
                {
                    Caption = 'Helpdesk Attend List';
                    ApplicationArea = all;
                    RunObject = page "ICT Helpdesk Attend List";
                }
                action(Requests5)
                {
                    Caption = 'Helpdesk History List';
                    ApplicationArea = all;
                    RunObject = page "ICT Helpdesk History List";
                }
                action(Requests6)
                {
                    Caption = 'Helpdesk Status List';
                    ApplicationArea = all;
                    RunObject = page "ICT Helpdesk Status List";
                }
            }
            group(ICTINVENTORY)
            {
                Caption = 'ICT Inventory';
                group("ICT Inventory Setups")
                {
                    action("ICT Category")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "ICT Category";
                        ToolTip = 'Executes the ICT Category action.';
                    }
                    action("ICT Asset Subcategory")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "ICT Asset Subcategory";
                        ToolTip = 'Executes the ICT Asset Subcategory action.';
                    }

                    action("ICT Inventory Brands ")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "ICT Inventory Brands";
                        ToolTip = 'Executes the ICT Inventory Brands  action.';
                    }
                    action("ICT Inventory Status")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "ICT Inventory Status";
                        ToolTip = 'Executes the ICT Inventory Status action.';
                    }
                    action("ICT Maintenance Areas")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "ICT Maintenance Areas";
                        ToolTip = 'Executes the ICT Maintenance Areas action.';
                    }
                    action("ICT Maintenance Activities")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "ICT Maintenance Activities";
                        ToolTip = 'Executes the ICT Maintenance Activities action.';
                    }
                }
                action("ICT Inventory List")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "ICT Inventory List";
                    ToolTip = 'Executes the ICT Inventory List action.';
                }

                action("ICT Issuance Voucher")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "ICT Issuance Vouchers";
                    ToolTip = 'Executes the ICT Issuance Voucher action.';

                }
                action("Approved Issuance Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Approved Issuance Vouchers";
                    ToolTip = 'Executes the Approved Issuance Vouchers action.';
                }
                action("Issued Issuance Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Posted Issuance Vouchers";
                    ToolTip = 'Executes the Issued Issuance Vouchers action.';
                }
                action("Returned Issuance Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Returned Issuance Vouchers";
                    ToolTip = 'Executes the Returned Issuance Vouchers action.';
                }
                action("ICT Movement Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "ICT Movement Vouchers";
                    ToolTip = 'Executes the ICT Movement Vouchers action.';
                }
                action("Approved  Movement Vouchers ")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Approved  Movement Vouchers";
                    ToolTip = 'Executes the Approved  Movement Vouchers  action.';
                }
                action("Posted  Movement Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Posted  Movement Vouchers";
                    ToolTip = 'Executes the Posted  Movement Vouchers  action.';
                }
                action("ICT Maintenance List")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "ICT Maintenance List";
                    ToolTip = 'Executes the ICT Maintenance List  action.';
                }
                action("Maintenance Forms")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Maintenance Forms";
                    ToolTip = 'Executes the Maintenance Forms action.';
                }
                group("ICT Inventory Reports")
                {
                    action("ICT IssuanceVoucher")
                    {
                        ApplicationArea = Basic, Suite;
                        Image = Document;
                        RunObject = Report "ICT Issuance Voucher";
                        ToolTip = 'Executes the ICT IssuanceVoucher action.';
                    }
                    action("ICT Equipment Movement")
                    {
                        ApplicationArea = Basic, Suite;
                        Image = Document;
                        RunObject = Report "ICT Equipment Movement";
                        ToolTip = 'Executes the ICT Equipment Movement action.';
                    }

                    action("ICT Inventory Movement & issuance")
                    {
                        ApplicationArea = Basic, Suite;
                        Image = Document;
                        RunObject = Report "ICT Inventory issuance";
                        ToolTip = 'Executes the ICT Inventory Movement & issuance action.';
                    }
                    action("Board Of Survey")
                    {
                        ApplicationArea = Basic, Suite;
                        Image = Document;
                        RunObject = Report "ICT Inventory List";
                        ToolTip = 'Executes the Board Of Survey action.';
                    }
                    action("ICT Equipment Summary")
                    {
                        ApplicationArea = Basic, Suite;
                        Image = Document;
                        RunObject = Report "ICT Equipment Summary";
                        ToolTip = 'Executes the ICT Equipment Summary action.';
                    }
                }
            }
        }
    }
}
