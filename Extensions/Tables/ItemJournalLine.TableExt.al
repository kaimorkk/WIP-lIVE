TableExtension 52193452 tableextension52193452 extends "Item Journal Line" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Item No."(Field 3).OnValidate".

        //trigger "(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Item No." <> xRec."Item No." THEN BEGIN
              "Variant Code" := '';
              "Bin Code" := '';
            #4..25
            GetItem;
            Item.TESTFIELD(Blocked,FALSE);
            Item.TESTFIELD(Type,Item.Type::Inventory);
            IF "Value Entry Type" = "Value Entry Type"::Revaluation THEN
              Item.TESTFIELD("Inventory Value Zero",FALSE);
            Description := Item.Description;
            "Inventory Posting Group" := Item."Inventory Posting Group";
            "Item Category Code" := Item."Item Category Code";
            #34..101
                      ERROR(Text031,"Item No.","Order No.");
                  IF ProdOrderLine.COUNT = 1 THEN BEGIN
                    VALIDATE("Order Line No.",ProdOrderLine."Line No.");
                    "Unit of Measure Code" := ProdOrderLine."Unit of Measure Code";
                    "Location Code" := ProdOrderLine."Location Code";
                    VALIDATE("Variant Code",ProdOrderLine."Variant Code");
            #108..129
                "Unit of Measure Code" := Item."Base Unit of Measure";
            END;

            IF "Value Entry Type" = "Value Entry Type"::Revaluation THEN
              "Unit of Measure Code" := Item."Base Unit of Measure";
            VALIDATE("Unit of Measure Code");
            IF "Variant Code" <> '' THEN
              VALIDATE("Variant Code");

            #139..145
                DATABASE::"Work Center","Work Center No.");

            ReserveItemJnlLine.VerifyChange(Rec,xRec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..28
            #31..104
                    "Routing Reference No." := ProdOrderLine."Routing Reference No.";
            #105..132
            IF "Value Entry Type"="Value Entry Type"::Revaluation THEN
              "Unit of Measure Code":=Item."Base Unit of Measure";
            //VALIDATE("Unit of Measure Code");
            #136..148
            */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Entry Type" <= "Entry Type"::Transfer THEN
              TESTFIELD("Item No.");

            IF ("Value Entry Type" = "Value Entry Type"::"Direct Cost") AND
               ("Item Charge No." = '') AND
               ("No." = '')
            #7..28
              END;
            END;

            VALIDATE("Unit of Measure Code");

            ReserveItemJnlLine.VerifyChange(Rec,xRec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #4..31
            //VALIDATE("Unit of Measure Code");

            ReserveItemJnlLine.VerifyChange(Rec,xRec);
            */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ("Entry Type" <= "Entry Type"::Transfer) AND (Quantity <> 0) THEN
              TESTFIELD("Item No.");

            IF NOT PhysInvtEntered THEN
              TESTFIELD("Phys. Inventory",FALSE);

            #7..40

            IF Item."Item Tracking Code" <> '' THEN
              ReserveItemJnlLine.VerifyQuantity(Rec,xRec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #4..43
            */
        //end;


        //Unsupported feature: Code Modification on ""Applies-to Entry"(Field 29).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Applies-to Entry" <> 0 THEN BEGIN
              ItemLedgEntry.GET("Applies-to Entry");

              IF "Value Entry Type" = "Value Entry Type"::Revaluation THEN BEGIN
                IF "Inventory Value Per" <> "Inventory Value Per"::" " THEN
                  ERROR(Text006,FIELDCAPTION("Applies-to Entry"));

                IF "Inventory Value Per" = "Inventory Value Per"::" " THEN
                  IF NOT RevaluationPerEntryAllowed("Item No.") THEN
                    ERROR(Text034);

                InitRevalJnlLine(ItemLedgEntry);
            #13..45
                "Bin Code" := '';
              END;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..8
                  IF NOT RevaluationPerEntryAllowed(Item."No.") THEN
            #10..48
            */
        //end;


        //Unsupported feature: Code Modification on ""Order Line No."(Field 92).OnValidate".

        //trigger "(Field 92)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD("Order No.");
            CASE "Order Type" OF
              "Order Type"::Production,"Order Type"::Assembly:
            #4..8
                      "Source Type" := "Source Type"::Item;
                      "Source No." := ProdOrderLine."Item No.";
                      "Order Line No." := ProdOrderLine."Line No.";
                      "Routing No." := ProdOrderLine."Routing No.";
                      "Routing Reference No." := ProdOrderLine."Routing Reference No.";
                    END;
                  END;

            #17..22
                    END;
                END;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..11
            #14..25
            */
        //end;


        //Unsupported feature: Code Modification on ""Variant Code"(Field 5402).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Entry Type" IN ["Entry Type"::Consumption,"Entry Type"::Output] THEN
              WhseValidateSourceLine.ItemLineVerifyChange(Rec,xRec);

            #4..18
              GetUnitAmount(FIELDNO("Variant Code"));
              "Unit Cost" := UnitCost;
              VALIDATE("Unit Amount");
              VALIDATE("Unit of Measure Code");
              ReserveItemJnlLine.VerifyChange(Rec,xRec);
            END;

            #26..29
              GetItem;
              Description := Item.Description;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..21
            //  VALIDATE("Unit of Measure Code");
            #23..32
            */
        //end;


        //Unsupported feature: Code Modification on ""Bin Code"(Field 5403).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Bin Code" <> xRec."Bin Code" THEN BEGIN
              TESTFIELD("Location Code");
              IF "Bin Code" <> '' THEN BEGIN
            #4..29
                       ProdOrderComp."Bin Code",
                       "Order No.")
                  THEN
                    ERROR(UpdateInterruptedErr);
              END;
            END;

            ReserveItemJnlLine.VerifyChange(Rec,xRec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..32
                    ERROR(Text012);
            #34..37
            */
        //end;


        //Unsupported feature: Code Modification on ""No."(Field 5831).OnValidate".

        //trigger "(Field 5831)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF Type = Type::Resource THEN
              TESTFIELD("Entry Type","Entry Type"::"Assembly Output")
            ELSE
              TESTFIELD("Entry Type","Entry Type"::Output);
            IF "No." = '' THEN BEGIN
              "Work Center No." := '';
              VALIDATE("Item No.");
              IF Type IN [Type::"Work Center",Type::"Machine Center"] THEN
                CreateDimWithProdOrderLine
              ELSE
                CreateDim(
                  DATABASE::"Work Center","Work Center No.",
                  DATABASE::Item,"Item No.",
                  DATABASE::"Salesperson/Purchaser","Salespers./Purch. Code");
              EXIT;
            END;

            #18..38
              Type::Resource:
                BEGIN
                  Resource.GET("No.");
                  Resource.CheckResourcePrivacyBlocked(FALSE);
                  Resource.TESTFIELD(Blocked,FALSE);
                END;
            END;
            #46..48
              VALIDATE("Cap. Unit of Measure Code",WorkCenter."Unit of Measure Code");
            END;

            IF "Work Center No." <> '' THEN
              CreateDimWithProdOrderLine;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..7
              CreateDim(
                DATABASE::"Work Center","Work Center No.",
                DATABASE::Item,"Item No.",
                DATABASE::"Salesperson/Purchaser","Salespers./Purch. Code");
              IF Type IN [Type::"Work Center",Type::"Machine Center"] THEN
                UpdateDimForProdJnlLine;
            #15..41
            #43..51
            IF "Work Center No." <> '' THEN BEGIN
              CreateDim(
                DATABASE::"Work Center","Work Center No.",
                DATABASE::Item,"Item No.",
                DATABASE::"Salesperson/Purchaser","Salespers./Purch. Code");
              UpdateDimForProdJnlLine;
            END;
            */
        //end;


        //Unsupported feature: Code Modification on ""Operation No."(Field 5838).OnValidate".

        //trigger "(Field 5838)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD("Entry Type","Entry Type"::Output);
            IF "Operation No." = '' THEN
              EXIT;

            TESTFIELD("Order Type","Order Type"::Production);
            TESTFIELD("Order No.");
            TESTFIELD("Item No.");

            ConfirmOutputOnFinishedOperation;
            GetProdOrderRtngLine(ProdOrderRtngLine);

            CASE ProdOrderRtngLine.Type OF
            #13..16
            END;
            VALIDATE("No.",ProdOrderRtngLine."No.");
            Description := ProdOrderRtngLine.Description;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..8
            #10..19
            */
        //end;


        //Unsupported feature: Code Modification on ""Setup Time"(Field 5841).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF SubcontractingWorkCenterUsed AND ("Setup Time" <> 0) THEN
              SubcontractedErr;
            "Setup Time (Base)" := CalcBaseTime("Setup Time");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            "Setup Time (Base)" := CalcBaseTime("Setup Time");
            */
        //end;


        //Unsupported feature: Code Modification on ""Run Time"(Field 5842).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF SubcontractingWorkCenterUsed AND ("Run Time" <> 0) THEN
              SubcontractedErr;

            "Run Time (Base)" := CalcBaseTime("Run Time");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            "Run Time (Base)" := CalcBaseTime("Run Time");
            */
        //end;


        //Unsupported feature: Code Modification on ""Output Quantity"(Field 5846).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD("Entry Type","Entry Type"::Output);
            IF SubcontractingWorkCenterUsed AND ("Output Quantity" <> 0) THEN
              SubcontractedErr;

            ConfirmOutputOnFinishedOperation;

            IF LastOutputOperation(Rec) THEN
              WhseValidateSourceLine.ItemLineVerifyChange(Rec,xRec);

            "Output Quantity (Base)" := CalcBaseQty("Output Quantity");

            VALIDATE(Quantity,"Output Quantity");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            TESTFIELD("Entry Type","Entry Type"::Output);
            #7..12
            */
        //end;
    }

    //Unsupported feature: Variable Insertion (Variable: DimensionSetIDArr) (VariableCollection) on "UpdateDimForProdJnlLine(PROCEDURE 48)".


    //Unsupported feature: Property Modification (Name) on "PickDimension(PROCEDURE 48)".



    //Unsupported feature: Code Modification on "PickDimension(PROCEDURE 48)".

    //procedure PickDimension();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SourceCode := "Source Code";
        IF SourceCode = '' THEN
          IF ItemJournalTemplate.GET("Journal Template Name") THEN
            SourceCode := ItemJournalTemplate."Source Code";

        "Shortcut Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        "Dimension Set ID" :=
          DimMgt.GetDefaultDimID(
            TableList,CodeList,SourceCode,
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",InheritFromDimSetID,InheritFromTableNo);

        IF "Entry Type" = "Entry Type"::Transfer THEN BEGIN
          "New Dimension Set ID" := "Dimension Set ID";
          "New Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
          "New Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        DimensionSetIDArr[1] := "Dimension Set ID";
        CreateProdDim;
        DimensionSetIDArr[2] := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.GetCombinedDimensionSetID(DimensionSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 13)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CreateTableList(TableID,Type1,Type2,Type3);
        CreateCodeList(No,No1,No2,No3);
        PickDimension(TableID,No,0,0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        TableID[1] := Type1;
        No[1] := No1;
        TableID[2] := Type2;
        No[2] := No2;
        TableID[3] := Type3;
        No[3] := No3;

        "Shortcut Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        "Dimension Set ID" :=
          DimMgt.GetDefaultDimID(
            TableID,No,"Source Code",
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);

        IF "Entry Type" = "Entry Type"::Transfer THEN BEGIN
          "New Dimension Set ID" := "Dimension Set ID";
          "New Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
          "New Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
        END;
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: ProdOrderLine2) (VariableCollection) on "LookupItemNo(PROCEDURE 37)".


    //Unsupported feature: Variable Insertion (Variable: ProdOrderLineList) (VariableCollection) on "LookupItemNo(PROCEDURE 37)".



    //Unsupported feature: Code Modification on "LookupItemNo(PROCEDURE 37)".

    //procedure LookupItemNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Entry Type" OF
          "Entry Type"::Consumption:
            LookupProdOrderComp;
          "Entry Type"::Output:
            LookupProdOrderLine;
          ELSE BEGIN
            ItemList.LOOKUPMODE := TRUE;
            IF ItemList.RUNMODAL = ACTION::LookupOK THEN BEGIN
              ItemList.GETRECORD(Item);
              VALIDATE("Item No.",Item."No.");
            END;
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF "Entry Type" = "Entry Type"::Output THEN BEGIN
          ProdOrderLine2.SetFilterByReleasedOrderNo("Order No.");
          ProdOrderLine2.Status := ProdOrderLine2.Status::Released;
          ProdOrderLine2."Prod. Order No." := "Order No.";
          ProdOrderLine2."Line No." := "Order Line No.";
          ProdOrderLine2."Item No." := "Item No.";

          ProdOrderLineList.LOOKUPMODE(TRUE);
          ProdOrderLineList.SETTABLEVIEW(ProdOrderLine2);
          ProdOrderLineList.SETRECORD(ProdOrderLine2);

          IF ProdOrderLineList.RUNMODAL = ACTION::LookupOK THEN BEGIN
            ProdOrderLineList.GETRECORD(ProdOrderLine2);
            VALIDATE("Item No.",ProdOrderLine2."Item No.");
            IF "Order Line No." <> ProdOrderLine2."Line No." THEN
              VALIDATE("Order Line No.",ProdOrderLine2."Line No.");
          END;
        END ELSE BEGIN
          ItemList.LOOKUPMODE := TRUE;
          IF ItemList.RUNMODAL = ACTION::LookupOK THEN BEGIN
            ItemList.GETRECORD(Item);
            VALIDATE("Item No.",Item."No.");
          END;
        END;
        */
    //end;

    //Unsupported feature: Deletion (ParameterCollection) on "PickDimension(PROCEDURE 48).TableList(Parameter 1005)".


    //Unsupported feature: Deletion (ParameterCollection) on "PickDimension(PROCEDURE 48).CodeList(Parameter 1004)".


    //Unsupported feature: Deletion (ParameterCollection) on "PickDimension(PROCEDURE 48).InheritFromDimSetID(Parameter 1003)".


    //Unsupported feature: Deletion (ParameterCollection) on "PickDimension(PROCEDURE 48).InheritFromTableNo(Parameter 1002)".


    //Unsupported feature: Deletion (VariableCollection) on "PickDimension(PROCEDURE 48).ItemJournalTemplate(Variable 1001)".


    //Unsupported feature: Deletion (VariableCollection) on "PickDimension(PROCEDURE 48).SourceCode(Variable 1000)".


    var
        Text012: label 'The update has been interrupted to respect the warning.';
}

