
table 80038 "Strategic Capability Matrix"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[100])
        {
        }
        field(2; "Entry No"; Integer)
        {
        }
        field(3; "Capability Category"; Option)
        {
            OptionCaption = 'Human Capital,Financial,Physical/Organizational Resources,Intellectual Capital';
            OptionMembers = "Human Capital",Financial,"Physical/Organizational Resources","Intellectual Capital";
        }
        field(4; "Capability Description"; Text[255])
        {
        }
        field(5; "Inventory Summary"; Text[255])
        {
        }
        field(6; "Strategic Implications"; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

