Table 52193809 "Survey Stage1"
{
    DrillDownPageID = "Survey Stage List";
    LookupPageID = "Survey Stage List";

    fields
    {
        field(1;Stage;Code[10])
        {
        }
        field(2;Description;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;Stage)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

