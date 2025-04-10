
table 80087 "Performance Appeal Level"
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

