Table 52193697 "Document Types1"
{
    DrillDownPageID = "Document Types";
    LookupPageID = "Document Types";

    fields
    {
        field(1;"Document Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;"Document Name";Text[100])
        {
        }
        field(3;Book;Boolean)
        {
        }
        field(4;"DuePeriod (days)";Text[30])
        {
        }
        field(5;Rates;Integer)
        {
        }
    }

    keys
    {
        key(Key1;"Document Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

