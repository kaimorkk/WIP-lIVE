Page 52193674 "Send Email Notifications"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Email Notifications";
    SourceTableView = where("Email Sent"=const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EmailAddress;"Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(EmailSent;"Email Sent")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000004;Notes)
            {
            }
            systempart(Control1000000003;MyNotes)
            {
            }
            systempart(Control1000000002;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ImportEmails)
            {
                ApplicationArea = Basic;
                Caption = 'Import Emails';
                // RunObject = XMLport UnknownXMLport51404072;
                Visible = false;
            }
            action(Action1000000001)
            {
                ApplicationArea = Basic;
                Caption = 'Import Emails';
                Image = Import;
                // RunObject = Report UnknownReport51403052;
            }
            action(SendNotification)
            {
                ApplicationArea = Basic;
                Caption = 'Send Notification';
                Image = SendMail;

                trigger OnAction()
                begin
                    if Page.RunModal(51507717,NotificationRec)=Action::LookupOK then begin
                       NotificationMgt.sendNotifications(NotificationRec.Code);
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Action1000000001_Promoted; Action1000000001)
                {
                }
                actionref(SendNotification_Promoted; SendNotification)
                {
                }
            }
        }
    }

    var
        NotificationRec: Record Notifications;
        NotificationMgt: Codeunit Notifications;
}

