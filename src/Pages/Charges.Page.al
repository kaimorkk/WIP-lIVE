Page 52193507 Charges
{
    ApplicationArea = Basic;
    Editable = true;
    PageType = List;
    SourceTable = Charges;
    UsageCategory = Documents;

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
                field(ChargeAmount;"Charge Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ChargeType;"Charge Type")
                {
                    ApplicationArea = Basic;
                }
                field(UsePerc;"Use Perc")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
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
                field(GLAccount;"G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field(IsInsurance;IsInsurance)
                {
                    ApplicationArea = Basic;
                }
                field(Statutory;Statutory)
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

