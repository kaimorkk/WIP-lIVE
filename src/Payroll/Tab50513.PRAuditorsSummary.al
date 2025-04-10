table 52193664 "PR Auditors Summary"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Transaction Code"; Code[10])
        {
        }
        field(2; "Transaction Type"; Text[30])
        {
        }
        field(3; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Transaction Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

