Page 52193956 "Tax Table"
{
    PageType = List;
    SourceTable = BracketsX1;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(TableCode;"Table Code")
                {
                    ApplicationArea = Basic;
                }
                field(TaxBand;"Tax Band")
                {
                    ApplicationArea = Basic;
                }
                field(TaxableAmount;"Taxable Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
                {
                    ApplicationArea = Basic;
                }
                field(LowerLimit;"Lower Limit")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(UpperLimit;"Upper Limit")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(FromDate;"From Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Institution;Institution)
                {
                    ApplicationArea = Basic;
                }
                field(ContributionRatesInclusive;"Contribution Rates Inclusive")
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

