Page 52194294 "Receipt Lines"
{
    PageType = ListPart;
    SourceTable = "Receipt Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(LineNo;"Line No")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptNo;"Receipt No.")
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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(VATCode;"VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field(VATAmount;"VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field(WTaxCode;"W/Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field(WTaxAmount;"W/Tax Amount")
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

