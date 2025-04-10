

page 69405 "Evacuation Events"
{
    CardPageID = "Emergency Evacuation Event";
    Editable = false;
    PageType = List;
    SourceTable = "Evacuation Event";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Hazard Type"; Rec."Hazard Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard Type field.';
                }
                field("No. of Planned Emerge Drills"; Rec."No. of Planned Emerge Drills")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planned Emerge Drills field.';
                }
                field("No. of Conducted Emerge Drills"; Rec."No. of Conducted Emerge Drills")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Conducted Emerge Drills field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

