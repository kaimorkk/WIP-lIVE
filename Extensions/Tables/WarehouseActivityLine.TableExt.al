TableExtension 52193714 tableextension52193714 extends "Warehouse Activity Line" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Warehouse Activity Line"(Table 5767)".

    fields
    {

        //Unsupported feature: Code Modification on ""Qty. to Handle"(Field 26).OnValidate".

        //trigger  to Handle"(Field 26)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Qty. to Handle" > "Qty. Outstanding" THEN
              ERROR(
                Text002,
            #4..34
            THEN
              CheckReservedItemTrkg(1,"Lot No.");

            IF ("Qty. to Handle" = 0) AND RegisteredWhseActLineIsEmpty THEN
              UpdateReservation(Rec,FALSE)
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..37
            IF "Qty. to Handle" = 0 THEN
              UpdateReservation(Rec)
            */
        //end;


        //Unsupported feature: Code Modification on ""Bin Code"(Field 7300).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckBinInSourceDoc;

            IF "Bin Code" <> '' THEN
            #4..39
                        AvailableQty :=
                          CreatePick.CalcTotalAvailQtyToPick(
                            "Location Code","Item No.","Variant Code","Lot No.","Serial No.",
                            "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",0,FALSE);
                        AvailableQty := AvailableQty + "Qty. Outstanding (Base)";
                        IF AvailableQty < 0 THEN
                          AvailableQty := 0;

                        IF AvailableQty = 0 THEN
                          ERROR(Text015);
                      END ELSE
                        AvailableQty := QtyAvail;

            #53..84
                  END ELSE BEGIN
                    IF "Qty. to Handle" > 0 THEN
                      CheckIncreaseCapacity(FALSE);
                    xRec.DeleteBinContent(xRec."Action Type"::Place);
                  END;
                END;
                Dedicated := Bin.Dedicated;
            #92..94
                  "Zone Code" := Bin."Zone Code";
                END;
              END ELSE BEGIN
                xRec.DeleteBinContent(xRec."Action Type"::Place);
                Dedicated := FALSE;
                "Bin Ranking" := 0;
                "Bin Type Code" := '';
              END;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..42
                            "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",0);
            #44..49
                        IF "Bin Code" <> '' THEN BEGIN
                          IF "Qty. to Handle" <> 0 THEN
                            CreatePick.CheckReservation(
                              AvailableQty,"Location Code","Source Type","Source Subtype","Source No.",
                              "Source Line No.","Source Subline No.","Qty. per Unit of Measure",
                              "Qty. to Handle","Qty. to Handle (Base)");
                          CreatePick.GetReservationStatus(ReservationExists,ReservedForItemLedgEntry);
                          IF ReservationExists AND NOT ReservedForItemLedgEntry THEN
                            ERROR(Text016,"Item No.");
                        END;
            #50..87
                    DeleteBinContent(xRec);
            #89..97
            #99..103
            */
        //end;

        //Unsupported feature: Property Deletion (TableRelation) on ""Bin Code"(Field 7300)".



        //Unsupported feature: Code Modification on ""Zone Code"(Field 7301).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF xRec."Zone Code" <> "Zone Code" THEN BEGIN
              GetLocation("Location Code");
              Location.TESTFIELD("Directed Put-away and Pick");
              xRec.DeleteBinContent(xRec."Action Type"::Place);
              "Bin Code" := '';
              "Bin Ranking" := 0;
              "Bin Type Code" := '';
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..3
              IF "Action Type" = "Action Type"::Place THEN
                DeleteBinContent(xRec);
            #5..8
            */
        //end;
    }


    //Unsupported feature: Code Modification on "DeleteRelatedWhseActivLines(PROCEDURE 13)".

    //procedure DeleteRelatedWhseActivLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH WhseActivLine DO BEGIN
          IF ("Activity Type" IN ["Activity Type"::"Invt. Put-away","Activity Type"::"Invt. Pick"]) AND
             (NOT CalledFromHeader)
        #4..61
          IF WhseActivLine2.FIND('-') THEN
            REPEAT
              WhseActivLine2.DELETE; // to ensure correct item tracking update
              WhseActivLine2.DeleteBinContent(WhseActivLine2."Action Type"::Place);
              UpdateRelatedItemTrkg(WhseActivLine2);
            UNTIL WhseActivLine2.NEXT = 0;
          IF (NOT CalledFromHeader) AND
        #69..74
              MESSAGE(Text013);
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..64
              DeleteBinContent(WhseActivLine2);
        #66..77
        */
    //end;


    //Unsupported feature: Code Modification on "SplitLine(PROCEDURE 27)".

    //procedure SplitLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WhseActivLine.TESTFIELD("Qty. to Handle");
        IF WhseActivLine."Activity Type" = WhseActivLine."Activity Type"::"Put-away" THEN BEGIN
          IF WhseActivLine."Breakbulk No." <> 0 THEN
        #4..14
        ELSE
          LineSpacing := 10000;

        IF LineSpacing = 0 THEN BEGIN
          ReNumberAllLines(NewWhseActivLine,WhseActivLine."Line No.",NewLineNo);
          WhseActivLine.GET(WhseActivLine."Activity Type",WhseActivLine."No.",NewLineNo);
          LineSpacing := 5000;
        END;

        NewWhseActivLine.RESET;
        NewWhseActivLine.INIT;
        NewWhseActivLine := WhseActivLine;
        #27..62
            WhseActivLine."Item No.",WhseActivLine."Unit of Measure Code",
            WhseActivLine."Qty. to Handle",WhseActivLine.Cubage,WhseActivLine.Weight);
        WhseActivLine.MODIFY;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..17
        #24..65
        */
    //end;


    //Unsupported feature: Code Modification on "ShowWhseDoc(PROCEDURE 22)".

    //procedure ShowWhseDoc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Whse. Document Type" OF
          "Whse. Document Type"::Shipment:
            BEGIN
        #4..13
          "Whse. Document Type"::"Internal Pick":
            BEGIN
              WhseIntPickHeader.SETRANGE("No.","Whse. Document No.");
              WhseIntPickHeader.FINDFIRST;
              WhseIntPickCard.SETRECORD(WhseIntPickHeader);
              WhseIntPickCard.SETTABLEVIEW(WhseIntPickHeader);
              WhseIntPickCard.RUNMODAL;
            END;
          "Whse. Document Type"::"Internal Put-away":
            BEGIN
              WhseIntPutawayHeader.SETRANGE("No.","Whse. Document No.");
              WhseIntPutawayHeader.FINDFIRST;
              WhseIntPutawayCard.SETRECORD(WhseIntPutawayHeader);
              WhseIntPutawayCard.SETTABLEVIEW(WhseIntPutawayHeader);
              WhseIntPutawayCard.RUNMODAL;
            END;
        #30..39
              PAGE.RUNMODAL(PAGE::"Assembly Order",AssemblyHeader);
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..16
        #19..24
        #27..42
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateRelatedItemTrkg(PROCEDURE 3)".

    //procedure UpdateRelatedItemTrkg();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF (WhseActivLine."Serial No." <> '') OR (WhseActivLine."Lot No." <> '') THEN BEGIN
          WhseItemTrkgLine.SETCURRENTKEY("Serial No.","Lot No.");
          WhseItemTrkgLine.SETRANGE("Serial No.",WhseActivLine."Serial No.");
        #4..63
          IF WhseItemTrkgLine.FIND('-') THEN
            REPEAT
              ItemTrackingMgt.CalcWhseItemTrkgLine(WhseItemTrkgLine);
              UpdateReservation(WhseActivLine,TRUE);
              IF ((WhseActivLine."Whse. Document Type" IN
                   [WhseActivLine."Whse. Document Type"::Production,WhseActivLine."Whse. Document Type"::Assembly]) OR
                  (WhseActivLine."Activity Type" = WhseActivLine."Activity Type"::"Invt. Movement")) AND
        #71..74
                WhseItemTrkgLine.MODIFY;
            UNTIL WhseItemTrkgLine.NEXT = 0;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..66
              UpdateReservation(WhseActivLine);
        #68..77
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: WhseActivLine) (VariableCollection) on "CheckReservedItemTrkg(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "CheckReservedItemTrkg(PROCEDURE 7)".

    //procedure CheckReservedItemTrkg();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ("Activity Type" = "Activity Type"::"Invt. Pick") AND "Assemble to Order" THEN
          EXIT;
        CASE CheckType OF
        #4..30
              Item.CALCFIELDS(Inventory,"Reserved Qty. on Inventory");
              LineReservedQty :=
                WhseAvailMgt.CalcLineReservedQtyOnInvt(
                  "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",TRUE,'',
                  ItemTrkgCode,TempWhseActivLine);
              ReservEntry.SETCURRENTKEY("Item No.","Variant Code","Location Code","Reservation Status");
              ReservEntry.SETRANGE("Item No.","Item No.");
              ReservEntry.SETRANGE("Variant Code","Variant Code");
        #39..57

              IF (Item.Inventory - ABS(Item."Reserved Qty. on Inventory") +
                  LineReservedQty + AvailQtyFromOtherResvLines +
                  WhseAvailMgt.CalcReservQtyOnPicksShips("Location Code","Item No.","Variant Code",TempWhseActivLine)) <
                 "Qty. to Handle (Base)"
              THEN
                ERROR(Text017,FIELDCAPTION("Lot No."),ItemTrkgCode);
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..33
                  "Source Type","Source Subtype","Source No.","Source Line No.","Source Subline No.",TRUE,'',ItemTrkgCode,WhseActivLine);
        #36..60
                  WhseAvailMgt.CalcReservQtyOnPicksShips("Location Code","Item No.","Variant Code",WhseActivLine)) <
        #62..66
        */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: WhseActivLine) (ParameterCollection) on "DeleteBinContent(PROCEDURE 21)".


    //Unsupported feature: Property Insertion (Local) on "DeleteBinContent(PROCEDURE 21)".



    //Unsupported feature: Code Modification on "DeleteBinContent(PROCEDURE 21)".

    //procedure DeleteBinContent();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Action Type" <> ActionType THEN
          EXIT;

        IF BinContent.GET("Location Code","Bin Code","Item No.","Variant Code","Unit of Measure Code") THEN
          IF NOT BinContent.Fixed THEN BEGIN
            BinContent.CALCFIELDS("Quantity (Base)","Positive Adjmt. Qty. (Base)","Put-away Quantity (Base)");
            IF (BinContent."Quantity (Base)" = 0) AND
               (BinContent."Positive Adjmt. Qty. (Base)" = 0) AND
               (BinContent."Put-away Quantity (Base)" - "Qty. Outstanding (Base)" <= 0)
            THEN
              BinContent.DELETE;
          END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        WITH WhseActivLine DO BEGIN
          IF "Action Type" <> "Action Type"::Place THEN
            EXIT;

          IF BinContent.GET("Location Code","Bin Code","Item No.","Variant Code","Unit of Measure Code") THEN
            IF NOT BinContent.Fixed THEN BEGIN
              BinContent.CALCFIELDS("Quantity (Base)","Positive Adjmt. Qty. (Base)","Put-away Quantity (Base)");
              IF (BinContent."Quantity (Base)" = 0) AND
                 (BinContent."Positive Adjmt. Qty. (Base)" = 0) AND
                 (BinContent."Put-away Quantity (Base)" - "Qty. Outstanding (Base)" <= 0)
              THEN
                BinContent.DELETE;
            END;
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateReservation(PROCEDURE 90)".

    //procedure UpdateReservation();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH TempWhseActivLine2 DO BEGIN
          IF ("Action Type" <> "Action Type"::Take) AND ("Breakbulk No." = 0) AND
             ("Whse. Document Type" = "Whse. Document Type"::Shipment)
        #4..15
            TempTrackingSpecification.INSERT;
          END;
          ItemTrackingMgt.SetPick("Activity Type" = "Activity Type"::Pick);
          ItemTrackingMgt.SynchronizeWhseItemTracking(TempTrackingSpecification,'',Deletion);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..18
          ItemTrackingMgt.SynchronizeWhseItemTracking(TempTrackingSpecification,'');
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "InitTrackingSpecFromWhseActivLine(PROCEDURE 37)".

    //procedure InitTrackingSpecFromWhseActivLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH WhseActivityLine DO BEGIN
          TrackingSpecification.INIT;
          TrackingSpecification."Source Type" := "Source Type";
        #4..9
          TrackingSpecification."Qty. per Unit of Measure" := "Qty. per Unit of Measure";
          TrackingSpecification."Serial No." := "Serial No.";
          TrackingSpecification."Lot No." := "Lot No.";
          TrackingSpecification."Expiration Date" := "Expiration Date";
          TrackingSpecification."Bin Code" := "Bin Code";
          TrackingSpecification."Source Batch Name" := '';
          TrackingSpecification."Source Prod. Order Line" := "Source Subline No.";
          TrackingSpecification."Source Ref. No." := "Source Line No.";
          TrackingSpecification."Qty. to Handle (Base)" := "Qty. to Handle (Base)";
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..12
        #14..19
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "SplitLine(PROCEDURE 27).NewLineNo(Variable 1005)".


    //Unsupported feature: Deletion (VariableCollection) on "CheckReservedItemTrkg(PROCEDURE 7).TempWhseActivLine(Variable 1005)".


    //Unsupported feature: Deletion (ParameterCollection) on "DeleteBinContent(PROCEDURE 21).ActionType(Parameter 1002)".


    //Unsupported feature: Deletion (ParameterCollection) on "UpdateReservation(PROCEDURE 90).Deletion(Parameter 1002)".


    var
        ReservationExists: Boolean;
        ReservedForItemLedgEntry: Boolean;

    var
        Text016: label 'Reserved item %1 is not on inventory.';
}

