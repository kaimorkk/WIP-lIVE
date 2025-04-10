PageExtension 52193661 pageextension52193661 extends "Sales Analysis by Dim Matrix" 
{
    layout
    {

        //Unsupported feature: Property Deletion (AutoFormatType) on "TotalQuantity(Control 6)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "TotalQuantity(Control 6)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "TotalInvtValue(Control 8)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "TotalInvtValue(Control 8)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field1(Control 13)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field1(Control 13)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field2(Control 15)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field2(Control 15)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field3(Control 17)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field3(Control 17)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field4(Control 25)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field4(Control 25)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field5(Control 23)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field5(Control 23)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field6(Control 21)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field6(Control 21)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field7(Control 19)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field7(Control 19)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field8(Control 31)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field8(Control 31)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field9(Control 39)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field9(Control 39)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field10(Control 41)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field10(Control 41)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field11(Control 45)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field11(Control 45)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field12(Control 27)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field12(Control 27)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field13(Control 29)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field13(Control 29)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field14(Control 33)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field14(Control 33)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field15(Control 35)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field15(Control 35)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field16(Control 37)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field16(Control 37)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field17(Control 43)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field17(Control 43)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field18(Control 47)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field18(Control 47)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field19(Control 49)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field19(Control 49)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field20(Control 51)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field20(Control 51)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field21(Control 53)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field21(Control 53)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field22(Control 55)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field22(Control 55)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field23(Control 57)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field23(Control 57)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field24(Control 59)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field24(Control 59)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field25(Control 61)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field25(Control 61)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field26(Control 63)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field26(Control 63)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field27(Control 65)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field27(Control 65)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field28(Control 67)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field28(Control 67)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field29(Control 69)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field29(Control 69)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field30(Control 71)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field30(Control 71)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field31(Control 73)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field31(Control 73)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "Field32(Control 75)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "Field32(Control 75)".

    }
    var
        GLSetup: Record "General Ledger Setup";

    var
        NormalFormatString: Text[80];

    var
        Text001: label '<Precision,';
        Text002: label '><Standard Format,0>';


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Field1Visible := 1 <= NoOfRecords;
        Field2Visible := 2 <= NoOfRecords;
        Field3Visible := 3 <= NoOfRecords;
        #4..29
        Field30Visible := 30 <= NoOfRecords;
        Field31Visible := 31 <= NoOfRecords;
        Field32Visible := 32 <= NoOfRecords;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..32

        GLSetup.GET;
        NormalFormatString := Text001 + GLSetup."Amount Decimal Places" + Text002;
        */
    //end;


    //Unsupported feature: Code Modification on "LoadVariables(PROCEDURE 1)".

    //procedure LoadVariables();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(MatrixColumnCaptions);
        ItemAnalysisView.COPY(ItemAnalysisView1);

        #4..22
        ShowColumnName := ShowColumnName1;

        NoOfRecords := NoOfRecordsLocal;
        RoundingFactorFormatString := MatrixMgt.GetFormatString(RoundingFactor,FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..25
        */
    //end;


    //Unsupported feature: Code Modification on "CalcAmt(PROCEDURE 3)".

    //procedure CalcAmt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF SetColFilter THEN
          IF AVBreakdownBuffer.GET(Code,DimCodeBufferColumn1.Code) THEN BEGIN
            Amt := AVBreakdownBuffer.Amount;
        #4..24
        IF ShowOppositeSign THEN
          Amt := -Amt;

        Amt := MatrixMgt.RoundValue(Amt,RoundingFactor);

        EXIT(Amt);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..27
        CASE RoundingFactor OF
          RoundingFactor::"1":
            Amt := ROUND(Amt,1);
          RoundingFactor::"1000":
            Amt := ROUND(Amt / 1000,0.1);
          RoundingFactor::"1000000":
            Amt := ROUND(Amt / 1000000,0.1);
        END;

        EXIT(Amt);
        */
    //end;
}

