Table 52193904 "Training Facilitators1"
{

    fields
    {
        field(1; "Training Need"; Code[20])
        {
            NotBlank = true;
            //TableRelation = Table69124.Field1;
        }
        field(2; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employees.Reset;
                if Employees.Get(Code) then
                    Names := Employees."First Name" + ' ' + Employees."Middle Name" + ' ' + Employees."Last Name";
            end;
        }
        field(3; Names; Text[200])
        {
        }
        field(4; Remarks; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Training Need", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employees: Record Employee;
}

