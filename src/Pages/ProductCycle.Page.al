Page 52193503 "Product Cycle"
{
    PageType = Card;
    SourceTable = "Product Cycles";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ProductCode;"Product Code")
                {
                    ApplicationArea = Basic;
                }
                field(Cycle;Cycle)
                {
                    ApplicationArea = Basic;
                }
                field(MaxInstallments;"Max. Installments")
                {
                    ApplicationArea = Basic;
                }
                field(MaxAmount;"Max. Amount")
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

