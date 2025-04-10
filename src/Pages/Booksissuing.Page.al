Page 52193764 "Books issuing"
{
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Book Issue Details1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestNo;"Request No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BookNo;"Book No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field(Issued;"Issued?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                label(Control1000000019)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19059044;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(IssueDate;"Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field(DueDate;"Due Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IssuerNo;"Issuer No.")
                {
                    ApplicationArea = Basic;
                }
                field(IssuerName;"Issuer Name.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CompleteIssue)
            {
                ApplicationArea = Basic;
                Caption = 'Complete Issue.';

                trigger OnAction()
                begin
                    TestField("Issue Date");
                    TestField("Issuer No.");
                    
                    if "Issued?"=true then
                    Error('Book has already been issued');
                    
                    
                    Book.Get("Book No");
                    
                    if Book.Status=Book.Status::"Not Available" then begin
                    //"Issue Date":='';
                    Clear("Due Date");
                    Clear("Issuer No.");
                    Clear("Issuer Name.");
                    Modify;
                    Error('Book Not Available');
                    
                    end else  begin
                    Book.Get("Book No");
                    Book.Status:=Book.Status::"Not Available";
                    Book.Modify;
                    
                    BooksReq.Get("Request No");
                    "Borrower No.":=BooksReq."Employee No";
                    "Borrower Name":=BooksReq."Employee Name";
                    BooksReq.Modify;
                    "Issued?":=true;
                    Modify;
                    
                    Message('Issue Succesful');
                    end;
                    
                    /*
                    EmployeeRec.RESET;
                    IF EmployeeRec.GET("Employee No.") THEN
                    email:=EmployeeRec."Company E- Mail";
                     */
                    
                    Detail:="Employee Name"+' '+text1+"Request No.";
                    // Mail.NewIncidentMail("System Support Email Address","Request No.",Detail);

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(CompleteIssue_Promoted; CompleteIssue)
                {
                }
            }
        }
    }

    var
        Book: Record Books1;
        BooksReq: Record "Book Issue1";
        Mail: Codeunit Mail;
        Detail: Text[30];
        text1: label ' Requisition No.';
        EmployeeRec: Record Employee;
        Text19059044: label 'ENTER ISSUE DETAILS';
}

