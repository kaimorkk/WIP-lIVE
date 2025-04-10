

page 69757 "Referee Recommendation Lines"
{
    Caption = 'Referee Recommendation Lines';
    PageType = ListPart;
    SourceTable = "Referee Recommendation Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reference Category"; Rec."Reference Category")
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

