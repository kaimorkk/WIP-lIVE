Page 52193548 "Transaction Charges"
{
    AutoSplitKey = true;
    PageType = CardPart;
    SourceTable = "Transaction Charges";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ChargeCode;"Charge Code")
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
                field(PercentageofAmount;"Percentage of Amount")
                {
                    ApplicationArea = Basic;
                }
                field(UsePercentage;"Use Percentage")
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;"G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumAmount;"Minimum Amount")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumAmount;"Maximum Amount")
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

