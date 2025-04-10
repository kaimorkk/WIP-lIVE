Page 52194363 "Performance Evaluation(Self)"
{
    PageType = ListPart;
    SourceTable = "Appraisal Lines-Probation";
    SourceTableView = where("Appraisal Heading Type"=const("Perfomance Evaluation(Self)"));

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
                field(ScoreCategory;"Score Category(Self)")
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

