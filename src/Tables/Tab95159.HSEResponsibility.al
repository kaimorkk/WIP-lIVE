
table 95159 "HSE Responsibility"
{
    DrillDownPageID = "Risk Mgt. Responsibilities";
    LookupPageID = "Risk Mgt. Responsibilities";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Role ID"; Code[20])
        {
        }
        field(2; "Responsibility ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Role ID", "Responsibility ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

