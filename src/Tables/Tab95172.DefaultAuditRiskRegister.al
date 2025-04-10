
table 95172 "Default Audit Risk Register"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Audit Risk ID"; Integer)
        {
        }
        field(2; "Risk Title"; Text[2048])
        {
        }
        field(3; "Audit Risk Type"; Option)
        {
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(4; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Audit Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

