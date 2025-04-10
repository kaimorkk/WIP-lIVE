Table 52193846 "Non Payroll Receipts1"
{

    fields
    {
        field(1; "Loan No"; Code[20])
        {
            //TableRelation = "Loan Application1"."Loan No";
        }
        field(2; "Receipt Date"; Date)
        {
            NotBlank = true;
        }
        field(3; "Received From"; Text[40])
        {
        }
        field(4; "Cheque No"; Code[20])
        {
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; "Reference No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Loan No", "Receipt Date")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
}

