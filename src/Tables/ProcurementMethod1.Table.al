Table 52193784 "Procurement Method1"
{
    DrillDownPageID = "Procurement method";
    LookupPageID = "Procurement method";

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
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

