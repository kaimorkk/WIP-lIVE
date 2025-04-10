Table 52193540 Sections
{
    DrillDownPageID = Unallocated;
    LookupPageID = Unallocated;

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Name;Text[30])
        {
        }
        field(3;"Minimum salary";Decimal)
        {
        }
        field(4;"Maximum Salary";Decimal)
        {
        }
        field(5;"Hourly Rate";Decimal)
        {
        }
        field(6;"Daily Rate";Decimal)
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

