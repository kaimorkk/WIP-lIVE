Table 52193597 "Allocated Receipts"
{
    // DrillDownPageID = 51507389;
    // //LookupPageID = UnknownPage51507389;

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; Amount; Decimal)
        {
            FieldClass = Normal;
        }
        field(3; "Receipt No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

