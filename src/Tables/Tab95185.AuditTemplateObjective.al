
table 95185 "Audit Template Objective"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[20])
        {
        }
        field(2; "Audit Objective ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Audit Objective ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

