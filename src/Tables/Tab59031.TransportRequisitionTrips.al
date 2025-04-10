
table 59031 "Transport Requisition Trips"
{
    DrillDownPageID = "Transport Requisition Trips";
    LookupPageID = "Transport Requisition Trips";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Transport Requisition No"; Code[20])
        {
        }
        field(2; Commencement; Text[30])
        {
        }
        field(3; Destination; Text[30])
        {
        }
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
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Cancelled,Closed';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed;

            trigger OnValidate()
            begin
                if (Status = Status::Closed) and ("WorkTicket Created" = false) then begin
                    WorkTicketHeader.Init;
                    WorkTicketHeader.SetRange(WorkTicketHeader."Vehicle Registration No", "Vehicle Allocated");
                    if WorkTicketHeader.FindFirst then begin
                        //MESSAGE('Here %1',WorkTicketHeader."Daily Work Ticket");
                        DailyWorkTicketLines.Init;
                        DailyWorkTicketLines."Transport Requisition No" := "Transport Requisition No";
                        DailyWorkTicketLines."Daily Work Ticket" := WorkTicketHeader."Daily Work Ticket";
                        DailyWorkTicketLines."Driver Allocated" := "Driver Allocated";
                        DailyWorkTicketLines."Driver Name" := "Driver Name";
                        DailyWorkTicketLines."Oil Drawn(Litres)" := "Oil Drawn";
                        DailyWorkTicketLines."Fuel Drawn(Litres)" := "Fuel Drawn";
                        DailyWorkTicketLines.Commencement := Commencement;
                        DailyWorkTicketLines.Destination := Destination;
                        //DailyWorkTicketLines.
                        DailyWorkTicketLines."Opening Odometer Reading" := "Opening Odometer";
                        DailyWorkTicketLines."Closing Odometer Reading" := "Odometer at the End";
                        DailyWorkTicketLines."Total Kilometres" := "Odometer at the End" - "Opening Odometer";
                        //DailyWorkTicketLines."Authorized By" := "Authorized by Name";
                        DailyWorkTicketLines."Authorized By Name" := "Authorized by Name";
                        DailyWorkTicketLines."Journey/Route" := "Journey Route";
                        DailyWorkTicketLines.Date := "Date of Trip";
                        DailyWorkTicketLines."Date of Request" := "Date of Request";
                        DailyWorkTicketLines.ReceiptNo := "POL Voucher No";
                        if not DailyWorkTicketLines.Insert(true) then
                            DailyWorkTicketLines.Modify(true);//MESSAGE('Added');
                        "Work Ticket No" := WorkTicketHeader."Daily Work Ticket";
                        "WorkTicket Created" := true;
                        Modify;
                    end;
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
            TableRelation = "Responsibility Center";

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
            Editable = false;
        }
        field(78; "Non KeRRA Vehicle Alloc."; Code[10])
        {

            trigger OnValidate()
            begin
                "Vehicle Allocated by" := UserId;
            end;
        }
        field(70014; "Department Code"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; "Employee No"; Code[20])
        {
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
                    HrEmployee.CalcFields(HrEmployee."Job Title");
                    Position := HrEmployee."Job Title";
                end;
                //
            end;
        }
        field(70021; "Date Closed"; Date)
        {
        }
        field(70022; "Closed By"; Code[50])
        {
        }
        field(70023; "Approved Imprest Memo"; Code[40])
        {
            // TableRelation = "Imprest Memo"."No." where(Status = filter(Released));

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
            //         // ObjImprestMemo.CalcFields(Objective);
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
            //             FuelTravelRequisition.Init;
            //             FuelTravelRequisition."Req No" := "Transport Requisition No";
            //             FuelTravelRequisition."Project No" := ObjProjMembers.Project;
            //             //    FuelTravelRequisition."Job No" := ObjProjMembers."Job No";
            //             //   FuelTravelRequisition."Job Task" := ObjProjMembers."Job Task No";
            //             FuelTravelRequisition."Requested Amount" := ObjProjMembers."Transport Costs";
            //             FuelTravelRequisition.Insert;
            //         until ObjProjMembers.Next = 0
            //     end;
            //     Validate("Employee No");
            // end;
        }
        field(70024; "Trip End Date"; Date)
        {
        }
        field(70025; "Reason for Reopening"; Text[250])
        {
        }
        field(70026; "Employee Name"; Text[100])
        {
        }
        field(70027; Subject; Text[250])
        {
        }
        field(70028; "Drivers Imp Memo No"; Code[10])
        {
        }
        field(70029; "Drivers Imp. Memo Created"; Boolean)
        {
        }
        field(70030; "Number of Hours Requested"; Decimal)
        {

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
        }
        field(70050; "Details of Journey"; Text[300])
        {
        }
        field(70051; "Oil Drawn"; Decimal)
        {
        }
        field(70052; "Fuel Drawn"; Decimal)
        {
        }
        field(70053; "POL Voucher No"; Code[10])
        {
        }
        field(70054; "Opening Odometer"; Integer)
        {
        }
        field(70055; "Odometer at the End"; Integer)
        {
        }
        field(70056; "Kilometers of Journey"; Integer)
        {
        }
        field(70057; "Authorized by  No"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                //added on 28/06/2019 to add the HOD
                HrEmployee.Reset;
                HrEmployee.SetRange("No.", "Authorized by  No");
                if HrEmployee.FindSet then begin

                    "Authorized by Name" := HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name";

                end;
                //
            end;
        }
        field(70058; "Authorized by Name"; Text[100])
        {
        }
        field(70059; "WorkTicket Created"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Transport Requisition No", "Driver Allocated")
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
            FltMgtSetup.TestField(FltMgtSetup."Transport Req No");
            NoSeriesMgt.InitSeries(FltMgtSetup."Transport Req No", xRec."No. Series", 0D, "Transport Requisition No", "No. Series");
        end;
        "User Id" := UserId;
        "Added On" := CurrentDatetime;

        //added on 28/06/2019 to add the HOD
        HrEmployee.Reset;
        HrEmployee.SetRange("User ID", "User Id");
        if HrEmployee.FindSet then begin
            HOD := HrEmployee.HOD;
            "Directorate Code" := HrEmployee."Directorate Code";
            "Department Code" := HrEmployee."Department Code";
            // Division := HrEmployee.Division;
            "Employee No" := HrEmployee."No.";
        end;
        //
    end;

    trigger OnModify()
    begin

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
        WorkTicketHeader: Record "Monthly Work Ticket Header";
        DailyWorkTicketLines: Record "Daily Work Ticket Lines";

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
                        SMTPMail.Create(Emp."E-Mail", Header, '', true);
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
                        // SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR@kemri.go.ke');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.Send;
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
                        //SMTPMail.Create(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Please note that you have been assigend driver(s) to the above mentioned trip as follows.');// for the month of January 2014');
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
                        // SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR@kemri.go.ke');
                        // SMTPMail.AppendToBody('<br><br>');
                        //SMTPMail.Send;
                        //MESSAGE('Mail sent to %1',Emp."E-Mail");
                    end;
                    //End email
                end;
            until VehicleDriverAllocation.Next = 0;

            Message('Email notifications has been sent');
        end;
    end;
}

