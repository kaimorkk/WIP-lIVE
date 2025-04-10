Table 52193932 "Salary Pointers21"
{
    DrillDownPageID = "Salary Pointers";
    LookupPageID = "Salary Pointers";

    fields
    {
        field(1;"Salary Pointer";Text[7])
        {
        }
        field(2;"Basic Pay int";Integer)
        {
        }
        field(3;"Basic Pay";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Salary Pointer")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

