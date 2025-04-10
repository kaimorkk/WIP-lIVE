Table 52193553 "Non-Pensionable Items"
{
    // //DrillDownPageID = UnknownPage51507414;
    // //LookupPageID = UnknownPage51507414;

    fields
    {
        field(1; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; Description; Text[60])
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

