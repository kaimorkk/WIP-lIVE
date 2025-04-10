Page 52193571 "Banking Schedule"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Transactions;
    SourceTableView = where(Type=filter("Cheque Deposit"),
                            Posted=const(true),
                            "Banking Posted"=const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
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
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeType;"Cheque Type")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate;"Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(BankName;"Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionDate;"Transaction Date")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(ClearingCharges;"Clearing Charges")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingDays;"Clearing Days")
                {
                    ApplicationArea = Basic;
                }
                field(Select;Select)
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

