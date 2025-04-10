TableExtension 52193446 tableextension52193446 extends "Invoice Post. Buffer" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on "Type(Field 1)".


        //Unsupported feature: Property Deletion (DataClassification) on ""G/L Account"(Field 2)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Global Dimension 1 Code"(Field 4)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Global Dimension 2 Code"(Field 5)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Job No."(Field 6)".


        //Unsupported feature: Property Deletion (DataClassification) on "Amount(Field 7)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Amount"(Field 8)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Gen. Bus. Posting Group"(Field 10)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Gen. Prod. Posting Group"(Field 11)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Calculation Type"(Field 12)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Base Amount"(Field 14)".


        //Unsupported feature: Property Deletion (DataClassification) on ""System-Created Entry"(Field 17)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Tax Area Code"(Field 18)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Tax Liable"(Field 19)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Tax Group Code"(Field 20)".


        //Unsupported feature: Property Deletion (DataClassification) on "Quantity(Field 21)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Use Tax"(Field 22)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Bus. Posting Group"(Field 23)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Prod. Posting Group"(Field 24)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Amount (ACY)"(Field 25)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Amount (ACY)"(Field 26)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Base Amount (ACY)"(Field 29)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT Difference"(Field 31)".


        //Unsupported feature: Property Deletion (DataClassification) on ""VAT %"(Field 32)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Dimension Set ID"(Field 480)".


        //Unsupported feature: Property Deletion (DataClassification) on ""FA Posting Date"(Field 5600)".


        //Unsupported feature: Property Deletion (DataClassification) on ""FA Posting Type"(Field 5601)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Depreciation Book Code"(Field 5602)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Salvage Value"(Field 5603)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Depr. until FA Posting Date"(Field 5605)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Depr. Acquisition Cost"(Field 5606)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Maintenance Code"(Field 5609)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Insurance No."(Field 5610)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Budgeted FA No."(Field 5611)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Duplicate in Depreciation Book"(Field 5612)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Use Duplication List"(Field 5613)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Fixed Asset Line No."(Field 5614)".

    }

    //Unsupported feature: Code Modification on "PrepareSales(PROCEDURE 1)".

    //procedure PrepareSales();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(Rec);
        Type := SalesLine.Type;
        "System-Created Entry" := TRUE;
        #4..26
          "Use Tax" := FALSE;
          Quantity := SalesLine."Qty. to Invoice (Base)";
        END;

        IF SalesLine."Line Discount %" = 100 THEN BEGIN
          "VAT Base Amount" := 0;
          "VAT Base Amount (ACY)" := 0;
          "VAT Amount" := 0;
          "VAT Amount (ACY)" := 0;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..29
        */
    //end;


    //Unsupported feature: Code Modification on "PreparePurchase(PROCEDURE 6)".

    //procedure PreparePurchase();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(Rec);
        Type := PurchLine.Type;
        "System-Created Entry" := TRUE;
        #4..33
          "Use Tax" := FALSE;
          Quantity := PurchLine."Qty. to Invoice (Base)";
        END;

        IF PurchLine."Line Discount %" = 100 THEN BEGIN
          "VAT Base Amount" := 0;
          "VAT Base Amount (ACY)" := 0;
          "VAT Amount" := 0;
          "VAT Amount (ACY)" := 0;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..36
        */
    //end;


    //Unsupported feature: Code Modification on "PrepareService(PROCEDURE 11)".

    //procedure PrepareService();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(Rec);
        CASE ServiceLine.Type OF
          ServiceLine.Type::Item:
        #4..25
          "Use Tax" := FALSE;
          Quantity := ServiceLine."Qty. to Invoice (Base)";
        END;

        IF ServiceLine."Line Discount %" = 100 THEN BEGIN
          "VAT Base Amount" := 0;
          "VAT Base Amount (ACY)" := 0;
          "VAT Amount" := 0;
          "VAT Amount (ACY)" := 0;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..28
        */
    //end;
}

