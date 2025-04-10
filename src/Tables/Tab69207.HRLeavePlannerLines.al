
table 69207 "HR Leave Planner Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application Code"; Code[20])
        {
            trigger OnValidate()
            begin
                PlanHeader.Reset();
                PlanHeader.SetRange(PlanHeader."Application Code", "Application Code");
                if PlanHeader.find('-') then begin
                    "Responsibility Center" := PlanHeader."Responsibility Center";
                    "Leave Calendar" := PlanHeader."Leave Calendar";

                end;
            end;
        }
        field(3; "Leave Type"; Code[50])
        {
            TableRelation = "HR Leave Types".Code;

            trigger OnValidate()
            begin

                LeaveHeader.RESET;
                LeaveHeader.SETRANGE("Application Code", LeaveHeader."Application Code");
                if LeaveHeader.Find('-') then
                    // "Employee No" := LeaveHeader."Employee No";
                    "Responsibility Center" := LeaveHeader."Responsibility Center";
                /*
               HRLeaveTypes.GET("Leave Type");
               HREmp.GET("Employee No");
               IF HREmp.Gender=HRLeaveTypes.Gender THEN
               EXIT
               ELSE
               ERROR('This leave type is restricted to the '+ FORMAT(HRLeaveTypes.Gender) +' gender')
               */

            end;
        }
        field(4; "Days Applied"; Decimal)
        {
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            var
                testReturn: Integer;
                webportal: Codeunit HRPortal;
                AgeYears: Integer;
                MaxDays: Integer;
            begin


                TestField("Leave Type");
                //CALCULATE THE END DATE AND RETURN DATE
                begin
                    if ("Days Applied" <> 0) and ("Start Date" <> 0D) then begin
                        "End Date" := webportal.CalcEndDate("Start Date", "Days Applied", "Leave Type");
                        "Return Date" := webportal.CalcReturnDate("End Date", "Leave Type"); //DetermineLeaveReturnDate("Start Date", "Days Applied");
                                                                                             // DeterminethisLeaveEndDate("Return Date");
                    end;
                    if HRLeaveTypes.Get("Leave Type") then
                        if HREmp.Get("Employee No") then
                            AgeYears := ABS((DATE2DMY(HREmp."Date Of Birth", 3) - DATE2DMY(Today, 3)));
                    if AgeYears > 55 then
                        MaxDays := 42 + HRLeaveTypes."Max Carry Forward 2"
                    else
                        MaxDays := HRLeaveTypes.Days + HRLeaveTypes."Max Carry Forward Days";

                    if MaxDays < "Days Applied" then
                        Error('You cannot apply days more than the set leave days');

                    PlanLines.reset();
                    PlanLines.setrange(PlanLines."Employee No", "Employee No");
                    PlanLines.setrange(PlanLines."Leave Type", "Leave Type");
                    PlanLines.setrange(PlanLines."Application Code", "Application Code");
                    if PlanLines.find('-') then Begin
                        PlanLines.CalcSums("Days Applied");
                        if MaxDays < PlanLines."Days Applied" + "Days Applied" then
                            Error('You cannot apply days more than the set leave days');
                    End;                                                          // Modify;
                end;
            end;
        }
        field(5; "Start Date"; Date)
        {

            trigger OnValidate()
            var
                webportal: Codeunit HRPortal;
            begin

                if "Start Date" = 0D then begin
                    "Return Date" := 0D;
                    exit;
                end else begin
                    if webportal.DetermineIfIsNonWorking("Start Date", "Leave Type") then
                        Error('The start date must be a working date');
                    Validate("Days Applied");
                end;
            end;
        }
        field(6; "Return Date"; Date)
        {
            Caption = 'Return Date';

            Editable = false;
        }
        field(7; "Application Date"; Date)
        {
        }
        field(15; "Applicant Comments"; Text[250])
        {
        }
        field(17; "No series"; Code[30])
        {
        }
        field(28; Selected; Boolean)
        {
        }
        field(31; "Current Balance"; Decimal)
        {
            FieldClass = Normal;
        }
        field(3900; "End Date"; Date)
        {
            Editable = false;
        }
        field(3901; "Total Taken"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(3902; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3921; "E-mail Address"; Date)
        {
            Editable = false;
        }
        field(3924; "Entry No"; Integer)
        {
        }
        field(3929; "Start Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(3936; "Cell Phone Number"; Text[50])
        {
        }
        field(3937; "Request Leave Allowance"; Boolean)
        {
        }
        field(3939; Picture; Blob)
        {
        }
        field(3940; Names; Text[100])
        {
        }
        field(3942; "Leave Allowance Entittlement"; Boolean)
        {
        }
        field(3943; "Leave Allowance Amount"; Decimal)
        {
        }
        field(3945; "Details of Examination"; Text[200])
        {
        }
        field(3947; "Date of Exam"; Date)
        {
        }
        field(3949; Reliever; Code[50])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                TestField("Start Date");
                TestField("End Date");
                TestField("Return Date");
                CheckRelieverAvailability();
                //DISPLAY RELEIVERS NAME
                if HREmp.Get(Reliever) then
                    "Reliever Name" := HREmp.FullName;
            end;
        }
        field(3950; "Reliever Name"; Text[100])
        {
        }
        field(3952; Description; Text[30])
        {
        }
        field(3956; "Number of Previous Attempts"; Text[200])
        {
        }
        field(3961; "Employee No"; Code[20])
        {
            TableRelation = Employee."No.";
            trigger OnValidate()
            begin
                IF HREmp.GET("Employee No") then begin
                    Names := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                end;

            end;

        }
        field(3969; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate | "Court Stations" | "Department/Center" | "Division/Section" | Office));

        }
        field(3970; "Approved days"; Integer)
        {

            trigger OnValidate()
            begin
                if "Approved days" > "Days Applied" then
                    Error(TEXT001);
            end;
        }
        field(3971; "Annual Leave Account"; Decimal)
        {
        }
        field(3972; "Compassionate Leave Acc."; Decimal)
        {
        }
        field(3973; "Maternity Leave Acc."; Decimal)
        {
        }
        field(3974; "Paternity Leave Acc."; Decimal)
        {
        }
        field(3975; "Sick Leave Acc."; Decimal)
        {
        }
        field(3976; "Study Leave Acc"; Decimal)
        {
        }
        field(3977; OffDays; Decimal)
        {
        }
        field(3978; "Leave Calendar"; Code[20])
        {
            TableRelation = "HR Leave Periods".Code where(Closed = filter(false));
            trigger OnValidate()
            begin

            end;
        }
    }

    keys
    {
        key(Key1; "Line No.", "Application Code", "Responsibility Center", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*
        //POPULATE FIELDS
        "Application Date":=TODAY;
         IF HREmp.GET("Employee No") THEN
         Names:=HREmp.FullName;
        */

    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        HREmp: Record Employee;
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        SMTP: Codeunit "Email Message";
        LeaveGjline: Record "HR Journal Line";
        "LineNo.": Integer;
        ApprovalComments: Record "Approval Comment Line";
        URL: Text[500];
        sDate: Record Date;
        Customized: Record "Base Calendar";
        HREmailParameters: Record "Hr E-Mail Parameters";
        // HRLeavePeriods: Record "HR Leave Periods 2";
        HRJournalBatch: Record "HR Leave Journal Batch";
        LeaveHeader: Record "HR Leave Planner Header";
        TEXT001: label 'Days Approved cannot be more than applied days';
        Names: Text[100];
        // GreencomFactory: Codeunit "Greencom Factory";
        PlanHeader: Record "HR Leave Planner Header";
        PlanLines: Record "HR Leave Planner Lines";


    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
            if DetermineIfIncludesNonWorking("Leave Type") = false then begin
                fReturnDate := CalcDate('1D', fReturnDate);
                if DetermineIfIsNonWorking(fReturnDate) then
                    varDaysApplied := varDaysApplied + 1
                else
                    varDaysApplied := varDaysApplied;
                varDaysApplied := varDaysApplied - 1
            end
            else begin
                fReturnDate := CalcDate('1D', fReturnDate);
                varDaysApplied := varDaysApplied - 1;
            end;
        until varDaysApplied = 0;
        exit(fReturnDate);
    end;


    procedure DetermineIfIncludesNonWorking(var fLeaveCode: Code[10]): Boolean
    begin
        if HRLeaveTypes.Get(fLeaveCode) then begin
            if HRLeaveTypes."Inclusive of Non Working Days" = true then
                exit(true);
        end;
    end;


    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    begin
        /*
        HRSetup.FIND('-');
        HRSetup.TESTFIELD(HRSetup."Base Calendar");
        BaseCalendarChange.SETFILTER(BaseCalendarChange."Base Calendar Code",HRSetup."Base Calendar");
        
        BaseCalendarChange.SETRANGE(BaseCalendarChange.Date,bcDate);
        IF BaseCalendarChange.FIND('-') THEN BEGIN
        IF BaseCalendarChange.Nonworking = TRUE THEN
        //ERROR('Start date can only be a Working Day Date');
        EXIT(TRUE);
        END;
         */

    end;


    procedure DeterminethisLeaveEndDate(var fDate: Date) fEndDate: Date
    begin
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('-1D', fEndDate);
            while (ReturnDateLoop) do begin
                if DetermineIfIsNonWorking(fEndDate) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
            end
        end;
        exit(fEndDate);
    end;


    procedure NotifyApplicant()
    begin
        /*
        HREmp.GET("Employee No");
        HREmp.TESTFIELD(HREmp."Company E-Mail");
        
        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        HREmailParameters.RESET;
        HREmailParameters.SETRANGE(HREmailParameters."Employee Code",HREmailParameters."Employee Code"::"2");
        IF HREmailParameters.FIND('-') THEN
        BEGIN
        
        
             HREmp.TESTFIELD(HREmp."Company E-Mail");
             //SMTP.Create(HREmailParameters."Transaction Code",HREmailParameters."Transaction Name",HREmp."Company E-Mail",
             HREmailParameters.Balance,'Dear'+' '+ HREmp."First Name" +' '+
             HREmailParameters."Period Month"+' '+"Application Code"+' '+ HREmailParameters."Period Year",TRUE);
             //SMTP.Send();
        
        
        MESSAGE('Leave applicant has been notified successfully');
        END;
                                                     */

    end;

    procedure CheckRelieverAvailability()
    var
        Lines: Record "HR Leave Planner Lines";
        Header, Header2 : Record "HR Leave Planner Header";
    begin
        Header2.Reset();
        Header2.SetRange("Application Code", "Application Code");
        Header2.FindFirst();
        Header.Reset();
        Header.SetRange("Employee No", Reliever);
        Header.SetRange(Status, Header.Status::Approved);
        Header.SetRange("Leave Calendar", Header2."Leave Calendar");
        if Header.FindFirst() then begin
            Lines.Reset();
            Lines.SetRange("Application Code", Header."Application Code");
            Lines.SetFilter("Start Date", '<=%1', "Start Date");
            Lines.SetFilter("End Date", '>=%1', "End Date");
            if Lines.FindFirst() then
                Error('Your reliever will be on leave from %1 to %2. Please pick a different period for your leave.', Lines."Start Date", Lines."End Date");
        end;
    end;
}

