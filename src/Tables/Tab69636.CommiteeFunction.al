
table 69636 "Commitee Function"
{

    fields
    {
        field(1; "Committee Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Committee Type";
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Committee Type ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

