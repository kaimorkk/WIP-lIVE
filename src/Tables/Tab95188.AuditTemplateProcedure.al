
table 95188 "Audit Template Procedure"
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
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "No. Of Reccomm Audit Test Meth"; Integer)
        {
            Description = 'No. of Recommended Audit Testing Methods';
        }
        field(6; "No. Of Comments"; Integer)
        {
            Description = 'No. of Comments/Additional Notes';
        }
        field(7; "No. of Audit Risks"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Audit Objective ID", "Audit Procedure ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

