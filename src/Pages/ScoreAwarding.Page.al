Page 52194414 "Score Awarding"
{
    PageType = List;
    SourceTable = "Score Awarding";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Supplier;Supplier)
                {
                    ApplicationArea = Basic;
                }
                field(ScoreCriteria;"Score Criteria")
                {
                    ApplicationArea = Basic;
                }
                field(MaxScore;"Max Score")
                {
                    ApplicationArea = Basic;
                }
                field(ScoreAwarded;"Score Awarded")
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

