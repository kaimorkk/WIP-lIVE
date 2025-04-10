Page 52193508 "Product Charges"
{
    PageType = ListPart;
    SourceTable = "Product Charges";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(UsePerc;"Use Perc")
                {
                    ApplicationArea = Basic;
                }
                field(IsInsurance;IsInsurance)
                {
                    ApplicationArea = Basic;
                }
                field(ShorttermInsuarance;"Short term Insuarance")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;"G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field(MinAmount;"Min Amount")
                {
                    ApplicationArea = Basic;
                }
                field(MaxAmount;"Max Amount")
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

