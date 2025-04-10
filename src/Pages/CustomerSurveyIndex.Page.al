Page 52193850 "Customer Survey Index"
{
    PageType = ListPart;
    SourceTable = "Custorme Survey Index1";
    SourceTableView = where("Survey Type"=const("Customer Survey"));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(SurveyType;"Survey Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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

