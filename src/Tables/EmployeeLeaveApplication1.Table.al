Table 52193908 "Employee Leave Application1"
{
    DrillDownPageID = "Employee Leave Application 2";
    LookupPageID = "Employee Leave Application 2";

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                /*
                 IF emp.GET("Employee No") THEN
                 BEGIN
                 "Employee Name":=FORMAT(emp.Title)+' '+emp."First Name"+' '+emp."Middle Name"+' '+emp."Last Name";
                 "Date of Joining Company":=EmpRec."Date Of Join";
                 "Balance brought forward":=EmpLeave."Balance Brought Forward";
                 END;
                  */

                if emp.Get("Employee No") then begin
                    "Employee Name" := Format(emp.Title) + ' ' + emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
                    "Date of Joining Company" := emp."Date Of Join";
                    //"Balance brought forward":=EmpLeave."Balance Brought Forward";
                    "Department Code" := emp."Global Dimension 1 Code";
                    //   if emp."Contract Number"<>0 then
                    //  "Contract No.":=emp."Contract Number";
                    //TO GET ENTITLEMENT AND BALANCES-B/F FOR EMPLOYEES ON CONTRACT - by Jacob

                    if (emp."Posting Group" = 'TEMP') or (emp."Posting Group" = 'INTERN') then begin
                        EmpContracts.Reset;
                        EmpContracts.SetRange(EmpContracts."Employee No", emp."No.");
                        // EmpContracts.SetRange(EmpContracts."Contract No",emp."Contract Number");
                        EmpContracts.SetRange(EmpContracts.Expired, false);
                        if EmpContracts.Find('-') then begin
                            "Leave Entitlment" := EmpContracts."Contract Leave Entitlement";
                            "Balance brought forward" := EmpContracts."Balance Brought Forward";
                            //   "Contract No.":=EmpContracts."Contract No";
                        end;
                        //to determine the leave entitlement for temporary employees by isaac
                        // "Leave Entitlment":=ROUND(((emp."Contract End Date"-emp."Contract Start Date")/30),1)*2.5;

                    end;
                    // End of the employee on contract
                end;

            end;
        }
        field(2; "Application No"; Code[20])
        {
            NotBlank = false;

            trigger OnValidate()
            begin
                "Application Date" := Today;
                if "Application No" <> xRec."Application No" then begin
                    HumanResSetup.Get;
                    NoSeriesMgt.TestManual(HumanResSetup."Leave Application Nos.");
                    "No. series" := '';
                end;
            end;
        }
        field(3; "Leave Code"; Code[20])
        {
            TableRelation = "Leave Types1";

            trigger OnValidate()
            begin
                if xRec.Status <> Status::Open then
                    Error('You cannot change an already approved document');

                if emp.Get("Employee No") then begin
                    if LeaveTypes.Get("Leave Code") then begin

                        if LeaveTypes."Annual Leave" = false then begin

                            if LeaveTypes.Gender = LeaveTypes.Gender::Female then
                                if emp.Gender = emp.Gender::Male then
                                    Error('%1 can only be assigned to %2 employees', LeaveTypes.Description, LeaveTypes.Gender);

                            if LeaveTypes.Gender = LeaveTypes.Gender::Male then
                                if emp.Gender = emp.Gender::Female then
                                    Error('%1 can only be assigned to %2 employees', LeaveTypes.Description, LeaveTypes.Gender);

                            "Leave Entitlment" := LeaveTypes.Days;

                            "Days Applied" := LeaveTypes.Days;

                        end else if LeaveTypes."Annual Leave" = true then begin

                            // END;
                            emp.Reset;
                            if emp.Get("Employee No") then begin

                                if LeaveTypes."Eligible Staff" = LeaveTypes."eligible staff"::Permanent then
                                    // MESSAGE(emp."Posting Group");
                                    if (emp."Posting Group" <> 'PERMANENT') and (emp."Posting Group" <> 'CMFIU/2NDM') then
                                        Error('%1 can only be assigned to Permanent members of staff', LeaveTypes.Description);
                                ;

                                if ("Date of Joining Company" <> 0D) and ("Date of Joining Company" > "Fiscal Start Date") then begin
                                    // MESSAGE('%1',"Date of Joining Company");
                                    NoofMonthsWorked := 0;
                                    Nextmonth := "Date of Joining Company";
                                    repeat

                                        Nextmonth := CalcDate('1M', Nextmonth);
                                        NoofMonthsWorked := "Application Date" - "Date of Joining Company";
                                    //message('%1',NoofMonthsWorked);
                                    until Nextmonth >= "Maturity Date";
                                    NoofMonthsWorked := NoofMonthsWorked - 1;
                                    "No. of Months Worked" := NoofMonthsWorked;

                                    if LeaveTypes.Get("Leave Code") then
                                        "Leave Earned to Date" := ROUND((NoofMonthsWorked / 30 * 2.5), 0.5);
                                    "Leave Entitlment" := ("Maturity Date" - "Date of Joining Company") / 30 * 2.5;
                                    // VALIDATE("Leave Code");
                                    //END;
                                    EmpLeave.Reset;
                                    EmpLeave."Leave Code" := "Leave Code";
                                    EmpLeave."Maturity Date" := "Maturity Date";
                                    EmpLeave."Employee No" := "Employee No";
                                    EmpLeave.Entitlement := "Leave Entitlment";
                                    // EmpLeave.Balance:="Leave balance";
                                    // EmpLeave."Balance Brought Forward";
                                    if not EmpLeave.Get("Employee No", "Leave Code", "Maturity Date") then
                                        EmpLeave.Insert;

                                end;

                                /*
                                 END;

                                emp.RESET;
                                IF emp.GET("Employee No") THEN
                                BEGIN

                                 IF LeaveTypes."Eligible Staff"=LeaveTypes."Eligible Staff"::Permanent THEN
                                  IF (emp."Posting Group"<>'PERMANENT') OR (emp."Posting Group"<>'CMFIU/2NDM') THEN
                                     ERROR('%1 can only be assigned to Permanent members of staff',LeaveTypes.Description);

                                   //  "Leave Entitlment":=LeaveTypes.Days;//EmpContracts."Contract Leave Entitlement";
                                 */

                                if ("Date of Joining Company" <> 0D) and ("Date of Joining Company" <= "Fiscal Start Date") then //"Leave Earned to Date"=0
                                begin
                                    if LeaveTypes."Eligible Staff" = LeaveTypes."eligible staff"::Permanent then begin
                                        EmpLeave.Reset;
                                        if EmpLeave.Get("Employee No", "Leave Code", "Maturity Date") then begin
                                            "Leave Earned to Date" := ROUND((("Application Date" - "Fiscal Start Date") / 30 * 2.5), 0.5);
                                            "Leave Entitlment" := LeaveTypes.Days;
                                            "Leave balance" := EmpLeave.Balance;
                                            "Balance brought forward" := EmpLeave."Balance Brought Forward";
                                        end;
                                    end else if LeaveTypes."Eligible Staff" = LeaveTypes."eligible staff"::"Temporary" then begin
                                        "Leave Earned to Date" := ROUND((("Application Date" - "Fiscal Start Date") / 30 * 1.75), 0.5);
                                        "Leave Entitlment" := LeaveTypes.Days;
                                    end;
                                    //+EmpLeave."Balance Brought Forward"
                                end else if "Leave Earned to Date" <> 0 then
                                        "Leave Entitlment" := LeaveTypes.Days;
                            end;


                        end;
                    end;

                    CalcFields("Total Leave Days Taken", "Recalled Days", "Off Days");
                    "Leave balance" := ("Leave Entitlment" + "Balance brought forward" + "Recalled Days" + "Off Days") - ("Total Leave Days Taken" + "Days Absent");


                    "Date of Joining Company" := emp."Date Of Join";
                end;

            end;
        }
        field(4; "Days Applied"; Decimal)
        {

            trigger OnValidate()
            begin
                if xRec.Status <> Status::Open then
                    Error('You cannot change an already approved document');

                Validate("Start Date");
                //VALIDATE("Leave Code");

                /*
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
                
                "End Date":=CurDate;
                
                END;
                         */

                // IF "Days Applied">"Leave balance" THEN
                // ERROR('The days applied for are more than your leave balance');

                "Annual Leave Entitlement Bal" := "Leave balance" - "Days Applied";

            end;
        }
        field(5; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                if xRec.Status <> Status::Open then
                    Error('You cannot change an already approved document');
                //TESTFIELD("Start Date");
                /*
               LeavePlan.RESET;
               LeavePlan.SETRANGE(LeavePlan."Employee No","Employee No");
               LeavePlan.SETRANGE(LeavePlan."Leave Code","Leave Code");
               LeavePlan.SETRANGE(LeavePlan."Maturity Date","Maturity Date");

               */

                FullDays := ROUND("Days Applied", 1, '<');
                HalfDays := "Days Applied" - FullDays;

                //IF "Start Date" < TODAY THEN
                //  ERROR('You cannot enter a date earlier than today on this field!');


                "Resumption Date" := "Start Date";
                GeneralOptions.Get;
                NoOfWorkingDays := 0;

                if ("Days Applied" <> 0) and ("Days Applied" >= 1) then begin
                    if "Start Date" <> 0D then begin
                        // IF "Days Applied" = FullDays THEN BEGIN
                        NextWorkingDate := "Start Date";

                        repeat
                            if not Codefactory.DetermineIfIsNonWorking(NextWorkingDate) then
                                NoOfWorkingDays := NoOfWorkingDays + 1;

                            if LeaveTypes.Get("Leave Code") then begin
                                if LeaveTypes."Inclusive of Holidays" then begin
                                    BaseCalendar.Reset;
                                    BaseCalendar.SetRange(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar Code");
                                    BaseCalendar.SetRange(BaseCalendar.Date, NextWorkingDate);
                                    BaseCalendar.SetRange(BaseCalendar.Nonworking, true);
                                    BaseCalendar.SetRange(BaseCalendar."Recurring System", BaseCalendar."recurring system"::"Annual Recurring");
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
                        until NoOfWorkingDays = FullDays;
                        "End Date" := NextWorkingDate - 1;
                        "Resumption Date" := NextWorkingDate;
                        // END;
                    end;
                end else
                    if ("Days Applied" <> 0) and ("Days Applied" < 1) then begin
                        "End Date" := "Start Date";
                        "Resumption Date" := "Start Date";

                    end;
                //serem
                //check if the date that the person is supposed to report back is a working day or not
                //get base calendar to use
                HumanResSetup.Reset();
                HumanResSetup.Get();
                HumanResSetup.TestField(HumanResSetup."Base Calender Code");
                NonWorkingDay := false;
                if "Start Date" <> 0D then begin
                    while NonWorkingDay = false
                      do begin
                        NonWorkingDay := Codefactory.DetermineIfIsNonWorking("Resumption Date");
                        if NonWorkingDay then begin
                            NonWorkingDay := false;
                            "Resumption Date" := CalcDate('1D', "Resumption Date");
                        end
                        else begin
                            NonWorkingDay := true;
                        end;
                    end;
                end;


                LeaveTypes.Get("Leave Code");

                if LeaveTypes."Annual Leave" = true then begin
                    //New Joining Employees
                    if emp.Get("Employee No") then begin
                        //IF (emp."Posting Group"='PERMANENT') OR (emp."Posting Group"='DG')
                        // AND (emp."Date Of Join">"Fiscal Start Date")
                        // THEN BEGIN

                        if ("Date of Joining Company" > "Fiscal Start Date") then begin

                            if "Date of Joining Company" <> 0D then begin
                                NoofMonthsWorked := 0;
                                Nextmonth := "Date of Joining Company";
                                repeat

                                    Nextmonth := CalcDate('1M', Nextmonth);
                                    NoofMonthsWorked := NoofMonthsWorked + 1;
                                until Nextmonth >= "Start Date";
                                NoofMonthsWorked := NoofMonthsWorked - 1;
                                "No. of Months Worked" := NoofMonthsWorked;

                                if LeaveTypes.Get("Leave Code") then
                                    "Leave Earned to Date" := ROUND(((LeaveTypes.Days / 12) * NoofMonthsWorked), 1);
                                //"Leave Entitlment":="Leave Earned to Date";
                                Validate("Leave Code");
                            end;
                        end;
                        //END;
                    end;
                end;

            end;
        }
        field(6; "End Date"; Date)
        {

            trigger OnValidate()
            begin
                //"Approved To Date":="To Date";
                if xRec.Status <> Status::Open then
                    Error('You cannot change an approved document');
                if "Start Date" <> 0D then
                    Validate("Start Date");
                Validate("Leave Code");
            end;
        }
        field(7; "Application Date"; Date)
        {
        }
        field(8; "Approved Days"; Decimal)
        {

            trigger OnValidate()
            begin
                days := "Approved Days";
            end;
        }
        field(9; "Approved Start Date"; Date)
        {
        }
        field(10; "Verified By Manager"; Boolean)
        {

            trigger OnValidate()
            begin
                "Verification Date" := Today;
            end;
        }
        field(11; "Verification Date"; Date)
        {
        }
        field(12; "Leave Status"; Option)
        {
            OptionCaption = 'Being Processed,Approved,Rejected,Canceled';
            OptionMembers = "Being Processed",Approved,Rejected,Canceled;

            trigger OnValidate()
            begin

                if ("Leave Status" = "leave status"::Approved) and (xRec."Leave Status" <> "leave status"::Approved) then begin
                    ;
                    "Approval Date" := Today;
                    "Approved Days" := xRec."Days Applied";
                    //MODIFY;

                    LeaveTypes.Get("Leave Code");

                    if LeaveTypes."Annual Leave" = true then begin


                        /*
                        emp.RESET;
                        IF emp.GET("Employee No") THEN BEGIN

                          //For employees on contract by Jacob
                          IF (emp."Posting Group"='TEMP') OR (emp."Posting Group"='INTERN') THEN BEGIN
                             EmployeeContracts.RESET;
                             EmployeeContracts.SETRANGE(EmployeeContracts."Employee No","Employee No");
                             EmployeeContracts.SETRANGE(EmployeeContracts.Expired,FALSE);
                             IF EmployeeContracts.FIND('-') THEN BEGIN
                              IF (EmployeeContracts."Contract Start Date"<"Start Date") AND (EmployeeContracts."Contract End Date">"Start Date") THEN
                                EmployeeContracts."Contract Leave Balance":=EmployeeContracts."Contract Leave Balance"-"Approved Days";
                                // "Leave balance":=EmployeeContracts."Contract Leave Balance";
                                EmployeeContracts.VALIDATE(EmployeeContracts."Contract Leave Balance");
                                EmployeeContracts.MODIFY;

                               "Employee Leaves".RESET;
                               "Employee Leaves".SETRANGE("Employee Leaves"."Employee No","Employee No");
                               "Employee Leaves".SETRANGE("Employee Leaves"."Leave Code","Leave Code");
                               "Employee Leaves".SETRANGE("Employee Leaves"."Temp. Emp. Contract",EmployeeContracts."Contract No");
                               IF "Employee Leaves".FIND('-') THEN;
                                "Employee Leaves".Balance:="Employee Leaves".Balance - "Approved Days";
                                "Employee Leaves".VALIDATE("Employee Leaves".Balance);
                                 "Employee Leaves".MODIFY;
                             END;
                           END
                           ELSE
                           */

                        "Employee Leaves".Reset;
                        "Employee Leaves".SetRange("Employee Leaves"."Employee No", "Employee No");
                        "Employee Leaves".SetRange("Employee Leaves"."Leave Code", "Leave Code");
                        if "Employee Leaves".Find('-') then begin

                            "Employee Leaves".Balance := "Employee Leaves".Balance - "Approved Days";
                            // "Employee Leaves".VALIDATE("Employee Leaves".Balance);

                            // "Leave balance":="Employee Leaves".Balance;
                            //"Balance brought forward":=EmpLeave."Balance Brought Forward";
                            "Employee Leaves".Modify;

                        end;
                    end
                    else if ("Leave Status" <> "leave status"::Approved) and (xRec."Leave Status" = "leave status"::Approved) then begin
                        "Approval Date" := Today;
                        //"Approved Days" := 0;
                        "Employee Leaves".Reset;
                        "Employee Leaves".SetRange("Employee Leaves"."Employee No", "Employee No");
                        "Employee Leaves".SetRange("Employee Leaves"."Leave Code", "Leave Code");
                        if "Employee Leaves".Find('-') then;
                        "Employee Leaves".Balance := "Employee Leaves".Balance + "Approved Days";
                        "Employee Leaves".Validate("Employee Leaves".Balance);

                        "Employee Leaves".Modify;
                    end;

                end;

            end;
        }
        field(13; "Approved End Date"; Date)
        {
        }
        field(14; "Approval Date"; Date)
        {
        }
        field(15; Comments; Text[250])
        {
        }
        field(16; Taken; Boolean)
        {
        }
        field(17; "Acrued Days"; Decimal)
        {
        }
        field(18; "Over used Days"; Decimal)
        {
        }
        field(19; "Leave Allowance Payable"; Option)
        {
            OptionMembers = " ",Yes,No;

            trigger OnValidate()
            begin
                HumanResSetup.Get;
                if "Leave Allowance Payable" = "leave allowance payable"::Yes then begin

                    if emp.Get("Employee No") then
                        // BEGIN
                        if (emp."Posting Group" = 'TEMP') or (emp."Posting Group" = 'INTERN') then
                            Error('Temporary Employees are not paid leave allowance');


                    leaveapp.Reset;
                    leaveapp.SetRange(leaveapp."Employee No", "Employee No");
                    leaveapp.SetRange(leaveapp."Maturity Date", "Maturity Date");
                    leaveapp.SetRange(leaveapp.Status, leaveapp.Status::Released);
                    leaveapp.SetRange(leaveapp."Leave Allowance Payable", leaveapp."leave allowance payable"::Yes);
                    if leaveapp.Find('-') then
                        Error('Leave allowance has already been paid in leave application %1', leaveapp."Application No");

                    AccPeriod.Reset;
                    AccPeriod.SetRange(AccPeriod."Starting Date", 0D, Today);
                    AccPeriod.SetRange(AccPeriod."New Fiscal Year", true);
                    if AccPeriod.Find('+') then
                        FiscalStart := AccPeriod."Starting Date";
                    // MESSAGE('YEAR START %1',FiscalStart);

                    FiscalEnd := CalcDate('1Y', FiscalStart) - 1;
                    //  MESSAGE('YEAR END%1',FiscalEnd);

                    assmatrix.Reset;
                    assmatrix.SetRange(assmatrix."Payroll Period", FiscalStart, FiscalEnd);
                    assmatrix.SetRange(assmatrix."Employee No", leaveapp."Employee No");
                    assmatrix.SetRange(assmatrix.Type, assmatrix.Type::Payment);
                    assmatrix.SetRange(assmatrix.Code, HumanResSetup."Leave Allowance Code");
                    if assmatrix.Find('-') then begin
                        LeaveAllowancePaid := true;
                        Error('Leave allowance has already been paid in %1', assmatrix."Payroll Period");
                    end;

                    if "Days Applied" < HumanResSetup."Qualification Days (Leave)" then
                        Error('You can only be paid leave allowance if you take %1 or more Days', HumanResSetup."Qualification Days (Leave)");

                end;
            end;
        }
        field(20; Post; Boolean)
        {
        }
        field(21; days; Decimal)
        {
        }
        field(23; "No. series"; Code[10])
        {
        }
        field(24; "Leave balance"; Decimal)
        {
        }
        field(25; "Resumption Date"; Date)
        {
        }
        field(26; "Employee Name"; Text[50])
        {
        }
        field(27; Status; Option)
        {
            Editable = false;
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected;
        }
        field(28; "Leave Entitlment"; Decimal)
        {
        }
        field(29; "Total Leave Days Taken"; Decimal)
        {
            CalcFormula = sum("Employee Leave Application1"."Days Applied" where(Status = const(Released),
                                                                                  "Employee No" = field("Employee No"),
                                                                                  "Leave Code" = field("Leave Code"),
                                                                                  "Maturity Date" = field("Maturity Date")));
            FieldClass = FlowField;
        }
        field(30; "Duties Taken Over By"; Code[30])
        {
            TableRelation = Employee where("Global Dimension 1 Code" = field("Directorate Code"));

            trigger OnValidate()
            begin
                if xRec.Status <> Status::Open then
                    Error('You cannot change an already approved document');


                if "Duties Taken Over By" = "Employee No" then
                    Error('You cannot select your own ID in this field');

                emp.Reset;
                if emp.Get("Duties Taken Over By") then
                    Name := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
            end;
        }
        field(31; Name; Text[50])
        {
        }
        field(32; "Mobile No"; Code[20])
        {
        }
        field(33; "Balance brought forward"; Decimal)
        {
        }
        field(34; "Leave Earned to Date"; Decimal)
        {
        }
        field(35; "Maturity Date"; Date)
        {
        }
        field(36; "Date of Joining Company"; Date)
        {
        }
        field(37; "Fiscal Start Date"; Date)
        {
        }
        field(38; "No. of Months Worked"; Decimal)
        {
        }
        field(39; "Annual Leave Entitlement Bal"; Decimal)
        {
        }
        field(40; "Recalled Days"; Decimal)
        {
            CalcFormula = sum("Employee Off/Holidays1"."No. of Off Days" where("Employee No" = field("Employee No"),
                                                                                "Maturity Date" = field("Maturity Date")));
            FieldClass = FlowField;
        }
        field(41; "Off Days"; Decimal)
        {
            CalcFormula = sum("Holidays_Off Days1"."No. of Days" where("Employee No." = field("Employee No"),
                                                                        "Leave Type" = field("Leave Code"),
                                                                        "Maturity Date" = field("Maturity Date")));
            FieldClass = FlowField;
        }
        field(42; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code;
        }
        field(43; "User ID"; Code[30])
        {
        }
        field(44; "No of Approvals"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Table ID" = const(69132),
                                                        "Document No." = field("Application No")));
            FieldClass = FlowField;
        }
        field(45; "Days Absent"; Decimal)
        {
            CalcFormula = sum("Employee Absentism1"."No. of  Days Absent" where("Employee No" = field("Employee No"),
                                                                                 "Maturity Date" = field("Maturity Date")));
            FieldClass = FlowField;
        }
        field(46; "Contract No."; Integer)
        {
        }
        field(47; "Pending Approver"; Code[30])
        {
            CalcFormula = lookup("Approval Entry"."Approver ID" where("Document No." = field("Application No"),
                                                                       Status = const(Open)));
            FieldClass = FlowField;
        }
        field(48; "Directorate Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code;
        }
        field(49; "Department Name"; Text[50])
        {
        }
        field(50; "Directorate name"; Text[50])
        {
        }
        field(51; "No. of Approvals"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Table ID" = const(51511234),
                                                        "Document No." = field("Application No")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Application No")
        {
            Clustered = true;
            SumIndexFields = days;
        }
        key(Key2; "Employee No", Status, "Leave Code", "Maturity Date")
        {
            SumIndexFields = "Days Applied", "Approved Days";
        }
        key(Key3; "Employee No", Status, "Leave Code", "Contract No.")
        {
            SumIndexFields = "Days Applied", "Approved Days";
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Application No", "Leave Code", "Employee No", "Employee Name", "Start Date", "End Date", "Days Applied")
        {
        }
    }

    trigger OnDelete()
    begin

        if Post = true then
            Error('You cannot Delete the Record');

        if Status <> Status::Open then
            Error('You cannot delete a document that is already approved or pending approval');
    end;

    trigger OnInsert()
    begin



        if "Application No" = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField("Leave Application Nos.");
            NoSeriesMgt.InitSeries(HumanResSetup."Leave Application Nos.", xRec."No. series", 0D, "Application No", "No. series");
        end;

        "Application Date" := Today;
        if UserSertup.Get(UserId) then begin
            "Employee No" := UserSertup."Employee No.";
            Validate("Employee No");
            "User ID" := UserId;
            if EmpRec.Get("Employee No") then begin
                "Department Code" := EmpRec."Global Dimension 2 Code";
                DimVal.Reset;
                if DimVal.Get('DEPARTMENT', "Department Code") then
                    "Department Name" := DimVal.Name;

                "Directorate Code" := EmpRec."Global Dimension 1 Code";
                DimVal.Reset;
                if DimVal.Get('DIRECTORATE', "Directorate Code") then
                    "Directorate name" := DimVal.Name;

                "Mobile No" := EmpRec."Cellular Phone Number";
                "Date of Joining Company" := EmpRec."Date Of Join";
                //  "Contract No.":=emp."Contract Number";
                //"Balance brought forward":=EmpLeave."Balance Brought Forward";
            end;

            //DimVal.RESET;
            //IF DimVal.GET('DIRECTORATE',"Directorate Code") THEN
            //  "Directorate name":=DimVal.Name;

        end;
        FindMaturityDate;
        "Maturity Date" := MaturityDate;
        "Fiscal Start Date" := FiscalStart;

        /*leaveapp.RESET;
        leaveapp.SETRANGE(leaveapp."Employee No","Employee No");
        leaveapp.SETRANGE(leaveapp."Fiscal Start Date","Fiscal Start Date");
        leaveapp.SETRANGE(leaveapp."Maturity Date","Maturity Date");
        leaveapp.SETRANGE(leaveapp."Leave Status",leaveapp."Leave Status"::"Being Processed");
        IF leaveapp.FIND('-') THEN BEGIN
        IF
        // (leaveapp."Leave Code"<>'') AND (leaveapp."Days Applied">0) AND (leaveapp."Start Date"<>0D) AND (leaveapp."End Date"<>0D)
        //AND (leaveapp."Duties Taken Over By"<>'') AND
        (leaveapp.Status<>leaveapp.Status::Open) AND (leaveapp.Status<>leaveapp.Status::Rejected)
         AND (leaveapp.Status<>leaveapp.Status::Released) THEN
          ERROR
        ('You cannot make a new leave application before the previous one on %1 is approved, Please contact HR or your supervisor'
        ,leaveapp."Application Date");
        END;*/

    end;

    trigger OnModify()
    begin
        if Post = true then
            Error('You cannot Modify the Record');
    end;

    trigger OnRename()
    begin
        if Post = true then
            Error('You cannot Rename the Record');
    end;

    var
        "Employee Leaves": Record "Employee Leaves1";
        BaseCalender: Record Date;
        CurDate: Date;
        LeaveTypes: Record "Leave Types1";
        DayApp: Decimal;
        Dayofweek: Integer;
        i: Integer;
        textholder: Text[30];
        emp: Record Employee;
        leaveapp: Record "Employee Leave Application1";
        GeneralOptions: Record "Company Information";
        NoOfDays: Integer;
        BaseCalendar: Record "Base Calendar Change";
        yearend: Date;
        d: Date;
        d2: Integer;
        d3: Integer;
        d4: Integer;
        d1: Integer;
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        earn: Record EarningsX1;
        assmatrix: Record "Assignment Matrix-X1";
        ecode: Code[10];
        ldated: Date;
        UserSertup: Record "User Setup";
        CalendarMgmt: Codeunit "Calendar Management";
        NextWorkingDate: Date;
        Description: Text[30];
        NoOfWorkingDays: Integer;
        LeaveAllowancePaid: Boolean;
        PayrollPeriod: Record "Payroll PeriodX1";
        PayPeriodStart: Date;
        EmpRec: Record Employee;
        MaturityDate: Date;
        EmpLeave: Record "Employee Leaves1";
        NoofMonthsWorked: Integer;
        FiscalStart: Date;
        Nextmonth: Date;
        DimVal: Record "Dimension Value";
        NonWorkingDay: Boolean;
        Dsptn: Text[30];
        AccPeriod: Record "Accounting Period";
        FiscalEnd: Date;
        EmpContracts: Record "Employee Contracts1";
        EmployeeContracts: Record "Employee Contracts1";
        LeavePlan: Record "Employee Leave Plan1";
        FullDays: Decimal;
        HalfDays: Decimal;


    procedure CreateLeaveAllowance(var LeaveApp: Record "Employee Leave Application1")
    var
        HRSetup: Record "Human Resources Setup";
        AccPeriod: Record "Accounting Period";
        FiscalStart: Date;
        FiscalEnd: Date;
        ScaleBenefits: Record "Scale Benefits1";
        RefDate: Date;
    begin

        if LeaveApp."Leave Allowance Payable" = LeaveApp."leave allowance payable"::Yes then begin
            AccPeriod.Reset;
            AccPeriod.SetRange(AccPeriod."Starting Date", 0D, Today);
            AccPeriod.SetRange(AccPeriod."New Fiscal Year", true);
            if AccPeriod.Find('+') then
                FiscalStart := AccPeriod."Starting Date";
            //MESSAGE('%1',FiscalStart);


            FiscalEnd := CalcDate('1Y', FiscalStart) - 1;
            //MESSAGE('%1',FiscalEnd);

            LeaveApp.Reset;
            LeaveApp.SetRange(LeaveApp."Employee No", "Employee No");
            LeaveApp.SetRange(LeaveApp."Maturity Date", "Maturity Date");
            LeaveApp.SetRange(LeaveApp.Status, LeaveApp.Status::Released);
            LeaveApp.SetRange(LeaveApp."Leave Allowance Payable", LeaveApp."leave allowance payable"::Yes);
            if LeaveApp.Find('-') then
                Error('Leave allowance has already been paid in leave application %1', LeaveApp."Application No");

            /*
            assmatrix.RESET;
            assmatrix.SETRANGE(assmatrix."Payroll Period",FiscalStart,FiscalEnd);
            assmatrix.SETRANGE(assmatrix."Employee No",LeaveApp."Employee No");
            assmatrix.SETRANGE(assmatrix.Type,assmatrix.Type::Payment);
            assmatrix.SETRANGE(assmatrix.Code,HRSetup."Leave Allowance Code");
            IF assmatrix.FIND('-') THEN
            BEGIN
            LeaveAllowancePaid:=TRUE;
            ERROR('Leave allowance has already been paid in %1',assmatrix."Payroll Period");
            END;


            IF NOT LeaveAllowancePaid THEN
            BEGIN



            IF HRSetup.GET THEN
            BEGIN
            IF "Days Applied">=HRSetup."Qualification Days (Leave)" THEN
            BEGIN
              IF emp.GET("Employee No") THEN
              BEGIN
              {
                ScaleBenefits.RESET;
                ScaleBenefits.SETRANGE(ScaleBenefits."Salary Scale",emp."Salary Scale");
                ScaleBenefits.SETRANGE(ScaleBenefits."Salary Pointer",emp.Present);
                ScaleBenefits.SETRANGE(ScaleBenefits."ED Code",HRSetup."Leave Allowance Code");
                IF ScaleBenefits.FIND('-') THEN
                BEGIN
              }
                   PayrollPeriod.RESET;
                   PayrollPeriod.SETRANGE(PayrollPeriod."Close Pay",FALSE);
                   IF PayrollPeriod.FIND('-') THEN
                   PayPeriodStart:=PayrollPeriod."Starting Date";

                  HRSetup.GET;
                  RefDate:=CALCDATE(HRSetup."Monthly PayDate",PayPeriodStart);
                  IF LeaveApp."Application Date">RefDate THEN
                   PayPeriodStart:=CALCDATE('1M',PayPeriodStart);


                  assmatrix.INIT;
                  assmatrix."Employee No":="Employee No";
                  assmatrix.Type:=assmatrix.Type::Payment;
                  assmatrix.Code:=HRSetup."Leave Allowance Code";
                  assmatrix.VALIDATE(assmatrix.Code);
                  assmatrix."Payroll Period":=PayPeriodStart;
                  assmatrix.VALIDATE("Payroll Period");
                  assmatrix.Amount:=ScaleBenefits.Amount;
                  IF NOT assmatrix.GET(assmatrix."Employee No",assmatrix.Type,assmatrix.Code,assmatrix."Payroll Period") THEN
                  assmatrix.INSERT;
             // END;
              END;

            END;




            END;
            //MESSAGE('Your leave allowance for this year has already been paid');
            END;
            */
        end;

    end;


    procedure FindMaturityDate()
    var
        AccPeriod: Record "Accounting Period";
    begin
        AccPeriod.Reset;
        AccPeriod.SetRange(AccPeriod."Starting Date", 0D, Today);
        AccPeriod.SetRange(AccPeriod."New Fiscal Year", true);
        if AccPeriod.Find('+') then begin
            FiscalStart := AccPeriod."Starting Date";
            MaturityDate := CalcDate('1Y', AccPeriod."Starting Date") - 1;
        end;
    end;

    var
        Codefactory: Codeunit "Code Factory";

}

