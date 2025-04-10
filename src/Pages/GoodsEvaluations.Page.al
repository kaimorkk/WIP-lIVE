Page 52193458 "Goods Evaluations"
{
    PageType = List;
    SourceTable = "Goods Evaluations";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ItemNo; "Item No")
                {
                    ApplicationArea = Basic;
                }
                field(Criteria; Criteria)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Comments)
                {
                    ApplicationArea = Basic;
                }
                field(Score; Score)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Notes)
            {
            }
            systempart(Control1000000009; MyNotes)
            {
            }
            systempart(Control1000000010; Links)
            {
            }
        }
    }

    actions
    {
    }
}

