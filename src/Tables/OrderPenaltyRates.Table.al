Table 52194065 "Order Penalty Rates"
{

    fields
    {
        field(1;"Purchase Type";Code[20])
        {
            TableRelation = "Purchases Types";
        }
        field(2;"Start Date";Date)
        {
        }
        field(3;"End Date";Date)
        {
        }
        field(4;Duration;DateFormula)
        {
        }
        field(5;"Penalty Rate";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Purchase Type","Start Date","End Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

