codeunit 57012 "Process Extensions"
{
    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeGetNoSeriesCode', '', false, false)]
    // local procedure OnBeforeGetNoSeriesCode(var Sender: Record "Purchase Header"; PurchSetup: Record "Purchases & Payables Setup"; var NoSeriesCode: Code[20]; var IsHandled: Boolean; var PurchaseHeader: Record "Purchase Header");
    // begin
    //     case PurchaseHeader."Document Type" of
    //         purchaseHeader."Document Type"::"Purchase Requisition":
    //             NoSeriesCode := PurchSetup."Purchase Requisition Nos.";
    //     end;
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidateNo', '', false, false)]
    local procedure OnBeforeValidateNo(var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line"; CurrentFieldNo: Integer; var IsHandled: Boolean);
    begin
        if (PurchaseLine."Document Type" = PurchaseLine."Document Type"::"Purchase Requisition") and (PurchaseLine.Type = PurchaseLine.Type::"G/L Account") then begin
            IsHandled := true;
        end;
        if (PurchaseLine."Document Type" = PurchaseLine."Document Type"::"Store Requisition") and (PurchaseLine.Type = PurchaseLine.Type::"G/L Account") then begin
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeCheckBuyFromVendorNo', '', false, false)]
    local procedure OnBeforeCheckBuyFromVendorNo(PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean);
    begin
        if (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Store Requisition") then
            IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch. Price Calc. Mgt.", 'OnBeforeFindPurchLinePrice', '', false, false)]
    local procedure OnBeforeFindPurchLinePrice(var PurchaseLine: Record "Purchase Line"; var PurchaseHeader: Record "Purchase Header"; CalledByFieldNo: Integer; var IsHandled: Boolean);
    begin
        if (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Store Requisition") then
            IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Enum Assignment Management", 'OnGetPurchApprovalDocumentType', '', false, false)]
    local procedure OnGetPurchApprovalDocumentType(PurchDocumentType: Enum "Purchase Document Type"; var ApprovalDocumentType: Enum "Approval Document Type"; var IsHandled: Boolean);
    var
    begin
        if PurchDocumentType = PurchDocumentType::"Purchase Requisition" then
            ApprovalDocumentType := ApprovalDocumentType::"Purchase requisition";
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]

    local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean);

    begin
        if (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Store Requisition") then begin

            PurchaseHeader.CheckPurchaseReleaseRestrictions();
            IsHandled := true;
        end;
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', true, true)]

    // //local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean)
    // local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean);
    // var
    //     IsHandled: boolean;
    // begin
    //     PurchaseHeader.CheckPurchaseReleaseRestrictions();
    //     PreviewMode := true;
    //     IF ((PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Store Requisition") OR (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition")) THEN BEGIN
    //         PurchaseHeader.TESTFIELD(PurchaseHeader."Requester ID");
    //         EXIT;
    //     END
    // end;
    //[IntegrationEvent(false, false)]
    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post", 'OnBeforeShowPostResultMessage', '', false, false)]
    // local procedure OnBeforeShowPostResultMessage(var GenJnlLine: Record "Gen. Journal Line"; TempJnlBatchName: Code[10]; IsHandled: Boolean)
    // var
    // begin
    //     if GenJnlLine."Document No." <> '' then
    //         IsHandled := true;
    //     exit;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post", 'OnBeforeCode', '', false, false)]
    // local procedure OnBeforeCode(var GenJournalLine: Record "Gen. Journal Line"; var HideDialog: Boolean);
    // var

    // begin
    //     if GenJournalLine."Document No." <> '' then
    //         HideDialog := true;
    //     if GenJournalLine."Posting Date" > CalcDate('CM', WorkDate()) then
    //         if not isFinanceHOD() then
    //             Error('You cannot post outside the current month');
    //     if GenJournalLine."Posting Date" < CalcDate('-CM', WorkDate()) then
    //         if not isFinanceHOD() then
    //             Error('You cannot post outside the current month');

    // end;


    procedure isFinanceHOD(): Boolean
    var
        Userstp: Record "User Setup";
    begin
        Userstp.Get(UserId);
        exit(Userstp."HOD Finance");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateShortcutDimCode', '', false, false)]
    local procedure "Sales Header_OnAfterValidateShortcutDimCode"(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        DimVal: Record "Dimension Value";
    begin
        if FieldNumber = 2 then
            if SalesHeader."Shortcut Dimension 1 Code" = '' then begin
                DimVal.Reset();
                DimVal.SetRange("Global Dimension No.", 2);
                DimVal.SetRange(Code, ShortcutDimCode);
                if DimVal.FindFirst() then begin
                    // SalesHeader."Shortcut Dimension 1 Code" := DimVal."Shortcut Dimension 1 Code";
                    //SalesHeader.Validate("Shortcut Dimension 1 Code");
                end;
            end;

    end;

    /*Show approvals to all users*/
    [EventSubscriber(ObjectType::Table, Database::"Approval Entry", 'OnBeforeMarkAllWhereUserisApproverOrSender', '', false, false)]

    local procedure OnBeforeMarkAllWhereUserisApproverOrSender(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    begin
        Ishandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnBeforeGetFullDocTypeTxt, '', false, false)]
    local procedure OnBeforeGetFullDocTypeTxt(var PurchaseHeader: Record "Purchase Header"; var FullDocTypeTxt: Text; var IsHandled: Boolean);
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition" then begin
            FullDocTypeTxt := 'Purchase Requisition';
            IsHandled := true;
        end;
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Store Requisition" then begin
            FullDocTypeTxt := 'Store Requisition';
            IsHandled := true;
        end;
    end;
}
