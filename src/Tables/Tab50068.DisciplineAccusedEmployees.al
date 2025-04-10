table 50068 "Discipline Accused Employees"
{
    Caption = 'Discipline Accused Employees';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Case Number"; Code[20])
        {
            Caption = 'Case Number';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No';
        }
        field(3; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            TableRelation = Employee;
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                Emp.Get("Employee No");
                "Employee Name" := Emp.FullName();
                Designation := Emp."Job Title";
                if Emp."Job Title2" <> '' then
                    Designation := Emp."Job Title2";

            end;
        }
        field(4; "Employee Name"; Text[250])
        {
            Caption = 'Employee Name';
            Editable = false;
        }
        field(5; Designation; Text[250])
        {
            Caption = 'Designation';
            Editable = false;
        }

    }
    keys
    {
        key(PK; "Case Number", "Line No.")
        {
            Clustered = true;
        }
    }
}
