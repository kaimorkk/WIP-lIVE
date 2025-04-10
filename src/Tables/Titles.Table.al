Table 52193621 Titles
{
    DrillDownPageID = "Titles List";
    LookupPageID = "Titles List";

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;Description;Text[100])
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

