
table 69252 "Job Indicators Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Indicator  Code"; Code[30])
        {
        }
        field(3; "Indicator Description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Indicator  Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

