Page 52193593 "Transaction Schedule Income"
{
    PageType = List;
    SourceTable = "Transaction Schedule Income";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(CIFNo;"CIF No")
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
                field(LoanRepayment;"Loan Repayment")
                {
                    ApplicationArea = Basic;
                }
                field(Imported;Imported)
                {
                    ApplicationArea = Basic;
                }
                field(ImportDate;"Import Date")
                {
                    ApplicationArea = Basic;
                }
                field(CommsCharged;"Comms Charged")
                {
                    ApplicationArea = Basic;
                }
                field(Principal;Principal)
                {
                    ApplicationArea = Basic;
                }
                field(Interest;Interest)
                {
                    ApplicationArea = Basic;
                }
                field(LoanType;"Loan Type")
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

