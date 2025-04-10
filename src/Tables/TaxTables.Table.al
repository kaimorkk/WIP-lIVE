Table 52193564 "Tax Tables"
{
    DrillDownPageID = "Receipts Line Allocation";
    LookupPageID = "Receipts Line Allocation";

    fields
    {
        field(1;"Code";Code[10])
        {
        }
        field(2;Description;Text[150])
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

