TableExtension 52193512 tableextension52193512 extends "Reminder Terms" 
{
    fields
    {

        //Unsupported feature: Deletion (FieldCollection) on ""Post Add. Fee per Line"(Field 7)".


        //Unsupported feature: Deletion (FieldCollection) on ""Note About Line Fee on Report"(Field 8)".

    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ReminderLevel.SETRANGE("Reminder Terms Code",Code);
        ReminderLevel.DELETEALL(TRUE);

        ReminderTermsTranslation.SETRANGE("Reminder Terms Code",Code);
        ReminderTermsTranslation.DELETEALL(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ReminderLevel.SETRANGE("Reminder Terms Code",Code);
        ReminderLevel.DELETEALL(TRUE);
        */
    //end;
}

