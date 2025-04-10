Page 52193665 "SMS Lines"
{
    PageType = List;
    SourceTable = SMS;

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
                field(Message;FullMessage)
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

    var
        FullMessage: Text;
        SmsMessage: BigText;
        SmsInstream: InStream;
}

