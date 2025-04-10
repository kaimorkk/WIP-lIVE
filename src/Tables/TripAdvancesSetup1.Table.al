Table 52193947 "Trip Advances Setup1"
{
    DrillDownPageID = "Trip Advances";
    LookupPageID = "Trip Advances";

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Description;Text[50])
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

