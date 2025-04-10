
table 80192 "Policy Core Value"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
        }
        field(2; "Core Value"; Code[50])
        {
        }
        field(3; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Core Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

