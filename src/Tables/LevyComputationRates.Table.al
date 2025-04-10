Table 52193997 "Levy Computation Rates"
{

    fields
    {
        field(1;LineNo;Integer)
        {
            AutoIncrement = true;
        }
        field(2;Period;Date)
        {
        }
        field(3;Rate;Decimal)
        {
        }
        field(4;RangeMin;Decimal)
        {
        }
        field(5;RangeMax;Decimal)
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

