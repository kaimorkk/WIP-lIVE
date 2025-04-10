Page 52194105 "Disciplinary Actions"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Disciplinary Actions1";
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
                field(Terminate;Terminate)
                {
                    ApplicationArea = Basic;
                }
                field(Document;Document)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
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

