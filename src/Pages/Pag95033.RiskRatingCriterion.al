

page 95033 "Risk Rating Criterion"
{
    PageType = Card;
    SourceTable = "Risk Rating Criteria";

    layout
    {
        area(content)
        {
            group(General)
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
                field("Criterion ID"; Rec."Criterion ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

