TableExtension 52193729 tableextension52193729 extends "BOM Buffer" 
{
    fields
    {
        modify("Replenishment System")
        {
            OptionCaption = 'Purchase,Prod. Order, ,Assembly';

            //Unsupported feature: Property Modification (OptionString) on ""Replenishment System"(Field 9)".

        }

        //Unsupported feature: Property Deletion (DataClassification) on ""Entry No."(Field 1)".


        //Unsupported feature: Property Deletion (DataClassification) on "Type(Field 2)".


        //Unsupported feature: Property Deletion (DataClassification) on ""No."(Field 3)".


        //Unsupported feature: Property Deletion (DataClassification) on "Description(Field 5)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Unit of Measure Code"(Field 6)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Variant Code"(Field 7)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Location Code"(Field 8)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Replenishment System"(Field 9)".


        //Unsupported feature: Property Deletion (DataClassification) on "Indentation(Field 10)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Is Leaf"(Field 11)".


        //Unsupported feature: Property Deletion (DataClassification) on "Bottleneck(Field 13)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Routing No."(Field 15)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Production BOM No."(Field 16)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Lot Size"(Field 20)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Low-Level Code"(Field 21)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Rounding Precision"(Field 22)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Qty. per Parent"(Field 30)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Qty. per Top Item"(Field 31)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Able to Make Top Item"(Field 32)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Able to Make Parent"(Field 33)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Available Quantity"(Field 35)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Gross Requirement"(Field 36)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Scheduled Receipts"(Field 37)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Unused Quantity"(Field 38)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Lead Time Calculation"(Field 40)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Lead-Time Offset"(Field 41)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Rolled-up Lead-Time Offset"(Field 42)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Needed by Date"(Field 43)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Safety Lead Time"(Field 45)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Unit Cost"(Field 50)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Indirect Cost %"(Field 52)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Overhead Rate"(Field 54)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Scrap %"(Field 55)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Scrap Qty. per Parent"(Field 56)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Scrap Qty. per Top Item"(Field 57)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Resource Usage Type"(Field 59)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Single-Level Material Cost"(Field 61)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Single-Level Capacity Cost"(Field 62)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Single-Level Subcontrd. Cost"(Field 63)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Single-Level Cap. Ovhd Cost"(Field 64)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Single-Level Mfg. Ovhd Cost"(Field 65)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Single-Level Scrap Cost"(Field 66)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Rolled-up Material Cost"(Field 71)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Rolled-up Capacity Cost"(Field 72)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Rolled-up Subcontracted Cost"(Field 73)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Rolled-up Capacity Ovhd. Cost"(Field 74)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Rolled-up Mfg. Ovhd Cost"(Field 75)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Rolled-up Scrap Cost"(Field 76)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Total Cost"(Field 81)".


        //Unsupported feature: Property Deletion (DataClassification) on ""BOM Unit of Measure Code"(Field 82)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Qty. per BOM Line"(Field 83)".

    }

    //Unsupported feature: Variable Insertion (Variable: BOMQtyPerUOM) (VariableCollection) on "TransferFromProdComp(PROCEDURE 6)".


    //Unsupported feature: Code Modification on "TransferFromProdComp(PROCEDURE 6)".

    //procedure TransferFromProdComp();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        INIT;
        EntryNo += 1;
        "Entry No." := EntryNo;
        #4..8
        IF ParentItem."Lot Size" = 0 THEN
          ParentItem."Lot Size" := 1;

        "Qty. per Parent" :=
          CostCalculationMgt.CalcCompItemQtyBase(
            ProdBOMLine,WORKDATE,
        #15..17
        "Qty. per Top Item" := ROUND(ParentQtyPer * "Qty. per Parent",0.00001);
        "Qty. per Parent" := ROUND("Qty. per Parent",0.00001);

        "Scrap Qty. per Parent" := "Qty. per Parent" - (ProdBOMLine.Quantity / BOMQtyPerUOM);
        "Scrap Qty. per Top Item" :=
          "Qty. per Top Item" -
          ROUND((ParentQtyPer - ParentScrapQtyPer) * ("Qty. per Parent" - "Scrap Qty. per Parent"),0.00001);
        #25..32
        Indentation := NewIndentation;

        INSERT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..11
        BOMQtyPerUOM := ProdBOMLine.GetBOMHeaderQtyPerUOM(ParentItem);
        #12..20
        "Scrap Qty. per Parent" := "Qty. per Parent" - (ProdBOMLine."Quantity per" / BOMQtyPerUOM);
        #22..35
        */
    //end;


    //Unsupported feature: Code Modification on "InitFromItem(PROCEDURE 19)".

    //procedure InitFromItem();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Type := Type::Item;
        "No." := Item."No.";
        Description := Item.Description;
        "Unit of Measure Code" := Item."Base Unit of Measure";

        "Production BOM No." := Item."Production BOM No.";
        "Routing No." := Item."Routing No.";
        IF SKU.GET(GETFILTER("Location Code"),"No.",GETFILTER("Variant Code")) THEN
          "Replenishment System" := SKU."Replenishment System"
        ELSE
          "Replenishment System" := Item."Replenishment System";
        IF "Replenishment System" = "Replenishment System"::"Prod. Order" THEN BEGIN
          VersionCode := VersionMgt.GetBOMVersion("Production BOM No.",WORKDATE,TRUE);
          "BOM Unit of Measure Code" := VersionMgt.GetBOMUnitOfMeasure("Production BOM No.",VersionCode);
        #15..21
        "Rounding Precision" := Item."Rounding Precision";
        "Lead Time Calculation" := Item."Lead Time Calculation";
        "Safety Lead Time" := Item."Safety Lead Time";

        SETRANGE("Location Code");
        SETRANGE("Variant Code");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
        "Replenishment System" := Item."Replenishment System";
        #12..24
        */
    //end;


    //Unsupported feature: Code Modification on "InitFromRes(PROCEDURE 3)".

    //procedure InitFromRes();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Type := Type::Resource;
        "No." := Res."No.";
        Description := Res.Name;
        "Unit of Measure Code" := Res."Base Unit of Measure";
        "Replenishment System" := "Replenishment System"::Transfer;
        "Is Leaf" := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        "Replenishment System" := "Replenishment System"::" ";
        "Is Leaf" := TRUE;
        */
    //end;


    //Unsupported feature: Code Modification on "InitFromMachineCenter(PROCEDURE 10)".

    //procedure InitFromMachineCenter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Type := Type::"Machine Center";
        "No." := MachineCenter."No.";
        Description := MachineCenter.Name;
        IF MachineCenter."Work Center No." <> '' THEN BEGIN
          WorkCenter.GET(MachineCenter."Work Center No.");
          "Unit of Measure Code" := WorkCenter."Unit of Measure Code";
        END;

        "Replenishment System" := "Replenishment System"::Transfer;
        "Is Leaf" := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
        "Replenishment System" := "Replenishment System"::" ";
        "Is Leaf" := TRUE;
        */
    //end;


    //Unsupported feature: Code Modification on "InitFromWorkCenter(PROCEDURE 11)".

    //procedure InitFromWorkCenter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Type := Type::"Work Center";
        "No." := WorkCenter."No.";
        Description := WorkCenter.Name;
        "Unit of Measure Code" := WorkCenter."Unit of Measure Code";

        "Replenishment System" := "Replenishment System"::Transfer;
        "Is Leaf" := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        "Replenishment System" := "Replenishment System"::" ";
        "Is Leaf" := TRUE;
        */
    //end;


    //Unsupported feature: Code Modification on "IsReplenishmentOk(PROCEDURE 29)".

    //procedure IsReplenishmentOk();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Type <> Type::Item THEN
          EXIT(TRUE);
        IF "No." = '' THEN
          EXIT(TRUE);

        Item.GET("No.");
        IF "Is Leaf" THEN BEGIN
          IF Item."Replenishment System" IN ["Replenishment System"::Purchase,"Replenishment System"::Transfer] THEN
            EXIT(TRUE);
          IF LogWarning THEN
            BOMWarningLog.SetWarning(STRSUBSTNO(Text005,Item."No."),DATABASE::Item,Item.GETPOSITION);
        #12..14
          IF LogWarning THEN
            BOMWarningLog.SetWarning(STRSUBSTNO(Text008,Item."No."),DATABASE::Item,Item.GETPOSITION);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
          IF Item."Replenishment System" IN ["Replenishment System"::Purchase,"Replenishment System"::" "] THEN
        #9..17
        */
    //end;

    //Unsupported feature: Deletion (ParameterCollection) on "TransferFromProdComp(PROCEDURE 6).BOMQtyPerUOM(Parameter 1008)".


    //Unsupported feature: Deletion (VariableCollection) on "InitFromItem(PROCEDURE 19).SKU(Variable 1003)".


    //Unsupported feature: Property Modification (Length) on "InitFromItem(PROCEDURE 19).VersionCode(Variable 1002)".

}

