
table 69102 "Staff Establishment Task Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Job ID"; Code[30])
        {
            //TableRelation = Positions;
        }
        field(3; "Job Title"; Text[250])
        {
            CalcFormula = lookup(Positions."Job Description" where("Job ID" = field("Job ID")));
            FieldClass = FlowField;
        }
        field(4; "Approved Qty"; Integer)
        {
        }
        field(5; "Department Code"; Code[30])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(6; "Department Name"; Text[100])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Department Code")));
            FieldClass = FlowField;
        }
        field(7; "Actual Active"; Integer)
        {
            CalcFormula = count(Employee where("Job ID" = field("Job ID"),
                                                Status = const(Active)));
            FieldClass = FlowField;
        }
        field(8; "Actual Terminated"; Integer)
        {
        }
        field(9; "Actual Suspended"; Integer)
        {
        }
        field(10; "Staff Establishment Code"; Code[30])
        {
            //TableRelation = "Staff Establishment Header";
        }
        field(11; "Year Code"; Code[30])
        {
            //TableRelation = "Annual Reporting Codes";
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Staff Establishment Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

