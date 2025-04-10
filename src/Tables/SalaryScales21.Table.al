Table 52193933 "Salary Scales21"
{
    DrillDownPageID = "Salary Scales List";
    LookupPageID = "Salary Scales List";

    fields
    {
        field(1;Scale;Code[10])
        {
        }
        field(2;"Minimum Pointer";Code[10])
        {
            TableRelation = "Salary Pointers21";
        }
        field(3;"Maximum Pointer";Code[10])
        {
            TableRelation = "Salary Pointers21";
        }
        field(4;"Responsibility Allowance";Decimal)
        {
        }
        field(5;"Commuter Allowance";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;Scale)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

