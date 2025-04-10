Table 52193793 "Commitee Members1"
{

    fields
    {
        field(1;"Ref No";Code[50])
        {
            TableRelation = "Procurement Request1";
        }
        field(2;Commitee;Code[10])
        {
            NotBlank = false;
            TableRelation = "Procurement Commitee1";
        }
        field(3;"Employee No";Code[10])
        {
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                  if Empl.Get("Employee No") then
                  begin
                     Name:=Empl."First Name"+ ' ' +Empl."Last Name";
                  end;
            end;
        }
        field(4;Name;Text[80])
        {
        }
        field(5;"Appointment No";Code[20])
        {

            trigger OnValidate()
            begin
                  if Appoitment.Get("Appointment No") then
                  begin
                   "Appointment No":=Appoitment."Appointment No";
                    Commitee:=Appoitment."Committee ID";
                  end;
            end;
        }
        field(6;Chair;Boolean)
        {
        }
        field(7;Secretary;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Appointment No","Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Empl: Record Employee;
        Appoitment: Record "Tender Commitee Appointment1";
}

