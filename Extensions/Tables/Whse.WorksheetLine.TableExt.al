TableExtension 52193786 tableextension52193786 extends "Whse. Worksheet Line" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""From Unit of Measure Code"(Field 27).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Item No." <> '' THEN BEGIN
              GetItemUnitOfMeasure;
              IF NOT FromItemUnitOfMeasure.GET(Item."No.","From Unit of Measure Code") THEN
                FromItemUnitOfMeasure.GET(Item."No.",Item."Base Unit of Measure");
              "Qty. per From Unit of Measure" := FromItemUnitOfMeasure."Qty. per Unit of Measure";
            END ELSE
              "Qty. per From Unit of Measure" := 1;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF "Item No." <> '' THEN BEGIN
              FromItemUnitOfMeasure.GET(Item."No.","From Unit of Measure Code");
            #5..7
            */
        //end;
    }

    //Unsupported feature: Variable Insertion (Variable: WhseActivLine) (VariableCollection) on "CheckAvailableQtyBase(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: AvailableQtyBase) (VariableCollection) on "CheckAvailableQtyBase(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: LineReservedQtyBase) (VariableCollection) on "CheckAvailableQtyBase(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "CheckAvailableQtyBase(PROCEDURE 2)".

    //procedure CheckAvailableQtyBase();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        AvailableQtyToPickBase := CalcAvailableQtyBase(FALSE);
        IF FIELDNO("Qty. to Handle") IN [CurrFieldNo,CurrentFieldNo] THEN
          AvailableQtyToPickBase += xRec."Qty. to Handle (Base)";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        LineReservedQtyBase :=
          WhseAvailMgt.CalcLineReservedQtyOnInvt(
            "Source Type","Source Subtype","Source No.",
            "Source Line No.","Source Subline No.",
            TRUE,'','',WhseActivLine);

        AvailableQtyBase := CalcAvailableQtyBase(FALSE);
        AvailableQtyToPickBase := AvailableQtyBase + LineReservedQtyBase;
        IF FIELDNO("Qty. to Handle") IN [CurrFieldNo,CurrentFieldNo] THEN
          AvailableQtyToPickBase += xRec."Qty. to Handle (Base)";
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: WhseActivLine) (VariableCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29)".



    //Unsupported feature: Code Modification on "AssignedQtyOnReservedLines(PROCEDURE 29)".

    //procedure AssignedQtyOnReservedLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WhseWkshLine.SETCURRENTKEY(
          "Item No.","Location Code","Worksheet Template Name","Variant Code");
        WhseWkshLine.SETRANGE("Item No.","Item No.");
        #4..11
                  WhseWkshLine."Source Type",WhseWkshLine."Source Subtype",
                  WhseWkshLine."Source No.",WhseWkshLine."Source Line No.",
                  WhseWkshLine."Source Subline No.",
                  TRUE,'','',TempWhseActivLine));
            IF LineReservedQtyBase > 0 THEN BEGIN
              IF LineReservedQtyBase <= WhseWkshLine."Qty. to Handle (Base)" THEN
                ReservedAndAssignedBase := LineReservedQtyBase
        #19..21
            END;
          UNTIL WhseWkshLine.NEXT = 0;
        EXIT(TotalReservedAndAssignedBase);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..14
                  TRUE,'','',WhseActivLine));
        #16..24
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: WhseActivLine) (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1)".



    //Unsupported feature: Code Modification on "CalcAvailableQtyBase(PROCEDURE 1)".

    //procedure CalcAvailableQtyBase();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetItem("Item No.",Description);
        Item2 := Item;
        GetLocation("Location Code");
        #4..6
          Item2.SETRANGE("Variant Filter","Variant Code");
          Item2.CALCFIELDS("Reserved Qty. on Inventory");
          QtyReservedOnPickShip :=
            WhseAvailMgt.CalcReservQtyOnPicksShips("Location Code","Item No.","Variant Code",TempWhseActivLine);
          QtyAssgndOnWkshBase := WhseAvailMgt.CalcQtyAssgndOnWksh(Rec,NOT Location."Allow Breakbulk",ExcludeLine);
          AvailQtyBase :=
            CreatePick.CalcTotalAvailQtyToPick(
              "Location Code","Item No.","Variant Code",'','',"Source Type","Source Subtype","Source No.","Source Line No.",
              "Source Subline No.","Qty. to Handle (Base)",FALSE);
        END ELSE BEGIN
          IF Location."Require Pick" THEN
            QtyReservedOnPickShip :=
              WhseAvailMgt.CalcReservQtyOnPicksShips("Location Code","Item No.","Variant Code",TempWhseActivLine) +
              QtyReservedOnPickShip;

          QtyAssgndOnWkshBase := WhseAvailMgt.CalcQtyAssgndOnWksh(Rec,TRUE,FALSE);
          AvailQtyBase := WhseAvailMgt.CalcInvtAvailQty(Item2,Location,"Variant Code",TempWhseActivLine) + QtyReservedOnPickShip;
        END;

        AvailableQty := AvailQtyBase - QtyAssgndOnWkshBase + AssignedQtyOnReservedLines;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..9
            WhseAvailMgt.CalcReservQtyOnPicksShips("Location Code","Item No.","Variant Code",WhseActivLine);
          QtyAssgndOnWkshBase := WhseAvailMgt.CalcQtyAssgndOnWksh(Rec,NOT Location."Allow Breakbulk",ExcludeLine);
          AvailQtyBase :=
            CalcAvailWhseQtyBase("Location Code","Item No.","Variant Code","Unit of Measure Code") -
            ABS(Item2."Reserved Qty. on Inventory") + QtyReservedOnPickShip;
        #16..18
              WhseAvailMgt.CalcReservQtyOnPicksShips("Location Code","Item No.","Variant Code",WhseActivLine) + QtyReservedOnPickShip;

          QtyAssgndOnWkshBase := WhseAvailMgt.CalcQtyAssgndOnWksh(Rec,TRUE,FALSE);
          AvailQtyBase := WhseAvailMgt.CalcInvtAvailQty(Item2,Location,"Variant Code",WhseActivLine) + QtyReservedOnPickShip;
        #24..26
        */
    //end;


    //Unsupported feature: Code Modification on "GetBin(PROCEDURE 19)".

    //procedure GetBin();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF (LocationCode = '') OR (BinCode = '') THEN
          CLEAR(Bin)
        ELSE
          IF (Bin."Location Code" <> LocationCode) OR
             (Bin.Code <> BinCode)
          THEN
            Bin.GET(LocationCode,BinCode);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF (LocationCode = '') OR (BinCode = '') THEN
          Bin.INIT
        #3..7
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: WhseActivLine) (VariableCollection) on "AvailableQtyToPickBase(PROCEDURE 27)".



    //Unsupported feature: Code Modification on "AvailableQtyToPickBase(PROCEDURE 27)".

    //procedure AvailableQtyToPickBase();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetLocation("Location Code");
        LineReservedQtyBase :=
          WhseAvailMgt.CalcLineReservedQtyOnInvt(
            "Source Type","Source Subtype","Source No.",
            "Source Line No.","Source Subline No.",
            TRUE,'','',TempWhseActivLine);
        IF NOT Location."Directed Put-away and Pick" THEN BEGIN
          GetItem("Item No.",ItemDescription);
          Item.CALCFIELDS("Reserved Qty. on Inventory");
        #10..15
        TotalAvailQtyToPickBase :=
          CreatePick.CalcTotalAvailQtyToPick(
            "Location Code","Item No.","Variant Code",'','',
            "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",0,FALSE);

        AvailQtyBase :=
          CalcAvailWhseQtyBase("Location Code","Item No.","Variant Code","Unit of Measure Code");
        #23..37
        IF TotalAvailQtyToPickBase > 0 THEN
          EXIT(TotalAvailQtyToPickBase);
        EXIT(0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
            TRUE,'','',WhseActivLine);
        #7..18
            "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",0);
        #20..40
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "AssignedQtyOnReservedLines(PROCEDURE 29).TempWhseActivLine(Variable 1002)".


    //Unsupported feature: Deletion (VariableCollection) on "CalcAvailableQtyBase(PROCEDURE 1).TempWhseActivLine(Variable 1001)".


    //Unsupported feature: Deletion (VariableCollection) on "AvailableQtyToPickBase(PROCEDURE 27).TempWhseActivLine(Variable 1006)".

}

