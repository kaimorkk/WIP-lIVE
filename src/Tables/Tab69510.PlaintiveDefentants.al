
table 69510 "Plaintive-Defentants"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Type; Option)
        {
            OptionCaption = 'Plaintive,Defendant';
            OptionMembers = Plaintive,Defendant;
        }
        field(3; Names; Code[255])
        {
        }
        field(4; Contact; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Code", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

