PageExtension 52193613 pageextension52193613 extends "Service Lines" 
{

    //Unsupported feature: Code Modification on "InsertExtendedText(PROCEDURE 7)".

    //procedure InsertExtendedText();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF TransferExtendedText.ServCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          AddExtendedText := TRUE;
          CurrPage.SAVERECORD;
          AddExtendedText := FALSE;
          TransferExtendedText.InsertServExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          CurrPage.UPDATE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF TransferExtendedText.ServCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
        #5..8
        */
    //end;
}

