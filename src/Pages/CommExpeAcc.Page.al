Page 52193952 "Comm Expe Acc"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Commissioner Expe Payables1";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(CommExpensePayableAcc;"Comm Expense Payable Acc")
                {
                    ApplicationArea = Basic;
                }
                field(Tax;"Tax %")
                {
                    ApplicationArea = Basic;
                }
                field(CommTaxAcc;"Comm Tax Acc")
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

