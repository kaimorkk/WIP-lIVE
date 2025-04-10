
table 80016 "Corporate Perfomance Criteria"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Perfomance Criteria Category"; Text[255])
        {
        }
        field(3; "Weight (%)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

