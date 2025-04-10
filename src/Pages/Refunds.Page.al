Page 52193528 Refunds
{
    PageType = List;
    SourceTable = Refunds;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(LoanNo;"Loan No.")
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

