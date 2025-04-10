
table 72065 "Incident Site Condition"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Assets; Text[250])
        {
        }
        field(3; "Damage Condition"; Text[250])
        {
        }
        field(4; "Photo no"; Text[20])
        {
        }
        field(5; "Incident No"; Code[20])
        {
        }
        field(6; Project; Code[20])
        {
        }
        field(7; "Header No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", Project, "Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

