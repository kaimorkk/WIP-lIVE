Table 52193869 "Employee Leave Plan Header1"
{
    DrillDownPageID = "Employee Leave Plan List";
    LookupPageID = "Employee Leave Plan List";

    fields
    {
        field(1;"Employee No";Code[30])
        {

            trigger OnValidate()
            begin
                
                if emp.Get("Employee No") then
                  begin
                  "Employee Name":=Format(emp.Title)+' '+emp."First Name"+' '+emp."Middle Name"+''+emp."Last Name";
                  "Date Of Joining Company":=emp."Date Of Join";
                  "Department Code":=emp."Global Dimension 2 Code";
                
                    DimVal.Reset;
                    if DimVal.Get('DEPARTMENT',"Department Code") then
                     "Department Name":=DimVal.Name;
                
                  "Directorate Code":=emp."Global Dimension 1 Code";
                
                    DimVal.Reset;
                    if DimVal.Get('DIRECTORATE',"Directorate Code") then
                     "Directorate Name":=DimVal.Name;
                
                  Designation:=emp.Position;
                  "Contract Type":=emp."Contract Type";
                /*
                    LeaveTypes.RESET;
                    LeaveTypes.SETRANGE(LeaveTypes."Annual Leave",TRUE);
                    IF LeaveTypes.FIND('-') THEN
                    "Leave Code":=LeaveTypes.Code;
                   */
                  end;

            end;
        }
        field(2;"Employee Name";Text[40])
        {
        }
        field(3;"Leave Code";Code[20])
        {
            TableRelation = "Leave Types1" where ("Annual Leave"=const(true));

            trigger OnValidate()
            begin
                LeaveTypes.Reset;
                if LeaveTypes.Get("Leave Code") then
                begin
                if LeaveTypes.Gender=LeaveTypes.Gender::Female then
                if emp.Gender=emp.Gender::Male then
                Error('%1 can only be assigned to %2 employees',LeaveTypes.Description,LeaveTypes.Gender);
                
                if LeaveTypes.Gender=LeaveTypes.Gender::Male then
                if emp.Gender=emp.Gender::Female then
                Error('%1 can only be assigned to %2 employees',LeaveTypes.Description,LeaveTypes.Gender);
                 /*
                 CALCFIELDS("Total Leave Days Taken","Recalled Days","Off Days");
                 "Leave balance":="Leave Entitlment"+"Recalled Days"+"Off Days"-"Total Leave Days Taken";
                 IF "Days Applied">"Leave balance" THEN
                 ERROR('The days applied for are more than your leave balance');
                
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
                
                END;
                 */
                
                if "Date Of Joining Company" < "Fiscal Start Date" then
                 begin
                
                  "Leave Entitlement":=LeaveTypes.Days;
                  Message('Yearly ent. %1',LeaveTypes.Days);
                
                 end
                 else
                
                if "Date Of Joining Company">"Fiscal Start Date" then
                 begin
                
                  if "Date Of Joining Company"<>0D then
                  begin
                    NoofMonthsWorked:=0;
                    Nextmonth:="Date Of Joining Company";
                  repeat
                    Nextmonth:=CalcDate('1M',Nextmonth);
                    NoofMonthsWorked:=NoofMonthsWorked+1;
                  until Nextmonth>=Today;
                    NoofMonthsWorked:=NoofMonthsWorked-1;
                //"No. of Months Worked":=NoofMonthsWorked;
                
                  if LeaveTypes.Get("Leave Code") then
                    "Leave Earned to Date":=ROUND(((LeaveTypes.Days/12)*NoofMonthsWorked),1);
                    "Leave Entitlement":="Leave Earned to Date";
                //MESSAGE('Leave earned ent. %1',"Leave Earned to Date");
                
                    //VALIDATE("Leave Code");
                  end;
                 end;
                
                end;
                
                
                
                if EmpLeave.Get("Employee No","Leave Code","Maturity Date") then
                begin
                if "Leave Earned to Date"=0 then  begin
                "Leave Entitlement":=EmpLeave.Entitlement+EmpLeave."Balance Brought Forward";
                //MESSAGE('EmpLeave ent. %1',"Leave Earned to Date")
                end
                else begin
                "Leave Entitlement":="Leave Earned to Date";
                //MESSAGE('Leave earned ent. %1',"Leave Earned to Date");
                end;
                
                // ERROR('The days applied for are more than your leave balance');
                
                end;
                "Leave Balance":="Leave Entitlement"-"Days in Plan";

            end;
        }
        field(4;"Leave Balance";Decimal)
        {
        }
        field(7;"Fiscal Start Date";Date)
        {
        }
        field(8;"Maturity Date";Date)
        {
        }
        field(10;"User ID";Code[30])
        {
        }
        field(11;"Department Code";Code[30])
        {
        }
        field(12;"Leave Entitlement";Decimal)
        {
        }
        field(13;"Date Of Joining Company";Date)
        {
        }
        field(14;"Application Date";Date)
        {
        }
        field(15;"Application No";Code[30])
        {
        }
        field(16;Status;Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected;
        }
        field(17;"No. series";Code[20])
        {
        }
        field(18;"Days in Plan";Decimal)
        {
            CalcFormula = sum("Employee Leave Plan1"."Days Applied" where ("Application No"=field("Application No"),
                                                                           "Employee No"=field("Employee No")));
            FieldClass = FlowField;
        }
        field(19;"Leave Earned to Date";Decimal)
        {
        }
        field(20;"Contract Type";Code[20])
        {
        }
        field(21;Designation;Code[10])
        {
        }
        field(22;"Recalled Days";Decimal)
        {
        }
        field(23;"Off Days";Decimal)
        {
        }
        field(24;"Total Leave Days";Decimal)
        {
        }
        field(25;"Directorate Code";Code[30])
        {
        }
        field(26;"Department Name";Text[50])
        {
        }
        field(27;"Directorate Name";Text[50])
        {
        }
        field(28;"No. of Approvals";Integer)
        {
            CalcFormula = count("Approval Entry" where ("Table ID"=const(51511194),
                                                        "Document No."=field("Application No")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Application No","Maturity Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Status<>Status::Open then
        Error('You cannot delete a document that is already approved or pending approval');
    end;

    trigger OnInsert()
    begin
        
        if "Application No" = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField("Leave Plan Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Leave Plan Nos",xRec."No. series",0D,"Application No","No. series");
        end;
        
        
        "Application Date":=Today;
        FindMaturityDate;
        "Maturity Date":=MaturityDate;
        "Fiscal Start Date":=FiscalStart;
        
        if UserSetup.Get(UserId) then
        begin
         "Employee No":=UserSetup."Employee No.";
         Validate("Employee No");
         "User ID":=UserId;
        end;
        /*
        PlanHeader.RESET;
        PlanHeader.SETRANGE(PlanHeader."Employee No","Employee No");
        PlanHeader.SETRANGE(PlanHeader."Fiscal Start Date","Fiscal Start Date");
        PlanHeader.SETRANGE(PlanHeader."Maturity Date","Maturity Date");
        IF PlanHeader.FIND('+') THEN
        ERROR('You have already forwarded your leave plan for the current year');
        */

    end;

    trigger OnModify()
    begin
        //IF (Status=Status::Released) OR (Status=Status::"Pending Approval") THEN
        //ERROR('You cannot modify a document that is already approved or is pending approval');
    end;

    var
        MaturityDate: Date;
        FiscalStart: Date;
        UserSetup: Record "User Setup";
        emp: Record Employee;
        LeaveTypes: Record "Leave Types1";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PlanHeader: Record "Employee Leave Plan Header1";
        EmpLeave: Record "Employee Leaves1";
        NoofMonthsWorked: Integer;
        Nextmonth: Date;
        DimVal: Record "Dimension Value";


    procedure FindMaturityDate()
    var
        AccPeriod: Record "Accounting Period";
    begin

        AccPeriod.Reset;
        AccPeriod.SetRange(AccPeriod."Starting Date",0D,Today);
        AccPeriod.SetRange(AccPeriod."New Fiscal Year",true);
        if AccPeriod.Find('+') then
        begin
        FiscalStart:=AccPeriod."Starting Date";
        MaturityDate:=CalcDate('1Y',AccPeriod."Starting Date")-1;
        end;
    end;
}

