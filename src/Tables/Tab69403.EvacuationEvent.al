
table 69403 "Evacuation Event"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[440])
        {
        }
        field(3; "Hazard Type"; Code[20])
        {
            TableRelation = "Hazard Type".Code where(Blocked = filter(false));
        }
        field(4; "No. of Planned Emerge Drills"; Integer)
        {
            Description = 'No. of Planned Emerge Drills';
            Editable = false;
            FieldClass = Normal;
        }
        field(5; "No. of Conducted Emerge Drills"; Integer)
        {
            Description = 'No. of Conducted Emerge Drills';
        }
        field(6; Blocked; Boolean)
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

