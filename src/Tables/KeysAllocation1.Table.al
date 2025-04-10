Table 52193715 "Keys Allocation1"
{

    fields
    {
        field(2;"Keys Allocated to";Code[20])
        {
            TableRelation = Employee;
        }
        field(3;"Office Code";Code[20])
        {
            TableRelation = "Office and Keys allocations1";
        }
    }

    keys
    {
        key(Key1;"Keys Allocated to","Office Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

