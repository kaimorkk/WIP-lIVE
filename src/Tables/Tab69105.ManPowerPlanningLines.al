
table 69105 "ManPower Planning Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Task No"; Code[30])
        {
        }
        field(3; "Manpower Plan Code"; Code[30])
        {
            TableRelation = "Manpower Plan Header";
        }
        field(4; "Job Id"; Code[30])
        {
            TableRelation = Positions;
        }
        field(5; "Job Title"; Text[100])
        {
            CalcFormula = lookup(Positions."Job Description" where("Job ID" = field("Job Id")));
            FieldClass = FlowField;
        }
        field(6; "Responsibility Center Code"; Code[10])
        {
            TableRelation = "Responsibility Center";
        }
        field(7; "Responsibility Center Name"; Text[100])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Responsibility Center Code")));
            FieldClass = FlowField;
        }
        field(8; "Quarter 1 Target"; Integer)
        {

            trigger OnValidate()
            begin
                "Target No." := "Quarter 1 Target" + "Quarter 2 Target" + "Quarter 3 Target" + "Quarter 4 Target";
            end;
        }
        field(9; "Quarter 2 Target"; Integer)
        {

            trigger OnValidate()
            begin
                "Target No." := "Quarter 1 Target" + "Quarter 2 Target" + "Quarter 3 Target" + "Quarter 4 Target";
            end;
        }
        field(10; "Quarter 3 Target"; Integer)
        {

            trigger OnValidate()
            begin
                "Target No." := "Quarter 1 Target" + "Quarter 2 Target" + "Quarter 3 Target" + "Quarter 4 Target";
            end;
        }
        field(11; "Quarter 4 Target"; Integer)
        {

            trigger OnValidate()
            begin
                "Target No." := "Quarter 1 Target" + "Quarter 2 Target" + "Quarter 3 Target" + "Quarter 4 Target";
            end;
        }
        field(12; "Quarter 1 Actual"; Integer)
        {
        }
        field(13; "Quarter 2 Actual"; Integer)
        {
        }
        field(14; "Quarter 3 Actual"; Integer)
        {
        }
        field(15; "Quarter 4 Actual"; Integer)
        {
        }
        field(16; "Target No."; Integer)
        {
        }
        field(17; "Estimated Costs"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", "Task No", "Manpower Plan Code", "Job Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

