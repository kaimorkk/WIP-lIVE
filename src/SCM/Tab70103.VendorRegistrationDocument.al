
table 70103 "Vendor Registration Document"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
            TableRelation = "Procurement Document Type".Code;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Global Requirement"; Boolean)
        {
        }
        field(4; "Special Group Requirement"; Boolean)
        {
        }
        field(5; "Contractor (Works Requirement)"; Boolean)
        {
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

