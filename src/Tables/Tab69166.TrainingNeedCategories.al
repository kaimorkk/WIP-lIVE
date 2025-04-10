
table 69166 "Training Need Categories"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; Cadre; Boolean)
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

