Page 52193739 "FD Terms"
{
    PageType = List;
    SourceTable = "FD Terms";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Term;Term)
                {
                    ApplicationArea = Basic;
                }
                field(InterestRate;"Interest Rate")
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

