
table 69609 "Establishment Planning Line"
{
    DrillDownPageID = "Establishment Planning Lines";
    LookupPageID = "Establishment Planning Lines";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Task No"; Integer)
        {

            trigger OnValidate()
            begin
                if StaffEstablishmentTaskLines.Get("Task No") then begin
                    // "Primary Key":=StaffEstablishmentTaskLines."Actual Active";
                    "Position ID" := StaffEstablishmentTaskLines."Job ID";
                end
            end;
        }
        field(3; "Primary Key"; Code[30])
        {
        }
        field(4; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions";

            trigger OnValidate()
            begin
                if CompanyPositions.Get("Position ID") then begin
                    "Department Code" := CompanyPositions.Department;
                    "Directorate Code" := CompanyPositions.Directorate;
                    "Job Title/Designation" := CompanyPositions."Job Title";

                end
            end;
        }
        field(5; "Job Title/Designation"; Text[100])
        {
            Editable = false;
        }
        field(6; "Department Code"; Code[20])
        {
            Caption = 'Department';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(7; "Directorate Code"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(8; "Optimal Staffing"; Integer)
        {
        }
        field(9; "No. of Active Employees"; Integer)
        {
            CalcFormula = count(Employee where("Current Position ID" = field("Position ID")));
            Editable = true;
            FieldClass = FlowField;
        }
        field(10; Justification; Text[100])
        {
        }
        field(11; "Dimension Set ID"; Code[30])
        {
        }
        field(12; "Region Code"; Code[30])
        {
            Caption = 'County';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(13; "Duty Station ID"; Code[30])
        {
            TableRelation = "Duty Station";

            trigger OnValidate()
            begin
                if DutyStation.Get("Duty Station ID") then begin
                    "Work Location Details" := DutyStation.Description;
                    "Region Code" := DutyStation."Region ID";
                end
            end;
        }
        field(14; "Work Location Details"; Text[300])
        {
        }
        field(15; "Designation Group"; Code[30])
        {
            TableRelation = "Designation Groups";
        }
        field(16; Blcoked; Boolean)
        {
        }
        field(17; "Court Stations"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Court Stations"));
        }
        field(18; "Court Levels"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Court Levels"));
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Position ID", "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Position ID", "Department Code", "Optimal Staffing")
        {
        }
    }

    var
        Employee: Record Employee;
        OK: Boolean;
        // TrainingNeeds: Record "Job Advert Header";
        Qualifications: Record Qualification;
        EmpQualifications: Record "Employee Qualification";
        // TrainingReq: Record "Training Request";
        StaffEstablishmentTaskLines: Record "Staff Establishment Task Lines";
        CompanyPositions: Record "Company Positions";
        DutyStation: Record "Duty Station";
}

