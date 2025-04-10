Table 52193791 "Procurement Commitee1"
{
    DrillDownPageID = "Committee List";
    LookupPageID = "Committee List";

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
        field(3;"Minimum Members";Integer)
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

