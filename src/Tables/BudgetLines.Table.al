Table 52194093 BudgetLines
{

    fields
    {
        field(1;BudgetLineID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;LineNumber;Integer)
        {
        }
        field(3;BudgetLineHeader;Text[50])
        {
        }
        field(4;Currency;Text[50])
        {
        }
        field(5;ClientAmount;Decimal)
        {
        }
        field(6;OperationAmount;Decimal)
        {
        }
        field(7;ProjectID;Integer)
        {
        }
        field(8;CreatedDate;Date)
        {
        }
    }

    keys
    {
        key(Key1;BudgetLineID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

