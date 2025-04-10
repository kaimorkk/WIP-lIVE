Page 52193610 "Cheque Transactions "
{
    PageType = CardPart;
    SourceTable = "Cheque Transactions";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TransactionDate;"Transaction Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TransactionTime;"Transaction Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AccountDescription;"Account Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ChequeType;"Cheque Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ExpectedMaturityDate;"Expected Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ChequeDate;"Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BankNo;"Bank No")
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

