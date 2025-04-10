

page 69479 "Emergency Drill Finding"
{
    PageType = Card;
    SourceTable = "Emergency Drill Finding";

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
                field("Drill Assessment Criteria"; Rec."Drill Assessment Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Assessment Criteria field.';
                }
                field("General Rating"; Rec."General Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Rating field.';
                }
                field("Additional Comments/Findings"; Rec."Additional Comments/Findings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments/Findings field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

