Page 52193766 "Books Receiving"
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
                field(IssueDate;"Issue Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DueDate;"Due Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IssuerNo;"Issuer No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IssuerName;"Issuer Name.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                label(Control1000000019)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19003526;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(Returned;"Returned?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReturnDate;"Return Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiverNo;"Receiver No.")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiverName;"Receiver Name")
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
            action(CompleteReceiving)
            {
                ApplicationArea = Basic;
                Caption = 'Complete Receiving.';

                trigger OnAction()
                begin
                    TestField("Return Date");
                    TestField("Receiver No.");
                    
                    if "Returned?"=true then
                    Error('The book has already been received!');
                    
                    
                    if "Issued?"=false then
                    Error('Confirm if the book was issued!!');
                    
                    /*if "Return Date"='' then
                    ERROR('Please enter the receiving date');
                    */
                    if "Receiver No."='' then
                    Error('Please enter the receiver No');
                    
                    
                    Book.Get("Book No");
                    Book.Status:=Book.Status::Available;
                    Book.Modify;
                    //IF Book.Status=Book.Status::"Not Available" THEN BEGIN
                    //ERROR('Book Not Available');
                    
                    //END ELSE  BEGIN
                    "Returned?":=true;
                    Modify;
                    
                    Message('Book Received Successfully');
                    //END;

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(CompleteReceiving_Promoted; CompleteReceiving)
                {
                }
            }
        }
    }

    var
        Book: Record Books1;
        Text19003526: label 'ENTER RECEIVING  DETAILS';
}

