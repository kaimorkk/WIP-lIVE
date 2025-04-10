Table 52193999 LevyCategory
{
    LookupPageID = "Levy types list";

    fields
    {
        field(1;"Category Code";Code[20])
        {
        }
        field(2;Description;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

