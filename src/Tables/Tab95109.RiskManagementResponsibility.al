
table 95109 "Risk Management Responsibility"
{
    DrillDownPageID = "Risk Mgt. Responsibilities";
    LookupPageID = "Risk Mgt. Responsibilities";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Role ID"; Code[20])
        {
            TableRelation = "Risk Management Role".Code where(Blocked = filter(false));
        }
        field(2; "Responsibility ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[250])
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

