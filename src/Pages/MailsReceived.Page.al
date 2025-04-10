Page 52193842 "Mails Received"
{
    PageType = Card;
    SourceTable = Mails1;

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
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Department;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
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
                field(Receiver;Receiver)
                {
                    ApplicationArea = Basic;
                }
                field(ReceiverName;"Receiver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field(CategoryName;"Category Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AvailableinRegistry;"Available in Registry?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(fileMove;"Mail/Document Move List")
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
            action(Receive)
            {
                ApplicationArea = Basic;
                Caption = 'Receive ';

                trigger OnAction()
                begin
                    CurrPage.fileMove.Page.GetfileMovement(fileMoveNo);
                    fileMovementRec.Reset;
                    fileMovementRec.SetRange(fileMovementRec."Movement Code",fileMoveNo);
                    Page.Run(51511120,fileMovementRec);//}
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
                actionref(Receive_Promoted; Receive)
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
        MailMoveForm: Page "Mail/Document Movement";
        fileMoveNo: Code[20];
        fileMovementRec: Record "Mail/Document Movement1";
}

