Table 52193895 "Medical Information1"
{
    DrillDownPageID = "Medical Information";
    LookupPageID = "Medical Information";

    fields
    {
        field(1;Description;Code[50])
        {
        }
        field(2;Remarks;Text[200])
        {
        }
    }

    keys
    {
        key(Key1;Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

