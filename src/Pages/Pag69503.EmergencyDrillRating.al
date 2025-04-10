

page 69503 "Emergency Drill Rating"
{
    PageType = Card;
    SourceTable = "Emergency Drill Rating";

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
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Evaluation Criterion"; Rec."Evaluation Criterion")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Criterion field.';
                }
                field("Additional Comments/Notes"; Rec."Additional Comments/Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments/Notes field.';
                }
                field("General Rating"; Rec."General Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Rating field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

