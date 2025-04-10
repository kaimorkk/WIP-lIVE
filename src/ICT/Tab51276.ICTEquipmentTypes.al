
table 51276 "ICT Equipment Types"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[150])
        {
        }
        field(3; Category; Option)
        {
            OptionCaption = 'Item/Accessory,Connected to the LAN,Academic software';
            OptionMembers = "Item/Accessory","Connected to the LAN","Academic software";
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

