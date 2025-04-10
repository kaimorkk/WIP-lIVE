

page 80209 "Policy Core Value Revisions"
{
    PageType = List;
    SourceTable = w;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Score (%)"; Rec."Score (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type"; Rec."Rating Type")
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

