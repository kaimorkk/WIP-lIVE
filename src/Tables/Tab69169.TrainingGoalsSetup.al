
table 69169 "Training Goals Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Training Plan ID"; Code[30])
        {
            TableRelation = "Training Plan Header";
        }
        field(3; "Goal ID"; Code[30])
        {
            TableRelation = "Training Goal Hub";
        }
        field(4; Description; Text[100])
        {
            CalcFormula = lookup("Training Goal Hub".Description where(Code = field("Goal ID")));
            FieldClass = FlowField;
        }
        field(5; "No. of training objectives"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Line No.", "Training Plan ID", "Goal ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

