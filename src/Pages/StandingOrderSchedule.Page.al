Page 52193595 "Standing Order Schedule"
{
    PageType = List;
    SourceTable = "STO Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DestinationAccountNo;"Destination Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(LoanNo;"Loan No.")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(AmountDeducted;"Amount Deducted")
                {
                    ApplicationArea = Basic;
                }
                field(STONo;"STO No.")
                {
                    ApplicationArea = Basic;
                }
                field(SourceNo;"Source No.")
                {
                    ApplicationArea = Basic;
                }
                field(DestinantionAccountType;"Destinantion Account Type")
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

