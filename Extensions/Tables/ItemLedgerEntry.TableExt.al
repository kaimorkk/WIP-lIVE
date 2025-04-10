TableExtension 52193437 tableextension52193437 extends "Item Ledger Entry" 
{
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Property Deletion (SumIndexFields) on ""Item No."(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Item No.",Open,"Variant Code",Positive,"Lot No.","Serial No."(Key)".
        // 
        // key(Key1;"Item No.",Open,"Variant Code",Positive,"Expiration Date","Lot No.","Serial No.")
        // {
        // MaintainSIFTIndex = false;
        // MaintainSQLIndex = false;
        // }
    }


    //Unsupported feature: Code Modification on "CalculateRemInventoryValue(PROCEDURE 12)".

    //procedure CalculateRemInventoryValue();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ValueEntry.SETCURRENTKEY("Item Ledger Entry No.");
        ValueEntry.SETRANGE("Item Ledger Entry No.",ItemLedgEntryNo);
        ValueEntry.SETFILTER("Valuation Date",'<=%1',PostingDate);
        IF NOT IncludeExpectedCost THEN
          ValueEntry.SETRANGE("Expected Cost",FALSE);
        IF ValueEntry.FINDSET THEN
        #7..15
                AdjustedCost += RemQty / TotalQty * ValueEntry."Cost Amount (Actual)";
          UNTIL ValueEntry.NEXT = 0;
        EXIT(AdjustedCost);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ValueEntry.SETCURRENTKEY("Item Ledger Entry No.");
        ValueEntry.SETRANGE("Item Ledger Entry No.",ItemLedgEntryNo);
        ValueEntry.SETFILTER("Posting Date",'<=%1',PostingDate);
        #4..18
        */
    //end;
}

