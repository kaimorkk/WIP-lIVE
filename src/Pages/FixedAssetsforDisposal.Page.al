Page 52194298 "Fixed Assets for Disposal"
{
    PageType = List;
    SourceTable = "Fixed Asset";
    SourceTableView = where("Disposal Status"=const("Due for Disposal"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(FAClassCode;"FA Class Code")
                {
                    ApplicationArea = Basic;
                }
                field(FASubclassCode;"FA Subclass Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(VendorNo;"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibleEmployee;"Responsible Employee")
                {
                    ApplicationArea = Basic;
                }
                field(SerialNo;"Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field(MaintenanceVendorNo;"Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field(FAPostingGroup;"FA Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(Supplier;Supplier)
                {
                    ApplicationArea = Basic;
                }
                field(FixedAssetType;"Fixed Asset Type")
                {
                    ApplicationArea = Basic;
                }
                field(RegistrationNo;"Registration No")
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

