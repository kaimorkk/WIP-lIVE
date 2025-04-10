Page 52194164 "Appraisal Format Header Setup"
{
    PageType = List;
    SourceTable = "Appraisal Format Header1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Header;Header)
                {
                    ApplicationArea = Basic;
                }
                field(Priority;Priority)
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

