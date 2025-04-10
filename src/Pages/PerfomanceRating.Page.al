Page 52193851 "Perfomance Rating"
{
    PageType = ListPart;
    SourceTable = "Custorme Survey Index1";
    SourceTableView = where("Survey Type"=const("Performance Rating"));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(SurveyType;"Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field(Statement;Statement)
                {
                    ApplicationArea = Basic;
                }
                field(N;N)
                {
                    ApplicationArea = Basic;
                }
                field(Mean;Mean)
                {
                    ApplicationArea = Basic;
                }
                field(SatisfactionIndex;"Satisfaction Index %")
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

