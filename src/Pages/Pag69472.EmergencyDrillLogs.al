

page 69472 "Emergency Drill Logs"
{
    CardPageID = "Emergency Drill Log";
    Editable = false;
    PageType = List;
    SourceTable = "Emergency Drill Log";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Drill ID"; Rec."Drill ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill ID field.';
                }
                field("Drill Document Type"; Rec."Drill Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Document Type field.';
                }
                field("OSH Management Plan ID"; Rec."OSH Management Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Management Plan ID field.';
                }
                field("OSH Plan Calendar ID"; Rec."OSH Plan Calendar ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Plan Calendar ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Evacuation Event ID"; Rec."Evacuation Event ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Event ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date of Drill"; Rec."Date of Drill")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Drill field.';
                }
                field("Drill Start Time"; Rec."Drill Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Start Time field.';
                }
                field("Drill End Time"; Rec."Drill End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill End Time field.';
                }
                field("Overall Drill Manager ID"; Rec."Overall Drill Manager ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Drill Manager ID field.';
                }
                field("Drill Location Details"; Rec."Drill Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Location Details field.';
                }
                field("Assembly Point Location"; Rec."Assembly Point Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assembly Point Location field.';
                }
                field("Prior Notice to Staff"; Rec."Prior Notice to Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prior Notice to Staff field.';
                }
                field("Notice to Staff Date"; Rec."Notice to Staff Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice to Staff Date field.';
                }
                field("Total No. of People Involved"; Rec."Total No. of People Involved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of People Involved field.';
                }
                field("Total No. of People Evacuated"; Rec."Total No. of People Evacuated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of People Evacuated field.';
                }
                field("Total No. of recorded Injuries"; Rec."Total No. of recorded Injuries")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of recorded Injuries field.';
                }
                field("Time Evacuation Started"; Rec."Time Evacuation Started")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Evacuation Started field.';
                }
                field("Time Evacuation Ended"; Rec."Time Evacuation Ended")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Evacuation Ended field.';
                }
                field("Evacuation Delay Time"; Rec."Evacuation Delay Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Delay Time field.';
                }
                field("Overall Drill Standard"; Rec."Overall Drill Standard")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Drill Standard field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

