Page 52194297 "Payment & Delivery Terms2"
{
    PageType = ListPart;
    SourceTable = "Payment & Delivery Terms";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(InstallmentNo;"Installment No")
                {
                    ApplicationArea = Basic;
                }
                field(PercentageofContractPrice;"Percentage of Contract Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(InclusiveofVAT;"Inclusive of VAT")
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

