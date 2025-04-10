TableExtension 52193447 tableextension52193447 extends "Accounting Period" 
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Average Cost Period"(Field 5805)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Average Cost Calc. Type"(Field 5804)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Average Cost Period"(Field 5805)".

    }
    procedure CreateLeaveEntitlment(var PayrollPeriod: Record "Accounting Period")
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
         //IF (Emp."Posting Group"='PARMANENT') THEN BEGIN
        
          if EmpleaveCpy.Get(Emp."No.",LeaveType.Code,MaturityDate) then
          begin
          EmpleaveCpy.CalcFields(EmpleaveCpy."Total Days Taken");
          CarryForwardDays:=EmpleaveCpy.Entitlement+EmpleaveCpy."Balance Brought Forward"+EmpleaveCpy."Recalled Days"
          -EmpleaveCpy."Total Days Taken";
          if CarryForwardDays>LeaveType."Max Carry Forward Days" then
          CarryForwardDays:=LeaveType."Max Carry Forward Days";
          end;
        
          Empleave.Init;
          Empleave."Employee No":=Emp."No.";
          Empleave."Leave Code":=LeaveType.Code;
          Empleave."Maturity Date":=NextMaturityDate;
         // IF Emp."Date Of Join">"Starting Date" THEN
         //   Empleave.Entitlement:=
         // ELSE
          Empleave.Entitlement:=LeaveType.Days;
          Empleave."Balance Brought Forward":=CarryForwardDays;
          if not Empleave.Get(Empleave."Employee No", Empleave."Leave Code",Empleave."Maturity Date") then
          Empleave.Insert;
         /*
          END ELSE
        
         IF (Emp."Posting Group"='TEMP') OR (Emp."Posting Group"='INTERN') THEN BEGIN
        
          IF EmpleaveCpy.GET(Emp."No.",LeaveType.Code,MaturityDate) THEN
          BEGIN
          EmpleaveCpy.CALCFIELDS(EmpleaveCpy."Total Days Taken");
          CarryForwardDays:=EmpleaveCpy.Entitlement+EmpleaveCpy."Balance Brought Forward"+EmpleaveCpy."Recalled Days"
          -EmpleaveCpy."Total Days Taken";
          IF CarryForwardDays>LeaveType."Max Carry Forward Days" THEN
          CarryForwardDays:=LeaveType."Max Carry Forward Days";
          END;
        
          Empleave.INIT;
          Empleave."Employee No":=Emp."No.";
          Empleave."Leave Code":=LeaveType.Code;
          Empleave."Maturity Date":=NextMaturityDate;
         // IF Emp."Date Of Join">"Starting Date" THEN
         //   Empleave.Entitlement:=
         // ELSE
          Empleave.Entitlement:=ROUND(((Emp."Contract End Date"-Emp."Contract Start Date")/30),1)*2.5;
          Empleave."Balance Brought Forward":=CarryForwardDays;
          IF NOT Empleave.GET(Empleave."Employee No", Empleave."Leave Code",Empleave."Maturity Date") THEN
          Empleave.INSERT;
         END;
        */
        until Emp.Next=0;
        
        end
        else
        Error('You must select one leave type as annual on the leave setup');
        
        end;

    end;
}

