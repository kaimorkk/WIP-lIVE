
table 69552 "Succession Template Category"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; Blocked; Boolean)
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

