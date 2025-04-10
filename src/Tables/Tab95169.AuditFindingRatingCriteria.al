
table 95169 "Audit Finding Rating Criteria"
{
    DrillDownPageID = "Audit Finding Rating Criteria";
    LookupPageID = "Audit Finding Rating Criteria";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Rating Code"; Code[20])
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
        key(Key1; "Rating Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

