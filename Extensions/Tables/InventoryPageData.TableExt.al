TableExtension 52193691 tableextension52193691 extends "Inventory Page Data" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Source Line ID"(Field 9)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Source Document ID"(Field 30)".

    }

    //Unsupported feature: Code Modification on "UpdateInventorys(PROCEDURE 1)".

    //procedure UpdateInventorys();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Projected Inventory" :=
          RunningInventory +
          ("Gross Requirement" - "Reserved Requirement") + ("Scheduled Receipt" - "Reserved Receipt");
        "Forecasted Projected Inventory" :=
          RunningInventoryForecast + "Remaining Forecast" +
          ("Gross Requirement" - "Reserved Requirement") + ("Scheduled Receipt" - "Reserved Receipt");
        "Suggested Projected Inventory" :=
          RunningInventorySuggestion + "Action Message Qty." + "Remaining Forecast" +
          ("Gross Requirement" - "Reserved Requirement") + ("Scheduled Receipt" - "Reserved Receipt");
        IF Level = 1 THEN BEGIN
          RunningInventory := "Projected Inventory";
          RunningInventoryForecast := "Forecasted Projected Inventory";
          RunningInventorySuggestion := "Suggested Projected Inventory"
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
          RunningInventorySuggestion + "Action Message Qty." +
        #9..14
        */
    //end;
}

