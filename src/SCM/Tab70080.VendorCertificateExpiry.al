
table 70080 "Vendor Certificate Expiry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Vendor No"; Code[20])
        {
        }
        field(3; "Certificate Type"; Code[30])
        {
            TableRelation = "Procurement Document Type";
        }
        field(4; Description; Text[100])
        {
        }
        field(5; "Valid From"; Date)
        {
        }
        field(6; "Expiry Date"; Date)
        {
        }
        field(7; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", "Vendor No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

