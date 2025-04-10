Page 52194091 Holidays
{
    PageType = Card;
    SourceTable = "Holidays_Off Days1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

