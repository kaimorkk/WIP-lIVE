Table 52193942 Articles1
{
    // DrillDownPageID = "Job Application Indicators";
    // LookupPageID = "Job Application Indicators";

    fields
    {
        field(1;"Misc. Article";Code[10])
        {
        }
        field(2;Description;Text[30])
        {
        }
        field(3;Type;Code[10])
        {
            TableRelation = "Misc. Article";
        }
        field(4;"Serial No";Code[20])
        {
        }
        field(5;"In Use";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Misc. Article")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

