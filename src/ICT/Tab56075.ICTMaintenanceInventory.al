
table 56075 "ICT Maintenance Inventory"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[50])
        {
        }
        field(2; "ICT Inventory"; Code[50])
        {
            TableRelation = "ICT Inventory".Code;

            trigger OnValidate()
            begin
                ICTInventory.Reset;
                ICTInventory.SetRange(Code, "ICT Inventory");
                if ICTInventory.FindSet then
                    Description := ICTInventory.Description;
                "ICT Category" := ICTInventory."ICT Asset Category";
                "ICT Sub Category" := ICTInventory."ICT Asset subcategory";
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "ICT Category"; Code[50])
        {
            TableRelation = "ICT Asset Category".Code;
        }
        field(5; "ICT Sub Category"; Code[50])
        {
            TableRelation = "ICT Asset subcategory".Code where("Asset Category" = field("ICT Category"));
        }
        field(6; "Mainatenance Code"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "ICT Inventory", "Mainatenance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTInventory: Record "ICT Inventory";
}

