TableExtension 52193712 tableextension52193712 extends "Transfer Line" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Transfer Line"(Table 5741)".

    fields
    {

        //Unsupported feature: Deletion (FieldCollection) on ""Appl.-to Item Entry"(Field 43)".

    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Item No.","Variant Code"(Key)".
        // 
        // key(Key1;"Item No.")
        // {
        // }
    }


    //Unsupported feature: Code Modification on "InitQtyInTransit(PROCEDURE 4)".

    //procedure InitQtyInTransit();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Qty. in Transit" := "Quantity Shipped" - "Quantity Received";
        "Qty. in Transit (Base)" := "Qty. Shipped (Base)" - "Qty. Received (Base)";
        "Completely Received" := (Quantity <> 0) AND (Quantity = "Quantity Received");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "Qty. in Transit" := "Quantity Shipped" - "Quantity Received";
        "Qty. in Transit (Base)" := "Qty. Shipped (Base)" - "Qty. Received (Base)";
        "Completely Received" := ("Quantity Shipped" <> 0) AND ("Qty. in Transit" = 0);
        */
    //end;


    //Unsupported feature: Code Modification on "ValidateShortcutDimCode(PROCEDURE 29)".

    //procedure ValidateShortcutDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
        VerifyItemLineDim;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
        */
    //end;


    //Unsupported feature: Code Modification on "FilterLinesWithItemToPlan(PROCEDURE 70)".

    //procedure FilterLinesWithItemToPlan();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RESET;
        SETCURRENTKEY("Item No.");
        SETRANGE("Item No.",Item."No.");
        #4..9
        END ELSE BEGIN
          SETFILTER("Transfer-from Code",Item.GETFILTER("Location Filter"));
          SETFILTER("Shipment Date",Item.GETFILTER("Date Filter"));
          SETFILTER("Outstanding Qty. (Base)",'<>0');
        END;
        SETFILTER("Shortcut Dimension 1 Code",Item.GETFILTER("Global Dimension 1 Filter"));
        SETFILTER("Shortcut Dimension 2 Code",Item.GETFILTER("Global Dimension 2 Filter"));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..12
        #14..16
        SETFILTER("Outstanding Qty. (Base)",'<>0');
        */
    //end;


    //Unsupported feature: Code Modification on "VerifyItemLineDim(PROCEDURE 87)".

    //procedure VerifyItemLineDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF IsShippedDimChanged THEN
          ConfirmShippedDimChange;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF "Dimension Set ID" <> xRec."Dimension Set ID" THEN
          IF ("Quantity Shipped" <> 0) OR ("Qty. Shipped (Base)" <> 0)THEN
            IF NOT CONFIRM(Text012,FALSE,TABLECAPTION) THEN
              ERROR(Text013);
        */
    //end;
}

