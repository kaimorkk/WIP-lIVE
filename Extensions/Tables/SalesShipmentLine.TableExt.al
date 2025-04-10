TableExtension 52193464 tableextension52193464 extends "Sales Shipment Line" 
{

    //Unsupported feature: Variable Insertion (Variable: SalesSetup) (VariableCollection) on "InsertInvLineFromShptLine(PROCEDURE 2)".


    //Unsupported feature: Code Modification on "InsertInvLineFromShptLine(PROCEDURE 2)".

    //procedure InsertInvLineFromShptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SETRANGE("Document No.","Document No.");

        TempSalesLine := SalesLine;
        IF SalesLine.FIND('+') THEN
          NextLineNo := SalesLine."Line No." + 10000
        ELSE
          NextLineNo := 10000;

        IF SalesInvHeader."No." <> TempSalesLine."Document No." THEN
          SalesInvHeader.GET(TempSalesLine."Document Type",TempSalesLine."Document No.");

        IF SalesLine."Shipment No." <> "Document No." THEN BEGIN
          SalesLine.INIT;
          SalesLine."Line No." := NextLineNo;
          SalesLine."Document Type" := TempSalesLine."Document Type";
          SalesLine."Document No." := TempSalesLine."Document No.";
          SalesLine.Description := STRSUBSTNO(Text000,"Document No.");
          SalesLine.INSERT;
          NextLineNo := NextLineNo + 10000;
        END;

        TransferOldExtLines.ClearLineNumbers;

        REPEAT
          ExtTextLine := (TransferOldExtLines.GetNewLineNumber("Attached to Line No.") <> 0);

          IF (Type <> Type::" ") AND SalesOrderLine.GET(SalesOrderLine."Document Type"::Order,"Order No.","Order Line No.")
          THEN BEGIN
            IF (SalesOrderHeader."Document Type" <> SalesOrderLine."Document Type"::Order) OR
               (SalesOrderHeader."No." <> SalesOrderLine."Document No.")
            THEN
              SalesOrderHeader.GET(SalesOrderLine."Document Type"::Order,"Order No.");

            InitCurrency("Currency Code");

            IF SalesInvHeader."Prices Including VAT" THEN BEGIN
              IF NOT SalesOrderHeader."Prices Including VAT" THEN
                SalesOrderLine."Unit Price" :=
                  ROUND(
                    SalesOrderLine."Unit Price" * (1 + SalesOrderLine."VAT %" / 100),
                    Currency."Unit-Amount Rounding Precision");
            END ELSE BEGIN
              IF SalesOrderHeader."Prices Including VAT" THEN
                SalesOrderLine."Unit Price" :=
                  ROUND(
                    SalesOrderLine."Unit Price" / (1 + SalesOrderLine."VAT %" / 100),
                    Currency."Unit-Amount Rounding Precision");
            END;
          END ELSE BEGIN
            SalesOrderHeader.INIT;
            IF ExtTextLine OR (Type = Type::" ") THEN BEGIN
              SalesOrderLine.INIT;
              SalesOrderLine."Line No." := "Order Line No.";
              SalesOrderLine.Description := Description;
              SalesOrderLine."Description 2" := "Description 2";
            END ELSE
              ERROR(Text001);
          END;

          SalesLine := SalesOrderLine;
          SalesLine."Line No." := NextLineNo;
          SalesLine."Document Type" := TempSalesLine."Document Type";
          SalesLine."Document No." := TempSalesLine."Document No.";
          SalesLine."Variant Code" := "Variant Code";
          SalesLine."Location Code" := "Location Code";
          SalesLine."Quantity (Base)" := 0;
          SalesLine.Quantity := 0;
          SalesLine."Outstanding Qty. (Base)" := 0;
          SalesLine."Outstanding Quantity" := 0;
          SalesLine."Quantity Shipped" := 0;
          SalesLine."Qty. Shipped (Base)" := 0;
          SalesLine."Quantity Invoiced" := 0;
          SalesLine."Qty. Invoiced (Base)" := 0;
          SalesLine.Amount := 0;
          SalesLine."Amount Including VAT" := 0;
          SalesLine."Purchase Order No." := '';
          SalesLine."Purch. Order Line No." := 0;
          SalesLine."Drop Shipment" := "Drop Shipment";
          SalesLine."Special Order Purchase No." := '';
          SalesLine."Special Order Purch. Line No." := 0;
          SalesLine."Special Order" := FALSE;
          SalesLine."Shipment No." := "Document No.";
          SalesLine."Shipment Line No." := "Line No.";
          SalesLine."Appl.-to Item Entry" := 0;
          SalesLine."Appl.-from Item Entry" := 0;
          IF NOT ExtTextLine AND (SalesLine.Type <> 0) THEN BEGIN
            SalesLine.VALIDATE(Quantity,Quantity - "Quantity Invoiced");
            SalesLine.VALIDATE("Unit Price",SalesOrderLine."Unit Price");
            SalesLine."Allow Line Disc." := SalesOrderLine."Allow Line Disc.";
            SalesLine."Allow Invoice Disc." := SalesOrderLine."Allow Invoice Disc.";
            SalesOrderLine."Line Discount Amount" :=
              ROUND(
                SalesOrderLine."Line Discount Amount" * SalesLine.Quantity / SalesOrderLine.Quantity,
                Currency."Amount Rounding Precision");
            IF SalesInvHeader."Prices Including VAT" THEN BEGIN
              IF NOT SalesOrderHeader."Prices Including VAT" THEN
                SalesOrderLine."Line Discount Amount" :=
                  ROUND(
                    SalesOrderLine."Line Discount Amount" *
                    (1 + SalesOrderLine."VAT %" / 100),Currency."Amount Rounding Precision");
            END ELSE BEGIN
              IF SalesOrderHeader."Prices Including VAT" THEN
                SalesOrderLine."Line Discount Amount" :=
                  ROUND(
                    SalesOrderLine."Line Discount Amount" /
                    (1 + SalesOrderLine."VAT %" / 100),Currency."Amount Rounding Precision");
            END;
            SalesLine.VALIDATE("Line Discount Amount",SalesOrderLine."Line Discount Amount");
            SalesLine."Line Discount %" := SalesOrderLine."Line Discount %";
            SalesLine.UpdatePrePaymentAmounts;
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
              SalesOrderLine."Line No.",
              NextLineNo,
              SalesOrderLine."Attached to Line No.");
          SalesLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
          SalesLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
          SalesLine."Dimension Set ID" := "Dimension Set ID";
          SalesLine.INSERT;

          ItemTrackingMgt.CopyHandledItemTrkgToInvLine(SalesOrderLine,SalesLine);

          NextLineNo := NextLineNo + 10000;
          IF "Attached to Line No." = 0 THEN
            SETRANGE("Attached to Line No.","Line No.");
        UNTIL (NEXT = 0) OR ("Attached to Line No." = 0);

        IF SalesOrderHeader.GET(SalesOrderHeader."Document Type"::Order,"Order No.") THEN BEGIN
          SalesOrderHeader."Get Shipment Used" := TRUE;
          SalesOrderHeader.MODIFY;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..26
          IF SalesOrderLine.GET(
               SalesOrderLine."Document Type"::Order,"Order No.","Order Line No.")
        #28..90
            SalesLine.VALIDATE(
              "Line Discount Amount",
              ROUND(
                SalesOrderLine."Line Discount Amount" * SalesLine.Quantity / SalesOrderLine.Quantity,
                Currency."Amount Rounding Precision"));
            SalesLine."Line Discount %" := SalesOrderLine."Line Discount %";
            SalesLine.UpdatePrePaymentAmounts;
            SalesSetup.GET;
            IF NOT SalesSetup."Calc. Inv. Discount" THEN
              IF SalesOrderLine.Quantity = 0 THEN
                SalesLine.VALIDATE("Inv. Discount Amount",0)
              ELSE
                SalesLine.VALIDATE(
                  "Inv. Discount Amount",
                  ROUND(
                    SalesOrderLine."Inv. Discount Amount" * SalesLine.Quantity / SalesOrderLine.Quantity,
                    Currency."Amount Rounding Precision"));
        #119..141
        */
    //end;
}

