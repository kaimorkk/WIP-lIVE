Table 52193963 "Blood Types List"
{
    DrillDownPageID = "Blood Types List";
    LookupPageID = "Blood Types List";

    fields
    {
        field(1;"Code";Code[10])
        {
        }
        field(2;"Blood Type";Text[30])
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

