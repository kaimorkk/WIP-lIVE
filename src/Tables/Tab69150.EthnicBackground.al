
table 69150 "Ethnic Background"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; "Ethnic group"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Ethnic group")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

