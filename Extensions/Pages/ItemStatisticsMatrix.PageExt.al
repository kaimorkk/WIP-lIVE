PageExtension 52193659 pageextension52193659 extends "Item Statistics Matrix" 
{
    layout
    {

        

    }
    var
        Text000: label '<Sign><Integer Thousand><Decimals,2>';
        GLSetup: Record "General Ledger Setup";

    var
        GLSetupRead: Boolean;

    var
        VarMATRIX_CellData: array [32] of Text[30];

    var
        VarAmount: Text[30];


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        NameIndent := 0;
        Amount := Calculate(FALSE);
        MATRIX_ColumnOrdinal := 0;
        IF MATRIX_OnFindRecord('=><') THEN BEGIN
          MATRIX_ColumnOrdinal := 1;
          REPEAT
            MATRIX_OnAfterGetRecord(MATRIX_ColumnOrdinal);
            MATRIX_Steps := MATRIX_OnNextRecord(1);
            MATRIX_ColumnOrdinal := MATRIX_ColumnOrdinal + MATRIX_Steps;
          UNTIL (MATRIX_ColumnOrdinal - MATRIX_Steps = ARRAYLEN(MatrixRecords)) OR (MATRIX_Steps = 0);
          IF MATRIX_ColumnOrdinal <> 1 THEN
            MATRIX_OnNextRecord(1 - MATRIX_ColumnOrdinal);
        END;
        NameOnFormat;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
            VarMATRIX_CellData[MATRIX_ColumnOrdinal] := FORMAT(MATRIX_CellData[MATRIX_ColumnOrdinal]);
            AmountOnFormat(VarMATRIX_CellData[MATRIX_ColumnOrdinal]);
        #8..13

        VarAmount := FORMAT(Amount);
        AmountOnFormat(VarAmount);
        NameOnFormat;
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Field1Visible := 1 <= MATRIX_CurrentNoOfMatrixColumn;
        Field2Visible := 2 <= MATRIX_CurrentNoOfMatrixColumn;
        Field3Visible := 3 <= MATRIX_CurrentNoOfMatrixColumn;
        #4..30
        Field31Visible := 31 <= MATRIX_CurrentNoOfMatrixColumn;
        Field32Visible := 32 <= MATRIX_CurrentNoOfMatrixColumn;

        WITH Item DO BEGIN
          IF "No." <> '' THEN
            ItemFilter := "No.";
        #37..47
        PeriodInitialized := DateFilter <> '';
        FindPeriod('');
        ItemName := STRSUBSTNO('%1  %2',Item."No.",Item.Description);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..33
        GLSetup.GET;

        #34..50
        */
    //end;


    //Unsupported feature: Code Modification on "Calculate(PROCEDURE 1147)".

    //procedure Calculate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH ItemBuffer DO BEGIN
          CASE "Line Option" OF
            "Line Option"::"Profit Calculation",
        #4..41
            ELSE
              Qty := CalcQty(SetColumnFilter);
            IF Qty <> 0 THEN
              Amount := Amount / ABS(Qty)
            ELSE
              Amount := 0;
          END;
          IF Name <> FIELDCAPTION("Profit %") THEN
            Amount := MatrixMgt.RoundValue(Amount,RoundingFactor);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        GetGLSetup;
        #1..44
              Amount := ROUND(Amount / ABS(Qty),GLSetup."Unit-Amount Rounding Precision")
        #46..48
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "Load(PROCEDURE 1154)".

    //procedure Load();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        COPYARRAY(MATRIX_CaptionSet,MatrixColumns1,1);
        COPYARRAY(MatrixRecords,MatrixRecords1,1);
        MATRIX_CurrentNoOfMatrixColumn := CurrentNoOfMatrixColumns;
        #4..12
        ItemFilter := _ItemFilter;
        LocationFilter := _LocationFilter;
        VariantFilter := _VariantFilter;
        RoundingFactorFormatString := MatrixMgt.GetFormatString(RoundingFactor,FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..15
        */
    //end;

    

    local procedure GetGLSetup()
    begin
        if not GLSetupRead then
          GLSetup.Get;
        GLSetupRead := true;
    end;

    
}

