Page 52193847 "Mails send"
{
    PageType = Card;
    SourceTable = "Mails send1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("code";code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Datereceived;"Date received")
                {
                    ApplicationArea = Basic;
                }
                field(Time;Time)
                {
                    ApplicationArea = Basic;
                }
                field(SenderCode;"Addressee code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sender Code';
                }
                field(SenderName;"Addressee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sender Name';
                }
                field(CategoryName;"Category Name")
                {
                    ApplicationArea = Basic;
                }
                field(Courierdescription;"Courier description")
                {
                    ApplicationArea = Basic;
                }
            }
            part(fileMove;"Mail/delivery List")
            {
                SubPageLink = Mail=field(code);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Issue)
            {
                ApplicationArea = Basic;
                Caption = 'Issue';
                Image = ReleaseDoc;

                trigger OnAction()
                begin
                    if "Available in Registry?"=false then

                    Error('This Mail is Not Available In Registry.Please Confirm!!');

                    MailMove.Reset;
                    MailMove.SetRange(MailMove.Mail,code);
                    Page.Run(51511117,MailMove);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Issue_Promoted; Issue)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
          "Available in Registry?":=true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
         "Available in Registry?":=true;
    end;

    var
        MailMove: Record "Mail/Document Movement1";
        fileMoveNo: Code[20];
        fileMovementRec: Record "Mail/Document Movement1";
        Addressee: Record "courier people1";
}

