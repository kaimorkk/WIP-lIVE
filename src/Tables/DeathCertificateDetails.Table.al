Table 52193603 "Death Certificate Details"
{
    DrillDownPageID = "Death Certificate Details";
    LookupPageID = "Death Certificate Details";

    fields
    {
        field(1;Detail;Text[50])
        {
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1;Detail)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

