Table 52194095 CashflowTypes
{

    fields
    {
        field(1;CashflowTypeID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;CashflowTypeName;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;CashflowTypeID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

