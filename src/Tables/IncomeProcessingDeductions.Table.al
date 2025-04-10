Table 52193570 "Income Processing Deductions"
{
    DrillDownPageID = "Income deductions";
    LookupPageID = "Income deductions";

    fields
    {
        field(1;"Transaction No";Code[20])
        {
        }
        field(2;"Vendor No";Code[20])
        {
        }
        field(3;"Loan No";Code[20])
        {
        }
        field(4;"Loan Type";Code[20])
        {
        }
        field(5;"Total Repayment";Decimal)
        {
        }
        field(6;Principal;Decimal)
        {
        }
        field(7;Interest;Decimal)
        {
        }
        field(8;Appraisal;Decimal)
        {
        }
        field(9;Penalties;Decimal)
        {
        }
        field(10;"CID NO";Code[20])
        {
        }
        field(11;Source;Option)
        {
            OptionMembers = BOSA,FOSA;
        }
        field(12;"KTDA No.";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Transaction No","Loan No","Loan Type","KTDA No.",Source,"Vendor No")
        {
            Clustered = true;
        }
        key(Key2;"Vendor No",Source,"Transaction No")
        {
            SumIndexFields = "Total Repayment";
        }
    }

    fieldgroups
    {
    }
}

