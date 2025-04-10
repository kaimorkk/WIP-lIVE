TableExtension 52193660 tableextension52193660 extends "To-do" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Team Name"(Field 19)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Completed By"(Field 46)".

    }

    //Unsupported feature: Code Modification on "CreateToDoFromToDo(PROCEDURE 1)".

    //procedure CreateToDoFromToDo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DELETEALL;
        INIT;
        IF ToDo.GETFILTER("Contact Company No.") <> '' THEN
          IF Cont.GET(ToDo.GETRANGEMIN("Contact Company No.")) THEN BEGIN
            VALIDATE("Contact No.",Cont."No.");
            "Salesperson Code" := Cont."Salesperson Code";
            SETRANGE("Contact Company No.","Contact No.");
          END;
        IF Cont.GET(ToDo.GETFILTER("Contact No.")) THEN BEGIN
          VALIDATE("Contact No.",Cont."No.");
          "Salesperson Code" := Cont."Salesperson Code";
        #12..39
        END;

        StartWizard;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        DELETEALL;
        INIT;
        IF Cont.GET(ToDo.GETFILTER("Contact Company No.")) THEN BEGIN
          VALIDATE("Contact No.",Cont."No.");
          "Salesperson Code" := Cont."Salesperson Code";
          SETRANGE("Contact Company No.","Contact No.");
        END;
        #9..42
        */
    //end;
}

