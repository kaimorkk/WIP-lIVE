Codeunit 52193457 "Leave Reports"
{

    trigger OnRun()
    begin
    end;

    var
        EmployeeLeaves: Record "Employee Leaves1";
        EmpLeaveApp: Record "Employee Leave Application1";
        Empl: Record Employee;
        entitlement: Decimal;
        Names: Text[50];


    procedure UpdateEmployeeLeaves()
    begin
        Empl.Reset;
        Empl.Get;
        Names:=Empl."First Name"+' '+Empl."Last Name";
        repeat
        EmpLeaveApp.Reset;
        EmpLeaveApp.SetRange(EmpLeaveApp."Employee No",Empl."No.");
        entitlement:=EmpLeaveApp."Leave Entitlment";
        if EmployeeLeaves.Get(Empl."No.") then  begin
          ;
        end
        else
         EmployeeLeaves.Init;

         EmployeeLeaves."Employee No":=Empl."No.";
         EmployeeLeaves."Leave Code":='0';
         EmployeeLeaves."Maturity Date":= 0D ;
         EmployeeLeaves.Balance:= entitlement;
         EmployeeLeaves."Acrued Days":= 0;
         EmployeeLeaves.Entitlement:=entitlement;
         EmployeeLeaves."Balance Brought Forward":=0;
         EmployeeLeaves."Total Days Taken":=0;
         EmployeeLeaves."Recalled Days":=0;


        until Empl.Next=0;

        //IF  THEN END
    end;
}

