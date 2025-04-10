Page 52194364 "Performance Evaluation(Apprai)"
{
    PageType = ListPart;
    SourceTable = "Appraisal Lines-Probation";
    SourceTableView = where("Appraisal Heading Type"=const("Perfomance Evaluation(Appraiser)"));

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
                field(Score;"Performance Ratings(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Score';
                }
                field(ScoreCategory;"Score Category(Appraiser)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Score Category';
                }
            }
        }
    }

    actions
    {
    }
}

