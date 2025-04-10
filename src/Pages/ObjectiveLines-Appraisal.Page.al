Page 52194025 "Objective Lines-Appraisal"
{
    PageType = ListPart;
    SourceTable = "Appraisal Objectives Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Measure;Measure)
                {
                    ApplicationArea = Basic;
                    Caption = 'Objectives';
                }
                field(Objective;Objective)
                {
                    ApplicationArea = Basic;
                    Caption = 'Action Plan(list specific activities)';
                }
                field(TimeFrame;"Agreed Target Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time Frame';
                }
                field(PerformanceRatingweight;"Weighting(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Performance Rating(weight)';
                }
                field(PerformanceRatings;"Performance Ratings(%)")
                {
                    ApplicationArea = Basic;
                }
                field(ReviewCommentsAchievements;"Review Comments/ Achievements")
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

