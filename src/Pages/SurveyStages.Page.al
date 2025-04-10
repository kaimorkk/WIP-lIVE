Page 52193942 "Survey Stages"
{
    PageType = ListPart;
    SourceTable = "Survey Stages1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(SurveyID;"Survey ID")
                {
                    ApplicationArea = Basic;
                }
                field(StageID;"Stage ID")
                {
                    ApplicationArea = Basic;
                }
                field(Finished;Finished)
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

