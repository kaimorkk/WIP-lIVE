page 52193588 "PR NHIF Setup"
{
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "PR NHIF";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field(TierCode; "Tier Code")
                {
                    ApplicationArea = Basic;
                }
                field(LowerLimit; "Lower Limit")
                {
                    ApplicationArea = Basic;
                }
                field(UpperLimit; "Upper Limit")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
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

