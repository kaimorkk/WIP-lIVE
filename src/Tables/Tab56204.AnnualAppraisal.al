
table 56204 "Annual Appraisal"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;
        }
        field(2; "Date created"; Date)
        {
            Editable = false;
        }
        field(3; "Time Created"; Time)
        {
            Editable = false;
        }
        field(4; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(5; "Employee No"; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(6; "Employee Name"; Text[250])
        {
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(9; Quarter; Option)
        {
            OptionCaption = ' ,Quarter 1,Quarter 2,Quarter 3,Quarter 4';
            OptionMembers = " ","Quarter 1","Quarter 2","Quarter 3","Quarter 4";
        }
        field(10; "Financial Year"; Code[20])
        {
            TableRelation = "Appraisal  Period";
        }
        field(11; "Overall Quartely score"; Decimal)
        {
            Editable = false;
        }
        field(12; "Additional Assignment"; Blob)
        {
        }
        field(13; Remarks; Blob)
        {
        }
        field(14; "Supervisor Code"; Code[10])
        {
        }
        field(15; "Supervisor Name"; Text[250])
        {
        }
        field(16; "Supervisor Designation"; Text[250])
        {
        }
        field(17; Status; Option)
        {
            OptionCaption = 'Open,Sent to supervisior,Completed,Rejected';
            OptionMembers = Open,"Sent to supervisior",Completed,Rejected;
        }
        field(18; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(19; "Current Designation"; Text[100])
        {
        }
        field(20; "Terms of service"; Text[100])
        {
        }
        field(21; "Acting Appointment"; Text[250])
        {
            Caption = 'Acting Appointment/Special Duty';
        }
        field(22; "Appraisee comments"; Text[250])
        {
        }
        field(24; "Supervisor Comments"; Text[250])
        {
        }
        field(25; "Reward Type Recommended"; Text[250])
        {
        }
        field(26; "Other Interventions"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            HumanResSetup.Get();
            HumanResSetup.TestField("Annual Appraisal Nos.");
            NoSeriesMgt.InitSeries(HumanResSetup."Annual Appraisal Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;

        "Time Created" := Time;
        "Date created" := Today;
        "Created By" := UserId;

        Usersetup.Get("Created By");
        "Employee No" := Usersetup."Employee No.";
        "Employee Name" := Usersetup."Employee Name";
        ApproverUSerID := Usersetup."Approver ID";

        if EmployeeRec.Get("Employee No") then begin
            "Global Dimension 1 Code" := EmployeeRec."Global Dimension 1 Code";
            "Current Designation" := EmployeeRec."Job Title";
        end;

        EmployeeRec1.Reset;
        EmployeeRec1.SetRange("User ID", ApproverUSerID);
        if EmployeeRec1.Find('-') then begin
            "Supervisor Code" := EmployeeRec1."No.";
            "Supervisor Designation" := EmployeeRec1."Job Title";
            "Supervisor Name" := EmployeeRec1.FullName;
        end;
    end;

    var
        Employee: Record Employee;
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Usersetup: Record "User Setup";
        EmployeeRec: Record Employee;
        ApproverUSerID: Code[100];
        EmployeeRec1: Record Employee;
}

