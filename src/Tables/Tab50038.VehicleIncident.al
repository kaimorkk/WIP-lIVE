table 50038 "Vehicle Incident"
{
    Caption = 'Vehicle Incident';
    DataClassification = CustomerContent;
    DrillDownPageId = "Vehicle Incident List";
    LookupPageId = "Vehicle Incident List";


    fields
    {
        field(1; "Incident No."; Code[20])
        {
            Caption = 'Incident No.';
            Editable = false;
            trigger OnValidate()
            begin
                if "Incident No." <> xRec."Incident No." then begin
                    FleetMgtSetup.Get;
                    NoSeriesMgt.TestManual(FleetMgtSetup."Vehicle Incident Nos.");
                    "No. Series" := '';
                end;
            end;

        }
        field(2; "Incident Date"; Date)
        {
            Caption = 'Incident Date';
        }
        field(3; "Incident Time"; Time)
        {
            Caption = 'Incident Time';
        }
        field(4; Location; Text[50])
        {
            Caption = 'Location';
        }
        field(5; "Driver ID"; Code[50])
        {
            Caption = 'Driver ID';
            TableRelation = "Vehicle Drivers".Driver where(Active = const(true));
            trigger OnValidate()
            var
                VehicleDrivers: Record "Vehicle Drivers";
            begin
                VehicleDrivers.Reset();
                VehicleDrivers.SetRange(Driver, "Driver ID");
                if VehicleDrivers.FindFirst then begin
                    "Driver Name" := VehicleDrivers."Driver Name";
                    "Driver Phone Number" := VehicleDrivers."Phone Number";
                    "Driver Licence Details" := VehicleDrivers."Driver License Number";
                end;
            end;
        }
        field(6; "Driver Name"; Text[100])
        {
            Caption = 'Driver Name';
            Editable = false;
        }
        field(7; "Driver Phone Number"; Text[50])
        {
            Caption = 'Driver Contact Information';
            Editable = false;
        }
        field(8; "Vehicle ID"; Code[20])
        {
            Caption = 'Vehicle ID';
            TableRelation = "Fleet Vehicles."."No." where(Blocked = const(false));
            trigger OnValidate()
            var
                FleetVehicles: Record "Fleet Vehicles.";
            begin
                FleetVehicles.Reset;
                FleetVehicles.SetRange("No.", "Vehicle ID");
                if FleetVehicles.FindFirst then begin
                    Make := FleetVehicles.Make;
                    Model := FleetVehicles.Model;
                    "Licence Plate Number" := FleetVehicles."Registration No.";
                end;
            end;
        }
        field(9; Make; Text[50])
        {
            Caption = 'Make';
            Editable = false;
        }
        field(10; Model; Text[50])
        {
            Caption = 'Model';
            Editable = false;
        }
        field(11; "Licence Plate Number"; Code[20])
        {
            Caption = 'Licence Plate Number';
            Editable = false;
        }
        field(12; "Current Milleage"; Integer)
        {
            Caption = 'Current Milleage';
        }
        field(13; "Incident Description"; Text[100])
        {
            Caption = 'Incident Description';
        }
        field(14; Recommendations; Text[100])
        {
            Caption = 'Recommendations';
        }
        field(15; "Service Provider"; Code[20])
        {
            Caption = 'Service Provider';
            TableRelation = Vendor;
            trigger OnValidate()
            var
                Vend: Record Vendor;
            begin
                Vend.Get("Service Provider");
                "Service Provider Name" := Vend.Name;
            end;
        }
        field(16; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            Editable = false;
        }
        field(17; "Driver Licence Details"; Text[100])
        {
            Editable = false;
        }
        field(18; "Service Provider Name"; Text[100])
        {
            Editable = false;
        }
        field(19; Status; Option)
        {
            OptionMembers = Open,Pending,Approved,Rejected;
            Editable = false;

            trigger OnValidate()
            begin
                if Status = Rec.Status::Approved then
                    SendEmailOnApproval();
            end;
        }
        field(20; "Action Taken"; Text[250])
        {

        }
        field(21; "Inspection Remarks"; Text[250])
        {

        }
        field(22; "Reporting Date"; Date)
        {
            Editable = false;
        }
        field(24; Submitted; Boolean)
        {
            Editable = false;
        }
        field(25; "Submitted By"; Code[50])
        {
            Editable = false;
        }
        field(26; "Submitted On"; DateTime)
        {
            Editable = false;
        }
        field(27; "Estimated Number"; Decimal)
        {
        }
        field(28; "Estimated Amount"; Decimal)
        {
        }
        field(29; "Insurance Policy Number"; Code[20])
        {
        }
        field(30; "Person Culpable"; Text[100])
        {
        }
        field(31; "Work Ticket No"; Code[20])
        {
            TableRelation = "Monthly Work Ticket Header"."Daily Work Ticket" where(Status = const(Released));
        }
        field(32; "Duty Station"; Code[20])
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
        field(33; "Station Name"; Text[150])
        {
            TableRelation = "Duty Station";
            Editable = false;
            trigger OnValidate()
            var
                Dstation: Record "Duty Station";
            begin
                if Dstation.Get("Duty Station") then
                    "Station Name" := Dstation.Description;

            end;
        }
        field(34; "Responsible Employee"; Code[20])
        {
            TableRelation = Resource where(Type = filter(Person | Driver));
        }
        field(35; Grounded; Boolean)
        {
            Editable = false;
        }
        field(36; "Grounded By"; Code[50])
        {
            Editable = false;
        }
        field(37; "Grounded On"; DateTime)
        {
            Editable = false;
        }


    }
    keys
    {
        key(PK; "Incident No.")
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    begin
        if "Incident No." = '' then begin
            FleetMgtSetup.Get;
            FleetMgtSetup.TestField(FleetMgtSetup."Vehicle Incident Nos.");
            NoSeriesMgt.InitSeries(FleetMgtSetup."Vehicle Incident Nos.", xRec."No. Series", 0D, "Incident No.", "No. Series");
        end;

        "Reporting Date" := Today;


    end;

    procedure ValidatePreSubmission()
    begin
        Rec.TestField(Status, Rec.Status::Open);
        Rec.TestField("Incident Date");
        Rec.TestField("Incident Time");
        Rec.TestField(Location);
        Rec.TestField("Driver ID");
        Rec.TestField("Vehicle ID");
        Rec.TestField("Incident Description");
        Rec.TestField("Person Culpable");
        Rec.TestField("Responsible Employee");
        //Rec.TestField("Work Ticket No");
        Rec.TestField("Duty Station");
    end;

    procedure ProcessSubmission()
    var
        ConfirmSubmission: label 'Sure to process submission?';
        FleetMgtSetup: Record "Fleet Management Setup";
        // VehicleMgt: Codeunit "Vehicle Management";
        EmailBody: Label '<p>A new vehicle incident %1 has been submitted.</p>';
        Instr: InStream;
    begin
        if not confirm(ConfirmSubmission, false) then
            exit;

        ValidatePreSubmission;
        FleetMgtSetup.Get;
        FleetMgtSetup.TestField("Transport Admin Email");
        Submitted := true;
        "Submitted By" := UserId;
        "Submitted on" := CurrentDateTime;
        // VehicleMgt.SendEmail(FleetMgtSetup."Transport Admin Email", '', 'New Vehicle Incident ' + "Incident No.", 'Greetings,', EmailBody, '', Instr);
        Modify;
        Message('The vehicle incident has been submitted');
    end;

    procedure GroundVehicle()
    var
        ConfirmGround: label 'Sure to ground vehicle?';
        FleetVehicles: Record "Fleet Vehicles.";
        FA: Record "Fixed Asset";
    begin
        Testfield(Status, Rec.Status::Approved);
        TestField(Submitted, true);
        TestField(Recommendations);
        if not confirm(ConfirmGround, false) then
            exit;

        FleetVehicles.Reset();
        FleetVehicles.SetRange("Registration No.", "Licence Plate Number");
        FleetVehicles.FindFirst();

        FleetVehicles.Blocked := true;
        FleetVehicles.Modify();

        FA.Reset();
        FA.SetRange("No.", "Vehicle ID");
        FA.FindFirst();

        // FA."Marked for Disposal" := true;
        FA.Modify();

        Rec.Grounded := true;
        Rec."Grounded By" := UserId;
        Rec."Grounded On" := CurrentDateTime;
        Rec.Modify();

        Message('The vehicle has been grounded successfully !');
    end;

    procedure ValidatePreApproval()
    begin
        Rec.TestField(Status, Rec.Status::Open);
        Rec.TestField("Incident Date");
        Rec.TestField("Incident Time");
        Rec.TestField(Location);
        Rec.TestField("Driver ID");
        Rec.TestField("Vehicle ID");
        Rec.TestField("Incident Description");
        Rec.TestField(Recommendations);
        Rec.TestField("Service Provider");
    end;

    procedure SendEmailOnApproval()
    var
        // Mgmt: Codeunit "Vehicle Management";
        FleetVehicles: Record "Fleet Vehicles.";
        Vend: Record Vendor;
        Emp: Record Employee;
        EmailToDriver: Label '<p>The vehicle incident has been approved kindly take the vehicle to the dealer.</p>';
        EmailToDealer: Label '<p>Vehicle Reg No %1 is coming for assessment.</p>';
        EmailSubj: Label 'Vehicle Incident %1, Submitted';
    begin
        Emp.Get(Rec."Responsible Employee");
        Emp.TestField("E-Mail");
        // Mgmt.SendEmail(Emp."E-Mail", '', StrSubstNo(EmailSubj, Rec."Incident No."), 'Greetings,', EmailToDriver);


        FleetVehicles.Reset;
        FleetVehicles.SetRange("Registration No.", Rec."Vehicle ID");
        if FleetVehicles.FindFirst() then begin
            Vend.Get(FleetVehicles."Maintenance Vendor No.");
            Vend.TestField("E-Mail");
            // Mgmt.SendEmail(Vend."E-Mail", '', StrSubstNo(EmailSubj, Rec."Incident No."), 'Greetings,', StrSubStno(EmailToDealer, Rec."Vehicle ID"));
        end;
    end;

    var

        FleetMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
}
