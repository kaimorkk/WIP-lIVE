Page 80490 "Planning &Strategy Role Center"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control10; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control9; "Planning & Strategy Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            // part(Control58; "M&E Activities")
            // {
            //     AccessByPermission = TableData "Activities Cue" = I;
            //     ApplicationArea = Basic, Suite;
            // }
            part(Control6; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control5; "Help And Chart Wrapper")
            {
                //AccessByPermission = TableData "Assisted Setup"=I;
                ApplicationArea = Basic, Suite;
                Caption = '';
                ToolTip = 'Specifies the view of your business assistance';
            }
            part(Control4; "Power BI Report Spinner Part")
            {
                AccessByPermission = TableData "Power BI User Configuration" = I;
                ApplicationArea = Basic, Suite;
            }
            // part(Control3; "O365 Link to Financials")
            // {
            //     ApplicationArea = Invoicing;
            //     Caption = ' ';
            // }
            part(Control2; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("User Task List")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Tasks';
                RunObject = Page "User Task List";
            }
            group("&SelfService")
            {
                Caption = '&SelfService';
                Image = Tools;
                action("Imprest Memo")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memo';
                    Image = New;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    // RunObject = Page "Imprest Memo";
                    RunPageMode = Create;
                }
                action("Imprest Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Requisition';
                    Image = NewDocument;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    // RunObject = Page "Imprest Requisition";
                    RunPageMode = Create;
                }
                action("Imprest Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    Image = NewDocument;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    // RunObject = Page "Imprest Surrender";
                    RunPageMode = Create;
                }
                action("Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application';
                    Image = Document;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    // RunObject = Page "Leave Applications";
                    RunPageMode = Create;
                }
                action("Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition';
                    Image = Document;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    // RunObject = Page "Standard Purchase Requisition";
                    RunPageMode = Create;
                }
            }
        }
        area(processing)
        {
            group(New)
            {
                Caption = 'New';
                Image = New;
                action("Funding Agencies")
                {
                    AccessByPermission = TableData Customer = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Funding Agencies';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageMode = Create;
                    ToolTip = 'Register a new =Funding Agent';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                group("Grants Reports")
                {
                    Caption = 'Grants Reports';
                    Image = ReferenceData;
                }
                group("Self Service Reports")
                {
                    Caption = 'Self Service Reports';
                    Image = ReferenceData;
                }
            }
        }
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
        }
        area(sections)
        {
            group("My Request")
            {
                Caption = 'My Request';
                action("Imprest Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memos';
                    // RunObject = Page "Imprest Memos";
                }
                action("<Page Project Imprest Requisition>")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Requisitions';
                    Image = Quote;
                    // RunObject = Page "Imprest Requisitions";
                }
                action("My Store Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Store Requisitions';
                    Image = Document;
                    // RunObject = Page "Store Requisitions";
                }
                action("My Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Surrenders';
                    Image = Document;
                    // RunObject = Page "Imprest Surrenders";
                }
                action("My Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Leave Applications';
                    Image = ServiceCode;
                    RunObject = Page "Leave Applications List";
                }
                action("ICT Helpdesk Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Helpdesk Request';
                    Enabled = false;
                    Image = SendTo;
                    // RunObject = Page "ICT Helpdesk Request List";
                    Visible = false;
                }
                action("My Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Purchase Requisitions';
                    Image = Loaners;
                    // RunObject = Page "Purchase Requisitions";
                }
                action("Fleet Requisition List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Fleet Requisition List";
                }
                action(Items)
                {
                    ApplicationArea = Basic;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Item List";
                }
            }
            group("My Approved Requests")
            {
                action("My Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    // RunObject = Page "My Approved Leave Applications";
                }
                action("Approved Imprest Memos")
                {
                    ApplicationArea = Basic;
                    // RunObject = Page "Approved Imprest Memos";
                }
                action("Approved Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    // RunObject = Page "Approved Imprest Surrenders";
                }
                action("Approved Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    // RunObject = Page "Approved Purchase Requisition";
                }
            }
            group("Annual Workplans")
            {
                Image = Travel;
                action("Functional Annual Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Station Annual Workplan';
                    RunObject = Page "Functional Annual Workplans";
                }

                action("Approved Annual Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Station Annual Workplan';
                    RunObject = Page "Approved Functional Plans";
                }
                action("Annual Strategy Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft  Annual Workplan';
                    RunObject = Page "Annual Strategy Workplans";
                }
                action("Functional/Operational PCs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Awp Cascading Templates';
                    RunObject = Page "Functional/Operational PCs";
                    Visible = false;
                }
                action("Directors Perfomance Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'DCS annual Workplan';
                    RunObject = Page "Directors Perfomance Contracts";
                    Visible = false;
                }
                action("Departments\Centers PCs ")
                {
                    ApplicationArea = Basic;
                    Caption = 'HOD Annual Workplans';
                    Visible = false;
                    RunObject = Page "Departments\Centers PCs";
                }
                action("Individual Scorecards")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Annual workplan';
                    RunObject = Page "Individual Scorecards";
                    Visible = false;
                }
            }
            group("Performance Contracting")
            {
                action("Functional PCs ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Departmental Pcs';
                    //RunObject = Page "Functional PCs";
                    Visible = false;
                }
                action("Organizational PCs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Organizational PCs';
                    //RunObject = Page "Organizational PCs";
                }
                action("DCS Perfomance Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Divisional Annual Perforance Contracts';
                    //RunObject = Page "DCS Perfomance Contracts";
                }
                action("HOD  Perfomance Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Departmental Performance Contracts';
                    // RunObject = Page "HOD  Perfomance Contracts";
                }
            }
            group("Performance Mornitoring")
            {
                action("Department Performance Logs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Performance Logs';
                    // RunObject = Page "Department Performance Logs";
                }
                action("Depart Performance Cont Logs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Performance Contracting Reporting';
                    //RunObject = Page "Depart Performance Cont Logs";
                }
                action("Performance Diary Logs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Performance Reporting';
                    RunObject = Page "Performance Diary Logs";
                }
            }
            group("Corporate Calender")
            {
                action("Functional calendars ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Corporate Calendars';
                    //RunObject = Page "Functional calendars";
                }
            }
            group("ISO Audit")
            {
                action("Audit Schedule")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Schedule';
                    //RunObject = Page "Approved Audit Schedules";
                }
            }
            group("Assigned Tickets")
            {
                action("My Assigned Tickets")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Assigned Tickets';
                    //RunObject = Page "Assigned Enquiries List";
                }
                action("My Closed Tickets")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Closed Tickets';
                    //RunObject = Page "My Closed Tickets";
                }
                action("My Resolved Tickets")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Resolved Tickets';
                    //RunObject = Page "My Resolved Tickets";
                }
            }
        }
    }
}
profile "Planning &Strategy Role Center"
{
    Caption = 'Planning &Strategy Role Center';
    RoleCenter = "Planning &Strategy Role Center";
    ProfileDescription = 'Planning &Strategy Role Center';
}

