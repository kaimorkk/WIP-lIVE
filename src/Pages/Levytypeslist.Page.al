Page 52194309 "Levy types list"
{
    PageType = Card;
    SourceTable = "Levy Types";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(LevyCode;"Levy Code")
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

