Table 52193991 "Penalty Rates"
{

    fields
    {
        field(1;EntryNo;Integer)
        {
            AutoIncrement = true;
        }
        field(2;PenaltyRate;Decimal)
        {
        }
        field(3;LeviesCreditPeriod;Decimal)
        {
        }
        field(4;MaxLegalDays;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

