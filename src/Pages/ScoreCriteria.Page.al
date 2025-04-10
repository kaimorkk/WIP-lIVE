Page 52194413 "Score Criteria"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Score Criteria";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;"No.")
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
            }
        }
    }

    actions
    {
    }
}

