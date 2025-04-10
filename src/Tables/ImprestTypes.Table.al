Table 52194051 "Imprest Types"
{
    DrillDownPageID = "Imprest Types";
    LookupPageID = "Imprest Types";

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Descrption;Text[150])
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

