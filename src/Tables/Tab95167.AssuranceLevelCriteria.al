
table 95167 "Assurance Level Criteria"
{
    DrillDownPageID = "Assurance Level Criteria";
    LookupPageID = "Assurance Level Criteria";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Assurance Level ID"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Assurance Level ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

