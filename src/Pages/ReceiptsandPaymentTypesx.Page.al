Page 52193748 "Receipts and Payment Typesx"
{
    PageType = Card;
    SourceTable = "Receipts and Payment Types1";

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
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(VATChargeable;"VAT Chargeable")
                {
                    ApplicationArea = Basic;
                }
                field(WithholdingTaxChargeable;"Withholding Tax Chargeable")
                {
                    ApplicationArea = Basic;
                }
                field(VATCode;"VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field(WithholdingTaxCode;"Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field(DefaultGrouping;"Default Grouping")
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;"G/L Account")
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

