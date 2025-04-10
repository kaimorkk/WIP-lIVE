Page 52193519 "Shares Banding"
{
    PageType = List;
    SourceTable = "Shares Banding";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Upto;"Up to")
                {
                    ApplicationArea = Basic;
                }
                field(ContractualShares;"Contractual Shares")
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

