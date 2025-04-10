Page 52194342 "Objective Performance Measures"
{
    PageType = List;
    SourceTable = "Objective Performance Measures";

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
                field(Weighting;"Weighting(%)")
                {
                    ApplicationArea = Basic;
                }
                field(PerformanceRatings;"Performance Ratings")
                {
                    ApplicationArea = Basic;
                }
                field(WeightedRatings;"Weighted Ratings")
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

