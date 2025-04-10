
table 56206 "Staff Training Appraisal"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Appraisal No"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Training & Development Need"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Appraisal No", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

