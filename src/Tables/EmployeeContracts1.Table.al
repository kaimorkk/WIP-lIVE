Table 52193870 "Employee Contracts1"
{
    DrillDownPageID = "Employee Contracts List";
    LookupPageID = "Employee Contracts List";

    fields
    {
        field(1;"Contract No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Employee No";Code[30])
        {
            TableRelation = Employee."No." where (Status=const(Active),
                                                  "Posting Group"=const('INTERNS'));

            trigger OnValidate()
            begin
                 EmpRec.Reset;
                 if EmpRec.Get("Employee No") then begin
                  "Employee Name":=EmpRec."First Name"+' '+EmpRec."Middle Name"+' '+EmpRec."Last Name";

                 EmpContracts.Reset;
                 EmpContracts.SetRange(EmpContracts."Employee No","Employee No");
                 //EmpContracts.SETRANGE();
                 if EmpContracts.Find('+') then
                   "Contract No":=EmpContracts."Contract No"+1
                 else
                   "Contract No":=1;

                 end;
            end;
        }
        field(3;"Contract Start Date";Date)
        {

            trigger OnValidate()
            begin
                  //Calculate balance brought forward from previous contract period
                //  VALIDATE("Contract Start Date");
                   "Balance Brought Forward":=0;
                   EndDate:=CalcDate('-1D',"Contract Start Date");

                   EmpContracts.Reset;
                   EmpContracts.SetRange(EmpContracts."Employee No","Employee No");
                   EmpContracts.SetRange(EmpContracts."Contract End Date",EndDate);
                   if EmpContracts.Find('+') then begin

                   TotalDays1:=0;
                   Recalled1:=0;
                   Absent1:=0;

                     EmpLeaveApps.Reset;
                     EmpLeaveApps.SetRange(EmpLeaveApps."Employee No",EmpContracts."Employee No");
                     EmpLeaveApps.SetRange(EmpLeaveApps."Leave Code",'ANNUAL');
                     EmpLeaveApps.SetRange(EmpLeaveApps."Start Date",EmpContracts."Contract Start Date",EmpContracts."Contract End Date");
                     //EmpLeaveApps.SETRANGE(EmpLeaveApps."End Date","Contract Start Date","Contract End Date");
                     EmpLeaveApps.SetRange(EmpLeaveApps.Status,EmpLeaveApps.Status::Released);
                    // EmpLeaveApps.CALCFIELDS(EmpLeaveApps."Days Applied");
                     if EmpLeaveApps.Find('-') then begin
                     repeat
                       TotalDays1:=TotalDays1+EmpLeaveApps."Days Applied";
                     until EmpLeaveApps.Next=0;
                     end;

                     EmpOffs.Reset;
                     EmpOffs.SetRange(EmpOffs."Employee No","Employee No");
                     EmpOffs.SetRange(EmpOffs."Recalled From",EmpContracts."Contract Start Date",EmpContracts."Contract End Date");
                     // EmpOffs.SETRANGE(EmpOffs."Recalled To","Contract Start Date","Contract End Date");
                     if EmpOffs.Find('-') then begin
                     repeat
                       Recalled1:=Recalled1+EmpOffs."No. of Off Days";
                     until EmpOffs.Next=0;
                     end;

                     EmpAbsence.Reset;
                     EmpAbsence.SetRange(EmpAbsence."Employee No","Employee No");
                     EmpAbsence.SetRange(EmpAbsence."Absent From",EmpContracts."Contract Start Date",EmpContracts."Contract End Date");
                     //EmpAbsence.SETRANGE(EmpAbsence."Absent To","Contract Start Date","Contract End Date");
                     if EmpAbsence.Find('-') then begin
                     repeat
                       Absent1:=Absent1+EmpAbsence."No. of  Days Absent";
                     until EmpAbsence.Next=0;
                     end;

                   "Balance Brought Forward":=(EmpContracts."Contract Leave Entitlement"+EmpContracts."Balance Brought Forward"+Recalled1)-
                (TotalDays1+Absent1);
                   end;
                 //  MESSAGE('Start Date %1',"Contract Start Date");
            end;
        }
        field(4;"Contract End Date";Date)
        {

            trigger OnValidate()
            begin
                //Calculate leave entitlement for the contract period
                   //MESSAGE('End Date %1',"Contract End Date");
                  if ("Contract End Date"<>0D) and ("Contract Start Date"<>0D) then
                     "Contract Leave Entitlement":=ROUND((("Contract End Date"-"Contract Start Date")/30),1)*2.5;

                   TotalDays:=0;
                   Recalled:=0;
                   Absent:=0;


                //Calculate avilable Leave Balance
                   EmpLeaveApps.Reset;
                   EmpLeaveApps.SetRange(EmpLeaveApps."Employee No","Employee No");
                   EmpLeaveApps.SetRange(EmpLeaveApps."Leave Code",'ANNUAL');
                   EmpLeaveApps.SetRange(EmpLeaveApps."Start Date","Contract Start Date","Contract End Date");
                   //EmpLeaveApps.SETRANGE(EmpLeaveApps."End Date","Contract Start Date","Contract End Date");
                   EmpLeaveApps.SetRange(EmpLeaveApps.Status,EmpLeaveApps.Status::Released);
                  // EmpLeaveApps.CALCFIELDS(EmpLeaveApps."Days Applied");
                   if EmpLeaveApps.Find('-') then begin
                   repeat
                       TotalDays:=TotalDays+EmpLeaveApps."Days Applied";
                   until EmpLeaveApps.Next=0;
                    end;

                    EmpOffs.Reset;
                    EmpOffs.SetRange(EmpOffs."Employee No","Employee No");
                    EmpOffs.SetRange(EmpOffs."Recalled From","Contract Start Date","Contract End Date");
                   // EmpOffs.SETRANGE(EmpOffs."Recalled To","Contract Start Date","Contract End Date");
                    if EmpOffs.Find('-') then begin
                    repeat
                       Recalled:=Recalled+EmpOffs."No. of Off Days";
                    until EmpOffs.Next=0;
                     end;

                    EmpAbsence.Reset;
                    EmpAbsence.SetRange(EmpAbsence."Employee No","Employee No");
                    EmpAbsence.SetRange(EmpAbsence."Absent From","Contract Start Date","Contract End Date");
                    //EmpAbsence.SETRANGE(EmpAbsence."Absent To","Contract Start Date","Contract End Date");
                    if EmpAbsence.Find('-') then begin
                    repeat
                     Absent:=Absent+EmpAbsence."No. of  Days Absent";
                    until EmpAbsence.Next=0;
                    end;

                "Contract Leave Balance":=("Contract Leave Entitlement"+"Balance Brought Forward"+Recalled)-(TotalDays+Absent);
                //MESSAGE('balance=%1+%2+%3-%4-%5 to give %6',"Contract Leave Entitlement","Balance Brought Forward",
                //Recalled,TotalDays,Absent,"Contract Leave Balance");

                 if "Contract End Date"<Today then
                  begin
                   Expired:=true;
                   Status:=Status::Expired;
                   Modify;
                 end;
            end;
        }
        field(5;"Contract Period";Duration)
        {

            trigger OnValidate()
            begin
                //To calculate contract period in months
                 //VALIDATE("Contract Start Date");
                // VALIDATE("Contract Period");
                 if "Contract Start Date"<>0D then begin
                 //MESSAGE('End Date %1',"Contract End Date");
                 NoOfMonths:=0;
                 NextDate:="Contract Start Date";
                 //MESSAGE('next %1',NextDate);
                 /*
                 REPEAT
                 //IF NOT CalendarMgmt.CheckDateStatus('2011',NextDate,Description) THEN
                   NextDate:=CALCDATE('1M',NextDate);
                  // MESSAGE('next %1',NextDate);
                    NoOfMonths:=NoOfMonths+1;
                
                 UNTIL  NoOfMonths="Contract Period";
                 */
                 //UNTIL NextDate="Contract End Date";
                 "Contract End Date":=CalcDate(format("Contract Period"),NextDate);
                 end;
                
                  Validate("Contract End Date");

            end;
        }
        field(6;Expired;Boolean)
        {
        }
        field(7;"Contract Leave Entitlement";Decimal)
        {
        }
        field(8;"Balance Brought Forward";Decimal)
        {

            trigger OnValidate()
            begin
                  Validate("Employee No");
                  Validate("Contract No");
                  Validate("Contract Leave Entitlement");

                AccPeriod.Reset;
                AccPeriod.SetRange(AccPeriod."Starting Date",0D,"Contract Start Date");
                AccPeriod.SetRange(AccPeriod."New Fiscal Year",true);
                if AccPeriod.Find('+') then
                begin
                //FiscalStart:=AccPeriod."Starting Date";
                MaturityDate:=CalcDate('1Y',AccPeriod."Starting Date")-1;
                end;

                  Empleave.Init;
                  Empleave."Employee No":="Employee No";
                  Empleave."Leave Code":='ANNUAL';
                  Empleave."Maturity Date":=MaturityDate;
                  Empleave.Entitlement:="Contract Leave Entitlement";
                  Empleave."Balance Brought Forward":="Balance Brought Forward";
                  Empleave."Temp. Emp. Contract":="Contract No";
                  //IF NOT Empleave.GET(Empleave."Employee No", Empleave."Leave Code",Empleave."Maturity Date") THEN
                  Empleave.Insert;
            end;
        }
        field(9;"Contract Leave Balance";Decimal)
        {
        }
        field(10;"Employee Name";Text[50])
        {
        }
        field(11;"User ID";Code[20])
        {
        }
        field(12;"Creation Date";Date)
        {
        }
        field(13;"Total Days Taken";Decimal)
        {
            CalcFormula = sum("Employee Leave Application1"."Days Applied" where ("Employee No"=field("Employee No"),
                                                                                  "Contract No."=field("Contract No"),
                                                                                  Status=const(Released),
                                                                                  "Leave Code"=const('ANNUAL')));
            FieldClass = FlowField;
        }
        field(14;"Recalled Days";Decimal)
        {
            CalcFormula = sum("Employee Off/Holidays1"."No. of Off Days" where ("Employee No"=field("Employee No"),
                                                                                "Contract No."=field("Contract No")));
            FieldClass = FlowField;
        }
        field(15;"Days Absent";Decimal)
        {
            CalcFormula = sum("Employee Absentism1"."No. of  Days Absent" where ("Employee No"=field("Employee No"),
                                                                                 "Contract No."=field("Contract No")));
            FieldClass = FlowField;
        }
        field(16;"Off Days";Decimal)
        {
        }
        field(17;Status;Option)
        {
            OptionMembers = Active,Expired,Terminated;
        }
        field(18;Created;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Contract No","Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Contract No","Employee No","Contract Start Date","Contract End Date","Contract Period")
        {
        }
    }

    trigger OnInsert()
    begin
           "User ID":=UserId;
           "Creation Date":=Today;

           EmpContracts.Reset;
           EmpContracts.SetRange(EmpContracts."Employee No","Employee No");
           EmpContracts.SetRange(EmpContracts."Contract End Date",0D,Today);
           if EmpContracts.Find('-') then begin
              EmpContracts.Expired:=true;
              EmpContracts.Modify;
           end;
    end;

    var
        LeaveTypes: Record "Leave Types1";
        EmpContracts: Record "Employee Contracts1";
        EndDate: Date;
        EmpLeaveApps: Record "Employee Leave Application1";
        EmpOffs: Record "Employee Off/Holidays1";
        EmpAbsence: Record "Employee Absentism1";
        TotalDays: Decimal;
        Recalled: Decimal;
        Absent: Decimal;
        Absent1: Decimal;
        TotalDays1: Decimal;
        Recalled1: Decimal;
        EmpRec: Record Employee;
        Empleave: Record "Employee Leaves1";
        NextMaturityDate: Date;
        CalendarMgmt: Codeunit "Calendar Management";
        NextDate: Date;
        NoOfMonths: Decimal;
        Description: Text[50];
        EndOfYear: Boolean;
        MaturityDate: Date;
        AccPeriod: Record "Payroll PeriodX1";
}

