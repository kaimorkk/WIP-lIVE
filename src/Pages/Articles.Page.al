Page 52194189 Articles
{
    CardPageID = "Aticles Card";
    PageType = List;
    SourceTable = Articles1;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(MiscArticle;"Misc. Article")
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
                field(SerialNo;"Serial No")
                {
                    ApplicationArea = Basic;
                }
                field(InUse;"In Use")
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

