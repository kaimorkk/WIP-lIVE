

page 69408 "Evacuation Event Procedure"
{
    PageType = Card;
    SourceTable = "Evacuation Event Procedure";

    layout
    {
        area(content)
        {
            group(General)
            {
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

