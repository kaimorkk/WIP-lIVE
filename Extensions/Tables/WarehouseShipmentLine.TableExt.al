TableExtension 52193784 tableextension52193784 extends "Warehouse Shipment Line" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Warehouse Shipment Line"(Table 7321)".


    //Unsupported feature: Code Modification on "OpenItemTrackingLines(PROCEDURE 6500)".

    //procedure OpenItemTrackingLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TESTFIELD("No.");
        TESTFIELD("Qty. (Base)");

        GetItem;
        Item.TESTFIELD("Item Tracking Code");

        SecondSourceQtyArray[1] := DATABASE::"Warehouse Shipment Line";
        SecondSourceQtyArray[2] := "Qty. to Ship (Base)";
        SecondSourceQtyArray[3] := 0;

        CASE "Source Type" OF
          DATABASE::"Sales Line":
            BEGIN
              IF SalesLine.GET("Source Subtype","Source No.","Source Line No.") THEN
                ReserveSalesLine.CallItemTrackingSecondSource(SalesLine,SecondSourceQtyArray,"Assemble to Order");
            END;
          DATABASE::"Service Line":
            BEGIN
        #19..30
                ReserveTransferLine.CallItemTracking2(TransferLine,Direction,SecondSourceQtyArray);
            END
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
        SecondSourceQtyArray[1] := DATABASE::"Warehouse Receipt Line";
        #8..14
                ReserveSalesLine.CallItemTracking2(SalesLine,SecondSourceQtyArray);
        #16..33
        */
    //end;
}

