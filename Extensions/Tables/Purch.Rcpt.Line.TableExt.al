TableExtension 52193470 tableextension52193470 extends "Purch. Rcpt. Line" 
{

    //Unsupported feature: Variable Insertion (Variable: PurchSetup) (VariableCollection) on "InsertInvLineFromRcptLine(PROCEDURE 2)".


    //Unsupported feature: Code Modification on "InsertInvLineFromRcptLine(PROCEDURE 2)".

    //procedure InsertInvLineFromRcptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SETRANGE("Document No.","Document No.");

        TempPurchLine := PurchLine;
        IF PurchLine.FIND('+') THEN
          NextLineNo := PurchLine."Line No." + 10000
        ELSE
          NextLineNo := 10000;

        IF PurchInvHeader."No." <> TempPurchLine."Document No." THEN
          PurchInvHeader.GET(TempPurchLine."Document Type",TempPurchLine."Document No.");

        IF PurchLine."Receipt No." <> "Document No." THEN BEGIN
          PurchLine.INIT;
          PurchLine."Line No." := NextLineNo;
          PurchLine."Document Type" := TempPurchLine."Document Type";
          PurchLine."Document No." := TempPurchLine."Document No.";
          PurchLine.Description := STRSUBSTNO(Text000,"Document No.");
          PurchLine.INSERT;
          NextLineNo := NextLineNo + 10000;
        END;

        TransferOldExtLines.ClearLineNumbers;

        REPEAT
          ExtTextLine := (TransferOldExtLines.GetNewLineNumber("Attached to Line No.") <> 0);

          IF PurchOrderLine.GET(
               PurchOrderLine."Document Type"::Order,"Order No.","Order Line No.") AND
             NOT ExtTextLine
          THEN BEGIN
            IF (PurchOrderHeader."Document Type" <> PurchOrderLine."Document Type"::Order) OR
               (PurchOrderHeader."No." <> PurchOrderLine."Document No.")
            THEN
              PurchOrderHeader.GET(PurchOrderLine."Document Type"::Order,"Order No.");

            InitCurrency("Currency Code");

            IF PurchInvHeader."Prices Including VAT" THEN BEGIN
              IF NOT PurchOrderHeader."Prices Including VAT" THEN
                PurchOrderLine."Direct Unit Cost" :=
                  ROUND(
                    PurchOrderLine."Direct Unit Cost" * (1 + PurchOrderLine."VAT %" / 100),
                    Currency."Unit-Amount Rounding Precision");
            END ELSE BEGIN
              IF PurchOrderHeader."Prices Including VAT" THEN
                PurchOrderLine."Direct Unit Cost" :=
                  ROUND(
                    PurchOrderLine."Direct Unit Cost" / (1 + PurchOrderLine."VAT %" / 100),
                    Currency."Unit-Amount Rounding Precision");
            END;
          END ELSE BEGIN
            IF ExtTextLine THEN BEGIN
              PurchOrderLine.INIT;
              PurchOrderLine."Line No." := "Order Line No.";
              PurchOrderLine.Description := Description;
              PurchOrderLine."Description 2" := "Description 2";
            END ELSE
              ERROR(Text001);
          END;
          PurchLine := PurchOrderLine;
          PurchLine."Line No." := NextLineNo;
          PurchLine."Document Type" := TempPurchLine."Document Type";
          PurchLine."Document No." := TempPurchLine."Document No.";
          PurchLine."Variant Code" := "Variant Code";
          PurchLine."Location Code" := "Location Code";
          PurchLine."Quantity (Base)" := 0;
          PurchLine.Quantity := 0;
          PurchLine."Outstanding Qty. (Base)" := 0;
          PurchLine."Outstanding Quantity" := 0;
          PurchLine."Quantity Received" := 0;
          PurchLine."Qty. Received (Base)" := 0;
          PurchLine."Quantity Invoiced" := 0;
          PurchLine."Qty. Invoiced (Base)" := 0;
          PurchLine.Amount := 0;
          PurchLine."Amount Including VAT" := 0;
          PurchLine."Sales Order No." := '';
          PurchLine."Sales Order Line No." := 0;
          PurchLine."Drop Shipment" := FALSE;
          PurchLine."Special Order Sales No." := '';
          PurchLine."Special Order Sales Line No." := 0;
          PurchLine."Special Order" := FALSE;
          PurchLine."Receipt No." := "Document No.";
          PurchLine."Receipt Line No." := "Line No.";
          PurchLine."Appl.-to Item Entry" := 0;
          IF NOT ExtTextLine THEN BEGIN
            PurchLine.VALIDATE(Quantity,Quantity - "Quantity Invoiced");
            PurchLine.VALIDATE("Direct Unit Cost",PurchOrderLine."Direct Unit Cost");
            PurchOrderLine."Line Discount Amount" :=
              ROUND(
                PurchOrderLine."Line Discount Amount" * PurchLine.Quantity / PurchOrderLine.Quantity,
                Currency."Amount Rounding Precision");
            IF PurchInvHeader."Prices Including VAT" THEN BEGIN
              IF NOT PurchOrderHeader."Prices Including VAT" THEN
                PurchOrderLine."Line Discount Amount" :=
                  ROUND(
                    PurchOrderLine."Line Discount Amount" *
                    (1 + PurchOrderLine."VAT %" / 100),Currency."Amount Rounding Precision");
            END ELSE
              IF PurchOrderHeader."Prices Including VAT" THEN
                PurchOrderLine."Line Discount Amount" :=
                  ROUND(
                    PurchOrderLine."Line Discount Amount" /
                    (1 + PurchOrderLine."VAT %" / 100),Currency."Amount Rounding Precision");
            PurchLine.VALIDATE("Line Discount Amount",PurchOrderLine."Line Discount Amount");
            PurchLine."Line Discount %" := PurchOrderLine."Line Discount %";
            PurchLine.UpdatePrePaymentAmounts;
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
              "Line No.",
              NextLineNo,
              "Attached to Line No.");
          PurchLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
          PurchLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
          PurchLine."Dimension Set ID" := "Dimension Set ID";

          IF "Sales Order No." = '' THEN
            PurchLine."Drop Shipment" := FALSE
          ELSE
            PurchLine."Drop Shipment" := TRUE;

          PurchLine.INSERT;

          ItemTrackingMgt.CopyHandledItemTrkgToInvLine2(PurchOrderLine,PurchLine);

          NextLineNo := NextLineNo + 10000;
          IF "Attached to Line No." = 0 THEN
            SETRANGE("Attached to Line No.","Line No.");
        UNTIL (NEXT = 0) OR ("Attached to Line No." = 0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..27
               PurchOrderLine."Document Type"::Order,"Order No.","Order Line No.")
        #30..87
            PurchLine.VALIDATE(
              "Line Discount Amount",
              ROUND(
                PurchOrderLine."Line Discount Amount" * PurchLine.Quantity / PurchOrderLine.Quantity,
                Currency."Amount Rounding Precision"));
            PurchLine."Line Discount %" := PurchOrderLine."Line Discount %";
            PurchLine.UpdatePrePaymentAmounts;
            PurchSetup.GET;
            IF NOT PurchSetup."Calc. Inv. Discount" THEN
              IF PurchOrderLine.Quantity = 0 THEN
                PurchLine.VALIDATE("Inv. Discount Amount",0)
              ELSE
                PurchLine.VALIDATE(
                  "Inv. Discount Amount",
                  ROUND(
                    PurchOrderLine."Inv. Discount Amount" * PurchLine.Quantity / PurchOrderLine.Quantity,
                    Currency."Amount Rounding Precision"));
        #115..138
        */
    //end;
}

