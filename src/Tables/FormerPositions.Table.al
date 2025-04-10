Table 52194046 "Former Positions"
{
    DrillDownPageID = "Employment History Codes";
    LookupPageID = "Employment History Codes";

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Description;Text[250])
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

