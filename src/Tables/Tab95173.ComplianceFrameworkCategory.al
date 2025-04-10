
table 95173 "Compliance Framework Category"
{
    DrillDownPageID = "Compliance Framework Categorie";
    LookupPageID = "Compliance Framework Categorie";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "No. of Compliance Frameworks"; Integer)
        {
            CalcFormula = count("Compliance Framework" where("Framework Category" = field(Code)));
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

