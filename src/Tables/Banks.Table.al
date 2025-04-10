Table 52193509 Banks
{
    DrillDownPageID = Banks;
    LookupPageID = Banks;

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;"Bank Name";Text[150])
        {
        }
        field(3;Branch;Text[150])
        {
        }
        field(4;"Bank Code";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Code",Branch)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

