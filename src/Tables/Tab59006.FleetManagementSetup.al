
table 59006 "Fleet Management Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Transport Req No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(2; "Daily Work Ticket"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(3; "Fuel Register"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(4; "Maintenance Request"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(11; "Driver Rotation"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(12; "Rotation Interval"; DateFormula)
        {
        }
        field(14; "Fuel Payment Batch No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(15; "Contract  No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(16; "Fuel Card No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17; No; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(18; "Sender Email"; Code[50])
        {
        }
        field(19; "Transport Req Gate Pass No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(20; "Licence Expiry Notice Period"; DateFormula)
        {
        }
        field(21; "Project Accountant Email"; Text[30])
        {
        }
        field(22; "Transport Admin Email"; Text[30])
        {
        }
        field(30; "Main Funds Bank A/C"; Code[50])
        {
            TableRelation = "Bank Account";
        }
        field(31; "Transfer-To Job No"; Code[50])
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
        field(32; "Transfer-To Task No"; Code[50])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Transfer-To Job No"),
                                                             "Job Task Type" = const(Posting));
        }
        field(33; "Transfer-To Income G/L A/C"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(34; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDocDim;
            end;
        }
        field(35; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(36; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(37; "HOD E-Mail Address"; Text[50])
        {
        }
        field(38; "Vehicle Inspection No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(39; "Default Fleet Driver"; Code[20])
        {

        }
        field(40; "Vehicle Request Nos."; Code[20])
        {
            TableRelation = "No. Series";

        }
        field(41; "Vehicle Incident Nos."; Code[20])
        {
            TableRelation = "No. Series";

        }

        field(42; "Tyre Requisition Nos"; Code[20])
        {
            TableRelation = "No. Series";

        }
        field(43; "Handover Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }

    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

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
        Project: Record Job;
        SalesLine: Record "Inter-Project Transfer Line";


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        //"Dimension Set ID" :=
        //  DimMgt.EditDimensionSet2(
        //   "Dimension Set ID",StrSubstNo('%1 %2','',No),
        //   "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
        
        
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    local procedure GetCurrency()
    begin
        /*
          CurrencyCode := "Currency Code";
        
        IF CurrencyCode = '' THEN BEGIN
          CLEAR(Currency);
          Currency.InitRoundingPrecision
        END ELSE
          IF CurrencyCode <> Currency.Code THEN BEGIN
            Currency.GET(CurrencyCode);
            Currency.TESTFIELD("Amount Rounding Precision");
          END;
          */

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
        /*OnBeforeUpdateCurrencyFactor(Rec,Updated);
        IF Updated THEN
          EXIT;
        
        IF "Currency Code" <> '' THEN BEGIN
          IF "Posting Date" <> 0D THEN
            CurrencyDate := "Posting Date"
          ELSE
            CurrencyDate := WORKDATE;
        
          IF UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrencyDate,"Currency Code") THEN BEGIN
            "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate,"Currency Code");
            IF "Currency Code" <> xRec."Currency Code" THEN
              RecreateSalesLines(FIELDCAPTION("Currency Code"));
          END ELSE BEGIN
            IF CONFIRM(STRSUBSTNO(MissingExchangeRatesQst,"Currency Code",CurrencyDate)) THEN BEGIN
              COMMIT;
              UpdateCurrencyExchangeRates.OpenExchangeRatesPage("Currency Code");
              UpdateCurrencyFactor;
            END ELSE
              RevertCurrencyCodeAndPostingDate;
          END;
        END ELSE
          "Currency Factor" := 0;
        */

    end;

    local procedure ConfirmUpdateCurrencyFactor()
    begin
        /*IF GetHideValidationDialog THEN
          Confirmed := TRUE
        ELSE
          Confirmed := CONFIRM(Text021,FALSE);
        IF Confirmed THEN
          VALIDATE("Currency Factor")
        ELSE
          "Currency Factor" := xRec."Currency Factor";
          */

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCurrencyFactor(var SalesHeader: Record "Inter_Project Transfer Header"; var Updated: Boolean)
    begin
    end;

    local procedure RevertCurrencyCodeAndPostingDate()
    begin
        /*"Currency Code" := xRec."Currency Code";
        "Posting Date" := xRec."Posting Date";
        */

    end;

    procedure GetHideValidationDialog(): Boolean
    var
        IdentityManagement: Codeunit "Identity Management";
    begin
        message('');
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

