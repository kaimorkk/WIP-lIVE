Page 52193662 "SMS Message View"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = SMS;
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
        area(processing)
        {
            action("Birthday Notification")
            {
                ApplicationArea = Basic;
                Caption = 'BIRTHDAY';
                Image = MachineCenterLoad;
                // RunObject = Report UnknownReport51403014;
            }
            action("Contribution Notification")
            {
                ApplicationArea = Basic;
                Caption = 'Deposit';
                Image = MachineCenterLoad;
                // RunObject = Report UnknownReport51403033;
            }
            action("Member Notification")
            {
                ApplicationArea = Basic;
                Caption = 'Member No';
                Image = MachineCenterLoad;
                // RunObject = Report UnknownReport51403030;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Birthday Notification_Promoted"; "Birthday Notification")
                {
                }
                actionref("Contribution Notification_Promoted"; "Contribution Notification")
                {
                }
                actionref("Member Notification_Promoted"; "Member Notification")
                {
                }
            }
        }
    }
}

