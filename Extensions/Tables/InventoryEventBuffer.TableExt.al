TableExtension 52193690 tableextension52193690 extends "Inventory Event Buffer" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Entry No."(Field 1)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Source Line ID"(Field 9)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Item No."(Field 10)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Variant Code"(Field 11)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Location Code"(Field 12)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Availability Date"(Field 14)".


        //Unsupported feature: Property Deletion (DataClassification) on "Type(Field 15)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Remaining Quantity (Base)"(Field 20)".


        //Unsupported feature: Property Deletion (DataClassification) on "Positive(Field 21)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Transfer Direction"(Field 22)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Reserved Quantity (Base)"(Field 23)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Action Message"(Field 29)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Attached to Line No."(Field 31)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Forecast Type"(Field 32)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Derived from Blanket Order"(Field 33)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Ref. Order No."(Field 34)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Orig. Quantity (Base)"(Field 35)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Ref. Order Type"(Field 37)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Ref. Order Line No."(Field 38)".

    }

    //Unsupported feature: Code Modification on "TransferInventoryQty(PROCEDURE 6)".

    //procedure TransferInventoryQty();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        INIT;
        RecRef.GETTABLE(ItemLedgEntry);
        "Source Line ID" := RecRef.RECORDID;
        "Item No." := ItemLedgEntry."Item No.";
        "Variant Code" := ItemLedgEntry."Variant Code";
        "Location Code" := ItemLedgEntry."Location Code";
        "Availability Date" := 0D;
        Type := Type::Inventory;
        "Remaining Quantity (Base)" := ItemLedgEntry."Remaining Quantity";

        "Reserved Quantity (Base)" := CalcReservedQuantity(ItemLedgEntry);

        Positive := NOT ("Remaining Quantity (Base)" < 0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
        ItemLedgEntry.CALCFIELDS("Reserved Quantity");
        "Remaining Quantity (Base)" := ItemLedgEntry."Remaining Quantity";
        "Reserved Quantity (Base)" := ItemLedgEntry."Reserved Quantity";
        Positive := NOT ("Remaining Quantity (Base)" < 0);
        */
    //end;


    //Unsupported feature: Code Modification on "TransferFromPurchase(PROCEDURE 7)".

    //procedure TransferFromPurchase();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF PurchLine.Type <> PurchLine.Type::Item THEN
          EXIT;

        #4..10
        Type := Type::Purchase;
        PurchLine.CALCFIELDS("Reserved Qty. (Base)");
        "Remaining Quantity (Base)" := -PurchLineReserve.ReservQuantity(PurchLine);
        "Reserved Quantity (Base)" := PurchLine."Reserved Qty. (Base)";
        Positive := NOT ("Remaining Quantity (Base)" < 0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..13
        "Reserved Quantity (Base)" := -PurchLine."Reserved Qty. (Base)";
        Positive := NOT ("Remaining Quantity (Base)" < 0);
        */
    //end;


    //Unsupported feature: Code Modification on "TransferFromPurchReturn(PROCEDURE 17)".

    //procedure TransferFromPurchReturn();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF PurchLine.Type <> PurchLine.Type::Item THEN
          EXIT;

        #4..10
        Type := Type::Purchase;
        PurchLine.CALCFIELDS("Reserved Qty. (Base)");
        "Remaining Quantity (Base)" := -PurchLineReserve.ReservQuantity(PurchLine);
        "Reserved Quantity (Base)" := PurchLine."Reserved Qty. (Base)";
        Positive := NOT ("Remaining Quantity (Base)" < 0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..13
        "Reserved Quantity (Base)" := -PurchLine."Reserved Qty. (Base)";
        Positive := NOT ("Remaining Quantity (Base)" < 0);
        */
    //end;


    //Unsupported feature: Code Modification on "TransferFromInboundTransOrder(PROCEDURE 14)".

    //procedure TransferFromInboundTransOrder();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        INIT;
        RecRef.GETTABLE(TransLine);
        "Source Line ID" := RecRef.RECORDID;
        "Item No." := TransLine."Item No.";
        "Variant Code" := TransLine."Variant Code";
        "Location Code" := TransLine."Transfer-to Code";
        "Availability Date" := TransLine."Receipt Date";
        Type := Type::Transfer;
        TransLine.CALCFIELDS("Reserved Qty. Inbnd. (Base)","Reserved Qty. Shipped (Base)");
        "Remaining Quantity (Base)" := TransLine."Quantity (Base)" - TransLine."Qty. Received (Base)";
        "Reserved Quantity (Base)" := TransLine."Reserved Qty. Inbnd. (Base)" + TransLine."Reserved Qty. Shipped (Base)";
        Positive := NOT ("Remaining Quantity (Base)" < 0);
        "Transfer Direction" := "Transfer Direction"::Inbound;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
        TransLine.CALCFIELDS("Reserved Qty. Inbnd. (Base)");
        "Remaining Quantity (Base)" := TransLine."Quantity (Base)" - TransLine."Qty. Received (Base)";
        "Reserved Quantity (Base)" := TransLine."Reserved Qty. Inbnd. (Base)";
        Positive := NOT ("Remaining Quantity (Base)" < 0);
        "Transfer Direction" := "Transfer Direction"::Inbound;
        */
    //end;
}

