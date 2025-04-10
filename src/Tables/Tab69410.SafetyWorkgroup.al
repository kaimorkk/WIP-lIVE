
table 69410 "Safety Workgroup"
{

    fields
    {
        field(1; "Workgroup ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[440])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Stakeholder Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(4; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Workgroup ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

