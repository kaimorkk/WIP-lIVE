
table 95166 "Audit Assurance Level"
{
    DrillDownPageID = "Audit Assurance Levels";
    LookupPageID = "Audit Assurance Levels";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "No. Of Findings"; Integer)
        {
            Editable = false;
        }
        field(4; Blocked; Boolean)
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

