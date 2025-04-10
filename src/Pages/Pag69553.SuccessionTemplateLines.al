

page 69553 "Succession Template Lines"
{
    PageType = ListPart;
    SourceTable = "Succession Template Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Initiative Category"; Rec."Initiative Category")
                {
                    ApplicationArea = Basic;
                }
                field(Initiative; Rec.Initiative)
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

