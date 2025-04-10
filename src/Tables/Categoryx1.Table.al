Table 52193687 Categoryx1
{
    // DrillDownPageID = "Approved Stock Returns";
    // LookupPageID = "Approved Stock Returns";

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Code",Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

