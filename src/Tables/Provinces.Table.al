Table 52193484 Provinces
{
    //DrillDownPageID = UnknownPage51507267;
    //LookupPageID = UnknownPage51507267;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Province Name"; Text[80])
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

