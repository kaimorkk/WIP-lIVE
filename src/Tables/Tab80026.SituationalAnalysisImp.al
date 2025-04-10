
table 80026 "Situational Analysis Imp"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Matrix ID"; Code[50])
        {
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Entry No"; Integer)
        {
        }
        field(4; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Matrix ID", "Line No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

