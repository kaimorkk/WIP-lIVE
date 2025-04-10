Table 52193556 "NEW BOSA LOANS"
{

    fields
    {
        field(1;StaffNo;Code[20])
        {
        }
        field(2;LoanNo;Code[20])
        {
        }
        field(3;RepayAmt;Decimal)
        {
        }
        field(4;ApplicationDate;Date)
        {
        }
        field(5;LoanTypeCode;Code[20])
        {
        }
        field(6;Posted;Boolean)
        {
        }
        field(7;Payperiod;Date)
        {
            TableRelation = "Payroll Period"."Starting Date";
        }
    }

    keys
    {
        key(Key1;StaffNo,LoanNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

