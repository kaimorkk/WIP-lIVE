Table 52193807 "Visiting Employees1"
{

    fields
    {
        field(1;"Visit No";Code[20])
        {
        }
        field(2;"Employee No.";Code[20])
        {
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                   if EmpRec.Get("Employee No.") then
                   begin
                   "Employee Name":=EmpRec."First Name"+' '+EmpRec."Middle Name"+ ' '+EmpRec."Last Name";
                   end;
            end;
        }
        field(3;"Employee Name";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Visit No","Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EmpRec: Record Employee;
}

