TableExtension 52193511 tableextension52193511 extends "VAT Amount Line" 
{

    //Unsupported feature: Code Modification on "GetTotalVATDiscount(PROCEDURE 19)".

    //procedure GetTotalVATDiscount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetCurrency(CurrencyCode);

        VATDiscount := 0;

        IF FIND('-') THEN
          REPEAT
            IF NewPricesIncludingVAT THEN
              VATBase += ("Line Amount" - "Invoice Discount Amount") * "VAT %" / (100 + "VAT %")
            ELSE
              VATBase += "VAT Base" * "VAT %" / 100;
            VATDiscount :=
              VATDiscount +
              ROUND(
                VATBase,
                Currency."Amount Rounding Precision",Currency.VATRoundingDirection) -
              "VAT Amount" + "VAT Difference";
            VATBase := VATBase - ROUND(VATBase,Currency."Amount Rounding Precision",Currency.VATRoundingDirection);
          UNTIL NEXT = 0;
        EXIT(VATDiscount);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
              VATDiscount :=
                VATDiscount +
                ROUND(
                  ("Line Amount" - "Invoice Discount Amount") * "VAT %" / (100 + "VAT %"),
                  Currency."Amount Rounding Precision",Currency.VATRoundingDirection) -
                "VAT Amount" + "VAT Difference"
            ELSE
              VATDiscount :=
                VATDiscount +
                ROUND(
                  "VAT Base" * "VAT %" / 100,
                  Currency."Amount Rounding Precision",Currency.VATRoundingDirection) -
                "VAT Amount";
          UNTIL NEXT = 0;
        EXIT(VATDiscount);
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "GetTotalVATDiscount(PROCEDURE 19).VATBase(Variable 1003)".

}

