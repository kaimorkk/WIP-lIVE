Page 52193864 "Job Requirements"
{
    PageType = Card;
    SourceTable = "Job Requirementx1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(QualificationType;"Qualification Type")
                {
                    ApplicationArea = Basic;
                }
                field(QualificationCode;"Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Qualification;Qualification)
                {
                    ApplicationArea = Basic;
                }
                field(Priority;Priority)
                {
                    ApplicationArea = Basic;
                }
                field(ScoreID;"Score ID")
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

