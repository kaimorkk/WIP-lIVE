Page 52193549 "Fixed Deposit Type"
{
    PageType = Card;
    SourceTable = "Fixed Deposit Type";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("FFD Interest Calculation";"FD Interest Calculation")
            {
                SubPageLink = Code=field(Code);
            }
        }
    }

    actions
    {
    }
}

