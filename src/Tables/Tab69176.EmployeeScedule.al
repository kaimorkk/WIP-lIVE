
table 69176 "Employee Scedule"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Employee No."; Code[30])
        {
            // TableRelation = "Training Participants"."Employee Code" where("Training Code" = field("Training Application No."));
        }
        field(3; Date; Date)
        {

            trigger OnValidate()
            begin
                Day := Format(Date, 0, '<Weekday Text>');
            end;
        }
        field(4; Type; Option)
        {
            OptionMembers = Schedule,Attendance;
        }
        field(5; "Training Application No."; Code[30])
        {
        }
        field(6; "Employee Name"; Text[100])
        {
            CalcFormula = lookup(Employee."Search Name" where("No." = field("Employee No.")));
            FieldClass = FlowField;
        }
        field(7; Day; Text[30])
        {
        }
        field(8; Submitted; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Training Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

