TableExtension 52193493 tableextension52193493 extends "Gen. Journal Batch" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Bal. Account No."(Field 6).OnValidate".

        //trigger  Account No()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Bal. Account Type" = "Bal. Account Type"::"G/L Account" THEN
              CheckGLAcc("Bal. Account No.");
            CheckJnlIsNotRecurring;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF "Bal. Account Type" = "Bal. Account Type"::"G/L Account" THEN
              CheckGLAcc("Bal. Account No.");
            */
        //end;
    }

    //Unsupported feature: Variable Insertion (Variable: GenJnlLine) (VariableCollection) on "ClearPostExchEntries(PROCEDURE 4)".


    //Unsupported feature: Property Deletion (Local) on "CheckJnlIsNotRecurring(PROCEDURE 4)".


    //Unsupported feature: Property Modification (Name) on "CheckJnlIsNotRecurring(PROCEDURE 4)".



    //Unsupported feature: Code Modification on "CheckJnlIsNotRecurring(PROCEDURE 4)".

    //procedure CheckJnlIsNotRecurring();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Bal. Account No." = '' THEN
          EXIT;

        GenJnlTemplate.GET("Journal Template Name");
        IF GenJnlTemplate.Recurring THEN
          FIELDERROR("Bal. Account No.",CannotBeSpecifiedForRecurrJnlErr);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        GenJnlLine.SETRANGE("Journal Template Name","Journal Template Name");
        GenJnlLine.SETRANGE("Journal Batch Name",Name);
        IF GenJnlLine.FINDSET THEN
          REPEAT
            GenJnlLine.ClearPostExchangeEntries(TRUE);
          UNTIL GenJnlLine.NEXT = 0;
        */
    //end;
}

