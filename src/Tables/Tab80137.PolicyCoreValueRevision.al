
table 80137 "Policy Core Value Revision"
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
        field(4; "Revision No."; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Core Value", "Revision No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

