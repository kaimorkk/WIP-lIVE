TableExtension 52193788 tableextension52193788 extends "Whse. Internal Put-away Header" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Assigned User ID"(Field 3)".

    }

    //Unsupported feature: Parameter Insertion (Parameter: WhseInternalPutAwayHeader) (ParameterCollection) on "OpenInternalPutAwayHeader(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: WhseEmployee) (VariableCollection) on "OpenInternalPutAwayHeader(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: CurrentLocationCode) (VariableCollection) on "OpenInternalPutAwayHeader(PROCEDURE 2)".


    //Unsupported feature: Property Modification (Name) on "SetWhseLocationFilter(PROCEDURE 2)".


    //Unsupported feature: Code Modification on "SetWhseLocationFilter(PROCEDURE 2)".

    //procedure SetWhseLocationFilter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF USERID <> '' THEN BEGIN
          FILTERGROUP := 2;
          SETRANGE("Location Code",WmsManagement.GetAllowedLocation("Location Code"));
          FILTERGROUP := 0;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF USERID <> '' THEN BEGIN
          WhseEmployee.SETRANGE("User ID",USERID);
          IF NOT WhseEmployee.FINDFIRST THEN
            ERROR(Text000,USERID);

          WhseEmployee.SETRANGE("Location Code",WhseInternalPutAwayHeader."Location Code");
          IF WhseEmployee.FINDFIRST THEN
            CurrentLocationCode := WhseInternalPutAwayHeader."Location Code"
          ELSE
            CurrentLocationCode := WmsManagement.GetDefaultLocation;

          WhseInternalPutAwayHeader.FILTERGROUP := 2;
          WhseInternalPutAwayHeader.SETRANGE("Location Code",CurrentLocationCode);
          WhseInternalPutAwayHeader.FILTERGROUP := 0;
        END;
        */
    //end;

    var
        Text000: label 'You must first set up user %1 as a warehouse employee.';
}

