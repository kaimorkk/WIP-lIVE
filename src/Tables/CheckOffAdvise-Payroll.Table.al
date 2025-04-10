Table 52193548 "Check Off Advise-Payroll"
{

    fields
    {
        field(1;"Payroll No";Code[20])
        {
        }
        field(2;"Development Principle";Decimal)
        {
        }
        field(3;"Development Interest";Decimal)
        {
        }
        field(4;"Emergency Principle";Decimal)
        {
        }
        field(5;"Emergency Interest";Decimal)
        {
        }
        field(6;"School Principle";Decimal)
        {
        }
        field(7;"School Interest";Decimal)
        {
        }
        field(8;"Guarantor Principle";Decimal)
        {
        }
        field(9;"Guarantor Interest";Decimal)
        {
        }
        field(10;"Oustanding Registration Fees";Decimal)
        {
        }
        field(11;"Payroll Period";Date)
        {
            TableRelation = "Payroll Period";
        }
        field(12;LoanNo;Code[10])
        {
        }
        field(13;Principle;Decimal)
        {
        }
        field(14;Interest;Decimal)
        {
        }
        field(15;OutStandingBal;Decimal)
        {
        }
        field(16;LoanType;Code[10])
        {
        }
        field(17;NotAssigned;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Payroll No","Payroll Period",LoanNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

