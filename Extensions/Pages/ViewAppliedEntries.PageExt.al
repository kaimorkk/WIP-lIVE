PageExtension 52193517 pageextension52193517 extends "View Applied Entries" 
{
    var
        AppliedRec: Record "Item Ledger Entry";


    //Unsupported feature: Code Modification on "SetMyView(PROCEDURE 22)".

    //procedure SetMyView();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        InitView;
        CASE ShowQuantity OF
          TRUE:
        #4..8
                  ShowQuantityOpen(ItemLedgEntry);
                  ShowCostOpen(ItemLedgEntry,MaxToApply);
                END;
            END;
          FALSE:
            CASE ShowApplied OF
              TRUE:
                ShowCostApplied(ItemLedgEntry);
              FALSE:
                ShowCostOpen(ItemLedgEntry,MaxToApply);
            END;
        END;

        IF TempItemLedgEntry.FINDSET THEN
          REPEAT
            Rec := TempItemLedgEntry;
            INSERT;
          UNTIL TempItemLedgEntry.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..11
            END
            ;
        #13..18
            END
            ;
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "InitView(PROCEDURE 23)".

    //procedure InitView();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DELETEALL;
        TempItemLedgEntry.RESET;
        TempItemLedgEntry.DELETEALL;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        DELETEALL;
        */
    //end;


    //Unsupported feature: Code Modification on "ShowQuantityApplied(PROCEDURE 20)".

    //procedure ShowQuantityApplied();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        InitApplied;
        WITH ItemLedgEntry DO
          IF Positive THEN BEGIN
        #4..17
              REPEAT
                InsertTempEntry(ItemApplnEntry."Inbound Item Entry No.",-ItemApplnEntry.Quantity,TRUE);
              UNTIL ItemApplnEntry.NEXT = 0;
          END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..20
          END
          ;
        */
    //end;


    //Unsupported feature: Code Modification on "ShowCostApplied(PROCEDURE 18)".

    //procedure ShowCostApplied();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        InitApplied;
        WITH ItemLedgEntry DO
          IF Positive THEN BEGIN
        #4..20
              REPEAT
                InsertTempEntry(ItemApplnEntry."Inbound Item Entry No.",-ItemApplnEntry.Quantity,FALSE);
              UNTIL ItemApplnEntry.NEXT = 0;
          END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..23
          END
          ;
        */
    //end;


    //Unsupported feature: Code Modification on "InsertTempEntry(PROCEDURE 21)".

    //procedure InsertTempEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ItemLedgEntry.GET(EntryNo);

        IF ShowQuantity THEN
          IF AppliedQty * ItemLedgEntry.Quantity < 0 THEN
            EXIT;

        IF NOT TempItemLedgEntry.GET(EntryNo) THEN BEGIN
          TempItemLedgEntry.RESET;
          TempItemLedgEntry := ItemLedgEntry;
          TempItemLedgEntry.CALCFIELDS("Reserved Quantity");
          TempItemLedgEntry.Quantity := AppliedQty;
          TempItemLedgEntry.INSERT;
        END ELSE BEGIN
          TempItemLedgEntry.Quantity := TempItemLedgEntry.Quantity + AppliedQty;
          TempItemLedgEntry.MODIFY;
        END;

        TotalApplied := TotalApplied + AppliedQty;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
        IF NOT GET(EntryNo) THEN BEGIN
          RESET;
          Rec := ItemLedgEntry;
          CALCFIELDS("Reserved Quantity");
          Quantity := AppliedQty;
          INSERT;
        END ELSE BEGIN
          Quantity := Quantity + AppliedQty;
          MODIFY;
        #16..18
        */
    //end;


    //Unsupported feature: Code Modification on "RemoveApplications(PROCEDURE 1)".

    //procedure RemoveApplications();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Application.SETCURRENTKEY("Inbound Item Entry No.","Outbound Item Entry No.");
        Application.SETRANGE("Inbound Item Entry No.",Inbound);
        Application.SETRANGE("Outbound Item Entry No.",OutBound);
        IF Application.FINDSET THEN
          REPEAT
            Apply.UnApply(Application);
            Apply.LogUnapply(Application);
          UNTIL Application.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        IF Application.FIND('-') THEN
          REPEAT
            Apply.UnApply(Application);
          UNTIL Application.NEXT = 0;
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: LoopRec) (VariableCollection) on "UnapplyRec(PROCEDURE 3)".


    //Unsupported feature: Variable Insertion (Variable: AppliedRec) (VariableCollection) on "UnapplyRec(PROCEDURE 3)".



    //Unsupported feature: Code Modification on "UnapplyRec(PROCEDURE 3)".

    //procedure UnapplyRec();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Applyrec.GET(RecordToShow."Entry No.");
        CurrPage.SETSELECTIONFILTER(TempItemLedgEntry);
        IF TempItemLedgEntry.FINDSET THEN BEGIN
          REPEAT
            AppliedItemLedgEntry.GET(TempItemLedgEntry."Entry No.");
            IF AppliedItemLedgEntry."Entry No." <> 0 THEN BEGIN
              IF Applyrec.Positive THEN
                RemoveApplications(Applyrec."Entry No.",AppliedItemLedgEntry."Entry No.")
              ELSE
                RemoveApplications(AppliedItemLedgEntry."Entry No.",Applyrec."Entry No.");
            END;
          UNTIL TempItemLedgEntry.NEXT = 0;

          BlockItem(Applyrec."Item No.");
        END;
        Show;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        Applyrec.GET(RecordToShow."Entry No.");
        CurrPage.SETSELECTIONFILTER(LoopRec);
        IF LoopRec.FIND('-') THEN
          REPEAT
            AppliedRec := LoopRec;
            IF AppliedRec."Entry No." <> 0 THEN BEGIN
              IF Applyrec.Positive THEN
                RemoveApplications(Applyrec."Entry No.",AppliedRec."Entry No.")
              ELSE
                RemoveApplications(AppliedRec."Entry No.",Applyrec."Entry No.");
            END;
          UNTIL LoopRec.NEXT = 0;

        BlockItem(Applyrec."Item No.");
        Show;
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: LoopRec) (VariableCollection) on "ApplyRec(PROCEDURE 5)".



    //Unsupported feature: Code Modification on "ApplyRec(PROCEDURE 5)".

    //procedure ApplyRec();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Applyrec.GET(RecordToShow."Entry No.");
        CurrPage.SETSELECTIONFILTER(TempItemLedgEntry);
        IF TempItemLedgEntry.FINDSET THEN
          REPEAT
            AppliedItemLedgEntry.GET(TempItemLedgEntry."Entry No.");
            IF AppliedItemLedgEntry."Entry No." <> 0 THEN BEGIN
              Apply.ReApply(Applyrec,AppliedItemLedgEntry."Entry No.");
              Apply.LogApply(Applyrec,AppliedItemLedgEntry);
            END;
          UNTIL TempItemLedgEntry.NEXT = 0;

        IF Applyrec.Positive THEN
          RemoveDuplicateApplication(Applyrec."Entry No.");

        Show;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        Applyrec.GET(RecordToShow."Entry No.");
        CurrPage.SETSELECTIONFILTER(LoopRec);
        IF LoopRec.FIND('-') THEN
          REPEAT
            AppliedRec := LoopRec;
            IF AppliedRec."Entry No." <> 0 THEN
              Apply.ReApply(Applyrec,AppliedRec."Entry No.");

          UNTIL LoopRec.NEXT = 0;
        #11..15
        */
    //end;

    //Unsupported feature: Property Deletion (Local) on "BlockItem(PROCEDURE 9)".


    //Unsupported feature: Deletion (VariableCollection) on "UnapplyRec(PROCEDURE 3).AppliedItemLedgEntry(Variable 1002)".


    //Unsupported feature: Deletion (VariableCollection) on "ApplyRec(PROCEDURE 5).AppliedItemLedgEntry(Variable 1002)".

}

