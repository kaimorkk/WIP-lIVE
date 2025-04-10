Table 52193669 "Commitee Members"
{
    // DrillDownPageID = "Daily Work Ticket List";
    // LookupPageID = "Daily Work Ticket List";

    fields
    {
        field(1;"Ref No";Code[20])
        {
            TableRelation = "Procurement Request";
        }
        field(2;Commitee;Code[10])
        {
            NotBlank = false;
            TableRelation = "Procurement Commitee";
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
        key(Key1;"Appointment No","Employee No",Commitee)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Empl: Record Employee;
        Appoitment: Record "Tender Commitee Appointment";
}

