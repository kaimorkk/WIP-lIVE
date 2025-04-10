Table 52193609 "Settlement Types"
{
    //DrillDownPageID = UnknownPage51507690;
    //LookupPageID = UnknownPage51507690;

    fields
    {
        field(1; Decription; Text[150])
        {
            NotBlank = true;
        }
        field(2; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; Decription)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

