TableExtension 52193732 tableextension52193732 extends "Inventory Adjmt. Entry (Order)" 
{

    //Unsupported feature: Code Modification on "RoundCosts(PROCEDURE 77)".

    //procedure RoundCosts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetRoundingPrecision(AmtRndgPrec,AmtRndgPrecACY);
        RoundAmounts(AmtRndgPrec,AmtRndgPrecACY,ShareOfTotalCost);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        GetRoundingPrecision(AmtRndgPrec,AmtRndgPrecACY);
        RoundAmounts(AmtRndgPrec,AmtRndgPrecACY,ShareOfTotalCost,RndgResidual,RndgResidualACY);
        */
    //end;

    //Unsupported feature: Property Deletion (Local) on "RoundUnitCosts(PROCEDURE 19)".



    //Unsupported feature: Code Modification on "RoundUnitCosts(PROCEDURE 19)".

    //procedure RoundUnitCosts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetUnitAmtRoundingPrecision(UnitAmtRndgPrec,UnitAmtRndgPrecACY);
        RoundAmounts(UnitAmtRndgPrec,UnitAmtRndgPrecACY,1);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        GetUnitAmtRoundingPrecision(UnitAmtRndgPrec,UnitAmtRndgPrecACY);
        RoundAmounts(UnitAmtRndgPrec,UnitAmtRndgPrecACY,1,UnitRndgResidual,UnitRndgResidualACY);
        */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: RndResLCY) (ParameterCollection) on "RoundAmounts(PROCEDURE 20)".


    //Unsupported feature: Parameter Insertion (Parameter: RndResACY) (ParameterCollection) on "RoundAmounts(PROCEDURE 20)".


    //Unsupported feature: Variable Insertion (Variable: CurrExchRate) (VariableCollection) on "GetUnroundedCostsFromItem(PROCEDURE 21)".



    //Unsupported feature: Code Modification on "GetUnroundedCostsFromItem(PROCEDURE 21)".

    //procedure GetUnroundedCostsFromItem();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Item.GET("Item No.");

        "Indirect Cost %" := Item."Indirect Cost %";
        "Overhead Rate" := Item."Overhead Rate";

        GetSingleLevelCosts;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        "Single-Level Material Cost" := Item."Single-Level Material Cost";
        "Single-Level Capacity Cost" := Item."Single-Level Capacity Cost";
        "Single-Level Subcontrd. Cost" := Item."Single-Level Subcontrd. Cost";
        "Single-Level Cap. Ovhd Cost" := Item."Single-Level Cap. Ovhd Cost";
        "Single-Level Mfg. Ovhd Cost" := Item."Single-Level Mfg. Ovhd Cost";

        CurrExchRate := CalcCurrencyFactor;
        "Direct Cost (ACY)" := "Direct Cost" * CurrExchRate;
        "Indirect Cost (ACY)" := "Indirect Cost" * CurrExchRate;
        "Single-Lvl Material Cost (ACY)" := "Single-Level Material Cost" * CurrExchRate;
        "Single-Lvl Capacity Cost (ACY)" := "Single-Level Capacity Cost" * CurrExchRate;
        "Single-Lvl Subcontrd Cost(ACY)" := "Single-Level Subcontrd. Cost" * CurrExchRate;
        "Single-Lvl Cap. Ovhd Cost(ACY)" := "Single-Level Cap. Ovhd Cost" * CurrExchRate;
        "Single-Lvl Mfg. Ovhd Cost(ACY)" := "Single-Level Mfg. Ovhd Cost" * CurrExchRate;
        */
    //end;


    //Unsupported feature: Code Modification on "SetProdOrderLine(PROCEDURE 3)".

    //procedure SetProdOrderLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        INIT;
        "Order Type" := "Order Type"::Production;
        "Order No." := ProdOrderLine."Prod. Order No.";
        #4..6
        "Routing Reference No." := ProdOrderLine."Routing Reference No.";
        "Cost is Adjusted" := FALSE;
        "Is Finished" := ProdOrderLine.Status = ProdOrderLine.Status::Finished;

        "Indirect Cost %" := ProdOrderLine."Indirect Cost %";
        "Overhead Rate" := ProdOrderLine."Overhead Rate";
        GetUnitCostsFromProdOrderLine;

        IF NOT INSERT THEN;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..9
        GetUnitCostsFromItem;
        IF NOT INSERT THEN;
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "RoundAmounts(PROCEDURE 20).RndResLCY(Variable 1003)".


    //Unsupported feature: Deletion (VariableCollection) on "RoundAmounts(PROCEDURE 20).RndResACY(Variable 1004)".


    var
        RndgResidual: Decimal;
        RndgResidualACY: Decimal;
        UnitRndgResidual: Decimal;
        UnitRndgResidualACY: Decimal;
}

