
table 56065 "ICT Asset subcategory"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Name; Text[50])
        {
        }
        field(3; "Asset Category"; Code[30])
        {
            TableRelation = "ICT Asset Category".Code;
        }
        field(4; "No. of ICT Inventory"; Integer)
        {
            CalcFormula = count("ICT Inventory" where("ICT Asset subcategory" = field(Code)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

