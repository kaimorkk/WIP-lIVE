
table 95177 "Compliance Framework Principle"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Framework ID"; Code[20])
        {
        }
        field(2; "Guiding Principle ID"; Code[20])
        {
        }
        field(3; Description; Text[2048])
        {
        }
        field(4; "No. of Guiding Principle Stmts"; Integer)
        {
            Description = 'No. of Guiding Principle Stmts';
        }
        field(5; "No. of Rationale Statements"; Integer)
        {
        }
        field(6; "No. of Key Benefits"; Integer)
        {
        }
        field(7; "No. of Compliance Requirements"; Integer)
        {
            Description = 'No. of Compliance Requirements';
        }
        field(8; "No. of Comments"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Framework ID", "Guiding Principle ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

