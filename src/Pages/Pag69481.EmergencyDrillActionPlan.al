

page 69481 "Emergency Drill Action Plan"
{
    PageType = Card;
    SourceTable = "Emergency Drill Action Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Evacuation Event ID"; Rec."Evacuation Event ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Event ID field.';
                }
                field("Criteria Code"; Rec."Criteria Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Code field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Action"; Rec.Action)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility field.';
                }
                field("Owner ID"; Rec."Owner ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Owner ID field.';
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

