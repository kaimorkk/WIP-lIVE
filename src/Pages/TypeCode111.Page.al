Page 52193691 "Type Code111"
{
    PageType = List;
    SourceTable = "Type Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TypeCode;"Type Code")
                {
                    ApplicationArea = Basic;
                }
                field(TypeName;"Type Name")
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

