Page 52194075 "HR Union Queries"
{
    PageType = Card;
    SourceTable = "HR Union Queries1";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(QueryDate;"Query Date")
                {
                    ApplicationArea = Basic;
                }
                field("Query";Query)
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

