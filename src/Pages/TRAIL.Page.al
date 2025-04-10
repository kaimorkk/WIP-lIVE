Page 52193834 TRAIL
{
    PageType = Card;
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
                field(RequestNo;"Request No")
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
                }
                field(ISBN;ISBN)
                {
                    ApplicationArea = Basic;
                }
                field(IssueDate;"Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field(BorrowerNo;"Borrower No.")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate;"Return Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiverNo;"Receiver No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

