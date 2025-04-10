Page 52194072 "Email Log"
{
    ApplicationArea = Basic;
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Mail Log";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(AlertType;"Alert Type")
                {
                    ApplicationArea = Basic;
                }
                field(DateSent;"Date Sent")
                {
                    ApplicationArea = Basic;
                }
                field(TimeSent;"Time Sent")
                {
                    ApplicationArea = Basic;
                }
                field(MailReceiver;"Mail Receiver")
                {
                    ApplicationArea = Basic;
                }
                field(MailSender;"Mail Sender")
                {
                    ApplicationArea = Basic;
                }
                field(EmailMessage;"Email Message")
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field(MailSubject;"Mail Subject")
                {
                    ApplicationArea = Basic;
                }
                field(SentBy;"Sent By")
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

