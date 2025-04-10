
table 65040 "Financial Year Code"
{
    DrillDownPageID = "Financial Year Code";
    LookupPageID = "Financial Year Code";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Starting Date"; Date)
        {
        }
        field(3; "Ending Date"; Date)
        {
        }
        field(4; "Active"; Boolean)
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

