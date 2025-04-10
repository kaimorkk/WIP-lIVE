Page 52193649 "Deceased Member Details"
{
    PageType = List;
    SourceTable = "Member Deceased Details";

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
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000005;MyNotes)
            {
            }
        }
    }

    actions
    {
    }
}

