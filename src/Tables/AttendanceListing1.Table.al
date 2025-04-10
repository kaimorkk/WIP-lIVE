Table 52193743 "Attendance Listing1"
{

    fields
    {
        field(1;"No.";Code[10])
        {
            Description = 'commissioners/empl';
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                      if   Empl.Get("No.")   then
                        "Full Names":=Empl."First Name"+' '+Empl."Last Name" ;
                        Email:=Empl."E-Mail";
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
}

