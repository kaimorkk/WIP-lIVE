Page 52193671 "Notifications List"
{
    ApplicationArea = Basic;
    CardPageID = "Notification Card";
    PageType = List;
    SourceTable = Notifications;
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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Subject;Subject)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000001;Links)
            {
            }
            systempart(Control1000000000;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }
}

