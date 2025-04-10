
table 95158 "HSE Role"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "Executive Summary"; Text[2048])
        {
        }
        field(4; "Directly Reports To"; Code[20])
        {
        }
        field(5; "Indirectly Reports To"; Code[20])
        {
        }
        field(6; "No. Of Default Responsibilteis"; Integer)
        {
        }
        field(7; Blocked; Boolean)
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

