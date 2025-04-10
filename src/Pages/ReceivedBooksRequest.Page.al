Page 52193763 "Received Books Request"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Book Issue1";
    SourceTableView = where(Requested=const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestNo;"Request No.")
                {
                    ApplicationArea = Basic;
                }
                field(User;User)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestDate;"Request Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part(fileMove;"Books Request Details1")
            {
                SubPageLink = "Request No"=field("Request No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(IssueBooks)
            {
                ApplicationArea = Basic;
                Caption = 'Issue Books';
                RunObject = Page "Books issuing";
                RunPageLink = "Request No"=field("Request No.");
            }
            action(ReceiveBook)
            {
                ApplicationArea = Basic;
                Caption = 'Receive Book';

                trigger OnAction()
                begin
                    CurrPage.fileMove.Page.GetfileMovement(fileMoveNo);
                    fileMovementRec.Reset;
                    fileMovementRec.SetRange(fileMovementRec.Code,fileMoveNo);
                    Page.Run(51511024,fileMovementRec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(IssueBooks_Promoted; IssueBooks)
                {
                }
                actionref(ReceiveBook_Promoted; ReceiveBook)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
          CompInfo.Get;
         // "System Support Email Address":=CompInfo."Registry Email";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
          CompInfo.Get;
          //"System Support Email Address":=CompInfo."Registry Email";
    end;

    var
        Mail: Codeunit Mail;
        CompInfo: Record "Company Information";
        text1: label 'Has requested books in Requisition No.';
        Detail: Text[100];
        fileMoveNo: Code[20];
        fileMovementRec: Record "Book Issue Details1";
}

