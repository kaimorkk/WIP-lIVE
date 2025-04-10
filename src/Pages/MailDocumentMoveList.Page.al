Page 52193845 "Mail/Document Move List"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Mail/Document Movement1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(MovementCode;"Movement Code")
                {
                    ApplicationArea = Basic;
                }
                field(Document;Document)
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDescription;"Document Description")
                {
                    ApplicationArea = Basic;
                }
                field(Mail;Mail)
                {
                    ApplicationArea = Basic;
                }
                field(MailDescription;"Mail Description")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiverType;"Receiver Type")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(VendorNo;"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field(CustomerNo;"Customer No")
                {
                    ApplicationArea = Basic;
                }
                field(Issuer;Issuer)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }


    procedure GetfileMovement(var fieMovement: Code[20])
    begin
        fieMovement:="Movement Code";
    end;
}

