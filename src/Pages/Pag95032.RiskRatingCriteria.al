

page 95032 "Risk Rating Criteria"
{
    CardPageID = "Risk Rating Criterion";
    PageType = List;
    SourceTable = "Risk Rating Criteria";

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

