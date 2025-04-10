

page 69406 "Emergency Evacuation Event"
{
    PageType = Card;
    SourceTable = "Evacuation Event";

    layout
    {
        area(content)
        {
            group(General)
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
            part(Control9; "Evacuation Event Procedure Lin")
            {
                Caption = 'Evacuation Procedures';
                SubPageLink = "Evacuation Event ID" = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Drill Evacuation Criteria")
            {
                ApplicationArea = Basic;
                Caption = 'Drill Evacuation Criteria';
                Image = CreatePutawayPick;
                RunObject = Page "Evacuation Event D. Criteria";
                RunPageLink = "Event ID" = field(Code);
                ToolTip = 'Executes the Drill Evacuation Criteria action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Drill Evacuation Criteria_Promoted"; "Drill Evacuation Criteria")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

