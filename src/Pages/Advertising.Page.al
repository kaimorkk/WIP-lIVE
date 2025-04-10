Page 52193866 Advertising
{
    PageType = ListPart;
    SourceTable = Advertising1;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(AdvertisingMedia;"Advertising Media")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(AdvertisementDocLink;"Advertisement Doc Link")
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

