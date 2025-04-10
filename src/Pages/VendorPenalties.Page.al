Page 52193523 "Vendor Penalties"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Vendor Penalties";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(VendorNo; "Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field(OrderNo; "Order No")
                {
                    ApplicationArea = Basic;
                }
                field(OrderDate; "Order Date")
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedReceiptDate; "Expected Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptDate; "Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(PenaltyAmount; "Penalty Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
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

