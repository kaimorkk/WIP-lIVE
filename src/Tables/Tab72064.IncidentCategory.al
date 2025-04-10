
table 72064 "Incident Category"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; "Incidence Type"; Option)
        {
            OptionMembers = GPA,GLA;
        }
        field(5; "Injury Type"; Option)
        {
            OptionMembers = "",Normal,Permanent;
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

