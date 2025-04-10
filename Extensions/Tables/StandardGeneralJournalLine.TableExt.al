TableExtension 52193591 tableextension52193591 extends "Standard General Journal Line" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Business Unit Code"(Field 50)".

    }

    //Unsupported feature: Code Modification on "GetCurrency(PROCEDURE 3)".

    //procedure GetCurrency();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF CurrencyCode = '' THEN BEGIN
          CLEAR(Currency);
          Currency.InitRoundingPrecision;
        END ELSE
          IF CurrencyCode <> Currency.Code THEN BEGIN
            Currency.GET(CurrencyCode);
            Currency.TESTFIELD("Amount Rounding Precision");
          END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF CurrencyCode = '' THEN BEGIN
          CLEAR(Currency);
          Currency.InitRoundingPrecision
        #4..8
        */
    //end;
}

