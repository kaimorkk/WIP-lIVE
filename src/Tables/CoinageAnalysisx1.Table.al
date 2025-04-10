Table 52193686 "Coinage Analysisx1"
{

    fields
    {
        field(1;Amount;Decimal)
        {
            MaxValue = 1000;
            MinValue = 0.05;
        }
        field(2;"Amount Description";Text[30])
        {
        }
    }

    keys
    {
        key(Key1;Amount)
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
}

