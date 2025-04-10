Page 52193980 "Score Setup List"
{
    PageType = List;
    SourceTable = "Score Setup1";

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

