Page 52193661 "SMS Setup List"
{
    ApplicationArea = Basic;
    CardPageID = "SMS Setup1";
    PageType = List;
    SourceTable = "SMS Setup1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000005;Links)
            {
            }
            systempart(Control1000000004;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }
}

