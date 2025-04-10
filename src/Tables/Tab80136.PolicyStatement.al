
table 80136 "Policy Statement"
{

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Area"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Policy Statement"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Area", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

