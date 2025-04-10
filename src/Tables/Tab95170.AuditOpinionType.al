
table 95170 "Audit Opinion Type"
{
    DrillDownPageID = "Audit Opinion Types";
    LookupPageID = "Audit Opinion Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "Additional Comments"; Text[2048])
        {
        }
        field(4; Blocked; Boolean)
        {
        }
        field(5; "No. of Draft Audit Reports"; Integer)
        {
            CalcFormula = count("Audit Execution Header" where("Document Type" = filter("Draft Audit Report")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "No. of Final Audit Reports"; Integer)
        {
            CalcFormula = count("Audit Execution Header" where("Document Type" = filter("Final Audit Report")));
            Editable = false;
            FieldClass = FlowField;
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

