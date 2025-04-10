
table 70125 "Project Role Code"
{
    DrillDownPageID = "Project Role Code";
    LookupPageID = "Project Role Code";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Project Role Code"; Code[30])
        {
        }
        field(2; "Title/Designation Description"; Text[100])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Project Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

