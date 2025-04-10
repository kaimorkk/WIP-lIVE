Page 52193702 "PV Lines11"
{
    PageType = List;
    SourceTable = "PV Lines1";

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
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppliestoDocNo;"Applies to Doc. No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(WTaxCode;"W/Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field(VATCode;"VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(VATAmount;"VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field(WTaxAmount;"W/Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field(NetAmount;"Net Amount")
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

