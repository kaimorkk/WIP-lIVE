Table 52193549 "item charges"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
        }
        field(2;"Employee No";Code[20])
        {
            TableRelation = "Employee Payroll";
        }
        field(3;Description;Text[100])
        {
        }
        field(4;"Deduction Code";Code[20])
        {
            TableRelation = DeductionsL;
        }
        field(5;Amount;Decimal)
        {
        }
        field(6;"Transfer to Payroll";Boolean)
        {
        }
        field(7;"Leave Entry No";Integer)
        {
        }
        field(8;Date;Date)
        {
        }
    }

    keys
    {
        key(Key1;"Employee No","Leave Entry No","Entry No")
        {
            Clustered = true;
        }
        key(Key2;"Transfer to Payroll")
        {
        }
    }

    fieldgroups
    {
    }
}

