Page 52193530 "Withdrawals Subform"
{
    PageType = List;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(CurrentShares;"Current Shares")
                {
                    ApplicationArea = Basic;
                }
                field(OustandingBalance;"Oustanding Balance")
                {
                    ApplicationArea = Basic;
                }
                field(InsuranceFund;"Insurance Fund")
                {
                    ApplicationArea = Basic;
                }
                field(DividendAmount;"Dividend Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationDate;"Application Date")
                {
                    ApplicationArea = Basic;
                }
                field(StatusWithdrawalApp;"Status - Withdrawal App.")
                {
                    ApplicationArea = Basic;
                }
                field(FOSAAccount;"FOSA Account")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No.")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate;"Cheque Date")
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

