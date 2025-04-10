Page 52194147 "Travel Rates"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Trip Advances1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(JobGroup;"Job Group")
                {
                    ApplicationArea = Basic;
                }
                field(Country;Country)
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field(AdvanceCode;"Advance Code")
                {
                    ApplicationArea = Basic;
                }
                field(EffectiveDate;"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;"Currency Code")
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

