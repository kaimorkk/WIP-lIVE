

page 69156 "Feedback Lines"
{
    PageType = ListPart;
    SourceTable = "Training Evaluation Lines";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Evaluation Area"; Rec."Evaluation Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Area field.';
                }
                field(Rating; Rec.Rating)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

