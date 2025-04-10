Table 52193738 "Meeting Scheduler1"
{
    DrillDownPageID = "Pay Periods";
    LookupPageID = "Pay Periods";

    fields
    {
        field(1;"Starting Date";Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                Name := Format("Starting Date",0,'<Month Text>');
                Day:=Format("Starting Date",0,'<WeekDay Text>');
            end;
        }
        field(2;Day;Text[30])
        {
        }
        field(3;Name;Text[10])
        {
        }
        field(4;"New Fiscal Year";Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed,false);
            end;
        }
        field(5;Closed;Boolean)
        {
            Editable = false;
        }
        field(6;"Date Locked";Boolean)
        {
            Editable = true;
        }
        field(50001;"Meeting Starting Date";Date)
        {
        }
        field(50002;"Meeting End Date";Date)
        {
        }
        field(50003;"Meeting Type";Code[20])
        {
            TableRelation = Campaign;
        }
        field(50004;Status;Option)
        {
            OptionCaption = ' ,Not Started,In Progress,Completed,Waiting,Postponded';
            OptionMembers = " ","Not Started","In Progress",Completed,Waiting,Postponded;
        }
        field(50005;"No of Attendance";Integer)
        {
        }
        field(50006;"Agenda Code";Code[20])
        {
            TableRelation = Activity;
        }
        field(50007;"Team Code";Code[20])
        {
            TableRelation = Team;
        }
    }

    keys
    {
        key(Key1;"Starting Date")
        {
            Clustered = true;
        }
        key(Key2;Name,Closed)
        {
        }
        key(Key3;"New Fiscal Year")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //TESTFIELD("Date Locked",FALSE);
    end;

    trigger OnInsert()
    begin
        AccountingPeriod2 := Rec;
        if AccountingPeriod2.Find('>') then
          AccountingPeriod2.TestField("Date Locked",false);
    end;

    trigger OnRename()
    begin
        TestField("Date Locked",false);
        AccountingPeriod2 := Rec;
        if AccountingPeriod2.Find('>') then
          AccountingPeriod2.TestField("Date Locked",false);
    end;

    var
        AccountingPeriod2: Record "Meeting Scheduler1";


    procedure CreateLeaveEntitlment(var PayrollPeriod: Record "Meeting Scheduler1")
    var
        AccPeriod: Record "Payroll PeriodX1";
        NextDate: Date;
        EndOfYear: Boolean;
        Empleave: Record "Employee Leaves1";
        LeaveType: Record "Leave Types1";
        MaturityDate: Date;
        NextMaturityDate: Date;
        Emp: Record Employee;
        CarryForwardDays: Decimal;
        EmpleaveCpy: Record "Employee Leaves1";
    begin
        EndOfYear:=false;
        NextDate:=CalcDate('1M',"Starting Date");
        if AccPeriod.Get(NextDate) then
        if AccPeriod."New Fiscal Year" then
        EndOfYear:=true;

        if EndOfYear then
        begin

        MaturityDate:=CalcDate('1M',PayrollPeriod."Starting Date")-1;
        NextMaturityDate:=CalcDate('1Y',MaturityDate);

        LeaveType.Reset;
        LeaveType.SetRange(LeaveType."Annual Leave",true);
        if LeaveType.Find('-') then
        begin

        Emp.Reset;
        Emp.SetRange(Emp.Status,Emp.Status::Active);
        if Emp.Find('-') then
        repeat
          if EmpleaveCpy.Get(Emp."No.",LeaveType.Code,MaturityDate) then
          begin
          EmpleaveCpy.CalcFields(EmpleaveCpy."Total Days Taken");
          CarryForwardDays:=EmpleaveCpy.Entitlement-EmpleaveCpy."Total Days Taken";
          if CarryForwardDays>LeaveType."Max Carry Forward Days" then
          CarryForwardDays:=LeaveType."Max Carry Forward Days";
          end;

          Empleave.Init;
          Empleave."Employee No":=Emp."No.";
          Empleave."Leave Code":=LeaveType.Code;
          Empleave."Maturity Date":=NextMaturityDate;
          Empleave.Entitlement:=LeaveType.Days;
          Empleave."Balance Brought Forward":=CarryForwardDays;
          if not Empleave.Get(Empleave."Employee No", Empleave."Leave Code",Empleave."Maturity Date") then
          Empleave.Insert;

        until Emp.Next=0;


        end
        else
        Error('You must select one leave type as annual on the leave setup');

        end;
    end;
}

