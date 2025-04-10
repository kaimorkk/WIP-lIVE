TableExtension 52193717 tableextension52193717 extends "Value Entry" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 24)".

    }
    keys
    {

        //Unsupported feature: Property Insertion (MaintainSIFTIndex) on ""Capacity Ledger Entry No.","Entry Type"(Key)".


        //Unsupported feature: Property Insertion (Enabled) on ""Source Type","Source No.","Global Dimension 1 Code","Global Dimension 2 Code","Item No.","Posting Date","Entry Type",Adjustment(Key)".


        //Unsupported feature: Deletion (KeyCollection) on ""Item Ledger Entry No.","Valuation Date"(Key)".

    }

    //Unsupported feature: Code Modification on "SumCostsTillValuationDate(PROCEDURE 4)".

    //procedure SumCostsTillValuationDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Item.GET(ValueEntry."Item No.");
        IF Item."Costing Method" = Item."Costing Method"::Average THEN
          ToDate := GetAvgToDate(ValueEntry."Valuation Date")
        #4..25
              QtyFactor := ValueEntry.CalcQtyFactor(FromDate,ToDate);

          CALCSUMS(
            "Item Ledger Entry Quantity","Invoiced Quantity",
            "Cost Amount (Actual)","Cost Amount (Actual) (ACY)",
            "Cost Amount (Expected)","Cost Amount (Expected) (ACY)");

          "Item Ledger Entry Quantity" :=
            ROUND("Item Ledger Entry Quantity" * QtyFactor,0.00001) + PrevValueEntrySum."Item Ledger Entry Quantity";
          "Invoiced Quantity" :=
            ROUND("Invoiced Quantity" * QtyFactor,0.00001) + PrevValueEntrySum."Invoiced Quantity";
          "Cost Amount (Actual)" :=
            "Cost Amount (Actual)" * QtyFactor + PrevValueEntrySum."Cost Amount (Actual)";
          "Cost Amount (Expected)" :=
        #40..46
          IF FromDate <> 0D THEN
            ToDate := CALCDATE('<-1D>',FromDate);
        UNTIL FromDate = 0D;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..28
            "Item Ledger Entry Quantity",
        #30..34
        #37..49
        */
    //end;
}

