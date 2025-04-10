table 50059 "HR Employee Clock In"
{
    Caption = 'HR Employee Clock In';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
        }
        field(2; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.get("Employee No") then
                    "Employee Name" := Emp.FullName();

            end;
        }
        field(3; "Employee Name"; Text[250])
        {
            Caption = 'Employee Name';
        }
        field(4; "Clockin Date"; Date)
        {
            Caption = 'Clockin Date';
        }
        field(5; "Clockin Time"; Time)
        {
            Caption = 'Clockin Time';
        }
        field(6; "Clockout Time"; Time)
        {
            Caption = 'Clockout Time';
        }
        field(7; "Date Created"; DateTime)
        {
            Caption = 'Date Created';
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }
}
