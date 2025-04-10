Page 52194251 "Supplier Appraisal"
{
    PageType = Card;
    SourceTable = "Supplier Appraisal";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(SupplierName;"Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field(SupplierCategory;"Supplier Category")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Performance Measures")
            {
                field(DeliveryLeadTime;"Delivery/Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field(LocationofDelivery;"Location of Delivery")
                {
                    ApplicationArea = Basic;
                }
                field(RejectedItems;"Rejected Items")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Product Characteristics")
            {
                field(ProductQuality;"Product Quality")
                {
                    ApplicationArea = Basic;
                }
                field(ProductPricing;"Product Pricing")
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

