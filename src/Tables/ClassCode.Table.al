Table 52193632 "Class Code"
{
    DrillDownPageID = "Class Codes";
    LookupPageID = "Class Codes";

    fields
    {
        field(1;"Class Code";Code[30])
        {
        }
        field(2;"Class Name";Text[50])
        {
        }
        field(3;"Salary Charge";Decimal)
        {
        }
        field(4;"Cheque Book Requisition Fee";Decimal)
        {
        }
        field(5;"Withdrawal Fee";Decimal)
        {
        }
        field(6;"Loan Interest Rate";Decimal)
        {
        }
        field(7;"Overdraft Interest";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Class Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Class Code","Class Name")
        {
        }
    }
}

