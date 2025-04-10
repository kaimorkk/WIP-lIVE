
table 65048 "Inter_Project Transfer Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[50])
        {

            // trigger OnValidate()
            // begin
            //     if No <> xRec.No then begin
            //         GrantsSetup.Get;
            //         NoSeriesMgt.TestManual(GrantsSetup."IFT Nos");
            //         "No. Series" := '';
            //     end;
            // end;
        }
        field(2; "Document Date"; Date)
        {
        }
        field(3; "Posting Description"; Code[50])
        {
        }
        field(4; "External Document No."; Code[50])
        {
        }
        field(5; "Main Funds Bank A/C"; Code[50])
        {
            TableRelation = "Bank Account";
        }
        field(6; "Transfer-To Job No"; Code[50])
        {
            TableRelation = Job where(Status = filter(Planning | Open | Quote));

            trigger OnValidate()
            begin
                Project.Reset;
                Project.SetRange("No.", "Transfer-To Job No");
                if Project.Find('-') then begin
                    Project.TestField("Job Posting Group");
                    "Shortcut Dimension 1 Code" := Project."Global Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := Project."Global Dimension 2 Code";
                end;
            end;
        }
        field(7; "Transfer-To Task No"; Code[50])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Transfer-To Job No"),
                                                             "Job Task Type" = const(Posting));
        }
        field(8; "Transfer-To Income G/L A/C"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(9; "Currency Code"; Code[50])
        {
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date")]) or ("Currency Code" <> xRec."Currency Code") then
                    TestField("Approval Status", "approval status"::Open);
                if (CurrFieldNo <> FieldNo("Currency Code")) and ("Currency Code" = xRec."Currency Code") then
                    UpdateCurrencyFactor
                else
                    if "Currency Code" <> xRec."Currency Code" then
                        UpdateCurrencyFactor
                    else
                        if "Currency Code" <> '' then begin
                            UpdateCurrencyFactor;
                            if "Currency Factor" <> xRec."Currency Factor" then
                                ConfirmUpdateCurrencyFactor;
                        end;
            end;
        }
        field(10; "Total Transfer Amount"; Decimal)
        {
            CalcFormula = sum("Inter-Project Transfer Line"."Transfer Line Amount" where("Document No" = field(No)));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                GetCurrency;
                if "Currency Code" = '' then
                    "Total Transfer Amount LCY" := "Total Transfer Amount"
                else
                    "Total Transfer Amount LCY" := ROUND(
                       CurrExchRate.ExchangeAmtFCYToLCY(
                         "Posting Date", "Currency Code",
                       "Total Transfer Amount", "Currency Factor"));
            end;
        }
        field(11; "Total Transfer Amount LCY"; Decimal)
        {
            CalcFormula = sum("Inter-Project Transfer Line"."Transfer Line Amount LCY" where("Document No" = field(No)));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                GetCurrency;
                if "Currency Code" = '' then
                    "Total Transfer Amount LCY" := "Total Transfer Amount"
                else
                    "Total Transfer Amount LCY" := ROUND(
                       CurrExchRate.ExchangeAmtFCYToLCY(
                         "Posting Date", "Currency Code",
                       "Total Transfer Amount", "Currency Factor"));
            end;
        }
        field(12; "Transfe-To Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(13; "Transfe-To Department/Center"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Transfe-To Directorate"));
        }
        field(14; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(15; Archived; Boolean)
        {
        }
        field(16; "Created By"; Code[50])
        {
        }
        field(17; "Created On"; Date)
        {
        }
        field(18; "No. Series"; Code[50])
        {
        }
        field(19; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDocDim;
            end;
        }
        field(20; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(21; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(22; "Reversed?"; Boolean)
        {
        }
        field(23; "Posting Date"; Date)
        {
        }
        field(44; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Currency Factor" <> xRec."Currency Factor" then
                    UpdateSalesLinesByFieldNo(FieldNo("Currency Factor"), false);
            end;
        }
        field(45; Posted; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // if No = '' then begin
        //     GrantsSetup.Get;
        //     GrantsSetup.TestField("IFT Nos");
        //     NoSeriesMgt.InitSeries(GrantsSetup."IFT Nos", xRec."No. Series", 0D, No, "No. Series");
        // end;

        "Created By" := UserId;
        "Created On" := Today;
        "Document Date" := Today;
    end;

    var
        // GrantsSetup: Record "Grants Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        CurrencyDate: Date;
        CurrExchRate: Record "Currency Exchange Rate";
        Confirmed: Boolean;
        HideValidationDialog: Boolean;
        Customer: Record Customer;
        Contact: Record Contact;
        Currency: Record Currency;
        GLSetup: Record "General Ledger Setup";
        CurrencyCode: Code[10];
        GLSetupRead: Boolean;
        MissingExchangeRatesQst: label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment = '%1 - currency code, %2 - posting date';
        Text021: label 'Do you want to update the exchange rate?';
        Project: Record Job;
        SalesLine: Record "Inter-Project Transfer Line";


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID", StrSubstNo('%1 %2', '', No),
        //     "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
        
        
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    local procedure GetCurrency()
    begin

        CurrencyCode := "Currency Code";

        if CurrencyCode = '' then begin
            Clear(Currency);
            Currency.InitRoundingPrecision
        end else
            if CurrencyCode <> Currency.Code then begin
                Currency.Get(CurrencyCode);
                Currency.TestField("Amount Rounding Precision");
            end;
    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
    begin

        // Update all lines with changed dimensions.

        /*IF NewParentDimSetID = OldParentDimSetID THEN
          EXIT;
        IF NOT CONFIRM(Text051) THEN
          EXIT;
        
        PurchLine.RESET;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SETRANGE(PurchLine.No,"No.");
        PurchLine.LOCKTABLE;
        IF PurchLine.FIND('-') THEN
          REPEAT
            NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID",NewParentDimSetID,OldParentDimSetID);
            IF PurchLine."Dimension Set ID" <> NewDimSetID THEN BEGIN
              PurchLine."Dimension Set ID" := NewDimSetID;
              DimMgt.UpdateGlobalDimFromDimSetID(
                PurchLine."Dimension Set ID",PurchLine."Shortcut Dimension 1 Code",PurchLine."Shortcut Dimension 2 Code");
              PurchLine.MODIFY;
            END;
          UNTIL PurchLine.NEXT = 0;
          */

    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        //IF "No." <> '' THEN
        //  MODIFY;

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    local procedure "................................................................"()
    begin
    end;

    local procedure UpdateCurrencyFactor()
    var
        UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
        Updated: Boolean;
    begin
        OnBeforeUpdateCurrencyFactor(Rec, Updated);
        if Updated then
            exit;

        if "Currency Code" <> '' then begin
            if "Posting Date" <> 0D then
                CurrencyDate := "Posting Date"
            else
                CurrencyDate := WorkDate;

            if UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrencyDate, "Currency Code") then begin
                "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
                if "Currency Code" <> xRec."Currency Code" then
                    RecreateSalesLines(FieldCaption("Currency Code"));
            end else begin
                if Confirm(StrSubstNo(MissingExchangeRatesQst, "Currency Code", CurrencyDate)) then begin
                    Commit;
                    UpdateCurrencyExchangeRates.OpenExchangeRatesPage("Currency Code");
                    UpdateCurrencyFactor;
                end else
                    RevertCurrencyCodeAndPostingDate;
            end;
        end else
            "Currency Factor" := 0;
    end;

    local procedure ConfirmUpdateCurrencyFactor()
    begin
        if GetHideValidationDialog then
            Confirmed := true
        else
            Confirmed := Confirm(Text021, false);
        if Confirmed then
            Validate("Currency Factor")
        else
            "Currency Factor" := xRec."Currency Factor";
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCurrencyFactor(var SalesHeader: Record "Inter_Project Transfer Header"; var Updated: Boolean)
    begin
    end;

    local procedure RevertCurrencyCodeAndPostingDate()
    begin
        "Currency Code" := xRec."Currency Code";
        "Posting Date" := xRec."Posting Date";
    end;

    procedure GetHideValidationDialog(): Boolean
    var
        IdentityManagement: Codeunit "Identity Management";
    begin
        //exit(HideValidationDialog or IdentityManagement.IsInvAppId);
    end;

    procedure UpdateSalesLinesByFieldNo(ChangedFieldNo: Integer; AskQuestion: Boolean)
    var
        "Field": Record "Field";
        JobTransferLine: Codeunit "Job Transfer Line";
        PermissionManager: Codeunit "Permission Manager";
        Question: Text[250];
        NotRunningOnSaaS: Boolean;
        IsHandled: Boolean;
    begin
        /*IF NOT SalesLinesExist THEN
          EXIT;
        
        IF NOT Field.GET(DATABASE::"Sales Header",ChangedFieldNo) THEN
          Field.GET(DATABASE::"Sales Line",ChangedFieldNo);
        
        NotRunningOnSaaS := TRUE;
        CASE ChangedFieldNo OF
          FIELDNO("Shipping Agent Code"),
          FIELDNO("Shipping Agent Service Code"):
            NotRunningOnSaaS := NOT PermissionManager.SoftwareAsAService;
        END;
        IF AskQuestion THEN BEGIN
          Question := STRSUBSTNO(Text031,Field."Field Caption");
          IF GUIALLOWED THEN
            IF NotRunningOnSaaS THEN
              IF DIALOG.CONFIRM(Question,TRUE) THEN
                CASE ChangedFieldNo OF
                  FIELDNO("Shipment Date"),
                  FIELDNO("Shipping Agent Code"),
                  FIELDNO("Shipping Agent Service Code"),
                  FIELDNO("Shipping Time"),
                  FIELDNO("Requested Delivery Date"),
                  FIELDNO("Promised Delivery Date"),
                  FIELDNO("Outbound Whse. Handling Time"):
                    ConfirmResvDateConflict;
                END
              ELSE
                EXIT
            ELSE
              ConfirmResvDateConflict;
        END;
        
        SalesLine.LOCKTABLE;
        MODIFY;
        
        SalesLine.RESET;
        SalesLine.SETRANGE("Document Type","Document Type");
        SalesLine.SETRANGE("Document No.","No.");
        IF SalesLine.FINDSET THEN
          REPEAT
            OnBeforeSalesLineByChangedFieldNo(SalesHeader,SalesLine,ChangedFieldNo,IsHandled);
            IF NOT IsHandled THEN
              CASE ChangedFieldNo OF
                FIELDNO("Shipment Date"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Shipment Date","Shipment Date");
                FIELDNO("Currency Factor"):
                  IF SalesLine.Type <> SalesLine.Type::" " THEN BEGIN
                    SalesLine.VALIDATE("Unit Price");
                    SalesLine.VALIDATE("Unit Cost (LCY)");
                    IF SalesLine."Job No." <> '' THEN
                      JobTransferLine.FromSalesHeaderToPlanningLine(SalesLine,"Currency Factor");
                  END;
                FIELDNO("Transaction Type"):
                  SalesLine.VALIDATE("Transaction Type","Transaction Type");
                FIELDNO("Transport Method"):
                  SalesLine.VALIDATE("Transport Method","Transport Method");
                FIELDNO("Exit Point"):
                  SalesLine.VALIDATE("Exit Point","Exit Point");
                FIELDNO(Area):
                  SalesLine.VALIDATE(Area,Area);
                FIELDNO("Transaction Specification"):
                  SalesLine.VALIDATE("Transaction Specification","Transaction Specification");
                FIELDNO("Shipping Agent Code"):
                  SalesLine.VALIDATE("Shipping Agent Code","Shipping Agent Code");
                FIELDNO("Shipping Agent Service Code"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Shipping Agent Service Code","Shipping Agent Service Code");
                FIELDNO("Shipping Time"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Shipping Time","Shipping Time");
                FIELDNO("Prepayment %"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Prepayment %","Prepayment %");
                FIELDNO("Requested Delivery Date"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Requested Delivery Date","Requested Delivery Date");
                FIELDNO("Promised Delivery Date"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Promised Delivery Date","Promised Delivery Date");
                FIELDNO("Outbound Whse. Handling Time"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Outbound Whse. Handling Time","Outbound Whse. Handling Time");
                SalesLine.FIELDNO("Deferral Code"):
                  IF SalesLine."No." <> '' THEN
                    SalesLine.VALIDATE("Deferral Code");
                ELSE
                  OnUpdateSalesLineByChangedFieldName(Rec,SalesLine,Field."Field Caption");
              END;
            SalesLineReserve.AssignForPlanning(SalesLine);
            SalesLine.MODIFY(TRUE);
          UNTIL SalesLine.NEXT = 0;
          */

    end;

    procedure SalesLinesExist(): Boolean
    begin
        SalesLine.Reset;
        SalesLine.SetRange("Document No", No);
        exit(not SalesLine.IsEmpty);
    end;

    local procedure RecreateSalesLines(ChangedFieldName: Text[100])
    var
        TempSalesLine: Record "Sales Line" temporary;
        ItemChargeAssgntSales: Record "Item Charge Assignment (Sales)";
        TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)" temporary;
        TempInteger: Record "Integer" temporary;
        TempATOLink: Record "Assemble-to-Order Link" temporary;
        ATOLink: Record "Assemble-to-Order Link";
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ExtendedTextAdded: Boolean;
        ConfirmText: Text;
        IsHandled: Boolean;
    begin
        if not SalesLinesExist then
            exit;

        /*OnRecreateSalesLinesOnBeforeConfirm(Rec,xRec,ChangedFieldName,HideValidationDialog,Confirmed,IsHandled);
        IF NOT IsHandled THEN
          IF GetHideValidationDialog OR NOT GUIALLOWED THEN
            Confirmed := TRUE
          ELSE BEGIN
            IF HasItemChargeAssignment THEN
              ConfirmText := ResetItemChargeAssignMsg
            ELSE
              ConfirmText := RecreateSalesLinesMsg;
            Confirmed := CONFIRM(ConfirmText,FALSE,ChangedFieldName);
          END;
        
        IF Confirmed THEN BEGIN
          SalesLine.LOCKTABLE;
          ItemChargeAssgntSales.LOCKTABLE;
          ReservEntry.LOCKTABLE;
          MODIFY;
          OnBeforeRecreateSalesLines(Rec);
          SalesLine.RESET;
          SalesLine.SETRANGE("Document Type","Document Type");
          SalesLine.SETRANGE("Document No.","No.");
          IF SalesLine.FINDSET THEN BEGIN
            TempReservEntry.DELETEALL;
            RecreateReservEntryReqLine(TempSalesLine,TempATOLink,ATOLink);
            TransferItemChargeAssgntSalesToTemp(ItemChargeAssgntSales,TempItemChargeAssgntSales);
            SalesLine.DELETEALL(TRUE);
            SalesLine.INIT;
            SalesLine."Line No." := 0;
            TempSalesLine.FINDSET;
            ExtendedTextAdded := FALSE;
            SalesLine.BlockDynamicTracking(TRUE);
            REPEAT
              IF TempSalesLine."Attached to Line No." = 0 THEN BEGIN
                CreateSalesLine(TempSalesLine);
                ExtendedTextAdded := FALSE;
                OnAfterRecreateSalesLine(SalesLine,TempSalesLine);
        
                IF SalesLine.Type = SalesLine.Type::Item THEN
                  RecreateSalesLinesFillItemChargeAssignment(SalesLine,TempSalesLine,TempItemChargeAssgntSales);
        
                IF SalesLine.Type = SalesLine.Type::"Charge (Item)" THEN BEGIN
                  TempInteger.INIT;
                  TempInteger.Number := SalesLine."Line No.";
                  TempInteger.INSERT;
                END;
              END ELSE
                IF NOT ExtendedTextAdded THEN BEGIN
                  TransferExtendedText.SalesCheckIfAnyExtText(SalesLine,TRUE);
                  TransferExtendedText.InsertSalesExtText(SalesLine);
                  OnAfterTransferExtendedTextForSalesLineRecreation(SalesLine);
        
                  SalesLine.FINDLAST;
                  ExtendedTextAdded := TRUE;
                END;
              SalesLineReserve.CopyReservEntryFromTemp(TempReservEntry,TempSalesLine,SalesLine."Line No.");
              RecreateReqLine(TempSalesLine,SalesLine."Line No.",FALSE);
              SynchronizeForReservations(SalesLine,TempSalesLine);
        
              IF TempATOLink.AsmExistsForSalesLine(TempSalesLine) THEN BEGIN
                ATOLink := TempATOLink;
                ATOLink."Document Line No." := SalesLine."Line No.";
                ATOLink.INSERT;
                ATOLink.UpdateAsmFromSalesLineATOExist(SalesLine);
                TempATOLink.DELETE;
              END;
            UNTIL TempSalesLine.NEXT = 0;
        
            CreateItemChargeAssgntSales(TempItemChargeAssgntSales,TempSalesLine,TempInteger);
        
            TempSalesLine.SETRANGE(Type);
            TempSalesLine.DELETEALL;
            OnAfterDeleteAllTempSalesLines;
            ClearItemAssgntSalesFilter(TempItemChargeAssgntSales);
            TempItemChargeAssgntSales.DELETEALL;
          END;
        END ELSE
          ERROR(Text017,ChangedFieldName);
        
        SalesLine.BlockDynamicTracking(FALSE);
        */

    end;
}

