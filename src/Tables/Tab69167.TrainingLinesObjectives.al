
table 69167 "Training Lines Objectives"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Objective Id"; Code[30])
        {
            TableRelation = "Training Lines Objectives";
        }
        field(3; "Code"; Code[30])
        {
        }
        field(4; Objective; Text[100])
        {
        }
        field(5; "Goal ID"; Code[10])
        {
            TableRelation = "Training Goal Hub";
        }
        field(6; "Goal Description"; Text[100])
        {
            CalcFormula = lookup("Training Goal Hub".Description where(Code = field("Goal ID")));
            FieldClass = FlowField;
        }
        field(7; Type; Option)
        {
            OptionMembers = Need,Plan;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Objective Id", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

