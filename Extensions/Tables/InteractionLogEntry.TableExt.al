TableExtension 52193653 tableextension52193653 extends "Interaction Log Entry" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 11)".

    }

    //Unsupported feature: Code Modification on "CreateInteraction(PROCEDURE 10)".

    //procedure CreateInteraction();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Contact No." <> '' THEN
          IF Contact.GET("Contact No.") THEN
            Contact.CheckIfPrivacyBlockedGeneric;
        IF "Contact Company No." <> '' THEN
          IF Contact.GET("Contact Company No.") THEN
            Contact.CheckIfPrivacyBlockedGeneric;
        SegLine.CreateInteractionFromIntLogEnt(Rec);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SegLine.CreateInteractionFromIntLogEnt(Rec);
        */
    //end;


    //Unsupported feature: Code Modification on "CreateTodo(PROCEDURE 8)".

    //procedure CreateTodo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Contact No." <> '' THEN
          IF Contact.GET("Contact No.") THEN
            Contact.CheckIfPrivacyBlockedGeneric;
        IF "Contact Company No." <> '' THEN
          IF Contact.GET("Contact Company No.") THEN
            Contact.CheckIfPrivacyBlockedGeneric;
        TempTodo.CreateToDoFromInteractLogEntry(Rec)
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        TempTodo.CreateToDoFromInteractLogEntry(Rec)
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "CreateInteraction(PROCEDURE 10).Contact(Variable 1001)".


    //Unsupported feature: Deletion (VariableCollection) on "CreateTodo(PROCEDURE 8).Contact(Variable 1001)".

}

