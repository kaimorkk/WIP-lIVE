Page 52193492 "Security Types"
{
    PageType = ListPart;
    SourceTable = "Security Type";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Used;Used)
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

