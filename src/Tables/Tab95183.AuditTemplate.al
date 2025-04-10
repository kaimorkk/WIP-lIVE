
table 95183 "Audit Template"
{
    DrillDownPageID = "Audit Templates";
    LookupPageID = "Audit Templates";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "Audit  WorkType"; Code[20])
        {
            TableRelation = "Audit Work Type".Code;
        }
        field(4; "Last Review Date"; Date)
        {
            Editable = false;
        }
        field(5; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

