

page 69447 "HSE Plans"
{
    CardPageID = "HSE Plan";
    Editable = false;
    PageType = List;
    SourceTable = "HSE Plan";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Plan Type"; Rec."Plan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Management Plan ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Safety Rules&Regulations Temp"; Rec."Safety Rules&Regulations Temp")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety Rules&Regulations Temp field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Primary Mission"; Rec."Primary Mission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Mission field.';
                }
                field("Overall Safety Manager"; Rec."Overall Safety Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Safety Manager field.';
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Start Date field.';
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning End Date field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
                field("No. of OSH Management Plans"; Rec."No. of OSH Management Plans")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of OSH Management Plans field.';
                }
                field("No. of Safe Work Permit App"; Rec."No. of Safe Work Permit App")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Safe Work Permit App field.';
                }
                field("No.of Safe Work Completion rep"; Rec."No.of Safe Work Completion rep")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No.of Safe Work Completion rep field.';
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
                field("No. of OSH Imp Status Reports"; Rec."No. of OSH Imp Status Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of OSH Imp Status Reports field.';
                }
                field("No. of Risk Incidents"; Rec."No. of Risk Incidents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Risk Incidents field.';
                }
                field("Actual Financial Impact (LCY)"; Rec."Actual Financial Impact (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Financial Impact (LCY) field.';
                }
                field("Actual Delay/Disruption (Days)"; Rec."Actual Delay/Disruption (Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Delay/Disruption (Days) field.';
                }
                field("Actual No. Injured Persons"; Rec."Actual No. Injured Persons")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual No. Injured Persons field.';
                }
                field("Actual No. of Fatalities"; Rec."Actual No. of Fatalities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual No. of Fatalities field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

