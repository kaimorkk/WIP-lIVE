
table 69199 "Hr Case Witness"
{
    DrillDownPageID = "Hr Case Witness";
    LookupPageID = "Hr Case Witness";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee No"; Code[30])
        {
            TableRelation = Employee."No.";
        }
        field(2; "Case Number"; Code[30])
        {
        }
        field(3; "Witness Number"; Code[30])
        {
            TableRelation = if ("Witness is Staff" = const(true)) Employee."No.";

            trigger OnValidate()
            begin
                if "Witness is Staff" = true then begin
                    Emp.Reset;
                    Emp.SetRange("No.", "Witness Number");
                    if Emp.FindSet then begin
                        "Witness Name" := Emp."First Name" + ' ' + Emp."Last Name";
                    end;
                end;


                //Validate Not  To Have 2 same witnesses
            end;
        }
        field(4; "Witness Name"; Text[100])
        {
        }
        field(5; "Witness Statement"; Text[2000])
        {
        }
        field(6; "Witness is Staff"; Boolean)
        {
        }
        field(7; "Line No"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(8; Address; Text[250])
        {
        }
        field(9; "Phone No."; Code[10])
        {
        }
        field(10; "E-Mail"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", "Case Number", "Witness Number")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //      Enabled = false;
        //   }
    }

    fieldgroups
    {
    }

    var
        Emp: Record Employee;
}

