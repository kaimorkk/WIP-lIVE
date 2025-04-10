Page 52194058 "HR Relative"
{
    PageType = Card;
    SourceTable = "HR Relative1";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Relationship;Relationship)
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

