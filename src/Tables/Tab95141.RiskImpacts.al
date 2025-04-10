
table 95141 "Risk Impacts"
{
    DrillDownPageID = "Risk Impacts";
    LookupPageID = "Risk Impacts";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[2000])
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

