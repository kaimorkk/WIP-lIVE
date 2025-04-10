Page 52194369 "Objectives Measures"
{
    PageType = List;
    SourceTable = "Objectives Measures";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MeasureID;MeasureID)
                {
                    ApplicationArea = Basic;
                }
                field(MeasureDescription;"Measure Description")
                {
                    ApplicationArea = Basic;
                }
                field(Targets;Targets)
                {
                    ApplicationArea = Basic;
                }
                field(Initiatives;Initiatives)
                {
                    ApplicationArea = Basic;
                }
                field(ReviewComments;"Review Comments")
                {
                    ApplicationArea = Basic;
                }
                field(PerformanceRatings;"Performance Ratings")
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

