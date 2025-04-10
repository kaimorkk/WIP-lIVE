
table 69402 "Hazard Control Measure"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Hazard Type"; Code[20])
        {
            TableRelation = "Hazard Type".Code;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(3; "Recommended Preventive Action"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Hazard Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

