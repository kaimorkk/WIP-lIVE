Page 52193746 "Payment Listing"
{
    CardPageID = "Payment Voucher Card";
    Editable = false;
    PageType = List;
    SourceTable = Payments;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }

                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(PayMode; "Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo; "Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount; "Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeType; "Cheque Type")
                {
                    ApplicationArea = Basic;
                }

                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankAccount; "Paying Bank Account")
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

