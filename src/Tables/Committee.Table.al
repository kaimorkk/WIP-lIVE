Table 52193617 Committee
{
    // //DrillDownPageID = UnknownPage51507688;
    // //LookupPageID = UnknownPage51507688;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Names; Text[200])
        {
        }
        field(3; Remarks; Text[250])
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

