Table 52193571 "STO Schedule"
{
    DrillDownPageID = "Standing Order Schedule";
    LookupPageID = "Standing Order Schedule";

    fields
    {
        field(1;"Transaction No.";Code[10])
        {
        }
        field(2;"Destination Account No.";Code[20])
        {
        }
        field(3;"Loan No.";Code[20])
        {
            TableRelation = "Payment Modes".Code;
        }
        field(4;"Transaction Type";Option)
        {
            OptionMembers = Deposits,"Loan Repayment";
        }
        field(5;"Amount Deducted";Decimal)
        {
        }
        field(6;"STO No.";Code[20])
        {
        }
        field(7;"Source No.";Code[20])
        {
        }
        field(8;"Destinantion Account Type";Option)
        {
            OptionMembers = Internal,External,BOSA;
        }
    }

    keys
    {
        key(Key1;"Transaction No.","Transaction Type","Source No.","Loan No.","Destinantion Account Type")
        {
            Clustered = true;
            SumIndexFields = "Amount Deducted";
        }
        key(Key2;"Source No.","Transaction No.")
        {
            SumIndexFields = "Amount Deducted";
        }
    }

    fieldgroups
    {
    }
}

