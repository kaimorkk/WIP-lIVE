Page 52193988 "Medical Cover List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Medical Cover Types1";

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
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Provider;Provider)
                {
                    ApplicationArea = Basic;
                }
                field(NameofProvider;"Name of Provider")
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

