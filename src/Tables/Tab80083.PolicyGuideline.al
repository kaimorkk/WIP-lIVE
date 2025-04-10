
table 80083 "Policy & Guideline"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Code[100])
        {
        }
        field(3; Type; Option)
        {
            OptionCaption = 'Guidelines,Policy,Other';
            OptionMembers = Guidelines,Policy,Other;
        }
        field(4; Category; Option)
        {
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(5; "Issued By"; Code[100])
        {
        }
        field(6; "Effective Date"; Date)
        {
        }
        field(7; Blocked; Boolean)
        {
        }
        field(8; Website; Code[100])
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

