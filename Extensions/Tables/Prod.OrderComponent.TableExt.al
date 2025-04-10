TableExtension 52193685 tableextension52193685 extends "Prod. Order Component" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Prod. Order Component"(Table 5407)".

    fields
    {

        //Unsupported feature: Code Modification on ""Expected Quantity"(Field 25).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF Item.GET("Item No.") THEN
              IF Item."Rounding Precision" > 0 THEN
                "Expected Quantity" := ROUND("Expected Quantity",Item."Rounding Precision",'>');
            #4..7
            THEN
              CALCFIELDS("Act. Consumption (Qty)");
            "Remaining Quantity" := "Expected Quantity" - "Act. Consumption (Qty)" / "Qty. per Unit of Measure";
            IF ("Remaining Quantity" * "Expected Quantity") <= 0 THEN
              "Remaining Quantity" := 0;
            "Remaining Qty. (Base)" := ROUND("Remaining Quantity" * "Qty. per Unit of Measure",0.00001);
            "Completely Picked" := "Qty. Picked" >= "Expected Quantity";
            #15..20
                "Expected Quantity" *
                (("Direct Unit Cost" * "Indirect Cost %" / 100) + "Overhead Rate"));
            "Direct Cost Amount" := ROUND("Expected Quantity" * "Direct Unit Cost");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..10
            IF ("Remaining Quantity" * "Expected Quantity") < 0 THEN
            #12..23
            */
        //end;


        //Unsupported feature: Code Modification on ""Due Date"(Field 52).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            WhseValidateSourceLine.ProdComponentVerifyChange(Rec,xRec);
            IF NOT Blocked THEN BEGIN
              IF CurrFieldNo <> 0 THEN
                CheckDateConflict.ProdOrderComponentCheck(Rec,TRUE,TRUE)
              ELSE
                IF CheckDateConflict.ProdOrderComponentCheck(Rec,NOT WarningRaised,FALSE) THEN
                  WarningRaised := TRUE;
            END;
            UpdateDatetime;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            WhseValidateSourceLine.ProdComponentVerifyChange(Rec,xRec);
            IF NOT Blocked THEN
              CheckDateConflict.ProdOrderComponentCheck(Rec,CurrFieldNo <> 0);
            UpdateDatetime;
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Status = Status::Finished THEN
          ERROR(Text000);
        IF Status = Status::Released THEN BEGIN
        #4..20
          IF ProdOrderLine.GET(Status,"Prod. Order No.","Supplied-by Line No.") THEN BEGIN
            NewQuantity := ProdOrderLine.Quantity - "Expected Quantity";
            IF NewQuantity = 0 THEN BEGIN
              ProdOrderLine.SetCalledFromComponent(TRUE);
              ProdOrderLine.DELETE(TRUE);
            END ELSE BEGIN
        #27..40
        ItemTrackingMgt.DeleteWhseItemTrkgLines(
          DATABASE::"Prod. Order Component",Status,"Prod. Order No.",'',
          "Prod. Order Line No.","Line No.","Location Code",TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..23
              ProdOrderLine.BlockDynamicTracking(TRUE);
        #24..43
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: RoutingLine) (VariableCollection) on "GetNeededQty(PROCEDURE 3)".



    //Unsupported feature: Code Modification on "GetNeededQty(PROCEDURE 3)".

    //procedure GetNeededQty();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Item.GET("Item No.");
        IF Item."Rounding Precision" = 0 THEN
          Item."Rounding Precision" := 0.00001;
        #4..27
              UNTIL CapLedgEntry.NEXT = 0;
          END;

          CompQtyBase := CostCalcMgt.CalcActNeededQtyBase(ProdOrderLine,Rec,OutputQtyBase);

          IF IncludePreviousPosting THEN BEGIN
            IF Status IN [Status::Released,Status::Finished] THEN
        #35..40
          EXIT(ROUND(CompQtyBase / "Qty. per Unit of Measure",Item."Rounding Precision",'>'));
        END;
        EXIT(ROUND("Remaining Quantity",Item."Rounding Precision"));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..30
          IF ProdOrderRtngLine."Flushing Method" = ProdOrderRtngLine."Flushing Method"::Manual THEN
            OutputQtyBase := (OutputQtyBase - ProdOrderRtngLine."Fixed Scrap Qty. (Accum.)") /
              (1 + ProdOrderRtngLine."Scrap Factor % (Accumulated)");
          CompQtyBase := CostCalcMgt.CalcActNeededQtyBase(ProdOrderLine,Rec,OutputQtyBase);
          RoutingLine.SETRANGE("Routing No.",ProdOrderLine."Routing No.");
          RoutingLine.SETRANGE("Version Code",ProdOrderLine."Routing Version Code");
          IF RoutingLine.FINDFIRST THEN
            CompQtyBase := CompQtyBase * (1 + RoutingLine."Scrap Factor % (Accumulated)") +
              RoutingLine."Fixed Scrap Qty. (Accum.)" * "Quantity (Base)" / ProdOrderLine."Qty. per Unit of Measure";
        #32..43
        */
    //end;
}

