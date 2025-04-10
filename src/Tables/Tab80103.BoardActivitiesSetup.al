
table 80103 "Board Activities Setup"
{
    DrillDownPageID = "Board Activities setup";
    LookupPageID = "Board Activities setup";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

