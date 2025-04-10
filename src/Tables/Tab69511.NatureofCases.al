
table 69511 "Nature of Cases"
{
    DrillDownPageID = "Nature of Cases";
    LookupPageID = "Nature of Cases";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Code[255])
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

