Page 52193609 "Receipts Line Allocation"
{
    PageType = ListPart;
    SourceTable = "Receipt Lines Allocation";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
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
                field(AppliestoDocNo;"Applies to Doc. No")
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
                field(LoanNo;"Loan No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(TransactionCode;"Transaction Code")
                {
                    ApplicationArea = Basic;
                }
                field(ProductCode;"Product Code")
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

