Page 52193667 "My Sent SMS"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = SMS;
    SourceTableView = where(Sent=const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(PHONENO;PHONENO)
                {
                    ApplicationArea = Basic;
                }
                field(Message;Message)
                {
                    ApplicationArea = Basic;
                }
                field(DATESENT;DATESENT)
                {
                    ApplicationArea = Basic;
                }
                field(SENDERID;SENDERID)
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

