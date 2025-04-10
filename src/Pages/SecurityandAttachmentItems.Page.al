Page 52193491 "Security and Attachment Items"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Security and Attachment Items";
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
                field(UsedonLoans;"Used on Loans")
                {
                    ApplicationArea = Basic;
                }
                field(UsedonMemberApplication;"Used on Member Application")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000004;Links)
            {
                Visible = true;
            }
            systempart(Control1000000003;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }
}

