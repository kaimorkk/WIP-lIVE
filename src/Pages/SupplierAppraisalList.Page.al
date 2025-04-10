Page 52194291 "Supplier Appraisal List"
{
    ApplicationArea = Basic;
    CardPageID = "Supplier Appraisal";
    PageType = List;
    SourceTable = "Supplier Appraisal";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(SupplierName;"Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field(SupplierCategory;"Supplier Category")
                {
                    ApplicationArea = Basic;
                }
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

