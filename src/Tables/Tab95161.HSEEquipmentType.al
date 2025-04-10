
table 95161 "HSE Equipment Type"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "Safety Equipment Category"; Code[20])
        {
        }
        field(4; "Additional Notes/Comments"; Text[2048])
        {
        }
        field(5; "Register Type"; Option)
        {
            OptionCaption = ' ,Fixed Asset,Inventory,Resource';
            OptionMembers = " ","Fixed Asset",Inventory,Resource;
        }
        field(6; "Register No"; Code[20])
        {
        }
        field(7; Blocked; Boolean)
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

