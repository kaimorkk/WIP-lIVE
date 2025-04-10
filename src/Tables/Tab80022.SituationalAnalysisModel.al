
table 80022 "Situational Analysis Model"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "code"; Code[30])
        {
        }
        field(2; Description; Text[255])
        {
        }
        field(3; Default; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

