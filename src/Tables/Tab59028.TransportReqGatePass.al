
table 59028 "Transport Req Gate Pass"
{
    DrillDownPageID = "Approved Fleet Requests List";
    LookupPageID = "Approved Fleet Requests List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Transport Requisition No"; Code[20])
        {
            TableRelation = "Transport Requisition"."Transport Requisition No" where(Status = const(Approved));
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
                /*IF Status = Status::Approved THEN BEGIN
                  IF Emp.GET("Requested By") THEN BEGIN
                        Header:='TRAVEL TRIP NOTIFICATION '+"Transport Requisition No";
                
                        IF SMTPSetup.GET() THEN BEGIN
                          SenderEmail:=SMTPSetup."Email Sender Address";
                          SenderName:= SMTPSetup."Email Sender Name";
                        END;
                        IF Emp."E-Mail" <> '' THEN BEGIN
                          SMTPMail.Create(SenderName,SenderEmail,Emp."E-Mail",Header,'',TRUE);
                          SMTPMail.AppendToBody('<br><br>');
                          SMTPMail.AppendToBody('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
                          SMTPMail.AppendToBody('<br><br>');
                          SMTPMail.AppendToBody('Please note that your travel requisition '+"Transport Requisition No"+' has been approved');// for the month of January 2014');
                          SMTPMail.AppendToBody('<br><br>');
                          SMTPMail.AppendToBody('Kindly prepare adequately');
                          SMTPMail.AppendToBody('<br><br>');
                          SMTPMail.AppendToBody('Thanks & Regards');
                          SMTPMail.AppendToBody('<br><br>');
                          SMTPMail.AppendToBody(SenderName);
                          SMTPMail.AppendToBody('<br><br>');
                          SMTPMail.AppendToBody('<HR>');
                          SMTPMail.AppendToBody('This is a system generated mail.');
                          SMTPMail.AppendToBody('<br><br>');
                          SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR@Judiciary.go.ke');
                          SMTPMail.AppendToBody('<br><br>');
                          SMTPMail.Send;
                        END;
                        //End email
                      END;
                END;
                */

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
            //         ObjImprestMemo.CalcFields(Objective);
            //         //MESSAGE(FORMAT(ObjImprestMemo.Objective));
            //         "Purpose of Trip" := Format(ObjImprestMemo.Objective);
            //         Validate("Purpose of Trip");
            //         Subject := ObjImprestMemo.Subject;
            //         Modify;
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
        }
        field(70031; "Trip End Time"; Time)
        {
        }
        field(70040; "Authorized By"; Text[100])
        {
        }
        field(70041; Month; Date)
        {
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(70042; "Gate Pass Serial No"; Code[20])
        {
        }
        field(70043; "Document Type"; Option)
        {
            OptionCaption = 'Vehicle,Security';
            OptionMembers = Vehicle,Security;
        }
    }

    keys
    {
        key(Key1; "Gate Pass Serial No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if "Document Type" = "document type"::Security then begin
            if "Gate Pass Serial No" = '' then begin
                FASetup.Get;
                // FASetup.TestField(FASetup."Gate Pass Nos.");
                // NoSeriesMgt.InitSeries(FASetup."Gate Pass Nos.", xRec."No. Series", 0D, "Gate Pass Serial No", "No. Series");
            end;
        end;
        if "Document Type" = "document type"::Vehicle then begin
            if "Gate Pass Serial No" = '' then begin
                FltMgtSetup.Get;
                FltMgtSetup.TestField(FltMgtSetup."Transport Req Gate Pass No");
                NoSeriesMgt.InitSeries(FltMgtSetup."Transport Req Gate Pass No", xRec."No. Series", 0D, "Gate Pass Serial No", "No. Series");
            end;
        end;
    end;

    trigger OnModify()
    begin
        /*IF (Status=Status::Approved) OR (Status=Status::Approved) THEN
           ERROR(Text0001);*/
        //VALIDATE(Status);

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
        FASetup: Record "FA Setup";
}

