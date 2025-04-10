
table 56068 "ICT Maintenance Areas"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Inventory  Category"; Code[50])
        {
            TableRelation = "ICT Asset subcategory".Code;
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

