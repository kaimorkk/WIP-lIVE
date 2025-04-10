TableExtension 52193513 tableextension52193513 extends "Reminder Level" 
{
    fields
    {

        //Unsupported feature: Deletion (FieldCollection) on ""Add. Fee per Line Amount (LCY)"(Field 7)".


        //Unsupported feature: Deletion (FieldCollection) on ""Add. Fee per Line Description"(Field 8)".


        //Unsupported feature: Deletion (FieldCollection) on ""Add. Fee Calculation Type"(Field 9)".

    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        AdditionalFeeSetup.SETRANGE("Reminder Terms Code","Reminder Terms Code");
        AdditionalFeeSetup.SETRANGE("Reminder Level No.","No.");
        AdditionalFeeSetup.DELETEALL(TRUE);

        ReminderText.SETRANGE("Reminder Terms Code","Reminder Terms Code");
        ReminderText.SETRANGE("Reminder Level","No.");
        ReminderText.DELETEALL;

        CurrencyForReminderLevel.SETRANGE("Reminder Terms Code","Reminder Terms Code");
        CurrencyForReminderLevel.SETRANGE("No.","No.");
        CurrencyForReminderLevel.DELETEALL;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #5..11
        */
    //end;


    //Unsupported feature: Code Modification on "NewRecord(PROCEDURE 1)".

    //procedure NewRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ReminderLevel.SETRANGE("Reminder Terms Code","Reminder Terms Code");
        IF ReminderLevel.FINDLAST THEN
          "No." := ReminderLevel."No.";
        "No." += 1;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ReminderLevel.SETRANGE("Reminder Terms Code","Reminder Terms Code");
        IF ReminderLevel.FINDLAST THEN;
        "No." := ReminderLevel."No." + 1;
        */
    //end;
}

