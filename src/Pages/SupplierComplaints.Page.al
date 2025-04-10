Page 52193536 "Supplier Complaints"
{
    AutoSplitKey = true;
    PageType = List;
    SourceTable = "Supplier Compaints";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(SupplierNo; "Supplier No.")
                {
                    ApplicationArea = Basic;
                }
                field(SupplierName; "Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(UserID; "User ID")
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

