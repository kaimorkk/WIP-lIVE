
table 69407 "Safe Work Permit Type"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[440])
        {
        }
        field(3; "No. of Safe Work Permit Apps"; Integer)
        {
            Description = 'No. of Safe Work Permit Apps';
        }
        field(4; "No. of Safe Work Compl Reports"; Integer)
        {
            Description = 'No. of Safe Work Compl Reports';
        }
        field(5; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

