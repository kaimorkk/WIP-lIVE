Page 52194198 "Sms Message"
{
    PageType = Card;
    SourceTable = "Sms Message1";
    SourceTableView = where(Posted=const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Message;Message)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Sent;Posted)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sent';
                    Editable = false;
                }
                part(Control1000000010;"Sms Sending")
                {
                    SubPageLink = "No."=field("No.");
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Posted)
            {
                ApplicationArea = Basic;
                Caption = 'Send';

                trigger OnAction()
                begin
                    if Posted=true then
                    Error('This message has been posted');

                    SmsLines.Reset;
                    SmsLines.SetRange(SmsLines."No.","No.");
                    if SmsLines.Find('-') then
                    repeat
                       Sms.Init;
                       Sms.ID:="No.";
                       Sms."Phone No":=SmsLines."Phone No." ;
                       Sms.Message:=Message;
                       Sms."Department Code":=Department;
                       Sms."Department Name":="Department Name";
                       Sms."User ID":=UserId;
                       Sms.Insert;
                       Posted:=true;
                       Modify;
                       SmsLines.Posted:=true;
                       SmsLines.Modify;
                    until SmsLines.Next=0;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Posted_Promoted; Posted)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Date:=Today;
    end;

    var
        SmsLines: Record "Sms Contacts1";
        Sms: Record SMS1;
        LineNo: Integer;
}

