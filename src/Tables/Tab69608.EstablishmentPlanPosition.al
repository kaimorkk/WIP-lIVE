
table 69608 "Establishment Plan Position"
{
    // DrillDownPageID = "App Welfare  Membership";
    // LookupPageID = "App Welfare  Membership";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Job ID"; Code[30])
        {
            TableRelation = "Company Positions" where("Position Category" = filter(Employee | Resource));
            trigger OnValidate()
            var
                Positn: Record "Company Positions";
            begin
                if Positn.Get("Job ID") then
                    "Job Title" := Positn."Job Title"

            end;
        }
        field(2; "Job Title"; Text[250])
        {
            Editable = false;
        }
        field(3; "Actual Active"; Integer)
        {
            //  Editable = false;
            CalcFormula = count(Employee where("Current Position ID" = field("Job ID"),
                                                Status = const(Active)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Actual Terminated"; Integer)
        {
            CalcFormula = count(Employee where("Current Position ID" = field("Job ID"),
                                                Status = const(Terminated)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Actual Suspended"; Integer)
        {
            CalcFormula = count(Employee where("Current Position ID" = field("Job ID"),
                                                Status = const(Inactive)));
            FieldClass = FlowField;
        }
        field(6; "Staff Establishment Code"; Code[30])
        {
            TableRelation = "Staff Establishment Plan".Code;
            trigger OnValidate()
            var
                StaffEst: record "Staff Establishment Plan";
            begin
                if StaffEst.Get("Staff Establishment Code") then
                    //  StaffEst.TestField("Establishment Type");
                    Rec."Establishment Type" := StaffEst."Establishment Type";
            end;
        }
        field(7; "Year Code"; Code[30])
        {
            TableRelation = "Annual Reporting Codes";
        }
        field(8; "Approved No."; Integer)
        {
            Caption = 'Global Approved No';
            CalcFormula = sum("Establishment Planning Line"."Optimal Staffing" where("Position ID" = field("Job ID"),
                                                                                      Blcoked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Department Code"; Code[20])
        {
            Caption = 'Directorate/ Department';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            //TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(10; "Directorate Code"; Code[30])
        {
            Caption = 'Duty Station';
            TableRelation = "Duty Station".Code;
            //TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            // TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(11; "Designation Group"; Code[30])
        {
            TableRelation = "Designation Groups";
        }
        field(12; "Position Category"; Option)
        {
            OptionCaption = 'Employee,Resource';
            OptionMembers = Employee,Resource;
        }
        field(13; Variance; Integer)
        {
        }
        field(36; "Cadre Type"; Option)
        {
            OptionCaption = ' ,Normal Cadre,Common Cadre';
            OptionMembers = " ","Normal Cadre","Common Cadre";
        }
        field(37; "Cadre Code"; Code[20])
        {
        }
        field(38; Status; Option)
        {
            Editable = false;
            OptionCaption = ' ,Approved,Not Approved';
            OptionMembers = " ",Approved,"Not Approved";
        }
        field(39; "Current No Functional"; Integer)
        {
            //  Editable = false;
            CalcFormula = count(Employee where("Current Position ID" = field("Job ID"),
            "Current Duty Station" = field("Directorate Code"),
                                                Status = const(Active)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Establishment Type"; Option)
        {
            OptionMembers = Global,Functional;
        }
        field(41; "Actual Active Function"; Integer)
        {
            //  Editable = false;
            CalcFormula = count(Employee where("Current Position ID" = field("Job ID"),
            "Current Duty Station" = field("Directorate Code"),
                                                Status = const(Active)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "Actual Terminated Function"; Integer)
        {
            CalcFormula = count(Employee where("Current Position ID" = field("Job ID"),
            "Current Duty Station" = field("Directorate Code"),
                                                Status = const(Terminated)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; "Actual Suspended Function"; Integer)
        {
            CalcFormula = count(Employee where("Current Position ID" = field("Job ID"),
            "Current Duty Station" = field("Directorate Code"),
                                                Status = const(Inactive)));
            FieldClass = FlowField;
        }
        field(44; "Approved No. Function"; Integer)
        {
            CalcFormula = sum("Establishment Planning Line"."Optimal Staffing" where("Position ID" = field("Job ID"),
            "Duty Station ID" = field("Directorate Code"),
                                                                                      Blcoked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }

    }

    keys
    {
        key(Key1; "Job ID", "Staff Establishment Code", "Directorate Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Job Title", "Actual Active", "Actual Terminated")
        {
        }
    }
}

