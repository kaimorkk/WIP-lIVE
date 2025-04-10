
table 69679 "Closed Qn Response Option"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Type ID"; Code[30])
        {
        }
        field(2; "Option Code"; Code[30])
        {
        }
        field(3; Description; Text[150])
        {
        }
        field(4; "Default Points"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Type ID", "Option Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

