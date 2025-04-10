Table 52193751 "Empoyee Attendees1"
{

    fields
    {
        field(1;"Segment No";Code[20])
        {
            NotBlank = true;
        }
        field(2;"Employee No.";Code[20])
        {
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                   if Employee.Get("Employee No.") then
                   begin
                   "Employee name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                   "Employee E-Mail":=Employee."E-Mail";
                   end;
            end;
        }
        field(3;"Employee name";Text[60])
        {
        }
        field(4;"Employee E-Mail";Text[60])
        {
        }
    }

    keys
    {
        key(Key1;"Segment No","Employee name")
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

