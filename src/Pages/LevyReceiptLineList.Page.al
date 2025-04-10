Page 52194310 "Levy Receipt Line List"
{
    PageType = Card;
    SourceTable = "Levy Receipt Lines";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(RegistrationNo;"Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field(LineNo;"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentType;"Payment Type")
                {
                    ApplicationArea = Basic;
                }
                field(InPaymentFor;"In Payment For")
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
                field(CustomerNo;"Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field(LevyReferenceNo;"Levy Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
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
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code;"Global Dimension 2 Code")
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

