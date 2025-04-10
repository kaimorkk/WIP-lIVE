Page 52194307 "Levies Lines"
{
    AutoSplitKey = true;
    PageType = List;
    SourceTable = "Levy Receipt Lines";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(LevyReferenceNo;"Levy Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field(InPaymentFor;"In Payment For")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentType;"Payment Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(DocumentNo;"Document No")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentDate;"Payment Date")
                {
                    ApplicationArea = Basic;
                }
                field(Department;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                }
                field(Activity;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity';
                }
            }
        }
    }

    actions
    {
    }
}

