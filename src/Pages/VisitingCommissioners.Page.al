Page 52193825 "Visiting Commissioners"
{
    PageType = ListPart;
    SourceTable = "Visiting Commissioners1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(VisitNo;"Visit No.")
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
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

