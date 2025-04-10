
table 80059 "PC Capability Matrix"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
            TableRelation = "Perfomance Contract Header".No;
        }
        field(2; "Entry No"; Integer)
        {
            AutoIncrement = true;
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
        field(6; "Unit of Measure"; Code[30])
        {
            TableRelation = "Unit of Measure";
        }
        field(7; Quantity; Decimal)
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

