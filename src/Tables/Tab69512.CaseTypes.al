
table 69512 "Case Types"
{
    DrillDownPageID = "Case Types";
    LookupPageID = "Case Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Case Nature"; Code[50])
        {
            TableRelation = "Nature of Cases".Code;
        }
        field(2; "Case Type"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Case Nature", "Case Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

