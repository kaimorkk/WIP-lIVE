Page 52193529 "Refunds Subform"
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
                field(UnallocatedFunds;"Un-allocated Funds")
                {
                    ApplicationArea = Basic;
                }
                field(RefundRequestAmount;"Refund Request Amount")
                {
                    ApplicationArea = Basic;
                }
                field(CurrentStatus;"Current Status")
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
                field(RefundIssued;"Refund Issued")
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

