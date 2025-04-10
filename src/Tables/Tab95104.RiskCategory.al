
table 95104 "Risk Category"
{
    DrillDownPageID = "Risk Categories";
    LookupPageID = "Risk Categories";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Risk Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Source"."Source ID" where(Blocked = filter(false));
        }
        field(4; "Addditiona Comments"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. of Risk Triggers"; Integer)
        {
            CalcFormula = count("Risk Category Trigger" where("Risk Category ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "No of Strategic Risks"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Document Type" = filter(Corporate),
                                                                   "Risk Category" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "No of Operational Risks"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Document Type" = filter("Functional (Directorate)" | "Functional (Department)" | "Functional (Region)"),
                                                                   "Risk Category" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "No of Project Risks"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Document Type" = filter(Project),
                                                                   "Risk Category" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "No. of Incidents"; Integer)
        {
        }
        field(10; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
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

