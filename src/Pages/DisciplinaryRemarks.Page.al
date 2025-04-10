Page 52194107 "Disciplinary Remarks"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Disciplinary Remarks1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Remark;Remark)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

