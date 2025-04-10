TableExtension 52193439 tableextension52193439 extends "Sales Line" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Sales Line"(Table 37)".

    fields
    {
        modify("Unit of Measure Code")
        {
            TableRelation = if (Type=const(Item)) "Item Unit of Measure".Code where ("Item No."=field("No."))
                            else if (Type=const(Resource)) "Resource Unit of Measure".Code where ("Resource No."=field("No."))
                            else "Unit of Measure";
        }

        //Unsupported feature: Code Modification on ""No."(Field 6).OnValidate".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TestJobPlanningLine;
            TestStatusOpen;
            CheckItemAvailable(FIELDNO("No."));
            #4..191
                END;
            END;

            IF NOT (Type IN [Type::" ",Type::"Fixed Asset"]) THEN
              VALIDATE("VAT Prod. Posting Group");

            UpdatePrepmtSetupFields;

            IF Type <> Type::" " THEN BEGIN
              VALIDATE("Unit of Measure Code");
              IF Quantity <> 0 THEN BEGIN
                InitOutstanding;
            #204..210
              UpdateUnitPrice(FIELDNO("No."));
            END;

            IF NOT TypeHelper.IsRecordTemporary(Rec) THEN
              CreateDim(
                DimMgt.TypeToTableID3(Type),"No.",
                DATABASE::Job,"Job No.",
                DATABASE::"Responsibility Center","Responsibility Center");

            IF "No." <> xRec."No." THEN BEGIN
              IF Type = Type::Item THEN
            #222..229
                DeleteChargeChargeAssgnt("Document Type","Document No.","Line No.");
            END;

            UpdateItemCrossRef;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..194
            VALIDATE("Prepayment %");

            IF Type <> Type::" " THEN BEGIN
              IF Type <> Type::"Fixed Asset" THEN
                VALIDATE("VAT Prod. Posting Group");
            #201..213
            CreateDim(
              DimMgt.TypeToTableID3(Type),"No.",
              DATABASE::Job,"Job No.",
              DATABASE::"Responsibility Center","Responsibility Center");
            #219..232
            GetItemCrossRef(FIELDNO("No."));

            InitICPartner;
            */
        //end;


        //Unsupported feature: Code Modification on ""Shipment Date"(Field 10).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TestStatusOpen;
            WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
            IF CurrFieldNo <> 0 THEN
              AddOnIntegrMgt.CheckReceiptOrderStatus(Rec);

            #6..25
            AutoAsmToOrder;
            IF (xRec."Shipment Date" <> "Shipment Date") AND
               (Quantity <> 0) AND
               NOT StatusCheckSuspended
            THEN
              CheckDateConflict.SalesLineCheck(Rec,CurrFieldNo <> 0);

            IF NOT PlannedShipmentDateCalculated THEN
              "Planned Shipment Date" := CalcPlannedShptDate(FIELDNO("Shipment Date"));
            IF NOT PlannedDeliveryDateCalculated THEN
              "Planned Delivery Date" := CalcPlannedDeliveryDate(FIELDNO("Shipment Date"));
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            TestStatusOpen;
            #3..28
               (Reserve <> Reserve::Never) AND
            #29..36
            */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TestJobPlanningLine;
            TestStatusOpen;

            #4..45
              ELSE
                InitQtyToShip;
              InitQtyToAsm;
              SetDefaultQuantity;
            END;

            CheckItemAvailable(FIELDNO(Quantity));
            #53..87

            CALCFIELDS("Reserved Qty. (Base)");
            VALIDATE("Reserved Qty. (Base)");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..48
            #50..90
            */
        //end;


        //Unsupported feature: Code Modification on ""Line Discount Amount"(Field 28).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            GetSalesHeader;
            "Line Discount Amount" := ROUND("Line Discount Amount",Currency."Amount Rounding Precision");
            TestJobPlanningLine;
            TestStatusOpen;
            TESTFIELD(Quantity);
            IF xRec."Line Discount Amount" <> "Line Discount Amount" THEN
              UpdateLineDiscPct;
            "Inv. Discount Amount" := 0;
            "Inv. Disc. Amount to Invoice" := 0;
            UpdateAmounts;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..6
              IF ROUND(Quantity * "Unit Price",Currency."Amount Rounding Precision") <> 0 THEN
                "Line Discount %" :=
                  ROUND(
                    "Line Discount Amount" / ROUND(Quantity * "Unit Price",Currency."Amount Rounding Precision") * 100,
                    0.00001)
              ELSE
                "Line Discount %" := 0;
            #8..10
            */
        //end;


        //Unsupported feature: Code Modification on ""Blanket Order Line No."(Field 98).OnValidate".

        //trigger "(Field 98)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD("Quantity Shipped",0);
            IF "Blanket Order Line No." <> 0 THEN BEGIN
              SalesLine2.GET("Document Type"::"Blanket Order","Blanket Order No.","Blanket Order Line No.");
              SalesLine2.TESTFIELD(Type,Type);
              SalesLine2.TESTFIELD("No.","No.");
              SalesLine2.TESTFIELD("Bill-to Customer No.","Bill-to Customer No.");
              SalesLine2.TESTFIELD("Sell-to Customer No.","Sell-to Customer No.");
              VALIDATE("Location Code",SalesLine2."Location Code");
              VALIDATE("Unit of Measure Code",SalesLine2."Unit of Measure Code");
              VALIDATE("Unit Price",SalesLine2."Unit Price");
              VALIDATE("Line Discount %",SalesLine2."Line Discount %");
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..7
            END;
            */
        //end;


        //Unsupported feature: Code Modification on ""IC Partner Ref. Type"(Field 107).OnValidate".

        //trigger  Type"(Field 107)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "IC Partner Code" <> '' THEN
              "IC Partner Ref. Type" := "IC Partner Ref. Type"::"G/L Account";
            IF "IC Partner Ref. Type" <> xRec."IC Partner Ref. Type" THEN
              "IC Partner Reference" := '';
            IF "IC Partner Ref. Type" = "IC Partner Ref. Type"::"Common Item No." THEN BEGIN
              IF Item."No." <> "No." THEN
                Item.GET("No.");
              Item.TESTFIELD("Common Item No.");
              "IC Partner Reference" := Item."Common Item No.";
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
            IF "IC Partner Ref. Type" = "IC Partner Ref. Type"::"Common Item No." THEN
              BEGIN
              IF Item."No." <> "No." THEN
                Item.GET("No.");
              "IC Partner Reference" := Item."Common Item No.";
            END;
            */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on ""Prepayment %"(Field 109).OnValidate".

        //trigger (Variable: GenPostingSetup)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on ""Prepayment %"(Field 109).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TestStatusOpen;
            UpdatePrepmtSetupFields;

            IF Type <> Type::" " THEN
              UpdateAmounts;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF ("Prepayment %" <> 0) AND (Type <> Type::" ") THEN BEGIN
              TESTFIELD("Document Type","Document Type"::Order);
              TESTFIELD("No.");
              IF CurrFieldNo = FIELDNO("Prepayment %") THEN
                IF "System-Created Entry" THEN
                  FIELDERROR("Prepmt. Line Amount",STRSUBSTNO(Text045,0));
              IF "System-Created Entry" THEN
                "Prepayment %" := 0;
              GenPostingSetup.GET("Gen. Bus. Posting Group","Gen. Prod. Posting Group");
              IF GenPostingSetup."Sales Prepayments Account" <> '' THEN BEGIN
                GLAcc.GET(GenPostingSetup."Sales Prepayments Account");
                VATPostingSetup.GET("VAT Bus. Posting Group",GLAcc."VAT Prod. Posting Group");
              END ELSE
                CLEAR(VATPostingSetup);
              "Prepayment VAT %" := VATPostingSetup."VAT %";
              "Prepmt. VAT Calc. Type" := VATPostingSetup."VAT Calculation Type";
              "Prepayment VAT Identifier" := VATPostingSetup."VAT Identifier";
              CASE "Prepmt. VAT Calc. Type" OF
                "VAT Calculation Type"::"Reverse Charge VAT",
                "VAT Calculation Type"::"Sales Tax":
                  "Prepayment VAT %" := 0;
                "VAT Calculation Type"::"Full VAT":
                  FIELDERROR("Prepmt. VAT Calc. Type",STRSUBSTNO(Text041,"Prepmt. VAT Calc. Type"));
              END;
              "Prepayment Tax Group Code" := GLAcc."Tax Group Code";
            END;

            TestStatusOpen;
            #3..5
            */
        //end;


        //Unsupported feature: Code Modification on ""Prepmt. Line Amount"(Field 110).OnValidate".

        //trigger  Line Amount"(Field 110)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TestStatusOpen;
            PrePaymentLineAmountEntered := TRUE;
            TESTFIELD("Line Amount");
            #4..6
              FIELDERROR("Prepmt. Line Amount",STRSUBSTNO(Text045,"Line Amount"));
            IF "System-Created Entry" THEN
              FIELDERROR("Prepmt. Line Amount",STRSUBSTNO(Text045,0));
            VALIDATE("Prepayment %",ROUND("Prepmt. Line Amount" * 100 / "Line Amount",0.00001));
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..9
            IF Quantity <> 0 THEN
              VALIDATE("Prepayment %",ROUND("Prepmt. Line Amount" /
                  ("Line Amount" * (Quantity - "Quantity Invoiced") / Quantity) * 100,0.00001))
            ELSE
              VALIDATE("Prepayment %",ROUND("Prepmt. Line Amount" * 100 / "Line Amount",0.00001));
            */
        //end;


        //Unsupported feature: Code Modification on ""Variant Code"(Field 5402).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TestJobPlanningLine;
            IF "Variant Code" <> '' THEN
              TESTFIELD(Type,Type::Item);
            #4..28
              WhseValidateSourceLine.SalesLineVerifyChange(Rec,xRec);
            END;

            UpdateItemCrossRef;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..31
            GetItemCrossRef(FIELDNO("Variant Code"));
            */
        //end;


        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 5407).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TestJobPlanningLine;
            TestStatusOpen;
            TESTFIELD("Quantity Shipped",0);
            TESTFIELD("Qty. Shipped (Base)",0);
            TESTFIELD("Return Qty. Received",0);
            TESTFIELD("Return Qty. Received (Base)",0);
            IF "Unit of Measure Code" <> xRec."Unit of Measure Code" THEN BEGIN
              TESTFIELD("Shipment No.",'');
              TESTFIELD("Return Receipt No.",'');
            #10..24
                  "Unit of Measure" := UnitOfMeasureTranslation.Description;
              END;
            END;
            DistIntegration.EnterSalesItemCrossRef(Rec);
            CASE Type OF
              Type::Item:
                BEGIN
            #32..56
                "Qty. per Unit of Measure" := 1;
            END;
            VALIDATE(Quantity);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
            #7..27
            GetItemCrossRef(FIELDNO("Unit of Measure Code"));
            #29..59
            */
        //end;


        //Unsupported feature: Code Modification on ""Cross-Reference No."(Field 5705).OnValidate".

        //trigger "(Field 5705)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            GetSalesHeader;
            "Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
            ReturnedCrossRef.INIT;
            IF "Cross-Reference No." <> '' THEN BEGIN
              DistIntegration.ICRLookupSalesItem(Rec,ReturnedCrossRef,CurrFieldNo <> 0);
              IF "No." <> ReturnedCrossRef."Item No." THEN
                VALIDATE("No.",ReturnedCrossRef."Item No.");
              IF ReturnedCrossRef."Variant Code" <> '' THEN
            #9..20
              Description := ReturnedCrossRef.Description;

            UpdateUnitPrice(FIELDNO("Cross-Reference No."));
            UpdateICPartner;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
              DistIntegration.ICRLookupSalesItem(Rec,ReturnedCrossRef);
            #6..23

            IF SalesHeader."Send IC Document" AND (SalesHeader."IC Direction" = SalesHeader."IC Direction"::Outgoing) THEN BEGIN
              "IC Partner Ref. Type" := "IC Partner Ref. Type"::"Cross Reference";
              "IC Partner Reference" := "Cross-Reference No.";
            END;
            */
        //end;


        //Unsupported feature: Code Modification on ""Planned Shipment Date"(Field 5795).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TestStatusOpen;
            IF "Planned Shipment Date" <> 0D THEN BEGIN
              PlannedShipmentDateCalculated := TRUE;
            #4..7
                  CalendarMgmt.CalcDateBOC2(
                    FORMAT("Outbound Whse. Handling Time"),
                    "Planned Shipment Date",
                    CalChange."Source Type"::Location,
                    "Location Code",
                    '',
                    CalChange."Source Type"::"Shipping Agent",
                    "Shipping Agent Code",
                    "Shipping Agent Service Code",
                    FALSE))
              ELSE
                VALIDATE(
            #20..28
                    '',
                    FALSE));
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..10
            #14..16
            #11..13
            #17..31
            */
        //end;
        field(60000;"Levy Type";Code[30])
        {
            TableRelation = Fees;
        }
        field(60001;"Base Amount";Decimal)
        {

            trigger OnValidate()
            begin
                if FeesRec.Get("Levy Type") then begin
                  case true of
                   FeesRec.Limited:
                    begin
                     case true of
                      (FeesRec.Percentage/100*"Base Amount">=FeesRec."Minimum Amount") and
                      (FeesRec.Percentage/100*"Base Amount"<=FeesRec."Maximum Amount"):
                        begin
                         "Unit Price":=ROUND(FeesRec.Percentage/100*"Base Amount",1);
                         "Limit Text":='Actual';
                        end;

                      FeesRec.Percentage/100*"Base Amount"<FeesRec."Minimum Amount":
                       begin
                        "Unit Price":=FeesRec."Minimum Amount";
                        "Limit Text":='Minimum';
                       end
                      else
                       begin
                         "Unit Price":=FeesRec."Maximum Amount";
                         "Limit Text":='Maximum';
                       end;
                     end;
                    end;
                    else
                     begin
                        "Unit Price":=ROUND(FeesRec.Percentage/100*"Base Amount",1);
                     end;
                  end;
                end;
            end;
        }
        field(60002;"Limit Text";Text[30])
        {
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TestStatusOpen;
        IF NOT StatusCheckSuspended AND (SalesHeader.Status = SalesHeader.Status::Released) AND
           (Type IN [Type::"G/L Account",Type::"Charge (Item)",Type::Resource])
        #4..15
        END;

        IF ("Document Type" = "Document Type"::Order) AND (Quantity <> "Quantity Invoiced") THEN
          TESTFIELD("Prepmt. Amt. Inv.","Prepmt Amt Deducted");

        CleanDropShipmentFields;
        CleanSpecialOrderFields;
        CheckAssocPurchOrder('');
        NonstockItemMgt.DelNonStockSales(Rec);

        #26..59
        IF NOT SalesCommentLine.ISEMPTY THEN
          SalesCommentLine.DELETEALL;

        IF ("Line No." <> 0) AND ("Attached to Line No." = 0) THEN BEGIN
          SalesLine2.COPY(Rec);
          IF SalesLine2.FIND('<>') THEN BEGIN
            SalesLine2.VALIDATE("Recalculate Invoice Disc.",TRUE);
            SalesLine2.MODIFY;
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..18
          TESTFIELD("Prepmt. Amt. Inv.",0);

        #23..62
        IF "Line No." <> 0 THEN BEGIN
          SalesLine2.RESET;
          SalesLine2.SETRANGE("Document Type","Document Type");
          SalesLine2.SETRANGE("Document No.","Document No.");
          SalesLine2.SETFILTER("Line No.",'<>%1',"Line No.");
          IF SalesLine2.FINDFIRST THEN BEGIN
        #66..69
        */
    //end;


    //Unsupported feature: Code Modification on "InitOutstandingAmount(PROCEDURE 17)".

    //procedure InitOutstandingAmount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Quantity = 0 THEN BEGIN
          "Outstanding Amount" := 0;
          "Outstanding Amount (LCY)" := 0;
        #4..6
          "Return Rcd. Not Invd. (LCY)" := 0;
        END ELSE BEGIN
          GetSalesHeader;
          AmountInclVAT := "Amount Including VAT";
          VALIDATE(
            "Outstanding Amount",
            ROUND(
        #14..25
                AmountInclVAT * "Qty. Shipped Not Invoiced" / Quantity,
                Currency."Amount Rounding Precision"));
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..9
          IF SalesHeader.Status = SalesHeader.Status::Released THEN
            AmountInclVAT := "Amount Including VAT"
          ELSE
            IF SalesHeader."Prices Including VAT" THEN
              AmountInclVAT := "Line Amount" - "Inv. Discount Amount"
            ELSE
              IF "VAT Calculation Type" = "VAT Calculation Type"::"Sales Tax" THEN
                AmountInclVAT :=
                  "Line Amount" - "Inv. Discount Amount" +
                  ROUND(
                    SalesTaxCalculate.CalculateTax(
                      "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
                      "Line Amount" - "Inv. Discount Amount","Quantity (Base)",SalesHeader."Currency Factor"),
                    Currency."Amount Rounding Precision")
              ELSE
                AmountInclVAT :=
                  ROUND(
                    ("Line Amount" - "Inv. Discount Amount") *
                    (1 + "VAT %" / 100 * (1 - SalesHeader."VAT Base Discount %" / 100)),
                    Currency."Amount Rounding Precision");
        #11..28
        */
    //end;


    //Unsupported feature: Code Modification on "InitQtyToShip(PROCEDURE 15)".

    //procedure InitQtyToShip();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetSalesSetup;
        IF (SalesSetup."Default Quantity to Ship" = SalesSetup."Default Quantity to Ship"::Remainder) OR
           ("Document Type" = "Document Type"::Invoice)
        THEN BEGIN
          "Qty. to Ship" := "Outstanding Quantity";
          "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";
        END ELSE
          IF "Qty. to Ship" <> 0 THEN
            "Qty. to Ship (Base)" := CalcBaseQty("Qty. to Ship");

        CheckServItemCreation;

        InitQtyToInvoice;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "Qty. to Ship" := "Outstanding Quantity";
        "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";
        #10..13
        */
    //end;


    //Unsupported feature: Code Modification on "InitQtyToReceive(PROCEDURE 5803)".

    //procedure InitQtyToReceive();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetSalesSetup;
        IF (SalesSetup."Default Quantity to Ship" = SalesSetup."Default Quantity to Ship"::Remainder) OR
           ("Document Type" = "Document Type"::"Credit Memo")
        THEN BEGIN
          "Return Qty. to Receive" := "Outstanding Quantity";
          "Return Qty. to Receive (Base)" := "Outstanding Qty. (Base)";
        END ELSE
          IF "Return Qty. to Receive" <> 0 THEN
            "Return Qty. to Receive (Base)" := CalcBaseQty("Return Qty. to Receive");

        InitQtyToInvoice;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "Return Qty. to Receive" := "Outstanding Quantity";
        "Return Qty. to Receive (Base)" := "Outstanding Qty. (Base)";

        InitQtyToInvoice;
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateAmounts(PROCEDURE 3)".

    //procedure UpdateAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Type = Type::" " THEN
          EXIT;
        GetSalesHeader;

        "Recalculate Invoice Disc." := TRUE;
        #6..30
              IF RemLineAmountToInvoice < ("Prepmt. Line Amount" - "Prepmt Amt Deducted") THEN
                FIELDERROR("Prepmt. Line Amount",STRSUBSTNO(Text045,RemLineAmountToInvoice + "Prepmt Amt Deducted"));
            END;
          END ELSE
            IF (CurrFieldNo <> 0) AND ("Line Amount" <> xRec."Line Amount") AND
               ("Prepmt. Amt. Inv." <> 0) AND ("Prepayment %" = 100)
            THEN BEGIN
              IF "Line Amount" < xRec."Line Amount" THEN
                FIELDERROR("Line Amount",STRSUBSTNO(Text044,xRec."Line Amount"));
              FIELDERROR("Line Amount",STRSUBSTNO(Text045,xRec."Line Amount"));
            END;
        END;
        InitOutstandingAmount;
        IF (CurrFieldNo <> 0) AND
        #45..53
          UpdateItemChargeAssgnt;

        CalcPrepaymentToDeduct;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF CurrFieldNo <> FIELDNO("Allow Invoice Disc.") THEN
          TESTFIELD(Type);
        #3..33
          END;
        #42..56
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateVATAmounts(PROCEDURE 38)".

    //procedure UpdateVATAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetSalesHeader;
        SalesLine2.SETRANGE("Document Type","Document Type");
        SalesLine2.SETRANGE("Document No.","Document No.");
        SalesLine2.SETFILTER("Line No.",'<>%1',"Line No.");
        IF "Line Amount" = 0 THEN
          IF xRec."Line Amount" >= 0 THEN
            SalesLine2.SETFILTER(Amount,'>%1',0)
          ELSE
            SalesLine2.SETFILTER(Amount,'<%1',0)
        ELSE
          IF "Line Amount" > 0 THEN
            SalesLine2.SETFILTER(Amount,'>%1',0)
          ELSE
            SalesLine2.SETFILTER(Amount,'<%1',0);
        SalesLine2.SETRANGE("VAT Identifier","VAT Identifier");
        SalesLine2.SETRANGE("Tax Group Code","Tax Group Code");

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
               ["VAT Calculation Type"::"Normal VAT","VAT Calculation Type"::"Reverse Charge VAT"]) AND ("VAT %" <> 0))
          THEN
            IF NOT SalesLine2.ISEMPTY THEN BEGIN
              SalesLine2.CALCSUMS("Line Amount","Inv. Discount Amount",Amount,"Amount Including VAT","Quantity (Base)");
              TotalLineAmount := SalesLine2."Line Amount";
              TotalInvDiscAmount := SalesLine2."Inv. Discount Amount";
              TotalAmount := SalesLine2.Amount;
              TotalAmountInclVAT := SalesLine2."Amount Including VAT";
              TotalQuantityBase := SalesLine2."Quantity (Base)";
            END;

          IF SalesHeader."Prices Including VAT" THEN
            CASE "VAT Calculation Type" OF
              "VAT Calculation Type"::"Normal VAT",
              "VAT Calculation Type"::"Reverse Charge VAT":
                BEGIN
                  Amount :=
                    ROUND(
                      (TotalLineAmount - TotalInvDiscAmount + "Line Amount" - "Inv. Discount Amount") / (1 + "VAT %" / 100),
                      Currency."Amount Rounding Precision") -
                    TotalAmount;
                  "VAT Base Amount" :=
                    ROUND(
                      Amount * (1 - SalesHeader."VAT Base Discount %" / 100),
                      Currency."Amount Rounding Precision");
                  "Amount Including VAT" :=
                    TotalLineAmount + "Line Amount" -
                    ROUND(
                      (TotalAmount + Amount) * (SalesHeader."VAT Base Discount %" / 100) * "VAT %" / 100,
                      Currency."Amount Rounding Precision",Currency.VATRoundingDirection) -
                    TotalAmountInclVAT - TotalInvDiscAmount - "Inv. Discount Amount";
                END;
              "VAT Calculation Type"::"Full VAT":
                BEGIN
                  Amount := 0;
                  "VAT Base Amount" := 0;
                END;
              "VAT Calculation Type"::"Sales Tax":
                BEGIN
                  SalesHeader.TESTFIELD("VAT Base Discount %",0);
                  Amount :=
                    SalesTaxCalculate.ReverseCalculateTax(
                      "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
                      TotalAmountInclVAT + "Amount Including VAT",TotalQuantityBase + "Quantity (Base)",
                      SalesHeader."Currency Factor") -
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
                    ROUND(Amount * (1 - SalesHeader."VAT Base Discount %" / 100),Currency."Amount Rounding Precision");
                  "Amount Including VAT" :=
                    TotalAmount + Amount +
                    ROUND(
                      (TotalAmount + Amount) * (1 - SalesHeader."VAT Base Discount %" / 100) * "VAT %" / 100,
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
                        "Tax Area Code","Tax Group Code","Tax Liable",SalesHeader."Posting Date",
                        TotalAmount + Amount,TotalQuantityBase + "Quantity (Base)",
                        SalesHeader."Currency Factor"),Currency."Amount Rounding Precision") -
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
        #1..30
          THEN BEGIN
            IF SalesLine2.FINDSET THEN
              REPEAT
                TotalLineAmount := TotalLineAmount + SalesLine2."Line Amount";
                TotalInvDiscAmount := TotalInvDiscAmount + SalesLine2."Inv. Discount Amount";
                TotalAmount := TotalAmount + SalesLine2.Amount;
                TotalAmountInclVAT := TotalAmountInclVAT + SalesLine2."Amount Including VAT";
                TotalQuantityBase := TotalQuantityBase + SalesLine2."Quantity (Base)";
              UNTIL SalesLine2.NEXT = 0;
          END;
        #40..125
        */
    //end;


    //Unsupported feature: Code Modification on "CheckItemAvailable(PROCEDURE 4)".

    //procedure CheckItemAvailable();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Reserve = Reserve::Always THEN
          EXIT;

        #4..14
           ("Outstanding Quantity" > 0) AND
           ("Job Contract Entry No." = 0) AND
           NOT (Nonstock OR "Special Order")
        THEN BEGIN
          IF ItemCheckAvail.SalesLineCheck(Rec) THEN
            ItemCheckAvail.RaiseUpdateInterruptedError;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..17
        THEN
          IF ItemCheckAvail.SalesLineCheck(Rec) THEN
            ItemCheckAvail.RaiseUpdateInterruptedError;
        */
    //end;


    //Unsupported feature: Code Modification on "ValidateShortcutDimCode(PROCEDURE 29)".

    //procedure ValidateShortcutDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
        VerifyItemLineDim;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateItemChargeAssgnt(PROCEDURE 5807)".

    //procedure UpdateItemChargeAssgnt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Document Type" = "Document Type"::"Blanket Order" THEN
          EXIT;

        CALCFIELDS("Qty. Assigned","Qty. to Assign");
        IF ABS("Quantity Invoiced") > ABS(("Qty. Assigned" + "Qty. to Assign")) THEN
          ERROR(Text055,FIELDCAPTION("Quantity Invoiced"),FIELDCAPTION("Qty. Assigned"),FIELDCAPTION("Qty. to Assign"));
        #7..10
        ItemChargeAssgntSales.SETRANGE("Document Line No.","Line No.");
        ItemChargeAssgntSales.CALCSUMS("Qty. to Assign");
        TotalQtyToAssign := ItemChargeAssgntSales."Qty. to Assign";
        IF (CurrFieldNo <> 0) AND (Amount <> xRec.Amount) AND
           NOT ((Quantity <> xRec.Quantity) AND (TotalQtyToAssign = 0))
        THEN BEGIN
          ItemChargeAssgntSales.SETFILTER("Qty. Assigned",'<>0');
          IF NOT ItemChargeAssgntSales.ISEMPTY THEN
            ERROR(Text026,
        #20..24
          GetSalesHeader;
          IF SalesHeader."Prices Including VAT" THEN
            TotalAmtToAssign :=
              ROUND(("Line Amount" - "Inv. Discount Amount") / (1 + "VAT %" / 100) - "VAT Difference",
                Currency."Amount Rounding Precision")
          ELSE
            TotalAmtToAssign := "Line Amount" - "Inv. Discount Amount";
        #32..40
                ItemChargeAssgntSales."Unit Cost" :=
                  ROUND(("Line Amount" - "Inv. Discount Amount") / Quantity / ShareOfVAT,
                    Currency."Unit-Amount Rounding Precision");
            IF TotalQtyToAssign <> 0 THEN BEGIN
              ItemChargeAssgntSales."Amount to Assign" :=
                ROUND(ItemChargeAssgntSales."Qty. to Assign" / TotalQtyToAssign * TotalAmtToAssign,
                  Currency."Amount Rounding Precision");
        #48..51
          UNTIL ItemChargeAssgntSales.NEXT = 0;
          CALCFIELDS("Qty. to Assign");
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #4..13
        IF (CurrFieldNo <> 0) AND (Amount <> xRec.Amount) THEN BEGIN
        #17..27
              ROUND(("Line Amount" - "Inv. Discount Amount") / (1 + "VAT %" / 100),
        #29..43
            IF TotalQtyToAssign > 0 THEN BEGIN
        #45..54
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateVATOnLines(PROCEDURE 36)".

    //procedure UpdateVATOnLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF QtyType = QtyType::Shipping THEN
          EXIT;
        IF SalesHeader."Currency Code" = '' THEN
        #4..30
                      ROUND("Line Amount" * "Qty. to Invoice" / Quantity,Currency."Amount Rounding Precision");

                  IF "Allow Invoice Disc." THEN BEGIN
                    IF (VATAmountLine."Inv. Disc. Base Amount" = 0) OR (LineAmountToInvoice = 0) THEN
                      InvDiscAmount := 0
                    ELSE BEGIN
                      LineAmountToInvoiceDiscounted :=
        #38..41
                      InvDiscAmount :=
                        ROUND(
                          TempVATAmountLineRemainder."Invoice Discount Amount",Currency."Amount Rounding Precision");
                      TempVATAmountLineRemainder."Invoice Discount Amount" :=
                        TempVATAmountLineRemainder."Invoice Discount Amount" - InvDiscAmount;
                    END;
        #48..111
                    ELSE
                      "VAT Difference" := ROUND(VATDifference,Currency."Amount Rounding Precision");
                  END;
                  IF QtyType = QtyType::General THEN
                    UpdateBaseAmounts(NewAmount,ROUND(NewAmountIncludingVAT,Currency."Amount Rounding Precision"),NewVATBaseAmount);
                  InitOutstanding;
                  IF Type = Type::"Charge (Item)" THEN
                    UpdateItemChargeAssgnt;
        #120..127
              END;
            UNTIL NEXT = 0;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..33
                    IF VATAmountLine."Inv. Disc. Base Amount" = 0 THEN
        #35..44
                      LineAmountToInvoiceDiscounted := ROUND(LineAmountToInvoiceDiscounted,Currency."Amount Rounding Precision");
                      IF (InvDiscAmount < 0) AND (LineAmountToInvoiceDiscounted = 0) THEN
                        InvDiscAmount := 0;
        #45..114
                  IF QtyType = QtyType::General THEN BEGIN
                    Amount := NewAmount;
                    "Amount Including VAT" := ROUND(NewAmountIncludingVAT,Currency."Amount Rounding Precision");
                    "VAT Base Amount" := NewVATBaseAmount;
                  END;
        #117..130
        */
    //end;


    //Unsupported feature: Code Modification on "CalcVATAmountLines(PROCEDURE 35)".

    //procedure CalcVATAmountLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF SalesHeader."Currency Code" = '' THEN
          Currency.InitRoundingPrecision
        ELSE
        #4..11
            REPEAT
              IF NOT ZeroAmountLine(QtyType) THEN BEGIN
                IF (Type = Type::"G/L Account") AND NOT "Prepayment Line" THEN
                  RoundingLineInserted :=
                    (("No." = GetCPGInvRoundAcc(SalesHeader)) AND "System-Created Entry") OR RoundingLineInserted;
                IF "VAT Calculation Type" IN
                   ["VAT Calculation Type"::"Reverse Charge VAT","VAT Calculation Type"::"Sales Tax"]
                THEN
        #20..248
            VATAmountLine."Calculated VAT Amount" := VATAmountLine."Calculated VAT Amount" + TotalVATAmount;
            VATAmountLine.MODIFY;
          END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..14
                  RoundingLineInserted := ("No." = GetCPGInvRoundAcc(SalesHeader)) OR RoundingLineInserted;
        #17..251
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: SalesSetup) (VariableCollection) on "GetCPGInvRoundAcc(PROCEDURE 71)".



    //Unsupported feature: Code Modification on "GetCPGInvRoundAcc(PROCEDURE 71)".

    //procedure GetCPGInvRoundAcc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetSalesSetup;
        IF SalesSetup."Invoice Rounding" THEN
          IF Cust.GET(SalesHeader."Bill-to Customer No.") THEN
            CustPostingGroup.GET(Cust."Customer Posting Group")
          ELSE
            IF CustTemplate.GET(SalesHeader."Sell-to Customer Template Code") THEN
              CustPostingGroup.GET(CustTemplate."Customer Posting Group");

        EXIT(CustPostingGroup."Invoice Rounding Account");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SalesSetup.GET;
        #2..9
        */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: CalledByFieldNo) (ParameterCollection) on "GetItemCrossRef(PROCEDURE 48)".


    //Unsupported feature: Property Modification (Name) on "UpdateItemCrossRef(PROCEDURE 48)".



    //Unsupported feature: Code Modification on "UpdateItemCrossRef(PROCEDURE 48)".

    //procedure UpdateItemCrossRef();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DistIntegration.EnterSalesItemCrossRef(Rec);
        UpdateICPartner;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF CalledByFieldNo <> 0 THEN
          DistIntegration.EnterSalesItemCrossRef(Rec);
        */
    //end;


    //Unsupported feature: Code Modification on "GetLineAmountToHandle(PROCEDURE 117)".

    //procedure GetLineAmountToHandle();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Line Discount %" = 100 THEN
          EXIT(0);

        GetSalesHeader;
        LineAmount := ROUND(QtyToHandle * "Unit Price",Currency."Amount Rounding Precision");
        LineDiscAmount :=
          ROUND(
            LineAmount * "Line Discount %" / 100,Currency."Amount Rounding Precision");
        EXIT(LineAmount - LineDiscAmount);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        GetSalesHeader;
        LineAmount := ROUND(QtyToHandle * "Unit Price",Currency."Amount Rounding Precision");
        LineDiscAmount := ROUND("Line Discount Amount" * QtyToHandle / Quantity,Currency."Amount Rounding Precision");
        EXIT(LineAmount - LineDiscAmount);
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: SalesSetup) (VariableCollection) on "SetDefaultQuantity(PROCEDURE 62)".



    //Unsupported feature: Code Modification on "SetDefaultQuantity(PROCEDURE 62)".

    //procedure SetDefaultQuantity();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetSalesSetup;
        IF SalesSetup."Default Quantity to Ship" = SalesSetup."Default Quantity to Ship"::Blank THEN BEGIN
          IF ("Document Type" = "Document Type"::Order) OR ("Document Type" = "Document Type"::Quote) THEN BEGIN
            "Qty. to Ship" := 0;
        #5..12
            "Qty. to Invoice (Base)" := 0;
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SalesSetup.GET;
        #2..15
        */
    //end;

    //Unsupported feature: Property Modification (Name) on "UpdateICPartner(PROCEDURE 78)".



    //Unsupported feature: Code Modification on "UpdateICPartner(PROCEDURE 78)".

    //procedure UpdateICPartner();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF SalesHeader."Send IC Document" AND
           (SalesHeader."IC Direction" = SalesHeader."IC Direction"::Outgoing) AND
           (SalesHeader."Bill-to IC Partner Code" <> '')
        THEN
          CASE Type OF
            Type::" ",Type::"Charge (Item)":
              BEGIN
                "IC Partner Ref. Type" := Type;
                "IC Partner Reference" := "No.";
              END;
            Type::"G/L Account":
              BEGIN
                "IC Partner Ref. Type" := Type;
                "IC Partner Reference" := GLAcc."Default IC Partner G/L Acc. No";
              END;
            Type::Item:
              BEGIN
                IF SalesHeader."Sell-to IC Partner Code" <> '' THEN
                  ICPartner.GET(SalesHeader."Sell-to IC Partner Code")
                ELSE
                  ICPartner.GET(SalesHeader."Bill-to IC Partner Code");
                CASE ICPartner."Outbound Sales Item No. Type" OF
                  ICPartner."Outbound Sales Item No. Type"::"Common Item No.":
                    VALIDATE("IC Partner Ref. Type","IC Partner Ref. Type"::"Common Item No.");
                  ICPartner."Outbound Sales Item No. Type"::"Internal No.",
                  ICPartner."Outbound Sales Item No. Type"::"Cross Reference":
                    BEGIN
                      ItemCrossReference.SETRANGE("Cross-Reference Type",ItemCrossReference."Cross-Reference Type"::Customer);
                      ItemCrossReference.SETRANGE("Cross-Reference Type No.","Sell-to Customer No.");
                      ItemCrossReference.SETRANGE("Item No.","No.");
                      ItemCrossReference.SETRANGE("Variant Code","Variant Code");
                      ItemCrossReference.SETRANGE("Unit of Measure","Unit of Measure Code");
                      IF ItemCrossReference.FINDFIRST THEN BEGIN
                        VALIDATE("IC Partner Ref. Type","IC Partner Ref. Type"::"Cross Reference");
                        "IC Partner Reference" := ItemCrossReference."Cross-Reference No.";
                      END ELSE BEGIN
                        "IC Partner Ref. Type" := "IC Partner Ref. Type"::Item;
                        "IC Partner Reference" := "No.";
                      END;
                    END;
                END;
              END;
            Type::"Fixed Asset":
              BEGIN
                "IC Partner Ref. Type" := "IC Partner Ref. Type"::" ";
                "IC Partner Reference" := '';
              END;
            Type::Resource:
              BEGIN
                Resource.GET("No.");
                "IC Partner Ref. Type" := "IC Partner Ref. Type"::"G/L Account";
                "IC Partner Reference" := Resource."IC Partner Purch. G/L Acc. No.";
              END;
          END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF SalesHeader."Bill-to IC Partner Code" <> '' THEN
        #5..24
                  ICPartner."Outbound Sales Item No. Type"::"Internal No.":
                    BEGIN
                      "IC Partner Ref. Type" := "IC Partner Ref. Type"::Item;
                      "IC Partner Reference" := "No.";
                    END;
                  ICPartner."Outbound Sales Item No. Type"::"Cross Reference":
                    BEGIN
                      VALIDATE("IC Partner Ref. Type","IC Partner Ref. Type"::"Cross Reference");
                      ItemCrossReference.SETRANGE("Cross-Reference Type",
                        ItemCrossReference."Cross-Reference Type"::Customer);
                      ItemCrossReference.SETRANGE("Cross-Reference Type No.",
                        "Sell-to Customer No.");
                      ItemCrossReference.SETRANGE("Item No.","No.");
                      IF ItemCrossReference.FINDFIRST THEN
                        "IC Partner Reference" := ItemCrossReference."Cross-Reference No.";
        #40..54
        */
    //end;


    //Unsupported feature: Code Modification on "VerifyItemLineDim(PROCEDURE 87)".

    //procedure VerifyItemLineDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF IsShippedReceivedItemDimChanged THEN
          ConfirmShippedReceivedItemDimChange;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF ("Dimension Set ID" <> xRec."Dimension Set ID") AND (Type = Type::Item) THEN
          IF ("Qty. Shipped Not Invoiced" <> 0) OR ("Return Rcd. Not Invd." <> 0) THEN
            IF NOT CONFIRM(Text053,TRUE,TABLECAPTION) THEN
              ERROR(Text054);
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: DialogText) (VariableCollection) on "CheckWMS(PROCEDURE 98)".



    //Unsupported feature: Code Modification on "CheckWMS(PROCEDURE 98)".

    //procedure CheckWMS();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF CurrFieldNo <> 0 THEN
          CheckLocationOnWMS;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        DialogText := Text035;
        IF (CurrFieldNo <> 0) AND (Type = Type::Item) THEN
          IF "Quantity (Base)" <> 0 THEN
            CASE "Document Type" OF
              "Document Type"::Invoice:
                IF "Shipment No." = '' THEN
                  IF Location.GET("Location Code") AND Location."Directed Put-away and Pick" THEN BEGIN
                    DialogText += Location.GetRequirementText(Location.FIELDNO("Require Shipment"));
                    ERROR(Text016,DialogText,FIELDCAPTION("Line No."),"Line No.");
                  END;
              "Document Type"::"Credit Memo":
                IF "Return Receipt No." = '' THEN
                  IF Location.GET("Location Code") AND Location."Directed Put-away and Pick" THEN BEGIN
                    DialogText += Location.GetRequirementText(Location.FIELDNO("Require Receive"));
                    ERROR(Text016,DialogText,FIELDCAPTION("Line No."),"Line No.");
                  END;
            END;
        */
    //end;


    //Unsupported feature: Code Modification on "ValidateReturnReasonCode(PROCEDURE 99)".

    //procedure ValidateReturnReasonCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF CallingFieldNo = 0 THEN
          EXIT;
        IF "Return Reason Code" = '' THEN
          UpdateUnitPrice(CallingFieldNo);

        IF ReturnReason.GET("Return Reason Code") THEN BEGIN
          IF (CallingFieldNo <> FIELDNO("Location Code")) AND (ReturnReason."Default Location Code" <> '') THEN
            VALIDATE("Location Code",ReturnReason."Default Location Code");
          IF ReturnReason."Inventory Value Zero" THEN
            VALIDATE("Unit Cost (LCY)",0)
          ELSE
            IF "Unit Price" = 0 THEN
              UpdateUnitPrice(CallingFieldNo);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
          IF ReturnReason."Inventory Value Zero" THEN BEGIN
            VALIDATE("Unit Cost (LCY)",0);
            VALIDATE("Unit Price",0);
          END ELSE
        #12..14
        */
    //end;

    var
        GenPostingSetup: Record "General Posting Setup";
        GLAcc: Record "G/L Account";

    var
        Text041: label 'You must cancel the existing approval for this document to be able to change the %1 field.';

    var
        FeesRec: Record Fees;
}

