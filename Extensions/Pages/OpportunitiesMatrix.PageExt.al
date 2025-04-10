PageExtension 52193670 pageextension52193670 extends "Opportunities Matrix" 
{
    layout
    {

        //Unsupported feature: Property Deletion (AutoFormatType) on "Field1(Control 1529)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field1(Control 1529)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field2(Control 1530)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field2(Control 1530)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field3(Control 1531)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field3(Control 1531)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field4(Control 1532)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field4(Control 1532)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field5(Control 1533)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field5(Control 1533)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field6(Control 1534)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field6(Control 1534)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field7(Control 1535)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field7(Control 1535)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field8(Control 1536)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field8(Control 1536)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field9(Control 1537)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field9(Control 1537)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field10(Control 1538)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field10(Control 1538)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field11(Control 1539)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field11(Control 1539)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field12(Control 1540)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field12(Control 1540)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field13(Control 1541)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field13(Control 1541)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field14(Control 1542)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field14(Control 1542)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field15(Control 1543)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field15(Control 1543)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field16(Control 1544)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field16(Control 1544)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field17(Control 1545)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field17(Control 1545)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field18(Control 1546)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field18(Control 1546)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field19(Control 1547)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field19(Control 1547)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field20(Control 1548)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field20(Control 1548)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field21(Control 1549)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field21(Control 1549)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field22(Control 1550)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field22(Control 1550)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field23(Control 1551)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field23(Control 1551)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field24(Control 1552)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field24(Control 1552)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field25(Control 1553)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field25(Control 1553)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field26(Control 1554)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field26(Control 1554)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field27(Control 1555)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field27(Control 1555)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field28(Control 1556)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field28(Control 1556)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field29(Control 1557)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field29(Control 1557)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field30(Control 1558)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field30(Control 1558)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field31(Control 1559)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field31(Control 1559)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field32(Control 1560)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field32(Control 1560)".

    }

    //Unsupported feature: Code Modification on "FormatAmount(PROCEDURE 1616)".

    //procedure FormatAmount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Text <> '' THEN BEGIN
          EVALUATE(Amount,Text);
          IF OutPutOption = OutPutOption::"No of Opportunities" THEN
            Text := FORMAT(Amount,0,Text000);
          Amount := MatrixMgt.RoundValue(Amount,RoundingFactor);
          IF Amount = 0 THEN
            Text := ''
          ELSE
        #9..12
                Text := FORMAT(Amount,0,Text001);
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
          IF RoundingFactor = RoundingFactor::None THEN
            EXIT;
          CASE RoundingFactor OF
            RoundingFactor::"1":
              Amount := ROUND(Amount,1);
            RoundingFactor::"1000":
              Amount := ROUND(Amount / 1000,0.1);
            RoundingFactor::"1000000":
              Amount := ROUND(Amount / 1000000,0.1);
          END;
        #6..15
        */
    //end;


    //Unsupported feature: Code Modification on "Load(PROCEDURE 1630)".

    //procedure Load();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        COPYARRAY(MATRIX_CaptionSet,MatrixColumns1,1);
        COPYARRAY(MatrixRecords,MatrixRecords1,1);
        TableOption := TableOptionLocal;
        #4..12
        SCS := "Sales Cycle Stage FilterLocal";
        ESV := "Estimated Value FilterLocal";
        MATRIX_CurrentNoOfMatrixColumn := NoOfColumns;
        RoundingFactorFormatString := MatrixMgt.GetFormatString(RoundingFactor,FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..15
        */
    //end;
}

