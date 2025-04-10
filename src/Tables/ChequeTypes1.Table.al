Table 52193680 "Cheque Types1"
{
    DrillDownPageID = "Cheque Typesx";
    LookupPageID = "Cheque Typesx";

    fields
    {
        field(1;"Code";Code[20])
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

