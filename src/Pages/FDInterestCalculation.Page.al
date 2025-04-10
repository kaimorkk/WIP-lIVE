Page 52193550 "FD Interest Calculation"
{
    PageType = ListPart;
    SourceTable = "FD Interest Calculation Rules";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MinimumAmount;"Minimum Amount")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumAmount;"Maximum Amount")
                {
                    ApplicationArea = Basic;
                }
                field(InterestRate;"Interest Rate")
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

