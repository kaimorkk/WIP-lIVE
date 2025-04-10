
table 80070 "Competency Note & Requirement"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Competency ID"; Code[50])
        {
        }
        field(3; "Competency Notes"; Text[255])
        {
        }
        field(4; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

