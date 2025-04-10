TableExtension 52193715 tableextension52193715 extends "Registered Whse. Activity Hdr." 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Assigned User ID"(Field 4)".

    }

    //Unsupported feature: Parameter Insertion (Parameter: CurrentType) (ParameterCollection) on "OpenRegisteredActivityHeader(PROCEDURE 12)".


    //Unsupported feature: Parameter Insertion (Parameter: ChangeLocation) (ParameterCollection) on "OpenRegisteredActivityHeader(PROCEDURE 12)".


    //Unsupported feature: Parameter Insertion (Parameter: CurrentLocationCode) (ParameterCollection) on "OpenRegisteredActivityHeader(PROCEDURE 12)".


    //Unsupported feature: Parameter Insertion (Parameter: NewRegisteredWhseActivHeader) (ParameterCollection) on "OpenRegisteredActivityHeader(PROCEDURE 12)".


    //Unsupported feature: Variable Insertion (Variable: RegisteredWhseActivHeader) (VariableCollection) on "OpenRegisteredActivityHeader(PROCEDURE 12)".


    //Unsupported feature: Variable Insertion (Variable: WhseEmployee) (VariableCollection) on "OpenRegisteredActivityHeader(PROCEDURE 12)".


    //Unsupported feature: Variable Insertion (Variable: FoundLocation) (VariableCollection) on "OpenRegisteredActivityHeader(PROCEDURE 12)".


    //Unsupported feature: Property Modification (Name) on "SetWhseLocationFilter(PROCEDURE 12)".


    //Unsupported feature: Code Modification on "SetWhseLocationFilter(PROCEDURE 12)".

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
        RegisteredWhseActivHeader.SETRANGE(Type,CurrentType);
        IF USERID <> '' THEN BEGIN
          WhseEmployee.SETRANGE("User ID",USERID);
          IF NOT WhseEmployee.FIND('-') THEN
            ERROR(Text000,USERID);

          IF (CurrentLocationCode = '') AND ChangeLocation THEN
            CurrentLocationCode := WmsManagement.GetDefaultLocation;
          RegisteredWhseActivHeader.SETRANGE("Location Code",CurrentLocationCode);
          IF NOT RegisteredWhseActivHeader.FINDFIRST THEN
            REPEAT
              RegisteredWhseActivHeader.SETRANGE("Location Code",WhseEmployee."Location Code");
              IF RegisteredWhseActivHeader.FINDFIRST THEN BEGIN
                CurrentLocationCode := RegisteredWhseActivHeader."Location Code";
                FoundLocation := TRUE;
              END;
            UNTIL (WhseEmployee.NEXT = 0) OR FoundLocation;

          NewRegisteredWhseActivHeader.FILTERGROUP := 2;
          NewRegisteredWhseActivHeader.SETRANGE("Location Code",CurrentLocationCode);
          NewRegisteredWhseActivHeader.FILTERGROUP := 0;
        END;
        */
    //end;

    var
        Text000: label 'You must first set up user %1 as a warehouse employee.';
}

