PageExtension 52193534 pageextension52193534 extends "CF Availability by Periods" 
{
    layout
    {

        //Unsupported feature: Property Deletion (AutoFormatType) on "LiquidFunds(Control 1021)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "LiquidFunds(Control 1021)".

    }

    //Unsupported feature: Code Modification on "UpdateSubForm(PROCEDURE 1000)".

    //procedure UpdateSubForm();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.CFAvailabLines.PAGE.Set(Rec,PeriodType,AmountType,RoundingFactor);
        LiquidFunds := MatrixMgt.RoundValue(CalcAmountFromSource("Source Type Filter"::"Liquid Funds"),RoundingFactor);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CurrPage.CFAvailabLines.PAGE.Set(Rec,PeriodType,AmountType,RoundingFactor);
        LiquidFunds := CurrPage.CFAvailabLines.PAGE.RoundAmount(CalcAmountFromSource("Source Type Filter"::"Liquid Funds"));
        */
    //end;
}

