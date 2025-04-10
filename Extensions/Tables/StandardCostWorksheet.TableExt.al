TableExtension 52193727 tableextension52193727 extends "Standard Cost Worksheet" 
{

    //Unsupported feature: Code Modification on "GetItemCosts(PROCEDURE 1)".

    //procedure GetItemCosts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Standard Cost" := Item."Standard Cost";
        "New Standard Cost" := Item."Standard Cost";
        "Overhead Rate" := Item."Overhead Rate";
        "New Overhead Rate" := Item."Overhead Rate";
        "Indirect Cost %" := Item."Indirect Cost %";
        "New Indirect Cost %" := Item."Indirect Cost %";

        IF Item.IsMfgItem THEN
          TransferManufCostsFromItem
        ELSE
          TransferStandardCostFromItem;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
        "Single-Lvl Material Cost" := Item."Single-Level Material Cost";
        "New Single-Lvl Material Cost" := Item."Single-Level Material Cost";
        "Single-Lvl Cap. Cost" := Item."Single-Level Capacity Cost";
        "New Single-Lvl Cap. Cost" := Item."Single-Level Capacity Cost";
        "Single-Lvl Subcontrd Cost" := Item."Single-Level Subcontrd. Cost";
        "Single-Lvl Subcontrd Cost" := Item."Single-Level Subcontrd. Cost";
        "Single-Lvl Cap. Ovhd Cost" := Item."Single-Level Cap. Ovhd Cost";
        "New Single-Lvl Cap. Ovhd Cost" := Item."Single-Level Cap. Ovhd Cost";
        "Single-Lvl Mfg. Ovhd Cost" := Item."Single-Level Mfg. Ovhd Cost";
        "New Single-Lvl Mfg. Ovhd Cost" := Item."Single-Level Mfg. Ovhd Cost";

        "Rolled-up Material Cost" := Item."Rolled-up Material Cost";
        "New Rolled-up Material Cost" := Item."Rolled-up Material Cost";
        "Rolled-up Cap. Cost" := Item."Rolled-up Capacity Cost";
        "New Rolled-up Cap. Cost" := Item."Rolled-up Capacity Cost";
        "Rolled-up Subcontrd Cost" := Item."Rolled-up Subcontracted Cost";
        "New Rolled-up Subcontrd Cost" := Item."Rolled-up Subcontracted Cost";
        "Rolled-up Cap. Ovhd Cost" := Item."Rolled-up Cap. Overhead Cost";
        "New Rolled-up Cap. Ovhd Cost" := Item."Rolled-up Cap. Overhead Cost";
        "Rolled-up Mfg. Ovhd Cost" := Item."Rolled-up Mfg. Ovhd Cost";
        "New Rolled-up Mfg. Ovhd Cost" := Item."Rolled-up Mfg. Ovhd Cost";
        */
    //end;
}

