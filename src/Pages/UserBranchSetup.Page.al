Page 52193590 "User Branch Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "User Setup";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(Branch;Branch)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000003;Links)
            {
                Visible = true;
            }
            systempart(Control1000000002;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }
}

