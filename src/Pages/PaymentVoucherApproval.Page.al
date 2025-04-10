Page 52193498 "Payment Voucher Approval"
{
    PageType = List;
    SourceTable = "Payment Voucher Approval";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
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

