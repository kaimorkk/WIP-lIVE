
table 69240 "HR Non Working Days & Dates"
{

    fields
    {
        field(1; "Non Working Days"; Code[10])
        {
        }
        field(2; "Non Working Dates"; Date)
        {
        }
        field(3; "Code"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Reason; Text[30])
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

