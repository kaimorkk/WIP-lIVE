

page 69622 "Recruitment Principle"
{
    PageType = ListPart;
    SourceTable = "Recruitment Plan Principle";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Recruitment Plan ID"; Rec."Recruitment Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Guiding Principle ID"; Rec."Guiding Principle ID")
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

