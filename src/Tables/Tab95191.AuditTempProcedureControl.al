
table 95191 "Audit Temp Procedure Control"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[20])
        {
        }
        field(2; "Audit Objective ID"; Integer)
        {
        }
        field(3; "Audit Procedure ID"; Integer)
        {
        }
        field(4; "Risk ID"; Integer)
        {
        }
        field(5; "Control ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(6; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Audit Objective ID", "Audit Procedure ID", "Risk ID", "Control ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

