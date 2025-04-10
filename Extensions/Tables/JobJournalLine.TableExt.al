TableExtension 52193489 tableextension52193489 extends "Job Journal Line" 
{
    fields
    {

        //Unsupported feature: Code Insertion on ""Unit of Measure Code"(Field 18)".

        //trigger OnLookup(var Text: Text): Boolean
        //var
            //ItemUnitOfMeasure: Record "Item Unit of Measure";
            //ResourceUnitOfMeasure: Record "Resource Unit of Measure";
            //UnitOfMeasure: Record "Unit of Measure";
            //Resource: Record Resource;
            //"Filter": Text;
        //begin
            /*
            CASE Type OF
              Type::Item:
                BEGIN
                  ItemUnitOfMeasure.SETRANGE("Item No.","No.");
                  IF PAGE.RUNMODAL(0,ItemUnitOfMeasure) = ACTION::LookupOK THEN
                    VALIDATE("Unit of Measure Code",ItemUnitOfMeasure.Code);
                END;
              Type::Resource:
                BEGIN
                  ResourceUnitOfMeasure.SETRANGE("Resource No.","No.");
                  IF "Job Planning Line No." <> 0 THEN BEGIN
                    Filter := Resource.GetUnitOfMeasureFilter("No.","Unit of Measure Code");
                    ResourceUnitOfMeasure.SETFILTER(Code,Filter);
                  END;
                  IF PAGE.RUNMODAL(0,ResourceUnitOfMeasure) = ACTION::LookupOK THEN
                    VALIDATE("Unit of Measure Code",ResourceUnitOfMeasure.Code);
                END;
              ELSE
                IF PAGE.RUNMODAL(0,UnitOfMeasure) = ACTION::LookupOK THEN
                  VALIDATE("Unit of Measure Code",UnitOfMeasure.Code);
            END;
            */
        //end;

        //Unsupported feature: Property Deletion (TableRelation) on ""Unit of Measure Code"(Field 18)".

    }


    //Unsupported feature: Code Modification on "HandleCostFactor(PROCEDURE 32)".

    //procedure HandleCostFactor();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ("Cost Factor" <> 0) AND
           ((("Unit Cost" <> xRec."Unit Cost") OR ("Cost Factor" <> xRec."Cost Factor")) OR
            ((Quantity <> xRec.Quantity) OR ("Location Code" <> xRec."Location Code")))
        THEN
          "Unit Price" := ROUND("Unit Cost" * "Cost Factor",UnitAmountRoundingPrecisionFCY)
        ELSE
          IF (Item."Price/Profit Calculation" = Item."Price/Profit Calculation"::"Price=Cost+Profit") AND
             (Item."Profit %" < 100) AND
             ("Unit Cost" <> xRec."Unit Cost")
          THEN
            "Unit Price" := ROUND("Unit Cost" / (1 - Item."Profit %" / 100),UnitAmountRoundingPrecisionFCY);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF ("Cost Factor" <> 0) AND (("Unit Cost" <> xRec."Unit Cost") OR ("Cost Factor" <> xRec."Cost Factor")) THEN
        #5..11
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateTotalPrice(PROCEDURE 6)".

    //procedure UpdateTotalPrice();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Total Price" := ROUND(Quantity * "Unit Price",AmountRoundingPrecisionFCY);
        "Total Price (LCY)" := ROUND(
            CurrExchRate.ExchangeAmtFCYToLCY("Posting Date","Currency Code","Total Price","Currency Factor"),
            AmountRoundingPrecision);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "Total Price" := ROUND(Quantity * "Unit Price",AmountRoundingPrecisionFCY);
        "Total Price (LCY)" := ROUND(
            CurrExchRate.ExchangeAmtFCYToLCY(
              "Posting Date","Currency Code",
              "Total Price","Currency Factor"),
            AmountRoundingPrecision);
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateAmountsAndDiscounts(PROCEDURE 31)".

    //procedure UpdateAmountsAndDiscounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Total Price" <> 0 THEN BEGIN
          IF ("Line Amount" <> xRec."Line Amount") AND ("Line Discount Amount" = xRec."Line Discount Amount") THEN BEGIN
            "Line Amount" := ROUND("Line Amount",AmountRoundingPrecisionFCY);
            "Line Discount Amount" := "Total Price" - "Line Amount";

            "Line Amount (LCY)" := ROUND("Line Amount (LCY)",AmountRoundingPrecision);
            "Line Discount Amount (LCY)" := "Total Price (LCY)" - "Line Amount (LCY)";

            "Line Discount %" :=
              ROUND("Line Discount Amount" / "Total Price" * 100,0.00001);
          END ELSE
            IF ("Line Discount Amount" <> xRec."Line Discount Amount") AND ("Line Amount" = xRec."Line Amount") THEN BEGIN
              "Line Discount Amount" := ROUND("Line Discount Amount",AmountRoundingPrecisionFCY);
              "Line Amount" := "Total Price" - "Line Discount Amount";

              "Line Discount Amount (LCY)" := ROUND("Line Discount Amount (LCY)",AmountRoundingPrecision);
              "Line Amount (LCY)" := "Total Price (LCY)" - "Line Discount Amount (LCY)";

              "Line Discount %" :=
                ROUND("Line Discount Amount" / "Total Price" * 100,0.00001);
            END ELSE
        #22..24
                "Line Discount Amount" :=
                  ROUND("Total Price" * "Line Discount %" / 100,AmountRoundingPrecisionFCY);
                "Line Amount" := "Total Price" - "Line Discount Amount";

                "Line Discount Amount (LCY)" :=
                  ROUND("Total Price (LCY)" * "Line Discount %" / 100,AmountRoundingPrecision);
                "Line Amount (LCY)" := "Total Price (LCY)" - "Line Discount Amount (LCY)";
              END;
        END ELSE BEGIN
          "Line Amount" := 0;
          "Line Discount Amount" := 0;
          "Line Amount (LCY)" := 0;
          "Line Discount Amount (LCY)" := 0;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        #9..14
        #19..27
        #32..35
        END;

        "Line Amount (LCY)" := ROUND(
            CurrExchRate.ExchangeAmtFCYToLCY(
              "Posting Date","Currency Code",
              "Line Amount","Currency Factor"),
            AmountRoundingPrecision);

        "Line Discount Amount (LCY)" := ROUND(
            CurrExchRate.ExchangeAmtFCYToLCY(
              "Posting Date","Currency Code",
              "Line Discount Amount","Currency Factor"),
            AmountRoundingPrecision);
        */
    //end;
}

