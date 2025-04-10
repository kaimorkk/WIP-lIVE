Page 52193657 "Receipts Line111"
{
    PageType = List;
    SourceTable = "Receipt LinesFin";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(VATCode;"VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field(WTaxCode;"W/Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(NetAmount;"Net Amount")
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

