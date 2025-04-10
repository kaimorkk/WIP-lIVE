Table 52193625 "FD Terms"
{
    DrillDownPageID = "FD Terms";
    LookupPageID = "FD Terms";

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Term;DateFormula)
        {
        }
        field(3;"Interest Rate";Decimal)
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

