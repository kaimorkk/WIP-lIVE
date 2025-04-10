Page 52194157 "Fuel Cards"
{
    PageType = List;
    SourceTable = "Fuel Cards1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Company;Company)
                {
                    ApplicationArea = Basic;
                }
                field(CompanyName;"Company Name")
                {
                    ApplicationArea = Basic;
                }
                field(CardNo;"Card No")
                {
                    ApplicationArea = Basic;
                }
                field(Limit;Limit)
                {
                    ApplicationArea = Basic;
                }
                field(PIN;PIN)
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

