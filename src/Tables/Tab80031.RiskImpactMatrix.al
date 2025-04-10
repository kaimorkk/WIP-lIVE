
table 80031 "Risk Impact Matrix"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "code"; Code[30])
        {
        }
        field(2; Description; Text[255])
        {
        }
        field(3; "Effective Date"; Date)
        {
        }
        field(4; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

