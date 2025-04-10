Table 52193759 "Employee Attendance1"
{

    fields
    {
        field(1;"No.";Code[10])
        {
            NotBlank = true;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                
                      /*
                       IF   Empl.GET("No.")   THEN
                        "Full Names":=Empl."First Name"+' '+Empl."Last Name" ;
                        Email:=Empl."E-Mail";
                         */
                
                
                      if Cust.Get("No.")   then
                        "Full Names":=Cust.Name ;
                        Email:=Cust."E-Mail";

            end;
        }
        field(2;"Full Names";Text[40])
        {
            NotBlank = true;
        }
        field(3;"Committee Code";Code[20])
        {
            NotBlank = false;
            TableRelation = "Committee Type1";
        }
        field(4;"To Attend?";Boolean)
        {
        }
        field(5;"Meeting Code";Code[10])
        {
            NotBlank = false;
            TableRelation = Campaign;
        }
        field(6;Email;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"No.","Meeting Code","Committee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Empl: Record Employee;
        Cust: Record Customer;
}

