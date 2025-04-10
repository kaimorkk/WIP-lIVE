Table 52193476 "Receipts Buffer"
{

    fields
    {
        field(1;"Staff/Payroll No";Code[20])
        {
        }
        field(2;Amount;Decimal)
        {
        }
        field(3;"No Repayment";Boolean)
        {
        }
        field(4;"Staff Not Found";Boolean)
        {
        }
        field(5;"Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(6;"Transaction Date";Date)
        {
        }
        field(7;"Entry No";Integer)
        {
        }
        field(8;Generated;Boolean)
        {
        }
        field(9;"Payment No";Integer)
        {
        }
        field(10;Posted;Boolean)
        {
        }
        field(11;"Multiple Receipts";Boolean)
        {
        }
        field(12;Name;Text[200])
        {
        }
        field(13;"Account No.";Code[20])
        {
        }
        field(14;"Member No";Code[20])
        {
        }
        field(15;"Transaction Type";Option)
        {
            OptionMembers = ABF,"Shares Contribution","Loan Repayment",Interest,"Unallocated Funds";
        }
        field(16;Reconciled;Boolean)
        {
        }
        field(17;"Employer Code";Code[20])
        {
        }
        field(18;"Loan No.";Code[20])
        {
        }
        field(19;"Loan Not Found";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

