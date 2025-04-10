
table 69520 "Leave Application Recall"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Recall No"; Code[20])
        {

            trigger OnValidate()
            begin
                if "Recall No" <> xRec."Recall No" then begin
                    HumanResSetup.Get;
                    NoSeriesMgt.TestManual(HumanResSetup."Leave Recall Nos");
                    "No. series" := '';
                end;
            end;
        }
        field(2; "Employee No"; Code[20])
        {
            NotBlank = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if emp.Get("Employee No") then begin
                    "Employee Name" := Format(emp.Title) + ' ' + emp."First Name" + ' ' + emp."Middle Name" + '' + emp."Last Name";
                    //"Date of Joining Company":=EmpRec."Date Of Join";
                    //"Balance brought forward":=EmpLeave."Balance Brought Forward";
                end;
            end;
        }
        field(3; "Application No"; Code[20])
        {
            NotBlank = false;
            TableRelation = "HR Leave Application" where(Posted = filter(true),
                                                          "Employee No" = field("Employee No"));

            trigger OnValidate()
            begin
                if HRLeave.Get("Application No") then begin
                    "Employee No" := HRLeave."Employee No";
                    Validate("Employee No");
                    //"Employee Name" := HRLeave."Employee Name";
                    "Leave Code" := HRLeave."Leave Type";
                    "Days Applied" := HRLeave."Days Applied";
                    "Start Date" := HRLeave."Start Date";
                    "End Date" := HRLeave."Return Date";
                    "Approved Days" := HRLeave."Days Applied";
                    "Approved Start Date" := HRLeave."Start Date";
                end;
            end;
        }
        field(4; "Leave Code"; Code[20])
        {
            TableRelation = "HR Leave Types";

            trigger OnValidate()
            begin
                /*IF xRec.Status<>Status::Open THEN
                ERROR('You cannot change a document an approved document');
                
                
                emp.GET("Employee No");
                IF LeaveTypes.GET("Leave Code") THEN
                BEGIN
                IF LeaveTypes.Gender=LeaveTypes.Gender::Female THEN
                IF emp.Gender1=emp.Gender1::Male THEN
                ERROR('%1 can only be assigned to %2 employees',LeaveTypes.Description,LeaveTypes.Gender);
                
                IF LeaveTypes.Gender=LeaveTypes.Gender::Male THEN
                IF emp.Gender1=emp.Gender1::Female THEN
                ERROR('%1 can only be assigned to %2 employees',LeaveTypes.Description,LeaveTypes.Gender);
                "Leave Entitlment":=LeaveTypes.Days;
                
                 CALCFIELDS("Total Leave Days Taken","Recalled Days","Off Days");
                 "Leave balance":="Leave Entitlment"+"Recalled Days"+"Off Days"-"Total Leave Days Taken";
                 //serem
                 {IF "Days Applied">"Leave balance" THEN
                 ERROR('The days applied for are more than your leave balance');   }
                
                
                END;
                
                
                IF EmpLeave.GET("Employee No","Leave Code","Maturity Date") THEN
                BEGIN
                IF "Leave Earned to Date"=0 THEN
                
                "Leave Entitlment":=EmpLeave.Entitlement+EmpLeave."Balance Brought Forward"
                ELSE
                "Leave Entitlment":="Leave Earned to Date";
                
                
                
                
                
                 CALCFIELDS("Total Leave Days Taken","Recalled Days","Off Days");
                 "Leave balance":="Leave Entitlment"+"Recalled Days"+"Off Days"-"Total Leave Days Taken";
                 IF "Days Applied">"Leave balance" THEN
                 ERROR('The days applied for are more than your leave balance');
                "Balance brought forward":=EmpLeave."Balance Brought Forward";
                END;
                
                
                
                
                "Date of Joining Company":=emp."Date Of Join";
                "Annual Leave Entitlement Bal":="Leave balance"-"Days Applied";
                */

            end;
        }
        field(5; "Days Applied"; Decimal)
        {

            trigger OnValidate()
            begin
                /*IF xRec.Status<>Status::Open THEN
                ERROR('You cannot change a document an approved document');
                
                VALIDATE("Start Date");
                VALIDATE("Leave Code");
                
                
                
                
                "Approved Days":="Days Applied";
                
                IF "Start Date" <> 0D THEN BEGIN;
                "Approved Start Date":="Start Date";
                
                IF "Days Applied" > 0 THEN BEGIN
                LeaveTypes.RESET;
                LeaveTypes.SETFILTER(LeaveTypes.Code,"Leave Code");
                CurDate:="Start Date";
                DayApp:="Days Applied";
                REPEAT
                DayApp := DayApp - 1;
                {
                IF LeaveTypes."Inclusive of Holidays" = FALSE THEN BEGIN
                GeneralOptions.FIND('-');
                BaseCalender.RESET;
                BaseCalender.SETFILTER(BaseCalender."Base Calendar Code",GeneralOptions."Base Calender");
                BaseCalender.SETRANGE(BaseCalender.Date,CurDate);
                IF BaseCalender.FIND('-') THEN BEGIN
                  IF BaseCalender.Nonworking = FALSE THEN BEGIN
                     CurDate := CALCDATE('1D',CurDate);
                  END
                  ELSE BEGIN
                     CurDate := CurDate;
                  END;
                
                
                END
                ELSE BEGIN
                  CurDate := CALCDATE('1D',CurDate);
                END;
                
                END;
                }
                 CurDate := CALCDATE('1D',CurDate);
                UNTIL DayApp = 0;
                
                END;
                
                "Recall Date To":=CurDate;
                
                END;
                         */

            end;
        }
        field(6; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                /*IF xRec.Status<>Status::Open THEN
                ERROR('You cannot change a document an approved document');
                
                  GeneralOptions.GET;
                 NoOfWorkingDays:=0;
                 IF "Days Applied"<>0 THEN
                 BEGIN
                 IF "Start Date"<>0D THEN
                 BEGIN
                  NextWorkingDate:="Start Date";
                
                 REPEAT
                 IF NOT CalendarMgmt.CheckDateStatus(GeneralOptions."Base Calendar Code",NextWorkingDate,Description) THEN
                 NoOfWorkingDays:=NoOfWorkingDays+1;
                
                 IF LeaveTypes.GET("Leave Code") THEN
                 BEGIN
                 IF LeaveTypes."Inclusive of Holidays" THEN
                 BEGIN
                 BaseCalendar.RESET;
                 BaseCalendar.SETRANGE(BaseCalendar."Base Calendar Code",GeneralOptions."Base Calendar Code");
                 BaseCalendar.SETRANGE(BaseCalendar.Date,NextWorkingDate);
                 BaseCalendar.SETRANGE(BaseCalendar.Nonworking,TRUE);
                 BaseCalendar.SETRANGE(BaseCalendar."Recurring System",BaseCalendar."Recurring System"::"Annual Recurring");
                  IF BaseCalendar.FIND('-') THEN BEGIN
                   NoOfWorkingDays:=NoOfWorkingDays+1;
                  // MESSAGE('Holiday =%1 Day of week %2',BaseCalendar.Date,BaseCalendar.Description);
                  END;
                
                 END;
                
                 IF LeaveTypes."Inclusive of Saturday" THEN
                 BEGIN
                 BaseCalender.RESET;
                 BaseCalender.SETRANGE(BaseCalender."Period Type",BaseCalender."Period Type"::Date);
                 BaseCalender.SETRANGE(BaseCalender."Period Start",NextWorkingDate);
                 BaseCalender.SETRANGE(BaseCalender."Period No.",6);
                
                 IF BaseCalender.FIND('-') THEN BEGIN
                   NoOfWorkingDays:=NoOfWorkingDays+1;
                   // MESSAGE('SATURDAY =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                  END;
                  END;
                
                
                 IF LeaveTypes."Inclusive of Sunday" THEN
                 BEGIN
                 BaseCalender.RESET;
                 BaseCalender.SETRANGE(BaseCalender."Period Type",BaseCalender."Period Type"::Date);
                 BaseCalender.SETRANGE(BaseCalender."Period Start",NextWorkingDate);
                 BaseCalender.SETRANGE(BaseCalender."Period No.",7);
                 IF  BaseCalender.FIND('-') THEN BEGIN
                   NoOfWorkingDays:=NoOfWorkingDays+1;
                 //  MESSAGE('Sunday =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                  END;
                  END;
                
                
                 IF LeaveTypes."Off/Holidays Days Leave" THEN
                 ;
                
                 END;
                
                 NextWorkingDate:=CALCDATE('1D',NextWorkingDate);
                 UNTIL  NoOfWorkingDays="Days Applied";
                 "Recall Date To":=NextWorkingDate-1;
                 "Resumption Date":=NextWorkingDate;
                 END;
                 END;
                 //serem
                //check if the date that the person is supposed to report back is a working day or not
                //get base calendar to use
                HumanResSetup.RESET();
                HumanResSetup.GET();
                HumanResSetup.TESTFIELD(HumanResSetup."Base Calender Code");
                NonWorkingDay:=FALSE;
                IF "Start Date"<>0D THEN
                  BEGIN
                    WHILE NonWorkingDay=FALSE
                      DO
                        BEGIN
                          NonWorkingDay:= CalendarMgmt.CheckDateStatus(HumanResSetup."Base Calender Code","Resumption Date",Dsptn);
                          IF NonWorkingDay THEN
                            BEGIN
                              NonWorkingDay:=FALSE;
                             "Resumption Date":=CALCDATE('1D',"Resumption Date");
                            END
                          ELSE
                            BEGIN
                              NonWorkingDay:=TRUE;
                            END;
                        END;
                  END;
                
                
                
                
                //New Joining Employees
                
                IF "Date of Joining Company">"Fiscal Start Date" THEN
                BEGIN
                
                IF "Date of Joining Company"<>0D THEN
                BEGIN
                NoofMonthsWorked:=0;
                Nextmonth:="Date of Joining Company";
                REPEAT
                
                Nextmonth:=CALCDATE('1M',Nextmonth);
                NoofMonthsWorked:=NoofMonthsWorked+1;
                UNTIL Nextmonth>="Start Date";
                NoofMonthsWorked:=NoofMonthsWorked-1;
                "No. of Months Worked":=NoofMonthsWorked;
                
                IF LeaveTypes.GET("Leave Code") THEN
                "Leave Earned to Date":=ROUND(((LeaveTypes.Days/12)*NoofMonthsWorked),1);
                "Leave Entitlment":="Leave Earned to Date";
                VALIDATE("Leave Code");
                END;
                END;
                */

            end;
        }
        field(7; "End Date"; Date)
        {
        }
        field(8; "Application Date"; Date)
        {
        }
        field(9; "Approved Days"; Decimal)
        {

            trigger OnValidate()
            begin
                //days:="Approved Days" ;
            end;
        }
        field(10; "Approved Start Date"; Date)
        {
        }
        field(11; "Days Recalled"; Integer)
        {

            trigger OnValidate()
            begin
                Validate("Recall Date From");
            end;
        }
        field(12; "Employee Name"; Text[100])
        {
        }
        field(13; "No. series"; Code[20])
        {
        }
        field(14; "Reason for Recall"; Text[200])
        {
        }
        field(15; "Recall Date From"; Date)
        {

            trigger OnValidate()
            begin
                GeneralOptions.Get;
                HRSetup.Get;
                if "Recall Date From" = 0D then begin
                    //"Return Date":=0D;
                    exit;
                end else begin
                    if DetermineIfIsNonWorking("Recall Date From") = true then begin
                        ;
                        Error('Recall Date From must be a working day');
                    end;
                end;

                NoOfWorkingDays := 0;
                if "Days Recalled" <> 0 then begin
                    if "Recall Date From" <> 0D then begin
                        NextWorkingDate := "Recall Date From";

                        repeat
                            //  if not CalendarMgmt.CheckDateStatus(HRSetup."Base Calender Code",NextWorkingDate,"Reason for Recall") then
                            NoOfWorkingDays := NoOfWorkingDays + 1;

                            if LeaveTypes.Get("Leave Code") then begin
                                if LeaveTypes."Inclusive of Holidays" then begin
                                    BaseCalendar.Reset;
                                    BaseCalendar.SetRange("Base Calendar Code", HRSetup."Base Calender Code");
                                    BaseCalendar.SetRange(Date, NextWorkingDate);
                                    BaseCalendar.SetRange(Nonworking, true);
                                    BaseCalendar.SetRange("Recurring System", BaseCalendar."recurring system"::"Annual Recurring");
                                    if BaseCalendar.Find('-') then begin
                                        NoOfWorkingDays := NoOfWorkingDays + 1;
                                        // MESSAGE('Holiday =%1 Day of week %2',BaseCalendar.Date,BaseCalendar.Description);
                                    end;

                                end;

                                if LeaveTypes."Inclusive of Saturday" then begin
                                    BaseCalender.Reset;
                                    BaseCalender.SetRange(BaseCalender."Period Type", BaseCalender."period type"::Date);
                                    BaseCalender.SetRange(BaseCalender."Period Start", NextWorkingDate);
                                    BaseCalender.SetRange(BaseCalender."Period No.", 6);

                                    if BaseCalender.Find('-') then begin
                                        NoOfWorkingDays := NoOfWorkingDays + 1;
                                        // MESSAGE('SATURDAY =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                                    end;
                                end;


                                if LeaveTypes."Inclusive of Sunday" then begin
                                    BaseCalender.Reset;
                                    BaseCalender.SetRange(BaseCalender."Period Type", BaseCalender."period type"::Date);
                                    BaseCalender.SetRange(BaseCalender."Period Start", NextWorkingDate);
                                    BaseCalender.SetRange(BaseCalender."Period No.", 7);
                                    if BaseCalender.Find('-') then begin
                                        NoOfWorkingDays := NoOfWorkingDays + 1;
                                        //  MESSAGE('Sunday =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                                    end;
                                end;


                                if LeaveTypes."Off/Holidays Days Leave" then
                                ;

                            end;

                            NextWorkingDate := CalcDate('1D', NextWorkingDate);
                        until NoOfWorkingDays = "Days Recalled";
                        //"Recall Date To":=NextWorkingDate-1;
                        "Recall Date To" := NextWorkingDate;
                    end;
                end;
            end;
        }
        field(16; Posted; Boolean)
        {
        }
        field(17; "Recall Date To"; Date)
        {
        }
        field(18; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
    }

    keys
    {
        key(Key1; "Recall No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if "Recall No" = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField("Leave Recall Nos");
            NoSeriesMgt.InitSeries(HumanResSetup."Leave Recall Nos", xRec."No. series", 0D, "Recall No", "No. series");
        end;
    end;

    trigger OnModify()
    begin
        if xRec.Posted then
            Error('You cannot edit a posted document');
    end;

    var
        ReturnDateLoop: Boolean;
        BaseCalendarChange: Record "Base Calendar Change";
        HRLeaveTypes: Record "HR Leave Types";
        "Employee Leaves": Record "Employee Leaves";
        CurDate: Date;
        DayApp: Decimal;
        Dayofweek: Integer;
        i: Integer;
        textholder: Text[30];
        emp: Record Employee;
        leaveapp: Record "Employee Leave Application";
        NoOfDays: Integer;
        yearend: Date;
        d: Date;
        HumanResSetup: Record "Human Resources Setup";
        d2: Integer;
        d3: Integer;
        d4: Integer;
        d1: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        // earn: Record EarningsX;
        assmatrix: Record "Assignment Matrix-X";
        ecode: Code[10];
        ldated: Date;
        UserSertup: Record "User Setup";
        Text01: label 'The Recall date must be between the leave dates i.e %1 and %2';
        Calendar: Record Date;
        empMonths: Integer;
        HRLeave: Record "HR Leave Application";
        objLeaveApps: Record "HR Leave Application";
        mWeekDay: Integer;
        empGender: Option Female;
        mMinDays: Integer;
        NoOfWorkingDays: Integer;
        NextWorkingDate: Date;
        CalendarMgmt: Codeunit "Calendar Management";
        BaseCalendar: Record "Base Calendar Change";
        BaseCalender: Record Date;
        NonWorkingDay: Boolean;
        GeneralOptions: Record "Company Information";
        HRSetup: Record "Human Resources Setup";
        LeaveTypes: Record "HR Leave Types";
        Dsptn: Text[50];
        DimMgt: Codeunit DimensionManagement;
        Employees: Record Employee;
        leave: Record "HR Leave Application";
        CummDays: Integer;
        dTaken: Decimal;
        AssignmentMatrixX: Record "Assignment Matrix-X";
        // EarnX: Record EarningsX;
        AssignMatrixX: Record "Assignment Matrix-X";
        HRLeaveApp: Record "HR Leave Application";
        varDaysApplied: Integer;


    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
            if DetermineIfIncludesNonWorking("Leave Code") = false then begin
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
        //MESSAGE('varDaysApplied,%1,%2',varDaysApplied,fReturnDate);
        until varDaysApplied = 0;

        //If Date to return is saturday add 2 days to returen on monday
        //IF DetermineIfIncludesNonWorking("Leave Type") =FALSE THEN BEGIN
        mWeekDay := Date2dwy(fReturnDate, 1);
        if mWeekDay = 6 then
            fReturnDate := CalcDate('+2D', fReturnDate)
        else
            if mWeekDay = 7 then
                fReturnDate := CalcDate('+1D', fReturnDate);

        exit(fReturnDate);
        //END;
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
        HRSetup.Find('-');
        HRSetup.TestField(HRSetup."Base Calender Code");
        BaseCalendarChange.SetFilter(BaseCalendarChange."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendarChange.SetRange(BaseCalendarChange.Date, bcDate);
        if BaseCalendarChange.Find('-') then begin
            if BaseCalendarChange.Nonworking = false then
                Message('Start date can only be a Working Day Date');
            exit(true);
        end;

        /*
        Customized.RESET;
        Customized.SETRANGE(Customized.Date,bcDate);
        IF Customized.FIND('-') THEN BEGIN
            IF Customized."Non Working" = TRUE THEN
            EXIT(TRUE)
            ELSE
            EXIT(FALSE);
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
        Message('fEndDate,%1', fEndDate);
    end;
}

