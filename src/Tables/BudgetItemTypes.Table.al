Table 52194092 BudgetItemTypes
{

    fields
    {
        field(1;BudgetItemTypeID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;BudgetItemTypeName;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;BudgetItemTypeID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

