
table 80005 "Stakeholder Sub-Group"
{
    DrillDownPageID = "Stakeholder Sub-Groups";
    LookupPageID = "Stakeholder Sub-Groups";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Stakeholder Group"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Group";
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Stakeholders"; Integer)
        {
            // CalcFormula = count(Contact where("Sub-Group" = field(Code)));
            // FieldClass = FlowField;
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

