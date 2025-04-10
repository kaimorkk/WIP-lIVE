TableExtension 52193733 tableextension52193733 extends "Service Header" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Bill-to Customer No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF (xRec."Bill-to Customer No." <> "Bill-to Customer No.") AND
               (xRec."Bill-to Customer No." <> '')
            THEN BEGIN
            #4..19
                  ELSE
                    ServLine.TESTFIELD("Shipment No.",'');
                ServLine.RESET
              END ELSE
                "Bill-to Customer No." := xRec."Bill-to Customer No.";
            END;

            GetCust("Bill-to Customer No.");
            #28..66
            "Invoice Disc. Code" := Cust."Invoice Disc. Code";
            "Customer Disc. Group" := Cust."Customer Disc. Group";
            "Language Code" := Cust."Language Code";
            SetSalespersonCode(Cust."Salesperson Code","Salesperson Code");
            Reserve := Cust.Reserve;
            ValidateServPriceGrOnServItem;

            #74..94

            IF NOT SkipBillToContact THEN
              UpdateBillToCont("Bill-to Customer No.");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..22
              END ELSE BEGIN
                "Bill-to Customer No." := xRec."Bill-to Customer No.";
                IF "Customer Posting Group" <> '' THEN
                  EXIT;
              END;
            #25..69
            "Salesperson Code" := Cust."Salesperson Code";
            #71..97
            */
        //end;


        //Unsupported feature: Code Modification on ""Payment Terms Code"(Field 23).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ("Payment Terms Code" <> '') AND ("Document Date" <> 0D) THEN BEGIN
              PaymentTerms.GET("Payment Terms Code");
              IF ("Document Type" IN ["Document Type"::"Credit Memo"]) AND
            #4..15
              VALIDATE("Pmt. Discount Date",0D);
              VALIDATE("Payment Discount %",0);
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..18
            UpdatePmtDiscDate;
            */
        //end;


        //Unsupported feature: Code Modification on ""Payment Discount %"(Field 25).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            GLSetup.GET;
            IF "Payment Discount %" < GLSetup."VAT Tolerance %" THEN
              "VAT Base Discount %" := "Payment Discount %"
            ELSE
              "VAT Base Discount %" := GLSetup."VAT Tolerance %";
            VALIDATE("VAT Base Discount %");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..6
            UpdatePmtDiscDate;
            */
        //end;


        //Unsupported feature: Code Insertion on ""Pmt. Discount Date"(Field 26)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            UpdatePmtDiscDate;
            */
        //end;


        //Unsupported feature: Code Modification on ""Salesperson Code"(Field 43).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ValidateSalesPersonOnServiceHeader(Rec,FALSE,FALSE);

            CreateDim(
              DATABASE::"Salesperson/Purchaser","Salesperson Code",
              DATABASE::Customer,"Bill-to Customer No.",
              DATABASE::"Responsibility Center","Responsibility Center",
              DATABASE::"Service Order Type","Service Order Type",
              DATABASE::"Service Contract Header","Contract No.");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #3..8
            */
        //end;


        //Unsupported feature: Code Modification on ""Gen. Bus. Posting Group"(Field 74).OnValidate".

        //trigger  Bus()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Gen. Bus. Posting Group" <> xRec."Gen. Bus. Posting Group" THEN BEGIN
              IF GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") THEN
                "VAT Bus. Posting Group" := GenBusPostingGrp."Def. VAT Bus. Posting Group";
              RecreateServLines(FIELDCAPTION("Gen. Bus. Posting Group"));
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF "Gen. Bus. Posting Group" <> xRec."Gen. Bus. Posting Group" THEN
              IF GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") THEN BEGIN
                "VAT Bus. Posting Group" := GenBusPostingGrp."Def. VAT Bus. Posting Group";
                RecreateServLines(FIELDCAPTION("Gen. Bus. Posting Group"));
              END;
            */
        //end;

        //Unsupported feature: Deletion on ""Posting No. Series"(Field 108).OnLookup".


        //Unsupported feature: Property Deletion (DataClassification) on ""Assigned User ID"(Field 9000)".

    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT UserSetupMgt.CheckRespCenter(2,"Responsibility Center") THEN
          ERROR(
            Text000,
        #4..52
            END;
        END;

        ServOrderAlloc.RESET;
        ServOrderAlloc.SETCURRENTKEY("Document Type");
        ServOrderAlloc.SETRANGE("Document Type","Document Type");
        #59..102
          ServDocLog."Document Type"::Shipment,ServDocLog."Document Type"::"Posted Invoice",
          ServDocLog."Document Type"::"Posted Credit Memo");
        ServDocLog.DELETEALL;

        IF (ServShptHeader."No." <> '') OR
           (ServInvHeader."No." <> '') OR
           (ServCrMemoHeader."No." <> '')
        THEN
          MESSAGE(PostedDocsToPrintCreatedMsg);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..55
        #107..109
        THEN BEGIN
          COMMIT;

          IF ServShptHeader."No." <> '' THEN
            IF CONFIRM(Text048,TRUE,ServShptHeader."No.") THEN BEGIN
              ServShptHeader.SETRECFILTER;
              ServShptHeader.PrintRecords(TRUE);
            END;

          IF ServInvHeader."No." <> '' THEN
            IF CONFIRM(Text049,TRUE,ServInvHeader."No.") THEN BEGIN
              ServInvHeader.SETRECFILTER;
              ServInvHeader.PrintRecords(TRUE);
            END;

          IF ServCrMemoHeader."No." <> '' THEN
            IF CONFIRM(Text002,TRUE,ServCrMemoHeader."No.") THEN BEGIN
              ServCrMemoHeader.SETRECFILTER;
              ServCrMemoHeader.PrintRecords(TRUE);
            END;
        END;

        #56..105
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: DimensionSetIDArr) (VariableCollection) on "CreateDim(PROCEDURE 16)".



    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 16)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SourceCodeSetup.GET;

        TableID[1] := Type1;
        #4..14
        "Shortcut Dimension 2 Code" := '';
        OldDimSetID := "Dimension Set ID";

        IF "Contract No." <> '' THEN BEGIN
          ServiceContractHeader.GET(ServiceContractHeader."Contract Type"::Contract,"Contract No.");
          ContractDimensionSetID := ServiceContractHeader."Dimension Set ID";
        END;

        "Dimension Set ID" :=
          DimMgt.GetDefaultDimID(
            TableID,No,SourceCodeSetup."Service Management",
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",ContractDimensionSetID,DATABASE::"Service Contract Header");

        IF ("Dimension Set ID" <> OldDimSetID) AND (ServItemLineExists OR ServLineExists) THEN BEGIN
          MODIFY;
          UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..17
        DimensionSetIDArr[1] :=
          DimMgt.GetDefaultDimID(
            TableID,No,SourceCodeSetup."Service Management",
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);

        IF "Contract No." <> '' THEN BEGIN
          ServiceContractHeader.GET(ServiceContractHeader."Contract Type"::Contract,"Contract No.");
          DimensionSetIDArr[2] := ServiceContractHeader."Dimension Set ID";
        #21..23
          DimMgt.GetCombinedDimensionSetID(
            DimensionSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        #27..31
        */
    //end;


    //Unsupported feature: Code Modification on "RecreateServLines(PROCEDURE 2)".

    //procedure RecreateServLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ServLineExists THEN BEGIN
          IF HideValidationDialog OR NOT GUIALLOWED THEN
            Confirmed := TRUE
        #4..51
                  UNTIL TempServDocReg.NEXT = 0;
              END;

              CreateServiceLines(TempServLine,ExtendedTextAdded);
              TempServLine.SETRANGE(Type);
              TempServLine.DELETEALL;
            END;
          END ELSE
            ERROR('');
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..54
              ServLine.INIT;
              ServLine."Line No." := 0;
              TempServLine.FIND('-');
              ExtendedTextAdded := FALSE;
              REPEAT
                IF TempServLine."Attached to Line No." = 0 THEN BEGIN
                  ServLine.INIT;
                  ServLine.SetHideReplacementDialog(TRUE);
                  ServLine.SetHideCostWarning(TRUE);
                  ServLine."Line No." := ServLine."Line No." + 10000;
                  ServLine.VALIDATE(Type,TempServLine.Type);
                  IF TempServLine."No." <> '' THEN BEGIN
                    ServLine.VALIDATE("No.",TempServLine."No.");
                    IF ServLine.Type <> ServLine.Type::" " THEN BEGIN
                      ServLine.VALIDATE("Unit of Measure Code",TempServLine."Unit of Measure Code");
                      ServLine.VALIDATE("Variant Code",TempServLine."Variant Code");
                      IF TempServLine.Quantity <> 0 THEN
                        ServLine.VALIDATE(Quantity,TempServLine.Quantity);
                    END;
                  END;

                  ServLine."Serv. Price Adjmt. Gr. Code" := TempServLine."Serv. Price Adjmt. Gr. Code";
                  ServLine."Document No." := TempServLine."Document No.";
                  ServLine."Service Item No." := TempServLine."Service Item No.";
                  ServLine."Appl.-to Service Entry" := TempServLine."Appl.-to Service Entry";
                  ServLine."Service Item Line No." := TempServLine."Service Item Line No.";
                  ServLine.VALIDATE(Description,TempServLine.Description);
                  ServLine.VALIDATE("Description 2",TempServLine."Description 2");

                  IF TempServLine."No." <> '' THEN BEGIN
                    TempLinkToServItem := "Link Service to Service Item";
                    IF "Link Service to Service Item" THEN BEGIN
                      "Link Service to Service Item" := FALSE;
                      MODIFY(TRUE);
                    END;
                    ServLine."Spare Part Action" := TempServLine."Spare Part Action";
                    ServLine."Component Line No." := TempServLine."Component Line No.";
                    ServLine."Replaced Item No." := TempServLine."Replaced Item No.";
                    ServLine.VALIDATE("Work Type Code",TempServLine."Work Type Code");

                    ServLine."Location Code" := TempServLine."Location Code";
                    IF ServLine.Type <> ServLine.Type::" " THEN BEGIN
                      IF ServLine.Type = ServLine.Type::Item THEN BEGIN
                        ServLine.VALIDATE("Variant Code",TempServLine."Variant Code");
                        IF ServLine."Location Code" <> '' THEN
                          ServLine."Bin Code" := TempServLine."Bin Code";
                      END;
                      ServLine."Fault Reason Code" := TempServLine."Fault Reason Code";
                      ServLine."Exclude Warranty" := TempServLine."Exclude Warranty";
                      ServLine."Exclude Contract Discount" := TempServLine."Exclude Contract Discount";
                      ServLine.VALIDATE("Contract No.",TempServLine."Contract No.");
                      ServLine.VALIDATE(Warranty,TempServLine.Warranty);
                    END;
                    ServLine."Fault Area Code" := TempServLine."Fault Area Code";
                    ServLine."Symptom Code" := TempServLine."Symptom Code";
                    ServLine."Resolution Code" := TempServLine."Resolution Code";
                    ServLine."Fault Code" := TempServLine."Fault Code";
                  END;
                  "Link Service to Service Item" := TempLinkToServItem;

                  ServLine.INSERT;
                  ExtendedTextAdded := FALSE;
                END ELSE
                  IF NOT ExtendedTextAdded THEN BEGIN
                    TransferExtendedText.ServCheckIfAnyExtText(ServLine,TRUE);
                    TransferExtendedText.InsertServExtText(ServLine);
                    ServLine.FIND('+');
                    ExtendedTextAdded := TRUE;
                  END;
                RecreateReservEntry(TempServLine,ServLine."Line No.",FALSE);
              UNTIL TempServLine.NEXT = 0;

        #56..61
        */
    //end;


    //Unsupported feature: Code Modification on "InitRecord(PROCEDURE 32)".

    //procedure InitRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Document Type" OF
          "Document Type"::Quote,"Document Type"::Order:
            BEGIN
        #4..36
        "Default Response Time (Hours)" := ServSetup."Default Response Time (Hours)";
        "Link Service to Service Item" := ServSetup."Link Service to Service Item";

        IF Cust.GET("Customer No.") THEN
          VALIDATE("Location Code",UserSetupMgt.GetLocation(2,Cust."Location Code","Responsibility Center"));

        IF "Document Type" IN ["Document Type"::"Credit Memo"] THEN BEGIN
          GLSetup.GET;
        #45..49
        Reserve := Reserve::Optional;

        IF Cust.GET("Customer No.") THEN
          IF Cust."Responsibility Center" <> '' THEN
            "Responsibility Center" := UserSetupMgt.GetRespCenter(2,Cust."Responsibility Center")
          ELSE
            "Responsibility Center" := UserSetupMgt.GetRespCenter(2,"Responsibility Center")
        ELSE
          "Responsibility Center" := UserSetupMgt.GetServiceFilter;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..39
        VALIDATE("Location Code",UserSetupMgt.GetLocation(2,Cust."Location Code","Responsibility Center"));
        #42..52
          "Responsibility Center" := UserSetupMgt.GetRespCenter(2,Cust."Responsibility Center")
        ELSE
          "Responsibility Center" := UserSetupMgt.GetServiceFilter;
        */
    //end;

    procedure UpdatePmtDiscDate()
    begin
        if "Payment Discount %" = 0 then
          if "Document Type" <> "document type"::"Credit Memo" then
            "Pmt. Discount Date" := "Due Date";
    end;

    //Unsupported feature: Deletion (VariableCollection) on "CreateDim(PROCEDURE 16).ContractDimensionSetID(Variable 1014)".


    var
        Text002: label 'Do you want to print credit memo %1?';

    var
        Text048: label 'Do you want to print shipment %1?';
        Text049: label 'Do you want to print invoice %1?';
}

