Table 52194063 "Supplier Types"
{
    DrillDownPageID = "Supplier Types";
    LookupPageID = "Supplier Types";

    fields
    {
        field(1;"Supplier Type";Code[20])
        {
        }
        field(2;Description;Text[150])
        {
        }
        field(3;Remarks;Text[150])
        {
        }
    }

    keys
    {
        key(Key1;"Supplier Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

