Page 52193972 "Non Payroll Receipts"
{
    PageType = List;
    SourceTable = "Non Payroll Receipts1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(LoanNo;"Loan No")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptDate;"Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivedFrom;"Received From")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
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

