Table 52193854 Institution1
{
    DrillDownPageID = Insitutions;
    LookupPageID = Insitutions;

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Name;Text[30])
        {
        }
        field(3;Address;Text[30])
        {
        }
        field(4;City;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

