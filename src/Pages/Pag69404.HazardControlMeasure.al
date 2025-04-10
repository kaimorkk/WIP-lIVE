

page 69404 "Hazard Control Measure"
{
    PageType = Card;
    SourceTable = "Hazard Control Measure";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Hazard Type"; Rec."Hazard Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Recommended Preventive Action"; Rec."Recommended Preventive Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Preventive Action field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

