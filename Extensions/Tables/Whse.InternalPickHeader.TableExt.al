TableExtension 52193790 tableextension52193790 extends "Whse. Internal Pick Header" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Assigned User ID"(Field 3)".

    }

    //Unsupported feature: Parameter Insertion (Parameter: WhseInternalPickHeader) (ParameterCollection) on "OpenWhseInternalPickHeader(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: WhseEmployee) (VariableCollection) on "OpenWhseInternalPickHeader(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: CurrentLocationCode) (VariableCollection) on "OpenWhseInternalPickHeader(PROCEDURE 2)".


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
            ERROR(Text002,USERID);

          WhseEmployee.SETRANGE("Location Code",WhseInternalPickHeader."Location Code");
          IF WhseEmployee.FINDFIRST THEN
            CurrentLocationCode := WhseInternalPickHeader."Location Code"
          ELSE
            CurrentLocationCode := WmsManagement.GetDefaultLocation;

          WhseInternalPickHeader.FILTERGROUP := 2;
          WhseInternalPickHeader.SETRANGE("Location Code",CurrentLocationCode);
          WhseInternalPickHeader.FILTERGROUP := 0;
        END;
        */
    //end;

    var
        Text002: label 'You must first set up user %1 as a warehouse employee.';
}

