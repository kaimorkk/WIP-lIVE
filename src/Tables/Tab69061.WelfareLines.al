
table 69061 "Welfare Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Welfare Header No."; Code[30])
        {
        }
        field(2; LineNo; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Employee No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No.");
                if Employee.FindSet then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";

                end
            end;
        }
        field(4; "Employee Name"; Text[30])
        {
        }
        field(5; Month; Text[30])
        {
        }
        field(6; Date; Date)
        {

            trigger OnValidate()
            begin
                Month := Format(Date, 0, '<Month Text>');
            end;
        }
        field(7; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Welfare Header No.", LineNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
}

