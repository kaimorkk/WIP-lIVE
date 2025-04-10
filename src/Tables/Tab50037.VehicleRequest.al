table 50037 "Vehicle Request"
{
    Caption = 'Vehicle Request';
    DataClassification = CustomerContent;
    LookupPageId = "Vehicle Request List";
    DrillDownPageId = "Vehicle Request List";

    fields
    {
        field(1; "Request No."; Code[20])
        {
            Caption = 'Request No.';
            Editable = false;
            trigger OnValidate()
            begin
                if "Request No." <> xRec."Request No." then begin
                    FleetMgtSetup.Get;
                    NoSeriesMgt.TestManual(FleetMgtSetup."Vehicle Request Nos.");
                    "No. Series" := '';
                end;
            end;

        }
        field(2; "Request Date"; Date)
        {
            Caption = 'Request Date';
            Editable = false;
        }
        field(3; "Requested By"; Code[50])
        {
            Caption = 'Requested By';
            Editable = false;
        }
        field(4; "Station No."; Code[20])
        {
            Caption = 'Station No.';
            TableRelation = "Duty Station";
            trigger OnValidate()
            var
                DutyStation: Record "Duty Station";
            begin
                DutyStation.Get("Station No.");
                "Station Description" := DutyStation.Description;
            end;
        }
        field(5; "Station Description"; Text[50])
        {
            Caption = 'Station Description';
            Editable = false;
        }
        field(6; "Vehicle Type"; Code[50])
        {
            Caption = 'Vehicle Type';
            TableRelation = "Vehicle Type";
        }
        field(7; Capacity; Integer)
        {
            Caption = 'Capacity';
        }
        field(8; "Request Type"; Option)
        {
            OptionMembers = " ",New,Replacement;
        }
        field(9; Justification; Text[250])
        {
            Caption = 'Justification';
        }
        field(10; Purpose; Text[250])
        {
            Caption = 'Purpose';
        }
        field(11; Status; Option)
        {
            OptionMembers = Open,Pending,Approved,Rejected;
            Editable = false;
        }
        field(12; "Vehicle Issued"; Boolean)
        {
            Caption = 'Vehicle Issued';
            Editable = false;
        }
        field(13; "Date Issued"; Date)
        {
            Caption = 'Date Issued';
            Editable = false;
        }
        field(14; "Time Issued"; Time)
        {
            Caption = 'Time Issued';
            Editable = false;
        }
        field(15; "License Plate Number Issued"; Code[20])
        {
            Caption = 'License Plate Number Issued';
            TableRelation = "Fleet Vehicles."."Registration No." where(Blocked = const(false));
        }
        field(16; "Issued By"; Code[50])
        {
            Caption = 'Issued By';
            Editable = false;

        }
        field(17; "No. Series"; Code[20])
        {
            Caption = 'No. Series.';
            Editable = false;
        }
        field(18; "Notification Remarks"; Text[250])
        {

        }
    }
    keys
    {
        key(PK; "Request No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        ValidateUser();

        if "Request No." = '' then begin
            FleetMgtSetup.Get;
            FleetMgtSetup.TestField(FleetMgtSetup."Vehicle Request Nos.");
            NoSeriesMgt.InitSeries(FleetMgtSetup."Vehicle Request Nos.", xRec."No. Series", 0D, "Request No.", "No. Series");
        end;

        "Request Date" := Today;
        "Requested By" := UserId;

        Employee.Reset();
        Employee.SetRange("User ID", UserId);
        if Employee.FindFirst() then begin
            //  Employee.TestField("Section/Location");
            Validate("Station No.", Employee."Current Duty Station");
        end;
    end;

    procedure IssueVehicle()
    var
        // VehicleMgt: Codeunit "Vehicle Management";
        FleetMgtSetup: Record "Fleet Management Setup";
        InStream: InStream;
    begin
        Rec.TestField(Status, Rec.Status::Approved);
        Rec.TestField("License Plate Number Issued");
        Rec.TestField("Notification Remarks");
        FleetMgtSetup.Get();

        Rec."Vehicle Issued" := true;
        Rec."Issued By" := UserId;
        Rec."Date Issued" := Today;
        Rec."Time Issued" := Time;
        Rec.Modify();

        Employee.Reset();
        Employee.SetRange("User ID", "Requested By");
        Employee.FindFirst();

        // VehicleMgt.SendEmail(Employee."E-Mail", FleetMgtSetup."Transport Admin Email",
        // StrSubstNo('Vehicle %1 Issued.', Rec."License Plate Number Issued"), 'Greetings,', '<p>' + Rec."Notification Remarks" + '</p>',
        // '', InStream);

        Message('Vehicle Issued Successfully!')
    end;

    local procedure ValidateUser()
    var
        Employee: Record Employee;
        ErrEmp: Label 'The user has not been setup as an Employee.!';
        EmpHod: Label 'Only the head of station is allowed to make a vehicle request.!';
    begin
        Employee.Reset();
        Employee.SetRange("User ID", UserId);
        if not Employee.FindFirst() then
            Error(ErrEmp);

        // if (not Employee.HOD) and (not Employee.HODIR) then
        //     Error(EmpHod);

    end;

    procedure ValidatePreApproval()
    begin
        Rec.TestField(Status, Rec.Status::Open);
        Rec.TestField("Vehicle Type");
        Rec.TestField("Request Type");
        Rec.TestField(Justification);
        Rec.TestField(Purpose);
        Rec.TestField(Capacity);
    end;

    var

        FleetMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
}
