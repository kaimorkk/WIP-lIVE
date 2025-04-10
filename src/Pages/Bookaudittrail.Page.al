Page 52193769 "Book audit trail"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Book Issue Details1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(BorrowerNo;"Borrower No.")
                {
                    ApplicationArea = Basic;
                }
                field(BorrowerName;"Borrower Name")
                {
                    ApplicationArea = Basic;
                }
                field(Issued;"Issued?")
                {
                    ApplicationArea = Basic;
                }
                field(IssueDate;"Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field(DueDate;"Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate;"Return Date")
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
                field(Returned;"Returned?")
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
                }
            }
        }
    }

    actions
    {
    }
}

