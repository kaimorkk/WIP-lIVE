Table 52193557 "Salary Advance"
{

    fields
    {
        field(1;Empcode;Code[10])
        {
        }
        field(2;Amount;Decimal)
        {
        }
        field(3;"Payroll Period";Date)
        {
            TableRelation = "Payroll Period"."Starting Date";
        }
    }

    keys
    {
        key(Key1;Empcode,"Payroll Period")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

