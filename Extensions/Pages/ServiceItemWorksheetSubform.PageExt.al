PageExtension 52193614 pageextension52193614 extends "Service Item Worksheet Subform" 
{

    //Unsupported feature: Variable Insertion (Variable: UpdateIsDone) (VariableCollection) on "QuantityOnAfterValidate(PROCEDURE 19032465)".


    //Unsupported feature: Code Modification on "QuantityOnAfterValidate(PROCEDURE 19032465)".

    //procedure QuantityOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Type = Type::Item THEN
          CASE Reserve OF
            Reserve::Always:
              BEGIN
                CurrPage.SAVERECORD;
                AutoReserve;
                CurrPage.UPDATE(FALSE);
              END;
            Reserve::Optional:
              IF (Quantity < xRec.Quantity) AND (xRec.Quantity > 0) THEN BEGIN
                CurrPage.SAVERECORD;
                CurrPage.UPDATE(FALSE);
              END;
          END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
                UpdateIsDone := TRUE;
        #8..12
                UpdateIsDone := TRUE;
              END;
          END;

        IF (Type = Type::Item) AND
           ((Quantity <> xRec.Quantity) OR ("Line No." = 0)) AND
           NOT UpdateIsDone
        THEN
          CurrPage.UPDATE(TRUE);
        */
    //end;
}

