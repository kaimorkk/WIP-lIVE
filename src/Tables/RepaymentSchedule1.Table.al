Table 52193845 "Repayment Schedule1"
{

    fields
    {
        field(1;"Loan No";Code[20])
        {
        }
        field(2;"Employee No";Code[20])
        {
        }
        field(3;"Repayment Date";Date)
        {
        }
        field(4;"Loan Amount";Decimal)
        {
        }
        field(5;"Interest Rate";Decimal)
        {
        }
        field(6;"Loan Category";Code[20])
        {
        }
        field(7;"Monthly Repayment";Decimal)
        {
        }
        field(8;"Employee Name";Text[100])
        {
        }
        field(9;"Monthly Interest";Decimal)
        {
        }
        field(10;"Principal Repayment";Decimal)
        {
        }
        field(11;"Instalment No";Integer)
        {
        }
        field(12;"Remaining Debt";Decimal)
        {
        }
        field(13;"Payroll Group";Code[20])
        {
        }
        field(14;Paid;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Loan No","Employee No","Repayment Date")
        {
            Clustered = true;
        }
        key(Key2;"Loan Category","Repayment Date")
        {
            SumIndexFields = "Loan Amount";
        }
        key(Key3;"Loan No","Repayment Date")
        {
        }
        key(Key4;"Loan Category","Employee No","Repayment Date")
        {
        }
    }

    fieldgroups
    {
    }
}

