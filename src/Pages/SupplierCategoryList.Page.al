Page 52193906 "Supplier Category List"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Supplier Category1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(CategoryCode;"Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(VendorPostingGroup;"Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(GenBusPostingGroup;"Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(VATBusPostingGroup;"VAT Bus. Posting Group")
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

