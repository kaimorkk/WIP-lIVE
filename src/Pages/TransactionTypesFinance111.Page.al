Page 52193720 "Transaction Types Finance111"
{
    PageType = List;
    SourceTable = "Transactions Type Finance";
    ApplicationArea = All;
    Caption = 'Transaction Types';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(TransactionName; "Transaction Name")
                {
                    ApplicationArea = Basic;
                }
                field(AccountType; "Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo; "Account No.")
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

