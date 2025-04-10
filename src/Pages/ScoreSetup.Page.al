Page 52194161 "Score Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Score Setup1";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ScoreID;"Score ID")
                {
                    ApplicationArea = Basic;
                }
                field(Score;Score)
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

