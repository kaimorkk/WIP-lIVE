

page 95149 "Risk Rating Actual Scale"
{
    PageType = List;
    SourceTable = "Risk Rating Actual Scale";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Rating Scale Type"; Rec."Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Rating Score"; Rec."Rating Score")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Rating"; Rec."Actual Rating")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual_Rating';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

