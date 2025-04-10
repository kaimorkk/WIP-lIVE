

page 69410 "Evacuation Event D. Criterion"
{
    PageType = Card;
    SourceTable = "Evacuation Event Drill Criteri";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Event ID"; Rec."Event ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Event ID field.';
                }
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

