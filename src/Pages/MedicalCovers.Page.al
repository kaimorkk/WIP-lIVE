Page 52193989 "Medical Covers"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Medical Cover Types1";
    UsageCategory = Administration;

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

