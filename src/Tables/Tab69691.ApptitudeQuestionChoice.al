
table 69691 "Apptitude Question Choice"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Apptitude Question"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Apptitude Question";
        }
        field(3; "Choice ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Blob)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

