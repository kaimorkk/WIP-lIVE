TableExtension 52193761 tableextension52193761 extends "Return Shipment Line" 
{

    //Unsupported feature: Code Modification on "InsertInvLineFromRetShptLine(PROCEDURE 2)".

    //procedure InsertInvLineFromRetShptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SETRANGE("Document No.","Document No.");

        TempPurchLine := PurchLine;
        #4..81
            PurchLine.VALIDATE(Quantity,Quantity - "Quantity Invoiced");
            PurchLine.VALIDATE("Direct Unit Cost",PurchOrderLine."Direct Unit Cost");
            PurchLine.VALIDATE("Line Discount %",PurchOrderLine."Line Discount %");
            IF PurchOrderLine.Quantity = 0 THEN
              PurchLine.VALIDATE("Inv. Discount Amount",0)
            ELSE
              PurchLine.VALIDATE(
                "Inv. Discount Amount",
                ROUND(
                  PurchOrderLine."Inv. Discount Amount" * PurchLine.Quantity / PurchOrderLine.Quantity,
                  Currency."Amount Rounding Precision"));
          END;
          PurchLine."Attached to Line No." :=
            TransferOldExtLines.TransferExtendedText(
        #96..106
          IF "Attached to Line No." = 0 THEN
            SETRANGE("Attached to Line No.","Line No.");
        UNTIL (NEXT = 0) OR ("Attached to Line No." = 0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..84
            IF NOT PurchSetup."Calc. Inv. Discount" THEN
              PurchLine.VALIDATE("Inv. Discount Amount",PurchOrderLine."Inv. Discount Amount");
        #93..109
        */
    //end;
}

