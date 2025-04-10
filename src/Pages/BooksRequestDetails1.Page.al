Page 52193765 "Books Request Details1"
{
    PageType = ListPart;
    SourceTable = "Book Issue Details1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field(BookNo;"Book No")
                {
                    ApplicationArea = Basic;
                }
                field(BookDescription;"Book Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ISBN;ISBN)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IssueDate;"Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field(DueDate;"Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(IssuerNo;"Issuer No.")
                {
                    ApplicationArea = Basic;
                }
                field(IssuerName;"Issuer Name.")
                {
                    ApplicationArea = Basic;
                }
                field(Issued;"Issued?")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate;"Return Date")
                {
                    ApplicationArea = Basic;
                }
                field(Returned;"Returned?")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        fileMoveNo: Code[20];
        fileMovementRec: Record "Book Issue Details1";


    procedure GetfileMovement(var fieMovement: Code[20])
    var
        fileMovementRec: Record "Book Issue Details1";
    begin
        fieMovement:=Rec.Code;
    end;
}

