
table 80204 "Compliance Finding"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Audit No."; Code[30])
        {
        }
        field(2; "Checklist Category"; Code[50])
        {
        }
        field(3; "Requirement ID"; Integer)
        {
        }
        field(4; "Finding ID"; Integer)
        {
        }
        field(5; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Audit No.", "Checklist Category", "Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

