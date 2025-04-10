Page 52194343 "Behavioural Competencies"
{
    PageType = ListPart;
    SourceTable = "Appraisal Lines1";
    SourceTableView = where("Appraisal Heading Type"=const("Behavioural Competencies"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective';
                }
                field(Measure;Measure)
                {
                    ApplicationArea = Basic;
                }
                field(ReviewCommentsAchievements;"Review Comments/ Achievements")
                {
                    ApplicationArea = Basic;
                }
                field(Weighting;"Weighting(%)")
                {
                    ApplicationArea = Basic;
                }
                field(PerformanceRatings;"Performance Ratings(%)")
                {
                    ApplicationArea = Basic;
                }
                field(WeightedRatings;"Weighted Ratings(%)")
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

