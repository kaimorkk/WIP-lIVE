

page 69400 "OSH Framework"
{
    PageType = Card;
    SourceTable = "Health & Safety Setup";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization Name field.';
                }
                field("Primary Purpose"; Rec."Primary Purpose")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Purpose field.';
                }
                field("OSH Policy No."; Rec."OSH Policy No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Policy No. field.';
                }
            }
            group("OSH Statistics")
            {
                Caption = 'OSH Statistics';
                field("No. of OSH Mgt. Plans"; Rec."No. of OSH Mgt. Plans")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of OSH Mgt. Plans field.';
                }
                field("No. of Safe Work Permit Apps"; Rec."No. of Safe Work Permit Apps")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Safe Work Permit Apps field.';
                }
                field("No. of Safe Work Compl Reports"; Rec."No. of Safe Work Compl Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Safe Work Compl Reports field.';
                }
                field("No. of Emergency Drill Reports"; Rec."No. of Emergency Drill Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Emergency Drill Reports field.';
                }
                field("No. of Risk Incident Logs"; Rec."No. of Risk Incident Logs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Risk Incident Logs field.';
                }
                field("No. of OSH Trainings"; Rec."No. of OSH Trainings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of OSH Trainings field.';
                }
                field("No. of OSH Meetings"; Rec."No. of OSH Meetings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of OSH Meetings field.';
                }
                field("No. of OSH Inspection Reports"; Rec."No. of OSH Inspection Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of OSH Inspection Reports field.';
                }
                field("No. of OSH Imp. Status Reports"; Rec."No. of OSH Imp. Status Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of OSH Imp. Status Reports field.';
                }
            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("OSH Management Plan Nos."; Rec."OSH Management Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Management Plan Nos. field.';
                }
                field("Safe Work Permit Apps Nos."; Rec."Safe Work Permit Apps Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safe Work Permit Apps Nos. field.';
                }
                field("Safe Work Compln Report Nos."; Rec."Safe Work Compln Report Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safe Work Compln Report Nos. field.';
                }
                field("Emergency Drill Report Nos."; Rec."Emergency Drill Report Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Emergency Drill Report Nos. field.';
                }
                field("Risk Incident Report Nos."; Rec."Risk Incident Report Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Incident Report Nos. field.';
                }
                field("OSH Training Nos."; Rec."OSH Training Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Training Nos. field.';
                }
                field("OSH Meeting Nos."; Rec."OSH Meeting Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Meeting Nos. field.';
                }
                field("OSH Inspection Report Nos."; Rec."OSH Inspection Report Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Inspection Report Nos. field.';
                }
                field("OSH Impl. Status Report Nos."; Rec."OSH Impl. Status Report Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Impl. Status Report Nos. field.';
                }
                field("Risk Incident Follow-up Nos."; Rec."Risk Incident Follow-up Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Incident Follow-up Nos. field.';
                }
                field("Implementation Status Nos."; Rec."Implementation Status Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Implementation Status Nos. field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Hazard Types")
            {
                ApplicationArea = Basic;
                Image = Bank;
                RunObject = Page "Hazard Types";
                ToolTip = 'Executes the Hazard Types action.';
            }
            action("Hazard Identification Methods")
            {
                ApplicationArea = Basic;
                Image = LiFo;
                RunObject = Page "Hazard Identification Methods";
                ToolTip = 'Executes the Hazard Identification Methods action.';
            }
            action("Evacuation Events")
            {
                ApplicationArea = Basic;
                Image = "Event";
                RunObject = Page "Evacuation Events";
                ToolTip = 'Executes the Evacuation Events action.';
            }
            action("Workplace Prohibited Items")
            {
                ApplicationArea = Basic;
                Image = Alerts;
                RunObject = Page "Workplace Prohibited Items";
                ToolTip = 'Executes the Workplace Prohibited Items action.';
            }
            action("Safety Equipment Categories")
            {
                ApplicationArea = Basic;
                Image = Category;
                RunObject = Page "HSE Equipment Categorxies";
                ToolTip = 'Executes the Safety Equipment Categories action.';
            }
            action("Safe Work Permit Types")
            {
                ApplicationArea = Basic;
                Image = Category;
                RunObject = Page "Safe Work Permit Types";
                ToolTip = 'Executes the Safe Work Permit Types action.';
            }
            action("Safety Workgroups")
            {
                ApplicationArea = Basic;
                Image = Group;
                RunObject = Page "Safety Workgroups";
                ToolTip = 'Executes the Safety Workgroups action.';
            }
            action("Rules & Regulations Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                RunObject = Page "OSH Rule Template Categories";
                ToolTip = 'Executes the Rules & Regulations Templates action.';
            }
            action("Safety Inspection Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                RunObject = Page "Inspection Templates";
                ToolTip = 'Executes the Safety Inspection Templates action.';
            }
            action("OSH Roles & Responsibilities")
            {
                ApplicationArea = Basic;
                Image = Route;
                RunObject = Page "HSE Role Members";
                ToolTip = 'Executes the OSH Roles & Responsibilities action.';
            }
            action("OSH Legal Instruments")
            {
                ApplicationArea = Basic;
                Caption = 'OSH Legal Instruments & Standards';
                Image = BarCode;
                RunObject = Page "OSH Legal Instruments";
                ToolTip = 'Executes the OSH Legal Instruments & Standards action.';
            }
            action("Incident Severity Levels")
            {
                ApplicationArea = Basic;
                Image = Language;
                RunObject = Page "Incident Severity Levels";
                ToolTip = 'Executes the Incident Severity Levels action.';
            }
            action("Incident Party Types")
            {
                ApplicationArea = Basic;
                Image = "Action";
                RunObject = Page "Incident Party Types";
                ToolTip = 'Executes the Incident Party Types action.';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Primary Key", Rec."Primary Key");
                    Report.Run(69400, true, true, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Hazard Types_Promoted"; "Hazard Types")
                {
                }
                actionref("Hazard Identification Methods_Promoted"; "Hazard Identification Methods")
                {
                }
                actionref("Evacuation Events_Promoted"; "Evacuation Events")
                {
                }
                actionref("Workplace Prohibited Items_Promoted"; "Workplace Prohibited Items")
                {
                }
                actionref("Safety Equipment Categories_Promoted"; "Safety Equipment Categories")
                {
                }
                actionref("Safe Work Permit Types_Promoted"; "Safe Work Permit Types")
                {
                }
                actionref("Rules & Regulations Templates_Promoted"; "Rules & Regulations Templates")
                {
                }
                actionref("Safety Inspection Templates_Promoted"; "Safety Inspection Templates")
                {
                }
                actionref("OSH Roles & Responsibilities_Promoted"; "OSH Roles & Responsibilities")
                {
                }
                actionref("OSH Legal Instruments_Promoted"; "OSH Legal Instruments")
                {
                }
                actionref("Incident Severity Levels_Promoted"; "Incident Severity Levels")
                {
                }
                actionref("Incident Party Types_Promoted"; "Incident Party Types")
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref("Safety Workgroups_Promoted"; "Safety Workgroups")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

