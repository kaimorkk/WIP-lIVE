Table 52194009 "Diligence Infomation"
{
    DrillDownPageID = "Diligence Information";
    LookupPageID = "Diligence Information";

    fields
    {
        field(1;"Required Information";Text[200])
        {
        }
        field(2;"Point Distribution";Decimal)
        {
        }
        field(3;"No.";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Required Information")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

