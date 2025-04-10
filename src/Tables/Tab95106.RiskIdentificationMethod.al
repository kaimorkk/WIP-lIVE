
table 95106 "Risk Identification Method"
{
    DrillDownPageID = "Risk Identification Methods";
    LookupPageID = "Risk Identification Methods";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "No. Held"; Integer)
        {
            CalcFormula = count("RMP Risk Identification Method" where("Risk Identification Method" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
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

