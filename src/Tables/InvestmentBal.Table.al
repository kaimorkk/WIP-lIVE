Table 52193558 InvestmentBal
{

    fields
    {
        field(2;"Staff/PayrollNo";Code[20])
        {
        }
        field(3;Insurance;Decimal)
        {
        }
        field(6;Pension;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Staff/PayrollNo")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

