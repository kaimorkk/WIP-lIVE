Page 52193749 "Pay Modesx"
{
    PageType = Card;
    SourceTable = "Pay Modes1";

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
                field(PrintReceipt;"Print Receipt")
                {
                    ApplicationArea = Basic;
                }
                field(Electronic;Electronic)
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

