
table 95240 "Audit PlanLine Objective"
{
    DrillDownPageID = "Audit Project Objectives";
    LookupPageID = "Audit Project Objectives";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Audit Plan ID"; Code[20])
        {
        }
        field(2; "Engagement Line No."; Integer)
        {
        }
        field(3; "Audit Objective ID"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(4; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Audit Plan ID", "Engagement Line No.", "Audit Objective ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

