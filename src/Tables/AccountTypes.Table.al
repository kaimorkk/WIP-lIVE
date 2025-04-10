Table 52193560 AccountTypes
{
    // //DrillDownPageID = UnknownPage66025;
    // LookupPageID = 66025;

    fields
    {
        field(1; "Code"; Code[20])
        {
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

