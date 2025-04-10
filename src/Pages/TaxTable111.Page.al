Page 52193605 "Tax Table111"
{
    PageType = List;
    SourceTable = Brackets;

    layout
    {
        area(content)
        {
            repeater(Group)
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
                }
                field(UpperLimit;"Upper Limit")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Totaltaxable;"Total taxable")
                {
                    ApplicationArea = Basic;
                }
                field(FromDate;"From Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(FactorWithoutHousing;"Factor Without Housing")
                {
                    ApplicationArea = Basic;
                }
                field(FactorWithHousing;"Factor With Housing")
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

