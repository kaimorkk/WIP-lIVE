

page 56149 "ICT Asset Subcategory"
{
    PageType = List;
    SourceTable = "ICT Asset subcategory";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Asset Category"; Rec."Asset Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Category field.';
                }
                field("No. of ICT Inventory"; Rec."No. of ICT Inventory")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of ICT Inventory field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

