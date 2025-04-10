Table 52193748 "Commissioner Expe Payables1"
{

    fields
    {
        field(1;"Primary key";Code[10])
        {
        }
        field(2;"Comm Expense Payable Acc";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(3;"Tax %";Decimal)
        {
        }
        field(4;"Comm Tax Acc";Code[20])
        {
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(Key1;"Primary key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

