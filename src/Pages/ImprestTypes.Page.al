Page 50109 "Imprest Types"
{
    PageType = List;
    SourceTable = "Imprest Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Descrption;Descrption)
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

