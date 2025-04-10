
table 70072 "Vendor Classification"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Vendor No"; Code[20])
        {
        }
        field(2; "Vendor Category"; Code[20])
        {
            TableRelation = "Special Vendor Category".Code;
        }
        field(3; "Certifying Agency"; Code[20])
        {
        }
        field(4; "Certifcate No"; Code[20])
        {
        }
        field(5; "Certificate Expiry Date"; Date)
        {
        }
        field(6; "Effective Date"; Date)
        {
        }
        field(7; "End Date"; Date)
        {
        }
        field(8; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Vendor No", "Vendor Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

