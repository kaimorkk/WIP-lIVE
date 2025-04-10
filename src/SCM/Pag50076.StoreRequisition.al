

page 50157 "Store Requisition"
{
    Caption = 'Store Requisition';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                }
                // field("Directorate Code1"; Rec."Directorate Code1")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Department Code"; Rec."Department Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Division; Rec.Division)
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                }
                field("Budget Item"; Rec."Budget Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }

            }
            part(PurchLines; "SR Subform")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control1903326807; "Item Replenishment FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "No." = field("No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control3; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "No." = field("No."),
                              "Line No." = field("Line No.");
                ApplicationArea = Basic;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
                ApplicationArea = Basic;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }

                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                }
            }

            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    //Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        // ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        if not Confirm('Do you want to send this document for approval?') then exit;

                        StoreReqLine.Reset();
                        StoreReqLine.SetRange("Document Type", StoreReqLine."Document Type"::"Store Requisition");
                        StoreReqLine.SetRange("Document No.", Rec."No.");
                        StoreReqLine.SetRange(Type, StoreReqLine.Type::Item);
                        if StoreReqLine.FindSet() then begin
                            repeat
                                if StoreReqLine."Qty. Requested" < 1 then
                                    Error('Quantity Requested cannot be less than 1.');

                                // if StoreReqLine."Qty. Requested" > StoreReqLine."Quantity In Store" then
                                //     Error('Quantity Requested is more than the available quantity.');

                                if StoreReqLine."Quantity To  Issue" = 0 then begin
                                    if StoreReqLine."Qty. Requested" > 0 then begin
                                        StoreReqLine."Quantity To  Issue" := StoreReqLine."Qty. Requested";
                                        StoreReqLine.Modify();
                                    end;
                                end;

                            until StoreReqLine.Next() = 0;
                        end else begin
                            Error('Please enter Requisition Items before sending for approval.')
                        end;
                        // VarVariant := Rec;
                        // if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        //     ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                        if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                            ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);

                        CurrPage.Close();
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    // Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    // WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        if not Confirm('Do you want to cancell this Approval?') then exit;
                        VarVariant := Rec;
                        // ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant);
                        ApprovalsMgmt.RunWorkflowOnCancelApprovalRequest(VarVariant);
                        // ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        // WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                        // rec.Status := Rec.Status::Open;
                        // rec.modify(true);
                        CurrPage.Close();
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = rec.Status = rec.Status::"Pending Approval";
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                        CurrPage.Close();
                    end;
                }
            }

            group("Archive Document1")
            {
                Caption = 'Archive Document';

                action("Archive Document")
                {
                    ApplicationArea = Suite;
                    Caption = 'Archi&ve Document';
                    Image = Archive;
                    ToolTip = 'Send the document to the archive, for example because it is too soon to delete it. Later, you delete or reprocess the archived document.';
                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.Update(false);
                        /*"Archive Requisitions":=TRUE;
                        MODIFY;
                        MESSAGE('Document Has been Archived Successfully');*/

                    end;
                }
            }
            group(ActionGroup13)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action73)
                {
                }
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //check Budget Control
                        // ProcSetup.Get;
                        // if ProcSetup."Enforce Strict Proc Budget che" = true then begin
                        //     if Rec."Total PRN Amount (LCY)" >= Rec."PP Total Available Budget" then
                        //         Error('There is no enough Budget for No %1 Line No %2 Budget Available %3', Rec."Procurement Plan ID", Rec."Procurement Plan Entry No", Rec."PP Total Available Budget");
                        // end;
                        rec.Status := Rec.Status::Released;
                        rec.modify(true);
                        message('Released Sucessfully');
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        rec.Status := Rec.Status::Open;
                        rec.modify(true);
                        message('Reopen Sucessfully');
                    end;
                }
                separator(Action611)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    trigger OnAction()
                    begin
                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    trigger OnAction()
                    begin
                        //DMSManagement.FnUploadStoreRequisitionDocs(Rec."No.", 'Store Requisition', Rec.RecordId);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'report', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
                {
                }
                actionref("Archive Document_Promoted"; "Archive Document")
                {
                }
                actionref(Release_Promoted; Release)
                {
                }
                actionref("Attach Documents_Promoted"; "Attach Documents")
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Workflow Process', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Approve_Promoted; Approve)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
        Rec."Document Type" := Rec."document type"::"Store Requisition";
        /*
        //KUGUN-Calc Avaliable Budget
        SETRANGE("Date Filter",0D,"Order Date");
        CALCFIELDS("Budgeted Amount","Actual Budget Costs","Budget Commitments");
        
        "Remaining Budget":="Budgeted Amount"-("Actual Budget Costs"+"Budget Commitments");
        //End KUGUN-Calc Avaliable Budget
        */
        SetControlAppearance;

    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Requisition Type" := Rec."requisition type"::"Internal Use";
        Rec."Document Type" := Rec."document type"::"Store Requisition";
    end;

    trigger OnOpenPage()
    begin
        // if UserMgt.GetPurchasesFilter <> '' then begin
        //     Rec.FilterGroup(2);
        //     Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
        //     Rec.FilterGroup(0);
        // end;
        // SetControlAppearance;
        // Usersetup.GET(USERID);
        // IF Usersetup."Procurement officer"=FALSE THEN
        //  BEGIN
        //    SETFILTER("Requester ID",USERID);
        //    END;
        // Rec."Requester ID" := UserId;
        // Rec."Document Type" := Rec."document type"::"Store Requisition";
    end;

    var
        ///  ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;

        JobQueueVisible: Boolean;
        PurchSetupRec: Record "Purchases & Payables Setup";
        ItemJnlTemplate: Record "Item Journal Template";
        ItemJnlBatch: Record "Item Journal Batch";
        ItemJnlLine: Record "Item Journal Line";
        StoreReqHeader: Record "Purchase Header";
        StoreReqLine: Record "Purchase Line";
        Varvariant: Variant;
        ItemGnl: Record "Item Journal Line";
        RequisitionLine: Record "Purchase Line";
        Linenumber: Integer;
        Req: Record "Purchase Header";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        AvailableBudget: Decimal;
        Usersetup: Record "User Setup";
        ApprovalEntry: Record "Approval Entry";
    //DMSManagement: Codeunit "DMS Management";

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        if Rec.GetFilter("Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
            if Rec."Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
                Rec.SetRange("Buy-from Vendor No.");
        CurrPage.Update;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure SetControlAppearance()
    var
    ////ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        // OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        ///  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

