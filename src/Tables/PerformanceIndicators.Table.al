Table 52194040 "Performance Indicators"
{
    DrillDownPageID = "Performance Indicators";
    LookupPageID = "Performance Indicators";

    fields
    {
        field(1;"PI Code";Code[20])
        {
        }
        field(2;Description;Text[150])
        {
        }
        field(3;"Desired Score";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"PI Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

