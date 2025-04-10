TableExtension 52193671 tableextension52193671 extends "Employee Absence" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Employee No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            Employee.GET("Employee No.");
            IF Employee."Privacy Blocked" THEN
              ERROR(BlockedErr);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            Employee.GET("Employee No.");
            */
        //end;
        field(50000;"Company Leave";Boolean)
        {
        }
        field(50001;Weight;Integer)
        {
        }
        field(50002;Approved;Boolean)
        {
        }
        field(50003;"Trasfered to Payroll";Boolean)
        {
        }
    }
}

