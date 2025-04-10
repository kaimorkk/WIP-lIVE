Page 52194032 "Company Activities"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Company Activities1";
    UsageCategory = Lists;

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
                field(Day;Day)
                {
                    ApplicationArea = Basic;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility;Responsibility)
                {
                    ApplicationArea = Basic;
                }
                field(Costs;Costs)
                {
                    ApplicationArea = Basic;
                }
                field(GLAccountNo;"G/L Account No")
                {
                    ApplicationArea = Basic;
                }
                field(BalAccountType;"Bal. Account Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(BalAccountNo;"Bal. Account No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Post;Post)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AttachmentNo;"Attachment No.")
                {
                    ApplicationArea = Basic;
                }
                field(LanguageCodeDefault;"Language Code (Default)")
                {
                    ApplicationArea = Basic;
                }
                field(Attachement;Attachement)
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

