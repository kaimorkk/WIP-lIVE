Page 52194319 "Items for Disposal"
{
    PageType = List;
    SourceTable = Item;
    SourceTableView = where(Dummy=const('1'));

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
                field(BaseUnitofMeasure;"Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Dummy;Dummy)
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

