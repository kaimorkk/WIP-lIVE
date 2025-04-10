

page 95136 "Complaince FRM Principl Detail"
{
    PageType = Card;
    SourceTable = "Complaince FRM Principl Detail";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Framework ID"; Rec."Framework ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Framework ID field.';
                }
                field("Guiding Principle ID"; Rec."Guiding Principle ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Guiding Principle ID field.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
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

