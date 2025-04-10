Page 52193941 "Commissioner ED Setup"
{
    PageType = List;
    SourceTable = "Commissioner ED Setup1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EDCode;"E/D Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
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

