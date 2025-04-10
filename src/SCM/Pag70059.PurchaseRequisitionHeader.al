

page 70059 "Purchase Requisition Header"
{
    Caption = 'Purchase Requisition Header';
    DeleteAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter("Purchase Requisition"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                group("&General")
                {
                    Editable = IsEditable;
                    field("No."; Rec."No.")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Requester ID"; Rec."Requester ID")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Request-By No."; Rec."Request-By No.")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Request-By Name"; Rec."Request-By Name")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                    field(HOD; Rec.HOD)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Location Code"; Rec."Location Code")
                    {
                        ApplicationArea = Basic;
                        Editable = not OpenApprovalEntriesExist;
                        ShowMandatory = true;
                        Visible = true;
                    }
                    field("Order Date"; Rec."Order Date")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Request Date';
                        Editable = not OpenApprovalEntriesExist;
                    }
                }
                group("&Description")
                {
                    field(Description; Rec.Description)
                    {
                        ApplicationArea = Basic;
                        Editable = not OpenApprovalEntriesExist;
                        NotBlank = true;
                        ShowMandatory = true;

                        trigger OnValidate()
                        begin
                            //MESSAGE('SID %1',SESSIONID);
                        end;
                    }
                }
                group("&&General")
                {
                    Editable = IsEditable;
                    field("Requisition Type"; Rec."Requisition Type")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
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
                        ShowMandatory = true;

                        trigger OnValidate()
                        begin
                            ShortcutDimension2CodeOnAfterV;
                        end;
                    }
                    field("Department Name"; Rec."Department Name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                    {
                        ApplicationArea = Basic;
                        Editable = not OpenApprovalEntriesExist;
                        ShowMandatory = true;
                    }
                    field("Project Name"; Rec."Project Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Program Name';
                        Editable = false;
                    }
                    field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                    {
                        ApplicationArea = Basic;
                        Editable = not OpenApprovalEntriesExist;
                        ShowMandatory = true;
                        Visible = false;
                    }
                    field("Unit  Name"; Rec."Unit  Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Section Name';
                        Visible = false;
                    }
                    field("Requisition Amount"; Rec."Requisition Amount")
                    {
                        ApplicationArea = Basic;
                        Style = Favorable;
                        StyleExpr = true;
                    }
                    field("No. of Archived Versions"; Rec."No. of Archived Versions")
                    {
                        ApplicationArea = Basic;
                        Importance = Additional;
                    }
                    field("Process Type"; Rec."Process Type")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                    }
                    field("Purchase Type"; Rec."Purchase Type")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Directorate Code1"; Rec."Directorate Code1")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Department Code"; Rec."Department Code")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Department/Center Code';
                    }
                    field(Division; Rec.Division)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Has Attachment"; Rec."Has Attachment")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                    field(Job; Rec.Job)
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                    }
                    field("Job Name"; Rec."Job Name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Job Task No."; Rec."Job Task No.")
                    {
                        ApplicationArea = Basic;
                        ShowMandatory = true;
                    }
                    field(Approver; Rec.Approver)
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            part(PurchLines; "Purchase Requisition Subform")
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
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.SetRecordFilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.SetRecordFilters(Database::"Purchase Header", 14, Rec."No.");
                        ApprovalEntries.Run;
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
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = true;

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        Rec.TestField(Description);
                        Rec.TestField(Job);
                        //TESTFIELD("Job Task No.");
                        //TESTFIELD("Has Attachment",TRUE);
                        //TESTFIELD("Requester ID",USERID);
                        //KasnebFunctions.UpdateLocations(Rec);
                        Rec.TestField("Requisition Amount");
                        //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                    end;
                }
                action("Archive Document")
                {
                    ApplicationArea = Suite;
                    Caption = 'Archi&ve Document';
                    Image = Archive;
                    ToolTip = 'Send the document to the archive, for example because it is too soon to delete it. Later, you delete or reprocess the archived document.';
                    Visible = false;

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
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Enabled = false;
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        if Rec.Status = Rec.Status::"Pending Approval" then
                            Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                        ////ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action611)
                {
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                Image = Approval;
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("Check Budget Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Availability';
                    Image = Balance;

                    trigger OnAction()
                    begin

                        /*BCSetup.GET;
                        IF NOT BCSetup.Mandatory THEN
                           EXIT;*/

                        /*F NOT CheckforRequiredFields THEN
                           ERROR('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');*/

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        /*IF SomeLinesCommitted THEN BEGIN
                           IF NOT CONFIRM( 'Some or All the Lines Are already Committed do you want to continue',TRUE, "Document Type") THEN
                                ERROR('Budget Availability Check and Commitment Aborted');
                          DeleteCommitment.RESET;
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::LPO);
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document No.","No.");
                          DeleteCommitment.DELETEALL;
                        END;*/
                        //Commitment.CheckLPOCommittment(Rec);

                        //MESSAGE('Commitments done Successfully for Doc. No %1',"No.");

                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);

                        if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');

                        // DeleteCommitment.Reset;
                        // DeleteCommitment.SetRange(DeleteCommitment."Commitment Type", DeleteCommitment."commitment type"::LPO);
                        // DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        // DeleteCommitment.DeleteAll;
                        //Tag all the Purchase Line entries as Uncommitted
                        /*PurchLine.RESET;
                        PurchLine.SETRANGE(PurchLine."Document Type","Document Type");
                        PurchLine.SETRANGE(PurchLine."Document No.","No.");
                        IF PurchLine.FIND('-') THEN BEGIN
                           REPEAT
                              PurchLine.Committed:=FALSE;
                              PurchLine.MODIFY;
                           UNTIL PurchLine.NEXT=0;
                        END;*/

                        Message('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");

                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;

                    trigger OnAction()
                    begin
                        /*IF Status<>Status::Released THEN
                        ERROR(Text001);
                        IF Status=Status::Released THEN BEGIN
                        DocPrint.PrintPurchHeader(Rec);
                          END;*/

                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(50097, true, true, Rec)

                    end;
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;

                    trigger OnAction()
                    begin
                        // DMSManagement.FnUploadPurchaseRequisitionDocs(Rec."No.", 'Purchase Requisition', Rec.RecordId);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("Attach Documents_Promoted"; "Attach Documents")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Process)
            {
                actionref("Check Budget Availability_Promoted"; "Check Budget Availability")
                {
                }
                actionref("Cancel Budget Commitment_Promoted"; "Cancel Budget Commitment")
                {
                }
                actionref(Release_Promoted; Release)
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
            group(Category_Category5)
            {
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
            }
            group(Category_Category9)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
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
        //SetControlAppearance;

        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        /*
        IF (Status=Status::"Pending Approval") THEN BEGIN
            CurrPage.EDITABLE:=FALSE;
          END;*/
        IsEditable := (Rec.Status = Rec.Status::Open);

    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Requisition Type" := Rec."requisition type"::Project;
        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
    end;

    trigger OnOpenPage()
    begin
        //SetControlAppearance;
        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
        end;


        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        /*
        IF (Status=Status::"Pending Approval") THEN BEGIN
            CurrPage.EDITABLE:=FALSE;
          END;*/
        IsEditable := (Rec.Status = Rec.Status::Open);

    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
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
        ItemGnl: Record "Item Journal Line";
        RequisitionLine: Record "Purchase Line";
        Linenumber: Integer;
        Req: Record "Purchase Header";
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        AvailableBudget: Decimal;
        Commitment: Codeunit "Procurement Processing";
        //DeleteCommitment: Record "Commitment Entries1";
        IsEditable: Boolean;
        KasnebFunctions: Codeunit KasnebFunctions;
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
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        //OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

