table 52193785 "PR NHIF"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Tier Code"; Code[10])
        {
            SQLDataType = Integer;
        }
        field(2; "NHIF Tier"; Decimal)
        {
        }
        field(3; Amount; Decimal)
        {
        }
        field(4; "Lower Limit"; Decimal)
        {
        }
        field(5; "Upper Limit"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Tier Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

