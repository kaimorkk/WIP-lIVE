
table 69697 "Medical Checks Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[50])
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
        key(Key1; "Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

