table 52194114 "HR Leave Allocation Request"
{
    DrillDownPageID = "HR Leave Requisition List";
    LookupPageID = "HR Leave Requisition List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; Date; Date)
        {
        }
        field(3; "Employee No"; Code[20])
        {
            TableRelation = "Employee"."No.";

            trigger OnValidate()
            begin

                if Emp.Get("Employee No") then begin
                    Emp.CalcFields(Emp."Leave Outstanding Bal");
                    "Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    "Leave Balance" := Emp."Leave Outstanding Bal";
                    "Department Code" := Emp."Department Code";
                    "Global Dimension 1 Code" := Emp."Global Dimension 1 Code";
                end;
                EmpLeaveApps.Reset;
                EmpLeaveApps.SetRange(EmpLeaveApps."Employee No", "Employee No");
                // EmpLeaveApps.SETFILTER(EmpLeaveApps.Status,'<>%1',EmpLeaveApps.Status::Released);
                EmpLeaveApps.SetFilter(EmpLeaveApps.Status, '=%1', EmpLeaveApps.Status::Open);
                //if EmpLeaveApps.Count > 0 then Error('Please note that you already have a pending leave application');
            end;
        }
        field(4; "Employee Name"; Text[100])
        {
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(6; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(7; "Applied Days"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin

                CalcFields("Availlable Days");
                //IF "Leave Type"='ANNUAL' THEN BEGIN
                if (("Availlable Days" = 0) or ("Applied Days" > "Availlable Days")) then begin
                    Error('Applied days must not be more than leave balance.');
                end;
                //END;
                if ("Applied Days" <> 0) and ("Starting Date" <> 0D) then begin
                    "End Date" := CalcEndDate("Starting Date", "Applied Days");
                    "Return Date" := CalcReturnDate("End Date");
                    Validate("Starting Date")
                end;
            end;
        }
        field(8; "Starting Date"; Date)
        {

            trigger OnValidate()
            begin
                dates.Reset;
                dates.SetRange(dates."Period Start", "Starting Date");
                dates.SetFilter(dates."Period Type", '=%1', dates."period type"::Date);
                if dates.Find('-') then
                    if ((dates."Period Name" = 'Sunday') or (dates."Period Name" = 'Saturday')) then begin
                        if (dates."Period Name" = 'Sunday') then
                            Error('You can not start your leave on a Sunday')
                        else
                            if (dates."Period Name" = 'Saturday') then Error('You can not start your leave on a Saturday')
                    end;

                // Check if the start date is a holliday
                //BaseCalendar.RESET;
                //BaseCalendar.SETRANGE(BaseCalendar.Date,"Starting Date");
                //BaseCalendar.SETFILTER(BaseCalendar."Recurring System",'=%1',BaseCalendar."Recurring System"::"Annual Recurring");
                //I/F BaseCalendar.FIND('-') THEN BEGIN
                //IF BaseCalendar.Description<>'' THEN
                // ERROR('You can not start your Leave on a Holiday - '''+BaseCalendar.Description+'''')
                // ELSE ERROR('You can not start your Leave on a Holiday');
                //END;
                // For one of Hollidays Like Isther
                BaseCalendar.Reset;
                BaseCalendar.SetFilter(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar");
                BaseCalendar.SetRange(BaseCalendar.Date, "Starting Date");
                if BaseCalendar.Find('-') then begin
                    repeat
                        if BaseCalendar.Nonworking = true then begin
                            if BaseCalendar.Description <> '' then
                                Error('You can not start your Leave on a Holiday - ''' + BaseCalendar.Description + '''')
                            else
                                Error('You can not start your Leave on a Holiday');
                        end;
                    until BaseCalendar.Next = 0;
                end;

                // For Annual Holidays
                BaseCalendar.Reset;
                BaseCalendar.SetFilter(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar");
                BaseCalendar.SetRange(BaseCalendar."Recurring System", BaseCalendar."recurring system"::"Annual Recurring");
                if BaseCalendar.Find('-') then begin
                    repeat
                        if ((Date2dmy("Starting Date", 1) = BaseCalendar."Day") and (Date2dmy("Starting Date", 2) = Date2dmy(BaseCalendar."Date", 2))) then begin
                            if BaseCalendar.Nonworking = true then begin
                                if BaseCalendar.Description <> '' then
                                    Error('You can not start your Leave on a Holiday - ''' + BaseCalendar.Description + '''')
                                else
                                    Error('You can not start your Leave on a Holiday');
                            end;
                        end;
                    until BaseCalendar.Next = 0;
                end;


                if ("Applied Days" <> 0) and ("Starting Date" <> 0D) then begin
                    "End Date" := CalcEndDate("Starting Date", "Applied Days");
                    "Return Date" := CalcReturnDate("End Date");
                    //"Approved End Date":="End Date";

                end;
            end;
        }
        field(9; "End Date"; Date)
        {
        }
        field(10; Purpose; Text[200])
        {
        }
        field(11; "Leave Type"; Code[20])
        {
            TableRelation = "HR Leave Types".Code;

            trigger OnValidate()
            begin
                // CalcFields("Availlable Days");
                // if Emp.Get("Employee No") then begin
                //     Emp.CalcFields(Emp."Leave Balance");
                //     "Leave Balance" := Emp."Leave Balance";
                // end;
            end;
        }
        field(12; "Leave Balance"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Approved,Pending Approval,Pending Prepayment,Cancelled,Posted';
            OptionMembers = Open,Approved,"Pending Approval","Pending Prepayment",Cancelled,Posted;

            trigger OnValidate()
            var
                CurrCalender: Record "HR Leave Periods";
                // HRWebportal: Codeunit HRPortal;
                msg: Text;
                LvJornal: Record "Hr Leave Ledger Entries";
                /// PostLeave: Codeunit "HR Post Leave Journal Ent.";
                UserSetup: Record "User Setup";
                leaveCal: Record "HR Leave Periods";
                LeavAllc: Record "HR Journal Line";
                Ledger: Record "HR Leave Ledger Entries";
                Ledger2: Record "HR Leave Ledger Entries";

                Periods: Record "HR Leave Periods";
            begin


                if Status = Status::Approved then begin
                    if HREmp.Get("Employee No") then begin
                        msg := 'Dear Sir/Madam,<br /><br />';
                        msg := msg + 'Your ' + Format("Application Type") + ' application has been approved.<br /><br />';
                        msg := msg + 'Details:<br /><br />';
                        msg := msg + 'Type of Leave: ' + "Leave Type" + '<br /><br />';
                        // msg := msg + 'Start Date: ' + Format("Starting Date") + '<br /><br />';
                        // msg := msg + 'End Date: ' + Format("End Date") + '<br /><br />';
                        //  msg := msg + 'Return Date: ' + Format("Return Date") + '<br /><br />';
                        msg := msg + 'No of Days: ' + Format("Days Approved") + '<br /><br />';
                        // HRWebportal.SendEmail(HREmp."Company E-Mail", 'Approved ' + Format("Application Type") + ' : ' + "No." + ' (Document Number)', msg);
                    end;
                    HREmp.Reset;
                    HREmp.Get("Employee No");

                    //Post Leave
                    /*  HRLeaveAlloc.Reset;
                     HRLeaveAlloc."Entry No." := fn_LastLineNo; */

                    //CurrCalender.Reset;
                    // CurrCalender.SetRange(Current, true);
                    //if CurrCalender.FindFirst() then begin
                    //   if CurrCalender.Count > 1 then Error('No active calendar exists', CurrCalender.Count);
                    /* HRLeaveAlloc."Calendar Code" := CurrCalender.Code;

                    HRLeaveAlloc."No." := HREmp."No.";
                    HRLeaveAlloc."Staff Name" := HREmp."Full Name";

                    HRLeaveAlloc."Posting Date" := Today;

                    HRLeaveAlloc."Entry Type" := HRLeaveAlloc."entry type"::"Positive Adjustment";
                    if "Application Type" = "Application Type"::"Carry Forward" then
                        HRLeaveAlloc."Posting Type" := HRLeaveAlloc."posting type"::"Carry Forward"
                    else
                        if "Application Type" = "Application Type"::"Re-Imbursement" then
                            HRLeaveAlloc."Posting Type" := HRLeaveAlloc."posting type"::Reimbursement
                        else
                            HRLeaveAlloc."Posting Type" := HRLeaveAlloc."posting type"::Normal;
                    HRLeaveAlloc."No. Of days" := ("Days Approved");
                    HRLeaveAlloc."Leave Type" := "Leave Type";

                    HRLeaveAlloc."Posting Description" := Format("Application Type") + ' - ' + Format("No.");
                    HRLeaveAlloc."Posted By" := UserId;

                    HRLeaveAlloc.Posted := true;

                    HRLeaveAlloc."Calendar Start Date" := CurrCalender."Start Date";
                    HRLeaveAlloc."Calendar End Date" := CurrCalender."End Date";
                    HRLeaveAlloc."Document No." := "No.";
                    HRLeaveAlloc."Posting Source" := HRLeaveAlloc."posting source"::Document;

                    //Application Date
                    HRLeaveAlloc."Application Start Date" := "Starting Date";
                    HRLeaveAlloc."Application End Date" := "End Date";
                    HRLeaveAlloc."Application Return Date" := "Return Date";

                    HRLeaveAlloc.Insert; */
                    //Now change status of document to posted
                    /*  Status := Status::Posted;
                     Posted := true;
                     "Posted By" := userid; */
                    // "Date Posted" := today;
                    //"Time Posted" := time;
                    //  Modify;
                    //fn_PostLeaveApplication("No.");

                    // leaveCal.Reset();
                    // // leaveCal.SetRange(Current, true);
                    // if leaveCal.Find('-') then
                    //     LeavAllc.Init();
                    // if hrSetup.Get() then
                    //     Evaluate(LeavAllc."Leave Period", hrSetup."Base Calender Code");
                    //LeavAllc."Staff No." := "Employee No";
                    //LeavAllc."Staff Name" := "Employee Name";
                    //LeavAllc."Posting Date" := Today;
                    //LeavAllc."Leave Entry Type" := LeavAllc."Leave Entry Type"::"Negative";
                    // LeavAllc."Posting Type" := LeavAllc."Posting Type"::Normal;

                    //LeavAllc."Leave Entry Type" := LeavAllc."Leave entry type"::Positive;
                    // if "Application Type" = "Application Type"::"Carry Forward" then
                    //     LeavAllc."Posting Type" := LeavAllc."posting type"::"Carry Forward"
                    // else
                    //     if "Application Type" = "Application Type"::"Re-Imbursement" then
                    //         LeavAllc."Posting Type" := LeavAllc."posting type"::Reimbursement
                    //     else
                    //         LeavAllc."Posting Type" := LeavAllc."posting type"::Normal;
                    // LeavAllc."No. Of days" := "Days Approved";
                    // LeavAllc."Description" := Format("Application Type") + ' - ' + Format("No.");
                    // //LeavAllc."Global Dimension 1 Code" := "Global Dimension 1 Code";
                    // //LeavAllc."Global Dimension 2 Code" := Department;
                    // // LeavAllc."Posted By" := UserId;
                    // LeavAllc."Leave Type" := "Leave Type";
                    // // LeavAllc.Posted := true;
                    // LeavAllc."Leave Start Date" := "Starting Date";
                    // LeavAllc."Leave Period End Date" := "End Date";
                    // //LeavAllc."Application Return Date" := "Return Date";
                    // LeavAllc."Leave Period Start Date" := leaveCal."Starts";
                    // LeavAllc."Leave Period End Date" := leaveCal."Ends";
                    // LeavAllc."Document No." := "No.";
                    // //LeavAllc."Posting Source" := LeavAllc."Posting Source"::Document;
                    // // LeavAllc."Posted By" := UserId;
                    // // LeavAllc.Posted := true;
                    // //  LeavAllc.Closed := false;
                    // LeavAllc.Insert();

                    // LeavAllc.Reset();
                    // LeavAllc.SetRange(LeavAllc."Document No.", "No.");
                    // LeavAllc.SetRange(LeavAllc."Staff No.", "Employee No");
                    // //LeavAllc.SetRange(LeavAllc."Leave Period", hrSetup."Base Calender Code");
                    // if LeavAllc.Find('-') then
                    //     Codeunit.Run(Codeunit::"HR Leave Jnl.-Post", LeavAllc);
                    // //PostLeave.PostLeaveAllocation(LeavAllc."Line No.", LeavAllc."Staff No.", LeavAllc."Leave Type", LeavAllc."Leave Period");
                    // Status := Status::Posted;
                    // Posted := true;
                    // "Posted By" := UserId;
                    //Modify();

                    if Rec.Posted then Error('The document has already been posted');
                    userSetup.Get(UserId);
                    if userSetup.Leave = false then Error('You do not have permission to post leave days');
                    if not Confirm('Do you ant to post leave number ' + Rec."No.") then Error('Process Aborted');


                    Ledger2.FindLast();
                    Periods.Reset();
                    Periods.SetRange(Closed, false);
                    Periods.FindFirst();

                    Ledger.Init();
                    Ledger."Entry No." := Ledger2."Entry No." + 1;
                    Ledger."Document No." := Rec."No.";
                    Ledger."Leave Type" := Rec."Leave Type";
                    Ledger.Closed := false;
                    Ledger."Staff No." := Rec."Employee No";
                    Ledger."Staff Name" := Rec."Employee Name";
                    Ledger."No. of days1" := Rec."Applied Days";
                    Ledger."Leave Posting Description" := Format(Rec."Application Type") + ' - ' + Format(Rec."No.");
                    Ledger."Leave Entry Type" := Ledger."Leave Entry Type"::Reimbursement;
                    Ledger."Posting Date" := Today;
                    Ledger.Posted := true;
                    Ledger."Leave Period" := format(Periods.Code);
                    Ledger."Leave Start Date" := Periods.Starts;
                    Ledger."Leave End Date" := Periods.Ends;
                    Ledger.Insert();
                    Rec.Posted := true;
                    Rec.Modify();



                    // end;

                end;
                //


            end;
        }
        field(15; "User ID"; Code[50])
        {
        }
        field(16; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center".Code;

            trigger OnValidate()
            begin

                TestField(Status, Status::Open);
                //  if not UserMgt.CheckRespCenter(1, "Responsibility Center") then
                //     Error(
                //       Text001,
                //        RespCenter.TableCaption, UserMgt.GetPurchasesFilter);
                /*
               "Location Code" := UserMgt.GetLocation(1,'',"Responsibility Center");
               IF "Location Code" = '' THEN BEGIN
                 IF InvtSetup.GET THEN
                   "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
               END ELSE BEGIN
                 IF Location.GET("Location Code") THEN;
                 "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
               END;

               UpdateShipToAddress;
                  */
                /*
             CreateDim(
               DATABASE::"Responsibility Center","Responsibility Center",
               DATABASE::Vendor,"Pay-to Vendor No.",
               DATABASE::"Salesperson/Purchaser","Purchaser Code",
               DATABASE::Campaign,"Campaign No.");

             IF xRec."Responsibility Center" <> "Responsibility Center" THEN BEGIN
               RecreatePurchLines(FIELDCAPTION("Responsibility Center"));
               "Assigned User ID" := '';
             END;
               */

            end;
        }
        field(17; Posted; Boolean)
        {
        }
        field(18; "Posted By"; Code[50])
        {
        }
        field(19; "Posting Date"; Date)
        {
        }
        field(20; "Process Leave Allowance"; Boolean)
        {
        }
        field(21; "Availlable Days"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("Employee No"),
                                                                     "Leave Type" = field("Leave Type")));


        }
        field(22; "Return Date"; Date)
        {
        }
        field(23; "Reliever No."; Code[30])
        {
            TableRelation = "Employee"."No.";

            trigger OnValidate()
            begin
                if Emp3.Get("Reliever No.") then
                    "Reliever Name" := Emp3."First Name" + ' ' + Emp3."Middle Name" + ' ' + Emp3."Last Name";
            end;
        }
        field(24; "Reliever Name"; Text[250])
        {
        }
        field(25; "Employee Dept"; Code[20])
        {
            CalcFormula = lookup("Employee"."Department Code" where("No." = field("Employee No")));
            FieldClass = FlowField;
        }
        field(26; HOD; Code[50])
        {
            // CalcFormula = lookup("Dimension Value".HOD where(Code = field("Department Code")));
            // FieldClass = FlowField;
        }
        field(27; "Approver ID"; Code[50])
        {
            CalcFormula = lookup("Employee"."User ID" where("No." = field(HOD)));
            FieldClass = FlowField;
        }
        field(28; "Application Type"; Option)
        {
            OptionMembers = Normal,"Re-Imbursement","Time Off","Paternity","Maternity","Carry Forward";
        }
        field(29; "Adjustment Type"; Option)
        {
            OptionMembers = ,"Positive Adjustment","Negative Adjustment";

        }
        field(30; "Days Approved"; Decimal)
        {
        }
        field(31; "Approvers Comments"; Text[500])
        {

        }
        field(32; "Leave Number"; code[20])
        {
            TableRelation = "HR Leave Application" where("Employee No" = field("Employee No"), Status = filter(Released));
        }
        field(33; "Time Off Start"; Time)
        {

        }
        field(34; "Time Off End"; Time)
        {

        }
        field(35; "Duty Station"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Duty Station";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        // IF Status<>Status::Open THEN ERROR('You can only delete a document if its status is still Open!')
    end;

    trigger OnInsert()
    begin

        if "No." = '' then begin
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField(GenLedgerSetup."Leave Application Nos.");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Leave Application Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        "User ID" := UserId;
        Date := Today;
        Status := Status::Open;

        // if usersetup.Get(UserId) then begin
        //     if usersetup."Employee No." = '' then
        //         Error('You are not authorized to use the leave application page. Please consult the system administrator.');
        //     if Employee.Get(CopyStr(usersetup."Employee No.", 4, ((StrLen(usersetup."Employee No.")) - 3))) then begin
        //         "Employee No" := Employee."No.";
        //         Validate("Employee No");
        //         "Global Dimension 1 Code" := usersetup."Global Dimension 1 Code";
        //         "Department Code" := usersetup."Global Dimension 2 Code";
        //         Date := Today;
        //     end;
        // end;
    end;

    var
        lastNo: Integer;
        GenLedgerSetup: Record "Human Resources Setup";
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Management";
        Dimval: Record "Dimension Value";
        Text001: label 'Your identification is set up to process from %1 %2 only.';
        Emp3: Record "Employee";
        Emp: Record "Employee";
        "Employee Leaves": Record "HR Leave Allocation Request";
        BaseCalendar: Record "Base Calendar Change";
        CurDate: Date;
        LeaveTypes: Record "HR Leave Types";
        DayApp: Decimal;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EndDate: Date;
        BeginDate: Date;
        NextDate: Date;
        varDaysApplied: Integer;
        fDays: Integer;
        ReturnDateLoop: Boolean;
        Employee: Record "Employee";
        fEmpNo: Code[30];
        EmpLeaveApps: Record "HR Leave Allocation Request";
        GeneralOptions: Record "Human Resources Setup";
        "HR Set Up": Record "Human Resources Setup";
        Levels: Integer;
        LEmployee: Record "Employee";
        CurrYear: Integer;
        CYSDate: Date;
        CYEDate: Date;
        CurrYearValue: Integer;
        Number: Integer;
        SMTP: Codeunit "Email Message";
        SendEmail: codeunit email;
        Names: Text[100];
        objPeriod: Record "HR Leave Periods";
        PayPeriod: Date;
        CurrYearValue2: Integer;
        // prCodes: Record "EarningsX";
        //prTrans: Record "pr Period Transactions";
        Payroll: Record "Employee";
        Grd: Code[20];
        hrSetup: Record "Human Resources Setup";
        mContent: Text[100];
        mSubject: Text[100];
        nonworking: Decimal;
        CurrDate: Date;
        NONWORKINDAYS: Integer;
        Users2: Record User;
        usersetup: Record "User Setup";
        leaveLedgers: Record "HR Leave Ledger Entries";
        dates: Record Date;
        HRLeaveAlloc: Record "HR Journal Line";
        HRLeaveCal: Record "HR Leave Periods";
        HREmp: Record "Employee";
        HRLeaveTypes: Record "HR Leave Types";

    procedure DetermineIfIsNonWorking(var bcDate: Date; var ltype: Record "HR Leave Types") ItsNonWorking: Boolean
    var
        dates: Record Date;
    begin
        Clear(ItsNonWorking);
        GeneralOptions.Find('-');
        //One off Hollidays like Good Friday
        BaseCalendar.Reset;
        BaseCalendar.SetFilter(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar");
        BaseCalendar.SetRange(BaseCalendar.Date, bcDate);
        if BaseCalendar.Find('-') then begin
            if BaseCalendar.Nonworking = true then
                ItsNonWorking := true;
        end;

        // For Annual Holidays
        BaseCalendar.Reset;
        BaseCalendar.SetFilter(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar");
        BaseCalendar.SetRange(BaseCalendar."Recurring System", BaseCalendar."recurring system"::"Annual Recurring");
        if BaseCalendar.Find('-') then begin
            repeat
                if ((Date2dmy(bcDate, 1) = Date2dmy(BaseCalendar."Date", 1)) and (Date2dmy(bcDate, 2) = Date2dmy(BaseCalendar."Date", 2))) then begin
                    if BaseCalendar.Nonworking = true then
                        ItsNonWorking := true;
                end;
            until BaseCalendar.Next = 0;
        end;

        if ItsNonWorking = false then begin
            // Check if its a weekend
            dates.Reset;
            dates.SetRange(dates."Period Type", dates."period type"::Date);
            dates.SetRange(dates."Period Start", bcDate);
            if dates.Find('-') then begin
                //if date is a sunday
                if dates."Period Name" = 'Sunday' then begin
                    //check if Leave includes sunday
                    if ltype."Inclusive of Sunday" = false then ItsNonWorking := true;
                end else
                    if dates."Period Name" = 'Saturday' then begin
                        //check if Leave includes sato
                        if ltype."Inclusive of Saturday" = false then ItsNonWorking := true;
                    end;
            end;
        end;
    end;

    procedure DetermineIfIncludesNonWorking(var fLeaveCode: Code[20]): Boolean
    begin
        if LeaveTypes.Get(fLeaveCode) then begin
            if LeaveTypes."Inclusive of Holidays" = true then
                exit(true);
        end;
    end;

    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    var
        ltype: Record "HR Leave Types";
    begin
        ltype.Reset;
        if ltype.Get("Leave Type") then begin
        end;
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
            if DetermineIfIncludesNonWorking("Leave Type") = false then begin
                fReturnDate := CalcDate('1D', fReturnDate);
                if DetermineIfIsNonWorking(fReturnDate, ltype) then begin
                    varDaysApplied := varDaysApplied + 1;
                end else
                    varDaysApplied := varDaysApplied;
                varDaysApplied := varDaysApplied + 1
            end
            else begin
                fReturnDate := CalcDate('1D', fReturnDate);
                varDaysApplied := varDaysApplied - 1;
            end;
        until varDaysApplied = 0;
        exit(fReturnDate);
    end;

    procedure DeterminethisLeaveEndDate(var fDate: Date) fEndDate: Date
    var
        ltype: Record "HR Leave Types";
    begin
        if ltype.Get("Leave Type") then begin
        end;
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('1D', fEndDate);
            while (ReturnDateLoop) do begin
                if DetermineIfIsNonWorking(fEndDate, ltype) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
            end
        end;
        exit(fEndDate);
    end;

    procedure GetPayPeriod()
    begin
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        // if objPeriod.Find('-') then
        //PayPeriod := objPeriod."Date Opened";
    end;

    procedure CalcEndDate(SDate: Date; LDays: Integer) LEndDate: Date
    var
        EndLeave: Boolean;
        DayCount: Integer;
        ltype: Record "HR Leave Types";
    begin
        ltype.Reset;
        if ltype.Get("Leave Type") then begin
        end;
        SDate := SDate - 1;
        if not DetermineIfIsNonWorking(SDate, ltype) then begin
            DayCount := 1;
            SDate := SDate + 1;
        end
        else
            DayCount := 1;

        EndLeave := false;
        while EndLeave = false do begin
            if not DetermineIfIsNonWorking(SDate, ltype) then
                DayCount := DayCount + 1;
            SDate := SDate + 1;
            if DayCount > LDays then
                EndLeave := true;
        end;
        LEndDate := SDate - 1;

        while DetermineIfIsNonWorking(LEndDate, ltype) = true do begin
            LEndDate := LEndDate + 1;
        end;
    end;

    procedure CalcReturnDate(EndDate: Date) RDate: Date
    var

        EndLeave: Boolean;
        DayCount: Integer;
        LEndDate: Date;
        ltype: Record "HR Leave Types";
    begin
        if ltype.Get("Leave Type") then begin
        end;
        /*  EndLeave:=FALSE;
         EndDate:=EndDate+1;
         LEndDate:=EndDate;
         CLEAR(DayCount);
         WHILE EndLeave=FALSE DO BEGIN
         IF NOT DetermineIfIsNonWorking(EndDate,ltype) THEN BEGIN
         DayCount:=DayCount+1;
         EndDate:=EndDate+1;

         END ELSE BEGIN
         EndLeave:=TRUE;
         END;
         END;
           */
        RDate := EndDate + 1;
        while DetermineIfIsNonWorking(RDate, ltype) = true do begin
            RDate := RDate + 1;
        end;

    end;

    procedure GetDate(var Applied_Dayes: Integer; var Start_Date: Date)
    var
        DaysCount: Integer;
        NewDate: Date;
        Last_is_WotkingDay: Boolean;
    begin
        /*clear(DaysCount);
        clear(NewDate);
         NewDate:=Start_Date;
        repeat
        DaysCount:=DaysCount+1;
        Last_is_WotkingDay:=false;
        
        until (() AND ()) */

    end;

    procedure ItsHolliday(var Start_Date: Date) holliday: Boolean
    var
        baseCal: Record "Base Calendar Change";
        days: Integer;
        Months: Integer;
        bool_Non_Working: Boolean;
    begin
        Clear(days);
        Clear(Months);
        Clear(bool_Non_Working);
        days := Date2dmy(Start_Date, 1);
        Months := Date2dmy(Start_Date, 2);
        baseCal.Reset;
        baseCal.SetFilter(baseCal."Recurring System", '=%1', baseCal."recurring system"::"Annual Recurring");
        if baseCal.Find('-') then begin
            repeat
                if ((Months = Date2dmy(baseCal.Date, 1)) and (days = Date2dmy(baseCal.Date, 1))) then bool_Non_Working := true;
            until ((((Months = Date2dmy(baseCal.Date, 1)) and (days = Date2dmy(baseCal.Date, 1)))) or (baseCal.Next = 0))
        end;
    end;

    procedure ItsSunday(var Start_Date: Date; var LeaveType: Integer)
    var
        leave_types: Record "HR Leave Types";
        dates: Record Date;
    begin
    end;

    procedure fn_PostLeaveApplication(LeaveDocNo: Code[20])
    var
        HRLeaveAppToPost: Record "HR Leave Application";
    // HRFunctions: Codeunit "HR Codeunit";
    // CurrCalender: Record "HR Leave Calendar";
    begin

        //Get Leave Details
        HRLeaveAppToPost.Reset;
        HRLeaveAppToPost.SetRange("Application Code", LeaveDocNo);
        if HRLeaveAppToPost.FindSet(true, false) then begin

            // if HRLeaveAppToPost.Status = HRLeaveAppToPost.Status::Posted then Error('Document no [ %1 ] has already been posted');
            //Staff Details
            HREmp.Reset;
            // HREmp.Get(HRLeaveAppToPost."Employee No.");

            //Post Leave
            HRLeaveAlloc.Reset;
            //  HRLeaveAlloc."Entry No." := fn_LastLineNo;

            // CurrCalender.Reset;
            // CurrCalender.SetRange(Current, true);
            // if CurrCalender.FindFirst() then begin
            //     if CurrCalender.Count > 1 then Error('No active calendar exists', CurrCalender.Count);
            //     HRLeaveAlloc."Calendar Code" := CurrCalender.Code;
            // end;
            // HRLeaveAlloc."No." := HREmp."No.";
            // HRLeaveAlloc."Staff Name" := HREmp."Full Name";

            // HRLeaveAlloc."Posting Date" := Today;

            // HRLeaveAlloc."Entry Type" := HRLeaveAlloc."entry type"::"Negative Adjustment";
            // HRLeaveAlloc."Posting Type" := HRLeaveAlloc."posting type"::Normal;

            // HRLeaveAlloc."No. Of days" := (HRLeaveAppToPost."Days Applied") * -1;
            // HRLeaveAlloc."Leave Type" := HRLeaveAppToPost."Leave Type";

            // HRLeaveAlloc."Posting Description" := Format(HRLeaveAlloc."Entry Type") + ' Allocation - ' + Format(Today);
            // HRLeaveAlloc."Posted By" := UserId;

            // HRLeaveAlloc.Posted := true;

            // HRLeaveAlloc."Calendar Start Date" := 20200101D;
            // HRLeaveAlloc."Calendar End Date" := 20200101D;
            // HRLeaveAlloc."Document No." := HRLeaveAppToPost."Application Code";
            // HRLeaveAlloc."Posting Source" := HRLeaveAlloc."posting source"::Document;

            // //Application Date
            // HRLeaveAlloc."Application Start Date" := HRLeaveAppToPost."Start Date";
            // HRLeaveAlloc."Application End Date" := HRLeaveAppToPost."End Date";
            // HRLeaveAlloc."Application Return Date" := HRLeaveAppToPost."Return Date";

            // HRLeaveAlloc.Insert;
            // //Now change status of document to posted
            // HRLeaveAppToPost.Status := HRLeaveAppToPost.Status::Posted;
            // HRLeaveAppToPost.Posted := true;
            // HRLeaveAppToPost."Posted By" := userid;
            // HRLeaveAppToPost."Date Posted" := today;
            // HRLeaveAppToPost."Time Posted" := time;
            // HRLeaveAppToPost.Modify;
        end;
    end;

    local procedure fn_LastLineNo(): Integer
    var
        HRLeaveAllocation_2: Record "HR Journal Line";
    begin
        HRLeaveAllocation_2.Reset;
        if HRLeaveAllocation_2.Find('+') then begin
            exit(HRLeaveAllocation_2."Line No." + 1);
        end else begin
            exit(1);
        end;
    end;
}



