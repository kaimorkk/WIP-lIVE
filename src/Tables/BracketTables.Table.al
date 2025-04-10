Table 52193543 "Bracket Tables"
{
    // //DrillDownPageID = UnknownPage51507382;
    // //LookupPageID = UnknownPage51507382;

    fields
    {
        field(1; "Bracket Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; "Bracket Description"; Text[80])
        {
        }
        field(3; "Effective Starting Date"; Date)
        {
        }
        field(4; "Effective End Date"; Date)
        {
        }
        field(5; Annual; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Bracket Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

