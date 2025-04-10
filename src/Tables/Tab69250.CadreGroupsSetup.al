
table 69250 "Cadre Groups Setup"
{
    LookupPageId = "Cadre Groups Setup List";
    DrillDownPageId = "Cadre Groups Setup List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; Blocked; Boolean)
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

