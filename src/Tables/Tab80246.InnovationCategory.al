
table 80246 "Innovation Category"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[255])
        {
        }
        field(3; "No. of Innovation Ideas"; Integer)
        {
        }
        field(4; "No. of Innovation Templates"; Integer)
        {
        }
        field(5; Blocked; Boolean)
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

