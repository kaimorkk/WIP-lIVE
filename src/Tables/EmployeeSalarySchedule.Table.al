Table 52193559 "Employee Salary Schedule"
{

    fields
    {
        field(1;EmpCode;Code[20])
        {
        }
        field(2;"Salary Amount";Decimal)
        {
        }
        field(3;"Payroll Period";Date)
        {
            TableRelation = "Payroll Period"."Starting Date";
        }
        field(4;Posted;Boolean)
        {
        }
        field(5;"No. Series";Code[10])
        {
        }
        field(6;TRANSACTIONNO;Code[20])
        {
        }
    }

    keys
    {
        key(Key1;EmpCode,"Payroll Period")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

