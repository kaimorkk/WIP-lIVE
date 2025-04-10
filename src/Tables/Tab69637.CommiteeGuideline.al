
table 69637 "Commitee Guideline"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Committee Type ID"; Code[30])
        {
            TableRelation = "Committee Type";
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[300])
        {
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

