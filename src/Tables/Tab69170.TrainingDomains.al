
table 69170 "Training Domains"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Courses"; Integer)
        {
            CalcFormula = count("Training Courses Setup" where(Domain = field(Code)));
            FieldClass = FlowField;
        }
        field(5; "No. of Actual Staff Trained"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Actual Budget Spent"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; LMS; Boolean)
        {
        }
        field(8; Synched; Boolean)
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

