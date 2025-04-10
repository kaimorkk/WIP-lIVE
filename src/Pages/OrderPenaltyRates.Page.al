Page 50011 "Order Penalty Rates"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Order Penalty Rates";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(PurchaseType;"Purchase Type")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate;"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                }
                field(PenaltyRate;"Penalty Rate")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008;Notes)
            {
            }
            systempart(Control1000000009;MyNotes)
            {
            }
            systempart(Control1000000010;Links)
            {
            }
        }
    }

    actions
    {
    }
}

