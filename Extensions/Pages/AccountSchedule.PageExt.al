PageExtension 52193463 pageextension52193463 extends "Account Schedule" 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "InsertGLAccounts(Action 7)".


        //Unsupported feature: Property Modification (Name) on "InsertCFAccounts(Action 5)".


        //Unsupported feature: Property Modification (Name) on "InsertCostTypes(Action 3)".

    }

    //Unsupported feature: Code Modification on "SetupAccSchedLine(PROCEDURE 3)".

    //procedure SetupAccSchedLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        AccSchedLine := Rec;
        IF "Line No." = 0 THEN BEGIN
          AccSchedLine := xRec;
          AccSchedLine.SETRANGE("Schedule Name",CurrentSchedName);
          IF AccSchedLine.NEXT = 0 THEN
            AccSchedLine."Line No." := xRec."Line No." + 10000
          ELSE BEGIN
            IF AccSchedLine.FINDLAST THEN
              AccSchedLine."Line No." += 10000;
            AccSchedLine.SETRANGE("Schedule Name");
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        AccSchedLine.COPY(Rec);
        IF "Line No." = 0 THEN BEGIN
          AccSchedLine := xRec;
          IF AccSchedLine.NEXT = 0 THEN
            AccSchedLine."Line No." := xRec."Line No." + 10000;
        END;
        */
    //end;
}

