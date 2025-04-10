Table 52193760 "Employee Committee1"
{

    fields
    {
        field(1;"Meeting Code";Code[20])
        {
        }
        field(2;"Employee Code";Code[10])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin

                   if Cust.Get("Employee Code") then
                  begin
                  "Employee Name":=Cust.Name;
                   end
            end;
        }
        field(3;"Employee Name";Text[40])
        {
        }
        field(4;"Committee Code";Code[20])
        {
        }
        field(5;Email;Text[100])
        {
        }
        field(6;Attended;Boolean)
        {
        }
        field(7;"No.";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Meeting Code","Employee Code","Committee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        emp: Record Employee;
        Cust: Record Customer;
}

