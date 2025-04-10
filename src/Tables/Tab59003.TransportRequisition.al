
table 59003 "Transport Requisition"
{
    DrillDownPageID = "Fleet Requisition List";
    LookupPageID = "Fleet Requisition List";

    fields
    {
        field(1; "Transport Requisition No"; Code[20])
        {
        }
        field(2; Commencement; Text[30])
        {
        }

        field(3; Destination; Text[250])
        {

        }
        // field(3; Destination; Code[20])
        // {
        //     Caption = 'Route Code';
        //     TableRelation = "Fleet Lookup".Code where(Type = const("Route Destination"));
        //     trigger OnValidate()
        //     var
        //         FleetLookup: Record "Fleet Lookup";
        //     begin
        //         FleetLookup.Reset();
        //         FleetLookup.SetRange(Type, FleetLookup.Type::"Route Destination");
        //         FleetLookup.SetRange(Code, Destination);
        //         if FleetLookup.FindFirst() then
        //             "Route Description" := FleetLookup.Description;

        //     end;

        // }
        field(4; "Vehicle Allocated"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                "Vehicle Allocated by" := UserId;
            end;
        }
        field(5; "Driver Allocated"; Code[20])
        {
            TableRelation = "Vehicle Drivers".Driver;

            trigger OnValidate()
            begin
                drivers.Reset;
                drivers.SetRange(drivers.Driver, "Driver Allocated");
                if drivers.Find('-') then
                    // "Driver Name":=HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name";
                    "Driver Name" := drivers."Driver Name";
                "Vehicle Allocated by" := UserId;
            end;
        }
        field(6; "Requested By"; Code[20])
        {
            TableRelation = "User Setup";
        }
        field(7; "Date of Request"; Date)
        {

            trigger OnValidate()
            begin
                /* IF "Date of Request" < TODAY THEN
                 ERROR('Date requested can not be less than today');
                 */

            end;
        }
        field(8; "Vehicle Allocated by"; Code[30])
        {
        }
        field(9; "Opening Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Cancelled,Closed,Handed Over';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed,"Handed Over";

            trigger OnValidate()
            begin
                if Status = Status::Approved then begin
                    SendEmailNotification;
                    CreateTripDetails;
                    CreateFuelReq;
                end;
            end;
        }
        field(13; "Date of Trip"; Date)
        {

            trigger OnValidate()
            begin


                /*  IF "Date of Trip" < TODAY THEN
                ERROR('Date requested can not be less than today');

                 IF "Date of Trip" < "Date of Request"  THEN
                ERROR('Date of Trip can not be less than Date of Requested');
                 */

            end;
        }
        field(14; "Purpose of Trip"; Text[300])
        {
        }
        field(60; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(61; Comments; Text[250])
        {
        }
        field(62; Department; Code[20])
        {
        }
        field(63; "Driver Name"; Text[100])
        {
        }
        field(64; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate | "Department/Center" | "Division/Section" | "Court Stations" | Office));
            trigger OnValidate()
            begin

                /*TESTFIELD(Status,Status::Open);
                IF NOT UserMgt.CheckRespCenter(1,Department) THEN
                  ERROR(
                    Text001,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter); */

            end;
        }
        field(65; "Loaded to WorkTicket"; Boolean)
        {
        }
        field(66; "Time out"; Time)
        {
        }
        field(67; "Time In"; Time)
        {
        }
        field(68; "Journey Route"; Text[250])
        {
        }
        field(69; "Time Requested"; Time)
        {
        }
        field(70; "Closing Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(71; "Work Ticket No"; Code[20])
        {
            TableRelation = "Monthly Work Ticket Header"."Daily Work Ticket" where(Status = const(Released));
        }
        field(72; "No of Days Requested"; Integer)
        {

            trigger OnValidate()
            begin
                "Trip End Date" := CalcDate(Format("No of Days Requested") + 'D', "Date of Trip");
            end;
        }
        field(73; "Authorized  By"; Text[30])
        {
        }
        field(74; Position; Text[200])
        {
        }
        field(75; "User Id"; Code[100])
        {
        }
        field(76; "Added On"; DateTime)
        {
        }
        field(77; HOD; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(78; "Non KeRRA Vehicle Alloc."; Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Vehicle Allocated by" := UserId;
            end;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                //added on 28/06/2019 to add the HOD
                HrEmployee.Reset;
                HrEmployee.SetRange("No.", "Employee No");
                if HrEmployee.FindSet then begin
                    HOD := HrEmployee.HOD;
                    "Directorate Code" := HrEmployee."Directorate Code";
                    "Department Code" := HrEmployee."Department Code";
                    // Division := HrEmployee.Division;
                    "Employee No" := HrEmployee."No.";
                    "Employee Name" := HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name";
                    // HrEmployee.CalcFields(HrEmployee."Job Title");
                    Position := HrEmployee."Current Position ID";
                end;
                //
            end;
        }
        field(70021; "Date Closed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70022; "Closed By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70023; "Approved Imprest Memo"; Code[40])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Imprest Memo"."No." where(Status = filter(Released),
            //                                             Requestor = field("Employee No"));

            // trigger OnValidate()
            // begin
            //     ObjImprestMemo.Reset;
            //     ObjImprestMemo.SetRange(ObjImprestMemo."No.", "Approved Imprest Memo");
            //     if ObjImprestMemo.FindSet then begin
            //         Commencement := ObjImprestMemo.From;
            //         Destination := ObjImprestMemo."Imprest Naration";
            //         "Requested By" := ObjImprestMemo.Requestor;

            //         "Employee No" := ObjImprestMemo.Requestor;
            //         Validate("Employee No");
            //         "Date of Request" := ObjImprestMemo.Date;
            //         "Time Requested" := Time;
            //         "Date of Trip" := ObjImprestMemo."Start Date";
            //         "No of Days Requested" := ObjImprestMemo."No. of days";
            //         Validate("Date of Trip");
            //         Validate("No of Days Requested");
            //         ObjImprestMemo.CalcFields(Objective);
            //         //MESSAGE(FORMAT(ObjImprestMemo.Objective));
            //         "Purpose of Trip" := Format(ObjImprestMemo.Objective);
            //         Validate("Purpose of Trip");
            //         Subject := ObjImprestMemo.Subject;
            //         Modify;
            //         //Create fuel req

            //     end;

            //     if Rec."Approved Imprest Memo" <> xRec."Approved Imprest Memo" then
            //         ObjTravelStaff.DeleteAll(true);

            //     ObjTravelStaff.Reset;
            //     ObjTravelStaff.SetRange(ObjTravelStaff."Req No", "Transport Requisition No");
            //     if ObjTravelStaff.FindSet then
            //         ObjTravelStaff.DeleteAll(true);

            //     ObjProjMembers.Reset;
            //     ObjProjMembers.SetRange(ObjProjMembers."Imprest Memo No.", "Approved Imprest Memo");
            //     if ObjProjMembers.FindSet then begin
            //         repeat
            //             ObjTravelStaff.Init;
            //             ObjTravelStaff."Req No" := "Transport Requisition No";
            //             ObjTravelStaff."Employee No" := ObjProjMembers."No.";
            //             ObjTravelStaff.Validate("Employee No");
            //             ObjTravelStaff."Employee Name" := ObjProjMembers.Name;
            //             ObjTravelStaff."Date of Trip" := "Date of Trip";
            //             ObjTravelStaff.Validate("Date of Trip");
            //             ObjTravelStaff."No of Days Requested" := ObjProjMembers."Time Period";
            //             ObjTravelStaff.Validate("No of Days Requested");
            //             //ObjTravelStaff.Position:=ObjProjMembers.
            //             ObjTravelStaff.Insert;

            //         until ObjProjMembers.Next = 0
            //     end;
            //     FuelTravelRequisition.Reset;
            //     FuelTravelRequisition.SetRange(FuelTravelRequisition."Req No", "Approved Imprest Memo");
            //     if FuelTravelRequisition.Find('-') then begin
            //         repeat
            //             Message('%1 test', FuelTravelRequisition."Req No");
            //             FuelTravel.Init;
            //             FuelTravel."Req No" := Rec."Transport Requisition No";
            //             //FuelTravel.TRANSFERFIELDS(FuelTravelRequisition);
            //             FuelTravel."Job No" := FuelTravelRequisition."Job No";
            //             FuelTravel."Job Name" := FuelTravelRequisition."Job Name";
            //             FuelTravel."Job Task" := FuelTravelRequisition."Job Task";
            //             FuelTravel."Job Task Name" := FuelTravelRequisition."Job Task Name";
            //             FuelTravel."Requested Amount" := FuelTravelRequisition."Requested Amount";
            //             if not FuelTravel.Insert(true) then
            //                 FuelTravel.Modify(true);
            //         until FuelTravelRequisition.Next = 0;
            //     end;
            //     Validate("Employee No");
            // end;
        }
        field(70024; "Trip End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70025; "Reason for Reopening"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70026; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70027; Subject; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70028; "Drivers Imp Memo No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70029; "Drivers Imp. Memo Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70030; "Number of Hours Requested"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Date of Request" = 0D then
                    "Date of Request" := Today;
                if "Date of Trip" = 0D then
                    "Date of Trip" := Today;
                "Trip End Time" := "Time Requested" + ("Number of Hours Requested" * 3600000);
                "Trip End Date" := "Date of Trip";
            end;
        }
        field(70031; "Trip End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(70032; "Route Description"; Text[100])
        {
            // Editable = false;
        }
        field(70033; "Fuel Request Code"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fuel & Maintenance Requisition"."Requisition No" where(Type = const(Fuel));
        }

        field(70034; "Spare Wheel"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(70035; "Wheel Spammer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(70036; "Hydraulic Jack"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Hydraulic Jack or Screw Jack';
        }
        field(70037; Radio; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70038; "Wheel Caps"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wheel Caps/Number';
        }

        field(70039; "Side Mirrors"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Side/Interior Mirrors';
        }

        field(70040; "Fuel Card No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70041; "Floor Mats"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(70042; "Body Condition"; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(70043; "Current Mileage"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(70044; "Tyre Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Good,Bad;
        }

        field(70045; Logbook; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'GP 55 Logbook';
        }
        field(70046; Observations; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(70047; "Officer Taking Over"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
            Trigger OnValidate()
            var
                emp: Record Employee;

            begin
                emp.reset();
                emp.get("Officer Taking Over");
                "Name Taking Officer" := emp."First Name" + emp."Last Name";

            end;

        }

        field(70048; "Immediate Former"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Immediate Former User';
            TableRelation = Employee;

            Trigger OnValidate()
            var
                emp: Record Employee;

            begin
                emp.reset();
                emp.get("Immediate Former");
                "Name Former Officer" := emp."First Name" + emp."Last Name";

            end;
        }



        field(70049; Model; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(70050; "Handed Over Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(70051; "Reg No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Registration No.';
            TableRelation = "Fleet Vehicles."."Registration No.";
            trigger OnValidate()
            var
                FleetVehicle: Record "Fleet Vehicles.";

            begin
                FleetVehicle.Reset;
                FleetVehicle.SetRange("Registration No.", "Reg No");

                if FleetVehicle.FindFirst() then begin

                    Model := FleetVehicle.Description;

                end


            end;
        }
        field(70052; "Handover Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Requisitioned,NonRequisitioned;
        }

        field(70053; "Taking Over Driver"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Drivers";

            Trigger OnValidate()
            var
                VehiclDrivers: Record "Vehicle Drivers";
            begin

                if VehicleDrivers.get("Taking Over Driver") then
                    "Current Driver" := VehicleDrivers."Driver Name";




            end;
        }


        field(70054; "Immediate Former Driver"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Drivers";
            Trigger OnValidate()
            var
                VehiclDrivers: Record "Vehicle Drivers";
            begin

                if VehicleDrivers.get("Taking Over Driver") then
                    "Former Driver" := VehicleDrivers."Driver Name";




            end;
        }

        field(70057; "Current Driver"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70058; "Former Driver"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(70055; "Name Former Officer"; Code[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Immediate Former User Name';
            Editable = false;
        }



        field(70056; "Name Taking Officer"; Code[100])
        {
            Caption = 'New User Name';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Transport Requisition No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Transport Requisition No" = '' then begin
            FltMgtSetup.Get;
            if "Handover Type" = "Handover Type"::Requisitioned then begin
                FltMgtSetup.TestField(FltMgtSetup."Transport Req No");
                NoSeriesMgt.InitSeries(FltMgtSetup."Transport Req No", xRec."No. Series", 0D, "Transport Requisition No", "No. Series");
            end else begin
                FltMgtSetup.TestField(FltMgtSetup."Handover Nos");
                NoSeriesMgt.InitSeries(FltMgtSetup."Handover Nos", xRec."No. Series", 0D, "Transport Requisition No", "No. Series");

            end;
        end;

        "Date of Request" := Today;
        /*
         "User Id":= USERID;
         "Added On":= CURRENTDATETIME;

        //added on 28/06/2019 to add the HOD
        HrEmployee.RESET;
        HrEmployee.SETRANGE("User ID","User Id");
        IF HrEmployee.FINDSET THEN
        BEGIN
          HOD := HrEmployee.HOD;
          "Directorate Code":=HrEmployee."Directorate Code";
          "Department Code":=HrEmployee."Department Code";
          Division:=HrEmployee.Division;
          "Employee No" := HrEmployee."No.";
        END;
    //
    IF UserSetup.GET(USERID) THEN BEGIN
      "Requested By" := UserSetup."Employee No.";
      "Employee No" := UserSetup."Employee No.";
      VALIDATE("Requested By");
      VALIDATE("Employee No");
    END
    */

    end;

    trigger OnModify()
    begin
        /*IF (Status=Status::Approved) OR (Status=Status::Approved) THEN
           ERROR(Text0001);*/
        Validate(Status);

    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text0001: label 'You cannot modify an Approved or Closed Record';
        HrEmployee: Record Employee;
        UserMgt: Codeunit "User Management";
        Text001: label 'Your identification is set up to process from %1 %2 only.';
        RespCenter: Record "Responsibility Center";
        drivers: Record "Vehicle Drivers";
        // ObjImprestMemo: Record "Imprest Memo";
        ObjTravelStaff: Record "Travel Requisition Staff";
        // ObjProjMembers: Record "Project Members";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Emp: Record Employee;
        VehicleDriversAll: Record "Vehicle Driver Allocation";
        VehicleDriverAllocation: Record "Vehicle Driver Allocation";
        VehicleDrivers: Record "Vehicle Drivers";
        FuelTravelRequisition: Record "Fuel Travel Requisition";
        // ProjectMembers: Record "Project Members";
        FuelTravel: Record "Fuel Travel Requisition";
        UserSetup: Record "User Setup";
        FleetSetup: Record "Fleet Management Setup";

    procedure SendEmailToDriver()
    var
        // VehicleMgt: Codeunit "Vehicle Management";
        EmailBody: Label '<p>Fleet <b>%1</b> has been approved as follows:</p><table><tr><th style="text-align:left"><u>Trip</u></th><th style="text-align:left"><u>Details</u></th></tr><tr><td>PJ No:</td><td>%2</td></tr><tr><td>Employee Name:</td><td>%3</td></tr><tr><td>Start Date:</td><td>%4</td></tr><tr><td>Start Time:</td><td>%5</td></tr><tr><td>End Date:</td><td>%6</td></tr><tr><td>Destination:</td><td>%7</td></tr><tr><td>No of People Travelling:</td><td>%8</td></tr><tr><td>Trip Purpose:</td><td>%9</td></tr><tr><td>Team Lead Contact:</td><td>%10</td></tr><tr><td>Vehicle Allocated:</td><td>%11</td></tr></table>';
        TravelReqStaff: Record "Travel Requisition Staff";
        StructuredEmailBody: Text;
        Emp: Record Employee;
        Driver: Record Resource;
        Instr: Instream;
        VehicleDriverAlloc: Record "Vehicle Driver Allocation";
        FleetDrivers: Record "Vehicle Drivers";
        NewFReq: Label '<p>NB: <b>A new fuel request %1 has been created to facilitate transportation.</b></p<';

    begin
        FleetMgtSetup.Get;
        FleetMgtSetup.TestField("Transport Admin Email");
        TravelReqStaff.Reset();
        TravelReqStaff.SetRange("Req No", Rec."Transport Requisition No");
        TravelReqStaff.SetFilter("Employee No", '<>%1', '');
        Emp.Get(Rec."Employee No");

        VehicleDriverAlloc.Reset();
        VehicleDriverAlloc.SetRange("Requisition Number", Rec."Transport Requisition No");
        if VehicleDriverAlloc.FindSet then
            repeat

                FleetDrivers.Reset();
                FleetDrivers.SetRange(Driver, VehicleDriverAlloc."Driver Code");
                if FleetDrivers.FindFirst() then begin

                    StructuredEmailBody := StrSubstNo(EmailBody, Rec."Transport Requisition No", "Employee No", "Employee Name", "Date of Trip", "Time Requested",
                    "Trip End Date", "Route Description", TravelReqStaff.Count, Subject, Emp."Mobile Phone No.",
                    VehicleDriverAlloc."Vehicle Registration No");

                    if "Fuel Request Code" <> '' then
                        StructuredEmailBody += StrSubstNo(NewFReq, Rec."Fuel Request Code");

                    // VehicleMgt.SendEmail(FleetDrivers.Email, FleetMgtSetup."Transport Admin Email", StrSubstNo('Requisition %1, Approved', Rec."Transport Requisition No"),
                    // 'Greetings,', StructuredEmailBody, '', Instr);

                end;

            until VehicleDriverAlloc.Next = 0;
    end;


    procedure SendEmailToTeamLead()
    var
        // VehicleMgt: Codeunit "Vehicle Management";
        EmailBody: Label '<p>Fleet <b>%1</b> has been approved as follows:</p><table><tr><th style="text-align:left"><u>Trip</u></th><th style="text-align:left"><u>Details</u></th></tr><tr><td>Start Date:</td><td>%2</td></tr><tr><td>Start Time:</td><td>%3</td></tr><tr><td>Destination:</td><td>%4</td></tr><tr><td>Driver Name:</td><td>%5</td></tr><tr><td>Vehicle Allocated:</td><td>%6</td></tr><tr><td>Driver Contact:</td><td>%7</td></tr></table>';
        TravelReqStaff: Record "Travel Requisition Staff";
        StructuredEmailBody: Text;
        Emp: Record Employee;
        Driver: Record Resource;
        Instr: Instream;
        VehicleDriverAlloc: Record "Vehicle Driver Allocation";
        FleetDrivers: Record "Vehicle Drivers";
        NewFReq: Label '<p>NB: <b>A new fuel request %1 has been created to facilitate transportation.</b></p<';
    begin
        TravelReqStaff.Reset();
        TravelReqStaff.SetRange("Req No", Rec."Transport Requisition No");
        TravelReqStaff.SetFilter("Employee No", '<>%1', '');

        FleetMgtSetup.Get;
        FleetMgtSetup.TestField("Transport Admin Email");


        if Emp.Get("Employee No") then;
        if Driver.Get("Driver Allocated") then;

        VehicleDriverAlloc.Reset();
        VehicleDriverAlloc.SetRange("Requisition Number", Rec."Transport Requisition No");
        if VehicleDriverAlloc.FindSet then
            repeat

                FleetDrivers.Reset();
                FleetDrivers.SetRange(Driver, VehicleDriverAlloc."Driver Code");
                if FleetDrivers.FindFirst() then begin

                    StructuredEmailBody := StrSubstNo(EmailBody, Rec."Transport Requisition No", "Date of Trip",
                    "Time Requested", "Route Description", FleetDrivers."Driver Name",
                    VehicleDriverAlloc."Vehicle Registration No", FleetDrivers."Phone Number");
                    if "Fuel Request Code" <> '' then
                        StructuredEmailBody += StrSubstNo(NewFReq, Rec."Fuel Request Code");

                    // VehicleMgt.SendEmail(Emp."E-Mail", FleetMgtSetup."Transport Admin Email",
                    //  StrSubstNo('Requisition %1, Approved', Rec."Transport Requisition No"), 'Greetings,', StructuredEmailBody,
                    //   '', Instr);

                end;




            until VehicleDriverAlloc.next = 0;
    end;

    local procedure SendEmailNotification()
    begin
        VehicleDriverAllocation.Reset;
        VehicleDriverAllocation.SetRange("Requisition Number", "Transport Requisition No");
        VehicleDriverAllocation.SetRange("Reassigned?", false);
        if VehicleDriverAllocation.Find('-') then begin
            repeat
                if Emp.Get(VehicleDriverAllocation."Driver Code") then begin
                    Header := 'TRAVEL TRIP NOTIFICATION ' + "Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

                    if SMTPSetup.Get() then begin
                        SenderEmail := SMTPSetup."Email Address";
                        SenderName := SMTPSetup."Email Address";
                    end;
                    if Emp."E-Mail" <> '' then begin
                        //  SMTPMail.Create(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Please note that you have been assigend as the driver to the above mentioned trip.');// for the month of January 2014');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('<h1>Trip Details</h1>');
                        // SMTPMail.AppendToBody('<br>');
                        // SMTPMail.AppendToBody('Trip requested by : ' + "Employee Name");
                        // SMTPMail.AppendToBody('<br>');
                        // SMTPMail.AppendToBody('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip") + ' return date will be on ' + Format("Trip End Date"));
                        // SMTPMail.AppendToBody('<br>');
                        // //SMTPMail.AppendToBody('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non kemri Vehicle Alloc.");
                        // SMTPMail.AppendToBody('<br>');
                        // SMTPMail.AppendToBody('Kindly prepare adequately');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Thanks & Regards');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody(SenderName);
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('<HR>');
                        // SMTPMail.AppendToBody('This is a system generated mail.');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR');
                        // SMTPMail.AppendToBody('<br><br>');
                        FltMgtSetup.Get;
                        //  SMTPMail.AddCC(FltMgtSetup."HOD E-Mail Address");
                        //   SMTPMail.Send;
                        //MESSAGE('Mail sent to %1',Emp."E-Mail");
                    end;
                    //End email
                end;
                //notify requester
                // ERROR('here %1',Rec."Employee No");
                if Emp.Get("Employee No") then begin
                    Header := 'TRAVEL TRIP NOTIFICATION ' + "Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

                    if SMTPSetup.Get() then begin
                        SenderEmail := SMTPSetup."Email Address";
                        SenderName := SMTPSetup."Email Address";
                    end;
                    if Emp."E-Mail" <> '' then begin
                        // SMTPMail.Create(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Please note that you have been assigned driver(s) to the above mentioned trip as follows.');// for the month of January 2014');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('<h1>Trip Details</h1>');
                        // SMTPMail.AppendToBody('<br>');
                        // SMTPMail.AppendToBody('Driver Name : ' + VehicleDriverAllocation."Driver Name");
                        // SMTPMail.AppendToBody('<br>');
                        // VehicleDrivers.Reset;
                        // VehicleDrivers.SetRange(VehicleDrivers.Driver, VehicleDriverAllocation."Driver Code");
                        // if VehicleDrivers.FindSet then begin
                        //     SMTPMail.AppendToBody('Driver Phone Number : ' + VehicleDrivers."Phone Number");
                        //     SMTPMail.AppendToBody('<br>');
                        // end;
                        // SMTPMail.AppendToBody('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip"));
                        // SMTPMail.AppendToBody('<br>');
                        // //SMTPMail.AppendToBody('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non kemri Vehicle Alloc.");
                        // SMTPMail.AppendToBody('<br>');
                        // SMTPMail.AppendToBody('Kindly prepare adequately');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Thanks & Regards');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody(SenderName);
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('<HR>');
                        // SMTPMail.AppendToBody('This is a system generated mail.');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.Send;
                        //MESSAGE('Mail sent to %1',Emp."E-Mail");
                    end;
                    //End email
                end;
            until VehicleDriverAllocation.Next = 0;
            Message('Email notifications has been sent');
        end;
        ObjTravelStaff.Reset;
        ObjTravelStaff.SetRange(ObjTravelStaff."Req No", Rec."Transport Requisition No");
        if ObjTravelStaff.Find('-') then begin
            repeat
                if Emp.Get(ObjTravelStaff."Employee No") then begin
                    Header := 'TRAVEL TRIP NOTIFICATION ' + "Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

                    if SMTPSetup.Get() then begin
                        SenderEmail := SMTPSetup."Email Address";
                        SenderName := SMTPSetup."Email Address";
                    end;
                    if Emp."E-Mail" <> '' then begin
                        //   SMTPMail.Create(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Please note that you have been assigned driver(s) to the above mentioned trip as follows.');// for the month of January 2014');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('<h1>Trip Details</h1>');
                        // SMTPMail.AppendToBody('<br>');
                        // SMTPMail.AppendToBody('Driver Name : ' + VehicleDriverAllocation."Driver Name");
                        // SMTPMail.AppendToBody('<br>');
                        // VehicleDrivers.Reset;
                        // VehicleDrivers.SetRange(VehicleDrivers.Driver, VehicleDriverAllocation."Driver Code");
                        // if VehicleDrivers.FindSet then begin
                        //     SMTPMail.AppendToBody('Driver Phone Number : ' + VehicleDrivers."Phone Number");
                        //     SMTPMail.AppendToBody('<br>');
                        // end;
                        // SMTPMail.AppendToBody('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip"));
                        // SMTPMail.AppendToBody('<br>');
                        // SMTPMail.AppendToBody('<br>');
                        // SMTPMail.AppendToBody('Kindly prepare adequately');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Thanks & Regards');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody(SenderName);
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('<HR>');
                        // SMTPMail.AppendToBody('This is a system generated mail.');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR');
                        // SMTPMail.AppendToBody('<br><br>');
                        ///  SMTPMail.Send;
                        //MESSAGE('Mail sent to %1',Emp."E-Mail");
                    end;
                    //End email
                end;
            until ObjTravelStaff.Next = 0;
        end;
    end;

    local procedure CreateTripDetails()
    var
        Trips: Record "Transport Requisition Trips";
    begin
        VehicleDriverAllocation.Reset;
        VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Requisition Number", Rec."Transport Requisition No");
        if VehicleDriverAllocation.Find('-') then begin
            repeat
                Trips.Init;
                Trips.TransferFields(Rec);
                Trips."Driver Allocated" := VehicleDriverAllocation."Driver Code";
                Trips."Driver Name" := VehicleDriverAllocation."Driver Name";
                Trips."Vehicle Allocated" := VehicleDriverAllocation."Vehicle Registration No";
                Trips.Status := Trips.Status::Open;
                Trips."Purpose of Trip" := "Purpose of Trip";
                if not Trips.Insert(true) then
                    Trips.Modify(true);
            until VehicleDriverAllocation.Next = 0;
        end;
    end;

    local procedure CreateFuelReq()
    var
        SaveFuelTravel: Record "Fuel & Maintenance Requisition";
        FuelTravel: Record "Fuel Travel Requisition";
        TransportReq: Record "Transport Requisition";
    begin
        FuelTravel.Reset;
        FuelTravel.SetRange(FuelTravel."Req No", Rec."Transport Requisition No");
        if FuelTravel.Find('-') then begin
            repeat
                SaveFuelTravel.Init;
                SaveFuelTravel."Project Name" := FuelTravel."Job Name";
                case FuelTravel."Expense Type" of
                    FuelTravel."expense type"::Fuel:
                        SaveFuelTravel.Type := SaveFuelTravel.Type::Fuel;
                    FuelTravel."expense type"::Maintenance:
                        SaveFuelTravel.Type := SaveFuelTravel.Type::Maintenance;
                end;
                SaveFuelTravel."Project Number" := FuelTravel."Job No";
                SaveFuelTravel."Job Name" := FuelTravel."Job Name";
                SaveFuelTravel."Job No" := FuelTravel."Job No";
                SaveFuelTravel."Job Task" := FuelTravel."Job Task";
                SaveFuelTravel."Job Task Name" := FuelTravel."Job Task Name";
                SaveFuelTravel."Request Date" := Today;
                SaveFuelTravel."Vehicle Reg No" := FuelTravel."Allocated Vehicle Reg No";
                SaveFuelTravel."Prepared By" := UserId;
                SaveFuelTravel."Total Price of Fuel" := FuelTravel."Requested Amount";
                if FuelTravel."Requested Amount" <> 0 then begin
                    if SaveFuelTravel.Insert(true) then;
                end;

            until SaveFuelTravel.Next = 0;
            SendFuelMail(FuelTravel."Requested Amount", FuelTravel."Job No");
        end;
    end;

    local procedure SendFuelMail(var Amount: Decimal; var ProjectCode: Code[30])
    begin

        FleetSetup.Get();
        FleetSetup.TestField(FleetSetup."Project Accountant Email");
        // IF Emp.GET(VehicleDriverAllocation."Driver Code") THEN BEGIN
        Header := 'FUEL REIMBURSEMENT REQUEST' + "Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

        if SMTPSetup.Get() then begin
            /// SenderEmail := SMTPSetup."Email Sender Address";
            // SenderName := SMTPSetup."Email Sender Name";
        end;
        if FleetSetup."Project Accountant Email" <> '' then begin
            // SMTPMail.Create(SenderName, SenderEmail, FleetSetup."Project Accountant Email", Header, '', true);
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Dear Sir/Madam');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Kindly prepare a fuel reimbursement of ' + Format(Amount) + ' from Project ' + ProjectCode + ' to Exchequer Transport vote.');// for the month of January 2014');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('<h1>Trip Details</h1>');
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Trip requested by : ' + "Employee Name");
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip") + ' return date will be on ' + Format("Trip End Date"));
            // SMTPMail.AppendToBody('<br>');
            // //SMTPMail.AppendToBody('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non kemri Vehicle Alloc.");
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Kindly prepare adequately');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Thanks & Regards');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody(SenderName);
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('<HR>');
            // SMTPMail.AppendToBody('This is a system generated mail.');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR@kemri.go.ke');
            // SMTPMail.AppendToBody('<br><br>');
            //    SMTPMail.Send;
            //MESSAGE('Mail sent to %1',FleetSetup."Project Accountant Email");
        end;
        //End email
        // END;
    end;

    var
        FleetMgtSetup: Record "Fleet Management Setup";
}

