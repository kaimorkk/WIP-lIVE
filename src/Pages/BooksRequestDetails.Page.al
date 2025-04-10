Page 52193821 "Books Request Details"
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
            }
        }
    }

    actions
    {
    }
}

