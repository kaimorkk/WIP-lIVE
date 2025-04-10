Page 52193650 "Death Certificate Details"
{
    PageType = List;
    SourceTable = "Death Certificate Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Detail;Detail)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000004;MyNotes)
            {
            }
        }
    }

    actions
    {
    }
}

