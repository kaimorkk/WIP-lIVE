
table 69104 "ManPower Plan Task Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Task No"; Code[30])
        {
        }
        field(2; "Manpower Plan Code"; Code[30])
        {
            TableRelation = "Manpower Plan Header";
        }
        field(3; "Job Id"; Code[30])
        {
            TableRelation = Positions;
        }
        field(4; "Job Title"; Text[100])
        {
            CalcFormula = lookup(Positions."Job Description" where("Job ID" = field("Job Id")));
            FieldClass = FlowField;
        }
        field(5; "Actual Active"; Integer)
        {
            CalcFormula = count(Employee where("Job ID" = field("Job Id")));
            FieldClass = FlowField;
        }
        field(6; "Target No."; Integer)
        {
            CalcFormula = sum("ManPower Planning Lines"."Target No." where("Job Id" = field("Job Id"),
                                                                            "Manpower Plan Code" = field("Manpower Plan Code")));
            FieldClass = FlowField;
        }
        field(7; "Actual Recruited"; Integer)
        {
        }
        field(8; "Approved Establishment"; Integer)
        {

            trigger OnValidate()
            begin
                Deficit := "Approved Establishment" - "Actual Active";
            end;
        }
        field(9; Deficit; Integer)
        {
        }
        field(10; "Quarter 3 Target"; Integer)
        {
        }
        field(11; "Quarter 4 Target"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Manpower Plan Code", "Job Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

