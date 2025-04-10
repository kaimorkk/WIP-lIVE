Table 52194045 "Batch Invoice Lines"
{
    DrillDownPageID = "Batch Invoices Lines";
    LookupPageID = "Batch Invoices Lines";

    fields
    {
        field(1;"Batch No";Code[20])
        {
            TableRelation = "Batch Invoices";
        }
        field(2;"Invoice No";Code[20])
        {
        }
        field(3;"Scheme No";Code[20])
        {
        }
        field(4;"Scheme Name";Text[100])
        {
        }
        field(5;Amount;Decimal)
        {
        }
        field(6;"Automatically Post";Boolean)
        {
        }
        field(7;Posted;Boolean)
        {
        }
        field(8;"Posted Invoice No";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Batch No","Invoice No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

