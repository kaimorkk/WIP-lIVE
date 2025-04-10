
table 95190 "Audit Temp Procedure Comment"
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
        field(4; "Comment Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(5; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Audit Objective ID", "Audit Procedure ID", "Comment Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

