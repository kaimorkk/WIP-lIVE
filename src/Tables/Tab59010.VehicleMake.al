
table 59010 "Vehicle Make"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; Description; Text[30])
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

