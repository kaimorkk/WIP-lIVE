Page 52193715 "Imprest Lines111"
{
    PageType = List;
    SourceTable = "Imprest Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field(TransactionType;"Transaction Type")
                // {
                //     ApplicationArea = Basic;
                // }
                field(ExpenseType; "Expense Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo; "Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ActualSpent; "Actual Spent")
                {
                    ApplicationArea = Basic;
                }
                field(RemainingAmount; "Remaining Amount")
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
        ImprestHeader: Record "Payments HeaderFin";
}

