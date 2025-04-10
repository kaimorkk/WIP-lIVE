
table 69607 "Staff Establishment Plan"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Effective Date"; Date)
        {
        }
        field(4; "External Document No."; Code[30])
        {
        }
        field(5; "Total Staff Establishment"; Integer)
        {
            Editable = false;
        }
        field(6; "No. of Recruitment Plans"; Integer)
        {
            CalcFormula = count("Recruitment Plan" where("Staff Establishement" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Created By"; Code[30])
        {
            Editable = false;
        }
        field(8; "Created On"; Date)
        {
            Editable = false;
        }
        field(9; "Created Time"; Time)
        {
            Editable = false;
        }
        field(10; "Establishment Type"; Option)
        {
            OptionMembers = Global,Functional;
        }
        field(11; "Duty Station"; Code[20])
        {
            TableRelation = "Duty Station";
            trigger OnValidate()
            var
                Dstation: Record "Duty Station";
            begin
                if Dstation.Get("Duty Station") then
                    "Station Name" := Dstation.Description;

            end;
        }
        field(12; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved,Cancelled,"Under Review";
        }
        field(13; "Station Name"; Text[250])
        {

        }
        field(14; "Actual Active"; Integer)
        {
            //  Editable = false;
            CalcFormula = count(Employee where(
                                                Status = const(Active)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Actual Terminated"; Integer)
        {
            CalcFormula = count(Employee where(
                                                Status = const(Terminated)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Actual Suspended"; Integer)
        {
            CalcFormula = count(Employee where(
                                                Status = const(Inactive)));
            FieldClass = FlowField;
        }
        field(17; "Approved No."; Integer)
        {
            Caption = 'Global Approved No';
            CalcFormula = sum("Establishment Planning Line"."Optimal Staffing" where(
                                                                                      Blcoked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; Variance; Integer)
        {
        }
        field(19; "Board Approved"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Treasury Approved"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "HRM Approved"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Global Consolidation"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staff Establishment Plan".Code where("Establishment Type" = const(Global));
        }

    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HrSetup.Get();
        HrSetup.TestField("Staff Establishment No.s");
        "Created By" := UserId;
        "Created On" := Today;
        "Created Time" := Time;
        if Code = '' then
            Code := Noseries.GetNextNo(HrSetup."Staff Establishment No.s", 0D, true);
    end;

    var
        QualificationSetUp: Record Qualification;
        HrSetup: Record "Human Resources Setup";
        Noseries: Codeunit NoSeriesManagement;

}

