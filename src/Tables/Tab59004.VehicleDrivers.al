
table 59004 "Vehicle Drivers"
{
    DrillDownPageID = "Fleet Drivers List";
    LookupPageID = "Fleet Drivers List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Driver; Code[10])
        {
            //TableRelation = Employee where("Employee Job Type" = const(Driver));
            TableRelation = Resource where(Type = const(Driver));
            trigger OnValidate()
            var
                Res: Record Resource;
            begin
                Emp.Reset;
                Emp.SetRange(Emp."No.", Driver);
                if Emp.Find('-') then begin
                    "Driver Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    "Phone Number" := Emp."Phone No.";
                    Gender := Format(Emp.Gender);
                    Email := Emp."Company E-Mail";
                    "Job Title code" := Emp."Job ID";

                    //Emp.CalcFields("Job Title");
                    "Job Title Description" := Emp."Job Title";
                    Validate("Center/Department", Emp."Department Code");

                    Grade := Emp."Salary Scale";
                    "Employement Date" := Emp."Employment Date";
                    "Duty Station Name" := Emp."Current Duty Station";
                end else begin
                    Res.Reset();
                    Res.SetRange("No.", Driver);
                    if Res.FindFirst() then begin
                        "Driver Name" := Res.Name;
                        // "Phone Number" := Res."M-Pesa Number";
                        Email := Res.Email;
                        // "Job Title code" := Res.co
                    end;
                end;
            end;
        }
        field(2; "Driver Name"; Text[100])
        {
        }
        field(3; "Driver License Number"; Code[20])
        {
        }
        field(4; "Last License Renewal"; Date)
        {
        }
        field(5; "Renewal Interval"; Option)
        {
            OptionMembers = Years;
        }
        field(6; "Renewal Interval Value"; Integer)
        {

            trigger OnValidate()
            begin
                "Next License Renewal" := CalcDate(Format("Renewal Interval Value") + 'Y', "Last License Renewal");
            end;
        }
        field(7; "Next License Renewal"; Date)
        {
        }
        field(8; "Year Of Experience"; Decimal)
        {
        }
        field(9; Grade; Code[20])
        {
        }
        field(10; Active; Boolean)
        {
        }
        field(11; "Licence Type"; Code[30])
        {
            TableRelation = "Licence Types"."Licence Type Code";
        }
        field(12; "Phone Number"; Text[30])
        {
        }
        field(13; "Center/Department"; Text[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
            trigger OnValidate()
            var
                RespCtr: Record "Responsibility Center";
            begin
                if RespCtr.Get("Center/Department") then
                    "Duty Station Name" := RespCtr.Name;
            end;
        }
        field(14; "Department Code"; Code[20])
        {
        }
        field(15; "Job Title code"; Code[20])
        {
        }
        field(16; "Job Title Description"; Text[100])
        {
        }
        field(17; Email; Text[50])
        {
        }
        field(18; "Date of Birth"; Date)
        {
        }
        field(19; "Employement Date"; Date)
        {
        }
        field(20; Gender; Code[20])
        {
        }
        field(21; "Type Of Driver"; Code[20])
        {
            TableRelation = "Fleet Lookup".Code where(Type = const("Driver Type"));
        }
        field(22; "Duty Station Name"; Text[100])
        {
            Editable = false;
        }


    }

    keys
    {
        key(Key1; Driver, "Driver Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Emp: Record Employee;
        StrValue: Text[1];
}

