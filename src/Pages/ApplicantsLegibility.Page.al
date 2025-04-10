Page 52193652 "Applicants Legibility"
{
    PageType = List;
    SourceTable = "Applicants Legibility";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Legible;Legible)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000005;Notes)
            {
            }
        }
    }

    actions
    {
    }
}

