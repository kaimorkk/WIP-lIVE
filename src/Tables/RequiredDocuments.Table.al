Table 52194054 "Required Documents"
{
    DrillDownPageID = "Required Documents";
    LookupPageID = "Required Documents";

    fields
    {
        field(1;"Recruitment Req. No";Code[20])
        {
            NotBlank = true;
            TableRelation = "Recruitment Needs1"."No.";
        }
        field(2;"Document Description";Text[100])
        {
            NotBlank = true;
        }
        field(3;Attached;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Recruitment Req. No","Document Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

