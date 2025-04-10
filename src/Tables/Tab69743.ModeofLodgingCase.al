
table 69743 "Mode of Lodging Case"
{
    // DrillDownPageID = "Mode of Lodging Case";
    // LookupPageID = "Mode of Lodging Case";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[250])
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

