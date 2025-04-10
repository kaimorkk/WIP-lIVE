Table 52193847 "Salary Pointers1"
{
    DrillDownPageID = "Salary Pointers";
    LookupPageID = "Salary Pointers";

    fields
    {
        field(1;"Salary Pointer";Code[10])
        {
            NotBlank = true;
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
        fieldgroup(DropDown;"Salary Pointer","Basic Pay int","Basic Pay")
        {
        }
    }
}

