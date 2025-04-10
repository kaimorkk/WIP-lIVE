table 69746 "Handover Temp Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Temp Id"; Code[30])
        {
        }
        field(2; Type; Option)
        {
            OptionCaption = 'Asset,Item,File,Other';
            OptionMembers = Asset,Item,File,Other;
        }
        field(3; No; Code[10])
        {
        }
        field(4; "Line No"; Code[10])
        {
        }
        field(5; Description; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Temp Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

