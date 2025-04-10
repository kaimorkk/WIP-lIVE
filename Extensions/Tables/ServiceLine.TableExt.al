TableExtension 52193735 tableextension52193735 extends "Service Line" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Service Line"(Table 5902)".

    fields
    {

        //Unsupported feature: Code Modification on ""No."(Field 6).OnValidate".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckIfCanBeModified;

            TESTFIELD("Qty. Shipped Not Invoiced",0);
            #4..273

            GetDefaultBin;

            IF NOT TypeHelper.IsRecordTemporary(Rec) THEN
              CreateDim(
                DimMgt.TypeToTableID5(Type),"No.",
                DATABASE::Job,"Job No.",
                DATABASE::"Responsibility Center","Responsibility Center");

            IF ServiceLine.GET("Document Type","Document No.","Line No.") THEN
              MODIFY;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..276
            CreateDim(
              DimMgt.TypeToTableID5(Type),"No.",
              DATABASE::Job,"Job No.",
              DATABASE::"Responsibility Center","Responsibility Center");
            #282..284
            */
        //end;


        //Unsupported feature: Code Modification on ""Qty. to Invoice"(Field 17).OnValidate".

        //trigger  to Invoice"(Field 17)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Qty. to Invoice" < 0 THEN
              FIELDERROR("Qty. to Invoice",Text029);

            IF "Qty. to Invoice" > 0 THEN BEGIN
              "Qty. to Consume" := 0;
              "Qty. to Consume (Base)" := 0;
            END;

            IF "Qty. to Invoice" = MaxQtyToInvoice THEN
              InitQtyToInvoice
            ELSE
              "Qty. to Invoice (Base)" := CalcBaseQty("Qty. to Invoice");
            IF ("Qty. to Invoice" * Quantity < 0) OR
               (ABS("Qty. to Invoice") > ABS(MaxQtyToInvoice))
            THEN
              ERROR(
                Text000,
                MaxQtyToInvoice);
            IF ("Qty. to Invoice (Base)" * "Quantity (Base)" < 0) OR
               (ABS("Qty. to Invoice (Base)") > ABS(MaxQtyToInvoiceBase))
            THEN
              ERROR(
                Text001,
                MaxQtyToInvoiceBase);
            "VAT Difference" := 0;

            IF (xRec."Qty. to Consume" <> "Qty. to Consume") OR
               (xRec."Qty. to Consume (Base)" <> "Qty. to Consume (Base)")
            THEN
              VALIDATE("Line Discount %")
            ELSE BEGIN
              CalcInvDiscToInvoice;
              UpdateAmounts
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..25
            CalcInvDiscToInvoice;
            UpdateAmounts;
            */
        //end;


        //Unsupported feature: Code Modification on ""Line Discount Amount"(Field 28).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TestStatusOpen;
            GetServHeader;
            TESTFIELD(Quantity);
            IF "Line Discount Amount" <> xRec."Line Discount Amount" THEN
              UpdateLineDiscPct;
            "Inv. Discount Amount" := 0;
            "Inv. Disc. Amount to Invoice" := 0;
            VALIDATE("Line Discount %");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
              IF ROUND(CalcChargeableQty * "Unit Price",Currency."Amount Rounding Precision") <> 0 THEN
                "Line Discount %" :=
                  ROUND(
                    "Line Discount Amount" /
                    ROUND(CalcChargeableQty * "Unit Price",
                      Currency."Amount Rounding Precision") * 100,0.00001)
              ELSE
                "Line Discount %" := 0;
            #6..8
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF TempTrackingSpecification.FINDFIRST THEN
          InsertItemTracking;

        #4..6
        IF Type = Type::Item THEN
          IF ServHeader.InventoryPickConflict("Document Type","Document No.",ServHeader."Shipping Advice") THEN
            DisplayConflictError(ServHeader.InvPickConflictResolutionTxt);

        IsCustCrLimitChecked := FALSE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..9
        */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Document Type" = ServiceLine."Document Type"::Invoice THEN
          CheckIfCanBeModified;

        #4..11
        END;

        UpdateServiceLedgerEntry;
        IsCustCrLimitChecked := FALSE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..14
        */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 26)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SourceCodeSetup.GET;
        GetServHeader;
        IF "Service Item Line No." = 0 THEN
          ServItemLine.INIT
        ELSE
          ServItemLine.GET(ServHeader."Document Type",ServHeader."No.","Service Item Line No.");

        TableID[1] := Type1;
        No[1] := No1;
        #10..16
        DimensionSetID := ServItemLine."Dimension Set ID";
        IF DimensionSetID = 0 THEN
          DimensionSetID := ServHeader."Dimension Set ID";
        UpdateDimSetupFromDimSetID(TableID,No,DimensionSetID);
        "Dimension Set ID" :=
          DimMgt.GetDefaultDimID(
            TableID,No,SourceCodeSetup."Service Management",
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
            DimensionSetID,DATABASE::Customer);
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SourceCodeSetup.GET;
        GetServHeader;
        #7..19

        #21..26
        */
    //end;


    //Unsupported feature: Code Modification on "CalculateDiscount(PROCEDURE 7)".

    //procedure CalculateDiscount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Exclude Warranty" OR NOT Warranty THEN
          Discounts[1] := 0
        ELSE BEGIN
        #4..11
        END;

        IF "Exclude Contract Discount" THEN
          Discounts[2] := "Line Discount %"
        ELSE
          Discounts[2] := "Contract Disc. %";

        #19..34
            "Line Discount Type" := i;
            "Line Discount %" := Discounts[i];
          END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..14
          Discounts[2] := 0
        #16..37
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateAmounts(PROCEDURE 13)".

    //procedure UpdateAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF GUIALLOWED AND (CurrFieldNo <> 0) THEN
          ConfirmAdjPriceLineChange;

        #4..17
        UpdateVATAmounts;

        InitOutstandingAmount;
        IF NOT IsCustCrLimitChecked AND (CurrFieldNo <> 0) THEN BEGIN
          IsCustCrLimitChecked := TRUE;
          CustCheckCrLimit.ServiceLineCheck(Rec);
        END;
        UpdateRemainingCostsAndAmounts;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..20
        UpdateRemainingCostsAndAmounts;
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateVATAmounts(PROCEDURE 38)".

    //procedure UpdateVATAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetServHeader;
        ServiceLine2.SETRANGE("Document Type","Document Type");
        ServiceLine2.SETRANGE("Document No.","Document No.");
        ServiceLine2.SETFILTER("Line No.",'<>%1',"Line No.");
        IF "Line Amount" = 0 THEN
          IF xRec."Line Amount" >= 0 THEN
            ServiceLine2.SETFILTER(Amount,'>%1',0)
          ELSE
            ServiceLine2.SETFILTER(Amount,'<%1',0)
        ELSE
          IF "Line Amount" > 0 THEN
            ServiceLine2.SETFILTER(Amount,'>%1',0)
          ELSE
            ServiceLine2.SETFILTER(Amount,'<%1',0);
        ServiceLine2.SETRANGE("VAT Identifier","VAT Identifier");
        ServiceLine2.SETRANGE("Tax Group Code","Tax Group Code");

        IF "Line Amount" = "Inv. Discount Amount" THEN BEGIN
          Amount := 0;
          "VAT Base Amount" := 0;
          "Amount Including VAT" := 0;
        END ELSE BEGIN
          TotalLineAmount := 0;
          TotalInvDiscAmount := 0;
          TotalAmount := 0;
          TotalAmountInclVAT := 0;
          TotalQuantityBase := 0;
          IF ("VAT Calculation Type" = "VAT Calculation Type"::"Sales Tax") OR
             (("VAT Calculation Type" IN
               ["VAT Calculation Type"::"Normal VAT",
                "VAT Calculation Type"::"Reverse Charge VAT"]) AND
              ("VAT %" <> 0))
          THEN
            IF NOT ServiceLine2.ISEMPTY THEN BEGIN
              ServiceLine2.CALCSUMS("Line Amount","Inv. Discount Amount",Amount,"Amount Including VAT","Quantity (Base)");
              TotalLineAmount := ServiceLine2."Line Amount";
              TotalInvDiscAmount := ServiceLine2."Inv. Discount Amount";
              TotalAmount := ServiceLine2.Amount;
              TotalAmountInclVAT := ServiceLine2."Amount Including VAT";
              TotalQuantityBase := ServiceLine2."Quantity (Base)";
            END;

          IF ServHeader."Prices Including VAT" THEN
            CASE "VAT Calculation Type" OF
              "VAT Calculation Type"::"Normal VAT",
              "VAT Calculation Type"::"Reverse Charge VAT":
                BEGIN
                  Amount :=
                    (TotalLineAmount - TotalInvDiscAmount + "Line Amount" - "Inv. Discount Amount") / (1 + "VAT %" / 100) -
                    TotalAmount;
                  "VAT Base Amount" :=
                    ROUND(
                      Amount * (1 - ServHeader."VAT Base Discount %" / 100),
                      Currency."Amount Rounding Precision");
                  "Amount Including VAT" :=
                    ROUND(TotalAmount + Amount +
                      (TotalAmount + Amount) * (1 - ServHeader."VAT Base Discount %" / 100) * "VAT %" / 100 -
                      TotalAmountInclVAT,Currency."Amount Rounding Precision",Currency.VATRoundingDirection);
                  Amount := ROUND(Amount,Currency."Amount Rounding Precision");
                END;
              "VAT Calculation Type"::"Full VAT":
                BEGIN
                  Amount := 0;
                  "VAT Base Amount" := 0;
                END;
              "VAT Calculation Type"::"Sales Tax":
                BEGIN
                  ServHeader.TESTFIELD("VAT Base Discount %",0);
                  Amount :=
                    SalesTaxCalculate.ReverseCalculateTax(
                      "Tax Area Code","Tax Group Code","Tax Liable",ServHeader."Posting Date",
                      TotalAmountInclVAT + "Amount Including VAT",TotalQuantityBase + "Quantity (Base)",
                      ServHeader."Currency Factor") -
                    TotalAmount;
                  IF Amount <> 0 THEN
                    "VAT %" :=
                      ROUND(100 * ("Amount Including VAT" - Amount) / Amount,0.00001)
                  ELSE
                    "VAT %" := 0;
                  Amount := ROUND(Amount,Currency."Amount Rounding Precision");
                  "VAT Base Amount" := Amount;
                END;
            END
          ELSE
            CASE "VAT Calculation Type" OF
              "VAT Calculation Type"::"Normal VAT",
              "VAT Calculation Type"::"Reverse Charge VAT":
                BEGIN
                  Amount := ROUND("Line Amount" - "Inv. Discount Amount",Currency."Amount Rounding Precision");
                  "VAT Base Amount" :=
                    ROUND(Amount * (1 - ServHeader."VAT Base Discount %" / 100),Currency."Amount Rounding Precision");
                  "Amount Including VAT" :=
                    TotalAmount + Amount +
                    ROUND(
                      (TotalAmount + Amount) * (1 - ServHeader."VAT Base Discount %" / 100) * "VAT %" / 100,
                      Currency."Amount Rounding Precision",Currency.VATRoundingDirection) -
                    TotalAmountInclVAT;
                END;
              "VAT Calculation Type"::"Full VAT":
                BEGIN
                  Amount := 0;
                  "VAT Base Amount" := 0;
                  "Amount Including VAT" := "Line Amount" - "Inv. Discount Amount";
                END;
              "VAT Calculation Type"::"Sales Tax":
                BEGIN
                  Amount := ROUND("Line Amount" - "Inv. Discount Amount",Currency."Amount Rounding Precision");
                  "VAT Base Amount" := Amount;
                  "Amount Including VAT" :=
                    TotalAmount + Amount +
                    ROUND(
                      SalesTaxCalculate.CalculateTax(
                        "Tax Area Code","Tax Group Code","Tax Liable",ServHeader."Posting Date",
                        TotalAmount + Amount,TotalQuantityBase + "Quantity (Base)",
                        ServHeader."Currency Factor"),Currency."Amount Rounding Precision") -
                    TotalAmountInclVAT;
                  IF "VAT Base Amount" <> 0 THEN
                    "VAT %" :=
                      ROUND(100 * ("Amount Including VAT" - "VAT Base Amount") / "VAT Base Amount",0.00001)
                  ELSE
                    "VAT %" := 0;
                END;
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..32
          THEN BEGIN
            IF ServiceLine2.FIND('-') THEN
              REPEAT
                TotalLineAmount := TotalLineAmount + ServiceLine2."Line Amount";
                TotalInvDiscAmount := TotalInvDiscAmount + ServiceLine2."Inv. Discount Amount";
                TotalAmount := TotalAmount + ServiceLine2.Amount;
                TotalAmountInclVAT := TotalAmountInclVAT + ServiceLine2."Amount Including VAT";
                TotalQuantityBase := TotalQuantityBase + ServiceLine2."Quantity (Base)";
              UNTIL ServiceLine2.NEXT = 0;
          END;
        #42..124
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "UpdateAmounts(PROCEDURE 13).CustCheckCrLimit(Variable 1000)".

}

