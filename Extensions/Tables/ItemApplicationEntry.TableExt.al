TableExtension 52193534 tableextension52193534 extends "Item Application Entry" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Created By User"(Field 26)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Last Modified By User"(Field 28)".

    }

    //Unsupported feature: Code Modification on "CheckCyclicProdCyclicalLoop(PROCEDURE 1100)".

    //procedure CheckCyclicProdCyclicalLoop();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT IsItemEverOutput(ItemLedgEntry."Item No.") THEN
          EXIT(FALSE);

        #4..18
        ItemLedgEntry.SETRANGE("Order No.",ItemLedgEntry."Order No.");
        ItemLedgEntry.SETRANGE("Order Line No.",ItemLedgEntry."Order Line No.");
        ItemLedgEntry.SETRANGE("Entry Type",ItemLedgEntry."Entry Type"::Output);
        IF MaxValuationDate <> 0D THEN
          ItemLedgEntry.SETRANGE("Posting Date",0D,MaxValuationDate);
        IF ItemLedgEntry.FINDSET THEN
          REPEAT
            IF TrackChain THEN
        #27..36
                EXIT(TRUE);
          UNTIL ItemLedgEntry.NEXT = 0;
        EXIT(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..21
        #24..39
        */
    //end;


    //Unsupported feature: Code Modification on "CheckCyclicAsmCyclicalLoop(PROCEDURE 1101)".

    //procedure CheckCyclicAsmCyclicalLoop();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ItemLedgEntry."Order Type" <> ItemLedgEntry."Order Type"::Assembly THEN
          EXIT(FALSE);
        IF ItemLedgEntry."Entry Type" = ItemLedgEntry."Entry Type"::"Assembly Output" THEN
        #4..13
        ItemLedgEntry.SETRANGE("Order Type",ItemLedgEntry."Order Type");
        ItemLedgEntry.SETRANGE("Order No.",ItemLedgEntry."Order No.");
        ItemLedgEntry.SETRANGE("Entry Type",ItemLedgEntry."Entry Type"::"Assembly Output");
        IF MaxValuationDate <> 0D THEN
          ItemLedgEntry.SETRANGE("Posting Date",0D,MaxValuationDate);
        IF ItemLedgEntry.FINDSET THEN
          REPEAT
            IF TrackChain THEN
        #22..31
                EXIT(TRUE);
          UNTIL ItemLedgEntry.NEXT = 0;
        EXIT(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..16
        #19..34
        */
    //end;


    //Unsupported feature: Code Modification on "CheckCyclicFwdToAppliedEntries(PROCEDURE 8)".

    //procedure CheckCyclicFwdToAppliedEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF EntryIsVisited(FromEntryNo) THEN
          EXIT(FALSE);

        REPEAT
          IF IsPositiveToNegativeFlow THEN
            ToEntryNo := ItemApplnEntry."Outbound Item Entry No."
          ELSE
            ToEntryNo := ItemApplnEntry."Inbound Item Entry No.";

          ValueEntry.SETCURRENTKEY("Item Ledger Entry No.","Valuation Date");
          ValueEntry.SETRANGE("Item Ledger Entry No.",ItemApplnEntry."Item Ledger Entry No.");
          ValueEntry.FINDLAST;
          IF (MaxValuationDate = 0D) OR (ValueEntry."Valuation Date" <= MaxValuationDate) THEN BEGIN
            IF TrackChain THEN
              IF NOT ItemLedgEntryInChainNo.GET(ToEntryNo) THEN BEGIN
                ItemLedgEntryInChainNo.Number := ToEntryNo;
                ItemLedgEntryInChainNo.INSERT;
              END;

            IF ToEntryNo = CheckItemLedgEntry."Entry No." THEN
              EXIT(TRUE);
            IF CheckCyclicFwdToAppliedOutbnds(CheckItemLedgEntry,ToEntryNo) THEN
              EXIT(TRUE);
            IF CheckCyclicFwdToAppliedInbnds(CheckItemLedgEntry,ToEntryNo) THEN
              EXIT(TRUE);
            IF CheckCyclicFwdToProdOutput(CheckItemLedgEntry,ToEntryNo) THEN
              EXIT(TRUE);
            IF CheckCyclicFwdToAsmOutput(CheckItemLedgEntry,ToEntryNo) THEN
              EXIT(TRUE);
          END;
        UNTIL ItemApplnEntry.NEXT = 0;
        EXIT(CheckCyclicFwdToInbndTransfers(CheckItemLedgEntry,FromEntryNo));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..9
          IF TrackChain THEN
            IF NOT ItemLedgEntryInChainNo.GET(ToEntryNo) THEN BEGIN
              ItemLedgEntryInChainNo.Number := ToEntryNo;
              ItemLedgEntryInChainNo.INSERT;
            END;

          IF ToEntryNo = CheckItemLedgEntry."Entry No." THEN
            EXIT(TRUE);
          IF CheckCyclicFwdToAppliedOutbnds(CheckItemLedgEntry,ToEntryNo) THEN
            EXIT(TRUE);
          IF CheckCyclicFwdToAppliedInbnds(CheckItemLedgEntry,ToEntryNo) THEN
            EXIT(TRUE);
          IF CheckCyclicFwdToProdOutput(CheckItemLedgEntry,ToEntryNo) THEN
            EXIT(TRUE);
          IF CheckCyclicFwdToAsmOutput(CheckItemLedgEntry,ToEntryNo) THEN
            EXIT(TRUE);
        UNTIL ItemApplnEntry.NEXT = 0;
        EXIT(CheckCyclicFwdToInbndTransfers(CheckItemLedgEntry,FromEntryNo));
        */
    //end;


    //Unsupported feature: Code Modification on "GetVisitedEntries(PROCEDURE 15)".

    //procedure GetVisitedEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        MaxValuationDate := 0D;
        IF WithinValuationDate THEN BEGIN
          ValueEntry.SETCURRENTKEY("Item Ledger Entry No.","Valuation Date");
          ValueEntry.SETRANGE("Item Ledger Entry No.",FromItemLedgEntry."Entry No.");
          ValueEntry.FINDLAST;
          AvgCostAdjmtEntryPoint.SETRANGE("Item No.",FromItemLedgEntry."Item No.");
          IF NOT AvgCostAdjmtEntryPoint.IsAvgCostCalcTypeItem(ValueEntry."Valuation Date") THEN BEGIN
            AvgCostAdjmtEntryPoint.SETRANGE("Variant Code",FromItemLedgEntry."Variant Code");
            AvgCostAdjmtEntryPoint.SETRANGE("Location Code",FromItemLedgEntry."Location Code");
          END;
          AvgCostAdjmtEntryPoint.SETRANGE("Valuation Date",ValueEntry."Valuation Date",99991231D);
          IF AvgCostAdjmtEntryPoint.FINDFIRST THEN
            MaxValuationDate := AvgCostAdjmtEntryPoint."Valuation Date"
        END;

        TrackChain := TRUE;
        ItemLedgEntryInChain.RESET;
        ItemLedgEntryInChain.DELETEALL;
        DummyItemLedgEntry.INIT;
        DummyItemLedgEntry."Entry No." := -1;
        CheckIsCyclicalLoop(DummyItemLedgEntry,FromItemLedgEntry);
        IF ItemLedgEntryInChainNo.FINDSET THEN
          REPEAT
            ToItemLedgEntry.GET(ItemLedgEntryInChainNo.Number);
            ItemLedgEntryInChain := ToItemLedgEntry;
            ItemLedgEntryInChain.INSERT;
          UNTIL ItemLedgEntryInChainNo.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #16..27
        */
    //end;


    //Unsupported feature: Code Modification on "SetOutboundsNotUpdated(PROCEDURE 110)".

    //procedure SetOutboundsNotUpdated();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT (ItemLedgEntry."Applied Entry to Adjust" OR ItemLedgEntry.Open) THEN
          EXIT;

        IF ItemLedgEntry.Quantity < 0 THEN
          EXIT;

        ItemApplnEntry.SETRANGE("Inbound Item Entry No.",ItemLedgEntry."Entry No.");
        ItemApplnEntry.MODIFYALL("Outbound Entry is Updated",FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF ItemLedgEntry.Quantity < 0 THEN
          EXIT;
        ItemApplnEntry.SETRANGE("Inbound Item Entry No.",ItemLedgEntry."Entry No.");
        ItemApplnEntry.MODIFYALL("Outbound Entry is Updated",FALSE);
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "CheckCyclicFwdToAppliedEntries(PROCEDURE 8).ValueEntry(Variable 1000)".


    //Unsupported feature: Deletion (ParameterCollection) on "GetVisitedEntries(PROCEDURE 15).WithinValuationDate(Parameter 1004)".


    //Unsupported feature: Deletion (VariableCollection) on "GetVisitedEntries(PROCEDURE 15).AvgCostAdjmtEntryPoint(Variable 1005)".


    //Unsupported feature: Deletion (VariableCollection) on "GetVisitedEntries(PROCEDURE 15).ValueEntry(Variable 1006)".

}

