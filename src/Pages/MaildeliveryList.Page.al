Page 52193848 "Mail/delivery List"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Mail/Document Movement1";

    layout
    {
        area(content)
        {
            repeater(Control1000000016)
            {
                field(MovementCode;"Movement Code")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiverType;"Receiver Type")
                {
                    ApplicationArea = Basic;
                }
                field(Document;Document)
                {
                    ApplicationArea = Basic;
                }
                field(Mail;Mail)
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDescription;"Document Description")
                {
                    ApplicationArea = Basic;
                }
                field(MailDescription;"Mail Description")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Time;Time)
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Receiver;Receiver)
                {
                    ApplicationArea = Basic;
                }
                field(ReceiverName;"Receiver Name")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivingDate;"Receiving Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivingTime;"Receiving Time")
                {
                    ApplicationArea = Basic;
                }
                field(Received;"Received?")
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

