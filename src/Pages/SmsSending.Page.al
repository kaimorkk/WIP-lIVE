Page 52194197 "Sms Sending"
{
    PageType = ListPart;
    SourceTable = "Sms Contacts1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(ContactNo;"Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo;"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
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
            // action(Message)
            // {
            //     ApplicationArea = Basic;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = Page "Legal Entity List";
            //     RunPageLink = "Primary Key"=field("No.");
            // }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
           if Posted=true then
           Error('You cannot modify this record, It has been posted!!!!!!!');
    end;

    var
        SmsMessage: Record "Sms Message1";
}

