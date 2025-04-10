PageExtension 52193665 pageextension52193665 extends "G/L Entries Dim. Overv. Matrix" 
{

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        MATRIX_CurrentColumnOrdinal := 0;
        IF MATRIX_PKFirstCaptionInSet <> '' THEN
          MatrixRecord.SETPOSITION(MATRIX_PKFirstCaptionInSet);
        IF MATRIX_OnFindRecord('=') THEN BEGIN
          MATRIX_CurrentColumnOrdinal := 1;
          REPEAT
        #7..14
        END;

        MATRIX_CurrentColumnOrdinal := MATRIX_CurrentColumnOrdinal;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        MATRIX_CurrentColumnOrdinal := 0;
        MatrixRecord.SETPOSITION(MATRIX_PKFirstCaptionInSet);
        #4..17
        */
    //end;
}

