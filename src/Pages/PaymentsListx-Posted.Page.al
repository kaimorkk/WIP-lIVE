Page 52193630 "Payments Listx-Posted"
{
    ApplicationArea = Basic;
    Caption = 'Posted Payments List';
    CardPageID = "Paymentsx-Posted";
    Editable = false;
    PageType = List;
    SourceTable = Payments1;
    SourceTableView = where(Posted=filter(true));
    UsageCategory = History;

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
                field(PaymentDate;"Payment Date")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Cashier;Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(BankAccount;"Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(ExtDocumentNo;"Ext. Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(PaymentMode;"Payment Mode")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No.")
                {
                    ApplicationArea = Basic;
                }
                field(AmountPaid;"Amount Paid")
                {
                    ApplicationArea = Basic;
                }
                field(Control1000000017;"Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate;"Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(PostedBy;"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field(PostedDate;"Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field(TimePosted;"Time Posted")
                {
                    ApplicationArea = Basic;
                }
                field(ActivityCode;"Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(PaymentTypes;"Payment Types")
                {
                    ApplicationArea = Basic;
                }
                field(EmployerCode;"Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployerName;"Employer Name")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentTo;"Payment To")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(AppliesToDocNo;"Applies- To Doc No.")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;"Currency Code")
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

