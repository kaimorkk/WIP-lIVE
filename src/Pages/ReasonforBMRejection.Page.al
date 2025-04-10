Page 52193811 "Reason for BM Rejection"
{
    PageType = Card;
    SourceTable = "Bench Mark1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ActivityNo;"Activity No")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonForRejection;"Reason For Rejection")
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

