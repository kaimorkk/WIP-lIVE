PageExtension 52193548 pageextension52193548 extends "Cost Type Balance Matrix" 
{
    layout
    {

        //Unsupported feature: Property Deletion (AutoFormatType) on "Column1(Control 9)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column1(Control 9)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column2(Control 10)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column2(Control 10)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column3(Control 11)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column3(Control 11)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column4(Control 12)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column4(Control 12)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column5(Control 13)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column5(Control 13)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column6(Control 14)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column6(Control 14)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column7(Control 15)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column7(Control 15)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column8(Control 16)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column8(Control 16)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column9(Control 17)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column9(Control 17)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column10(Control 18)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column10(Control 18)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column11(Control 19)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column11(Control 19)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Column12(Control 20)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Column12(Control 20)".

    }

    //Unsupported feature: Code Modification on "Load(PROCEDURE 2)".

    //procedure Load();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        FOR i := 1 TO 12 DO BEGIN
          IF MatrixColumns1[i] = '' THEN
            MATRIX_ColumnCaption[i] := ' '
        #4..14
        CostObjectFilter := CostObjectFilter1;
        RoundingFactor := RoundingFactor1;
        AmtType := AmtType1;
        RoundingFactorFormatString := MatrixMgt.GetFormatString(RoundingFactor,FALSE);

        CurrPage.UPDATE(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..17

        CurrPage.UPDATE(FALSE);
        */
    //end;


    //Unsupported feature: Code Modification on ""MATRIX_OnAfterGetRecord"(PROCEDURE 4)".

    //procedure "MATRIX_OnAfterGetRecord"();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetFilters(ColumnID);
        CALCFIELDS("Net Change");
        MATRIX_CellData[ColumnID] := MatrixMgt.RoundValue("Net Change",RoundingFactor);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SetFilters(ColumnID);
        CALCFIELDS("Net Change");
        MATRIX_CellData[ColumnID] := "Net Change";
        CASE RoundingFactor OF
          RoundingFactor::"1":
            MATRIX_CellData[ColumnID] := ROUND(MATRIX_CellData[ColumnID],1);
          RoundingFactor::"1000":
            MATRIX_CellData[ColumnID] := ROUND(MATRIX_CellData[ColumnID] / 1000,0.1);
          RoundingFactor::"1000000":
            MATRIX_CellData[ColumnID] := ROUND(MATRIX_CellData[ColumnID] / 1000000,0.1);
        END;
        */
    //end;
}

