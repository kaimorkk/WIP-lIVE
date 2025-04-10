Page 52193854 "CS  Description"
{
    PageType = ListPart;
    SourceTable = "Custorme Survey Index1";
    SourceTableView = where("Survey Type"=const("CSS Statement"));

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
                    Style = Strong;
                    StyleExpr = true;
                }
            }
        }
    }

    actions
    {
    }
}

