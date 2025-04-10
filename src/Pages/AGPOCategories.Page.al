Page 50123 "AGPO Categories"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "AGPO Categories";
    UsageCategory = Lists;

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

