Table 52193690 "Score Setup1"
{
    DrillDownPageID = "Score Setup List";
    LookupPageID = "Score Setup List";

    fields
    {
        field(1;"Score ID";Decimal)
        {
        }
        field(2;Score;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Score ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

