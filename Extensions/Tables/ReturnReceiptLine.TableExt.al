TableExtension 52193763 tableextension52193763 extends "Return Receipt Line" 
{

    //Unsupported feature: Code Modification on "InsertInvLineFromRetRcptLine(PROCEDURE 2)".

    //procedure InsertInvLineFromRetRcptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SETRANGE("Document No.","Document No.");

        TempSalesLine := SalesLine;
        #4..82
            SalesLine."Allow Line Disc." := SalesOrderLine."Allow Line Disc.";
            SalesLine."Allow Invoice Disc." := SalesOrderLine."Allow Invoice Disc.";
            SalesLine.VALIDATE("Line Discount %",SalesOrderLine."Line Discount %");
            IF SalesOrderLine.Quantity = 0 THEN
              SalesLine.VALIDATE("Inv. Discount Amount",0)
            ELSE
              SalesLine.VALIDATE(
                "Inv. Discount Amount",
                ROUND(
                  SalesOrderLine."Inv. Discount Amount" * SalesLine.Quantity / SalesOrderLine.Quantity,
                  Currency."Amount Rounding Precision"));
          END;
          SalesLine."Attached to Line No." :=
            TransferOldExtLines.TransferExtendedText(
        #97..113
          SalesOrderHeader."Get Shipment Used" := TRUE;
          SalesOrderHeader.MODIFY;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..85
            IF NOT SalesSetup."Calc. Inv. Discount" THEN
              SalesLine.VALIDATE("Inv. Discount Amount",SalesOrderLine."Inv. Discount Amount");
        #94..116
        */
    //end;
}

