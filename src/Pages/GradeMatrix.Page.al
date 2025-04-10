Page 52194111 "Grade Matrix"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Appraisal Grades1";
    SourceTableView = sorting("Lowest Points Awarded")
                      order(descending);
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Grade;Grade)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(LowestPointsAwarded;"Lowest Points Awarded")
                {
                    ApplicationArea = Basic;
                }
                field(HighestPointsAwarded;"Highest Points Awarded")
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

