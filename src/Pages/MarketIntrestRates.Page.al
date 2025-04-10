Page 52193506 "Market Intrest Rates"
{
    PageType = ListPart;
    SourceTable = "Market Intrest Rates";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(StartDate; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Intrest; Intrest)
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

