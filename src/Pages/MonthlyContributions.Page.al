Page 52193460 "Monthly Contributions"
{
    ApplicationArea = Basic;
    CardPageID = "Product Application Card";
    PageType = List;
    SourceTable = "Monthly Contributions";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MemberNo;"Member No.")
                {
                    ApplicationArea = Basic;
                }
                field(MemberName;"Member Name")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ProductCode;"Product Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedContribution;"Expected Contribution")
                {
                    ApplicationArea = Basic;
                }
                field(InterestAmount;"Interest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(TaxCharged;"Tax Charged")
                {
                    ApplicationArea = Basic;
                }
                field(ShareCapital;"Share Capital")
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

