
table 80027 "Risk Categories"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Nature of Risk"; Text[255])
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

