Page 52194357 "Performance Grade Definitions"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Appraisal Grades1";
    SourceTableView = sorting("Lowest Points Awarded")
                      order(descending);

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(LowestPointsAwarded;"Lowest Points Awarded")
                {
                    ApplicationArea = Basic;
                }
                field(HighestPointsAwarded;"Highest Points Awarded")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

