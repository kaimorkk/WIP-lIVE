

page 69502 "Emergency Drill Ratings"
{
    CardPageID = "Emergency Drill Rating";
    PageType = List;
    SourceTable = "Emergency Drill Rating";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("General Rating"; Rec."General Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Rating field.';
                }
                field("Additional Comments/Notes"; Rec."Additional Comments/Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments/Notes field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

