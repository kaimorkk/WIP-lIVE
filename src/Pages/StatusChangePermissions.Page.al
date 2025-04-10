Page 52193567 "Status Change Permissions"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Status Change Permisions";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Function";"Function")
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000006;Notes)
            {
            }
            systempart(Control1000000005;MyNotes)
            {
            }
            systempart(Control1000000004;Links)
            {
            }
        }
    }

    actions
    {
    }
}

