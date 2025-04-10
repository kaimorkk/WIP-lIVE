
table 95000 "Stakeholder"
{
    DrillDownPageID = StakeHolders;
    LookupPageID = StakeHolders;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Stakeholder Type"; Option)
        {
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(4; Blocked; Boolean)
        {
        }
        field(5; "Default Form ID"; Code[50])
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

