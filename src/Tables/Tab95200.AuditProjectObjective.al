
table 95200 "Audit Project Objective"
{
    DrillDownPageID = "Audit Project Objectives";
    LookupPageID = "Audit Project Objectives";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
            Editable = false;
        }
        field(2; "Audit Objective ID"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(3; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Audit Objective ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

