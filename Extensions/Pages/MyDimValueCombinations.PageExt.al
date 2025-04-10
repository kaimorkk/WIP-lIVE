PageExtension 52193668 pageextension52193668 extends "MyDim Value Combinations" 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "PreviousSet(Action 1102601002)".


        //Unsupported feature: Property Modification (Name) on "PreviousColumn(Action 1102601003)".


        //Unsupported feature: Property Modification (Name) on "NextColumn(Action 1102601004)".


        //Unsupported feature: Property Modification (Name) on "NextSet(Action 1102601001)".

    }

    //Unsupported feature: Code Modification on ""MATRIX_GenerateColumnCaptions"(PROCEDURE 1106)".

    //procedure "MATRIX_GenerateColumnCaptions"();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RecRef.GETTABLE(MatrixRecord);
        IF ShowColumnName THEN
          MATRIX_CaptionFieldNo := 3
        #4..7
          MATRIX_CaptionSet,MATRIX_ColumnSet,MATRIX_CurrSetLength);
        CLEAR(MatrixRecords);
        MatrixRecord.SETPOSITION(PrimaryKeyFirstCaptionInCurrSe);
        REPEAT
          CurrentMatrixRecordOrdinal += 1;
          MatrixRecords[CurrentMatrixRecordOrdinal].COPY(MatrixRecord);
        UNTIL (CurrentMatrixRecordOrdinal = ARRAYLEN(MatrixRecords)) OR (MatrixRecord.NEXT <> 1);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..10
        CurrentMatrixRecordOrdinal := 1;
        REPEAT
          MatrixRecords[CurrentMatrixRecordOrdinal].COPY(MatrixRecord);
          CurrentMatrixRecordOrdinal := CurrentMatrixRecordOrdinal + 1;
        UNTIL (CurrentMatrixRecordOrdinal = ARRAYLEN(MatrixRecords)) OR (MatrixRecord.NEXT <> 1);
        */
    //end;
}

