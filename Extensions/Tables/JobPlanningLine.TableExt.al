TableExtension 52193615 tableextension52193615 extends "Job Planning Line" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Job Planning Line"(Table 1003)".

    fields
    {
        modify("No.")
        {
            TableRelation = if (Type=const(Resource)) Resource
                            else if (Type=const(Item)) Item where (Type=const(Inventory))
                            else if (Type=const("G/L Account")) "G/L Account"
                            else if (Type=const(Text)) "Standard Text";
        }

        //Unsupported feature: Code Modification on ""No."(Field 7).OnValidate".

        //trigger "(Field 7)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ValidateModification;

            CheckUsageLinkRelations;
            #4..24
              Type::Resource:
                BEGIN
                  Res.GET("No.");
                  Res.CheckResourcePrivacyBlocked(FALSE);
                  Res.TESTFIELD(Blocked,FALSE);
                  Description := Res.Name;
                  "Description 2" := Res."Name 2";
            #32..70

            IF Type <> Type::Text THEN
              VALIDATE(Quantity);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..27
            #29..73
            */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Usage Link" THEN
              IF NOT BypassQtyValidation THEN BEGIN
                IF ("Qty. Posted" > 0) AND (Quantity < "Qty. Posted") THEN
                  ERROR(Text005,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Posted"));
                IF ("Qty. Posted" < 0) AND (Quantity > "Qty. Posted") THEN
                  ERROR(Text015,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Posted"));
              END;

            CALCFIELDS("Qty. Transferred to Invoice");
            IF ("Qty. Transferred to Invoice" > 0) AND (Quantity < "Qty. Transferred to Invoice") THEN
              ERROR(Text005,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Transferred to Invoice"));
            IF ("Qty. Transferred to Invoice" < 0) AND (Quantity > "Qty. Transferred to Invoice") THEN
              ERROR(Text015,FIELDCAPTION(Quantity),FIELDCAPTION("Qty. Transferred to Invoice"));

            CASE Type OF
              Type::Item:
                IF NOT Item.GET("No.") THEN
            #18..38
            UpdateReservation(FIELDNO(Quantity));

            UpdateAllAmounts;
            BypassQtyValidation := FALSE;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF "Usage Link" THEN BEGIN
              IF NOT BypassQtyPostedValidation THEN BEGIN
            #3..7
            END;
            #8..14
            BypassQtyPostedValidation := FALSE;

            #15..41
            */
        //end;

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 30)".



        //Unsupported feature: Code Modification on ""Work Type Code"(Field 32).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ValidateModification;
            TESTFIELD(Type,Type::Resource);

            #4..6
              "Unit of Measure Code" := Res."Base Unit of Measure";
              VALIDATE("Unit of Measure Code");
            END;
            IF WorkType.GET("Work Type Code") THEN
              IF WorkType."Unit of Measure Code" <> '' THEN BEGIN
                "Unit of Measure Code" := WorkType."Unit of Measure Code";
                IF ResUnitofMeasure.GET("No.","Unit of Measure Code") THEN
            #14..16
                "Unit of Measure Code" := Res."Base Unit of Measure";
                VALIDATE("Unit of Measure Code");
              END;
            VALIDATE(Quantity);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..9
            IF WorkType.GET("Work Type Code") THEN BEGIN
            #11..19
            END;
            VALIDATE(Quantity);
            */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Currency Date"(Field 1024)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Reserved Quantity"(Field 1100)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Reserved Qty. (Base)"(Field 1101)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Reserve(Field 1102)".

        field(50000;ActivityID;Integer)
        {
        }
        field(50001;Days;Integer)
        {
        }
        field(50002;AgencyFeeRate;Decimal)
        {
        }
        field(50003;Activity;Text[250])
        {
        }
        field(50004;ItemNumber;Text[50])
        {
        }
        field(50005;Allocation;Text[150])
        {
        }
        field(50006;BudgetID;Integer)
        {
        }
    }


    //Unsupported feature: Code Modification on "SetUpNewLine(PROCEDURE 9)".

    //procedure SetUpNewLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Document Date" := LastJobPlanningLine."Planning Date";
        "Document No." := LastJobPlanningLine."Document No.";
        Type := LastJobPlanningLine.Type;
        VALIDATE("Line Type",LastJobPlanningLine."Line Type");
        GetJob;
        "Currency Code" := Job."Currency Code";
        UpdateCurrencyFactor;
        IF LastJobPlanningLine."Planning Date" <> 0D THEN
          VALIDATE("Planning Date",LastJobPlanningLine."Planning Date");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
        IF LastJobPlanningLine."Planning Date" <> 0D THEN
          VALIDATE("Planning Date",LastJobPlanningLine."Planning Date");
        */
    //end;


    //Unsupported feature: Code Modification on "InitJobPlanningLine(PROCEDURE 4)".

    //procedure InitJobPlanningLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetJob;
        IF "Planning Date" = 0D THEN
          VALIDATE("Planning Date",WORKDATE);
        #4..6
        "VAT Line Discount Amount" := 0;
        "VAT Line Amount" := 0;
        "VAT %" := 0;
        "Job Contract Entry No." := JobJnlManagement.GetNextEntryNo;
        "User ID" := USERID;
        "Last Date Modified" := 0D;
        Status := Job.Status;
        ControlUsageLink;
        "Country/Region Code" := Job."Bill-to Country/Region Code";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..9
        "Job Ledger Entry No." := 0;
        #10..14
        */
    //end;


    //Unsupported feature: Code Modification on "RetrieveCostPrice(PROCEDURE 13)".

    //procedure RetrieveCostPrice();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE Type OF
          Type::Item:
            IF ("No." <> xRec."No.") OR
               ("Location Code" <> xRec."Location Code") OR
               ("Variant Code" <> xRec."Variant Code") OR
               (NOT BypassQtyValidation AND (Quantity <> xRec.Quantity)) OR
               ("Unit of Measure Code" <> xRec."Unit of Measure Code")
            THEN
              EXIT(TRUE);
        #10..19
            EXIT(FALSE);
        END;
        EXIT(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
               (Quantity <> xRec.Quantity) OR
        #7..22
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
        #4..9
              "Line Amount" := "Total Price" - "Line Discount Amount";
              "Line Discount %" :=
                ROUND("Line Discount Amount" / "Total Price" * 100,0.00001);
            END ELSE
              IF ("Line Discount Amount" = xRec."Line Discount Amount") AND
                 (("Line Amount" <> xRec."Line Amount") OR ("Line Discount %" <> xRec."Line Discount %") OR
                  ("Total Price" <> xRec."Total Price"))
              THEN BEGIN
                "Line Discount Amount" :=
                  ROUND("Total Price" * "Line Discount %" / 100,AmountRoundingPrecisionFCY);
                "Line Amount" := "Total Price" - "Line Discount Amount";
              END;
        END ELSE BEGIN
          "Line Amount" := 0;
          "Line Discount Amount" := 0;
        #25..34
              "Currency Date","Currency Code",
              "Line Discount Amount","Currency Factor"),
            AmountRoundingPrecision);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..12
            END ELSE BEGIN
        #14..21
            END;
        #22..37
        */
    //end;

    //Unsupported feature: Parameter Insertion (Parameter: JobLedgerEntry) (ParameterCollection) on "UpdatePostedTotalCost(PROCEDURE 33)".



    //Unsupported feature: Code Modification on "UpdatePostedTotalCost(PROCEDURE 33)".

    //procedure UpdatePostedTotalCost();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Usage Link" THEN BEGIN
          InitRoundingPrecisions;
          "Posted Total Cost" += ROUND(AdjustJobCost,AmountRoundingPrecisionFCY);
          "Posted Total Cost (LCY)" += ROUND(AdjustJobCostLCY,AmountRoundingPrecision);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF "Usage Link" THEN BEGIN
          InitRoundingPrecisions;
          "Posted Total Cost" := ROUND("Qty. Posted" * JobLedgerEntry."Unit Cost",AmountRoundingPrecisionFCY);
          "Posted Total Cost (LCY)" := ROUND("Qty. Posted" * JobLedgerEntry."Unit Cost (LCY)",AmountRoundingPrecision);
        END;
        */
    //end;

    //Unsupported feature: Property Modification (Name) on "SetBypassQtyValidation(PROCEDURE 32)".



    //Unsupported feature: Code Modification on "SetBypassQtyValidation(PROCEDURE 32)".

    //procedure SetBypassQtyValidation();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        BypassQtyValidation := Bypass;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        BypassQtyPostedValidation := Bypass;
        */
    //end;


    //Unsupported feature: Code Modification on "DrillDownJobInvoices(PROCEDURE 34)".

    //procedure DrillDownJobInvoices();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        JobInvoices.SetShowDetails(FALSE);
        JobInvoices.SetPrJobPlanningLine(Rec);
        JobInvoices.RUN;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        JobInvoices.SetPrJobPlanningLine(Rec);
        JobInvoices.RUN;
        */
    //end;

    //Unsupported feature: Deletion (ParameterCollection) on "UpdatePostedTotalCost(PROCEDURE 33).AdjustJobCost(Parameter 1000)".


    //Unsupported feature: Deletion (ParameterCollection) on "UpdatePostedTotalCost(PROCEDURE 33).AdjustJobCostLCY(Parameter 1001)".


    var
        BypassQtyPostedValidation: Boolean;
}

