Page 52193457 "Goods Evaluation Criteria"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Goods Evaluation Criteria";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(EvaluationDescription; "Evaluation Description")
                {
                    ApplicationArea = Basic;
                }
                field(MaxScore; "Max Score")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000006; Notes)
            {
            }
            systempart(Control1000000007; MyNotes)
            {
            }
            systempart(Control1000000008; Links)
            {
            }
        }
    }

    actions
    {
    }
}

