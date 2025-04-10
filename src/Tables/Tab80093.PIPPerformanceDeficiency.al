
table 80093 "PIP Performance Deficiency"
{

    fields
    {
        field(1; "PIP ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Performance Deficiency/Gap"; Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Detailed Impact Noted"; Code[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "PIP ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

