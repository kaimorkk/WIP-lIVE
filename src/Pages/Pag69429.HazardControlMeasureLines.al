

page 69429 "Hazard Control Measure Lines"
{
    PageType = ListPart;
    SourceTable = "Hazard Control Measure";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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

