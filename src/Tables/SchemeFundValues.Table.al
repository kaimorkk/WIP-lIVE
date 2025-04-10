Table 52193996 SchemeFundValues
{

    fields
    {
        field(1;LineNo;Integer)
        {
            AutoIncrement = true;
        }
        field(2;SchemeID;Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(3;FundValue;Decimal)
        {
        }
        field(4;Quater;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;LineNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

