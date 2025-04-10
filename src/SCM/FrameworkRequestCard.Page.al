Page 75433 "Framework Request Card"
{
    // check on format of email and if its attaching the email document

    DeleteAllowed = false;
    PageType = Document;
    SourceTable = "Standard Purchase Code";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'No.';
                    Importance = Promoted;
                }
                field("External Document No"; "External Document No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reference';
                    Importance = Promoted;
                }
                field("PRN No."; "PRN No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Summary"; "Tender Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; "Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                    Importance = Additional;
                }
                field("Requisition Product Group"; "Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category ID"; "Procurement Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category"; "Procurement Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Solicitation Type"; "Solicitation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Method"; "Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code"; "Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field("Language Code"; "Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; "Created Date/Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created by"; "Created by")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            group("Framework Agreement Details")
            {
                Caption = 'Framework Agreement Details';
                field("Framework Agreement No"; "Framework Agreement No")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Quote No"; "Awarded Quote No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Quote No';
                }
                field("Awarded Bidder No"; "Awarded Bidder No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidder No';
                }
                field("Awarded Bidder Name"; "Awarded Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bidder Sum"; "Awarded Bidder Sum")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Description of Items & Services Requested"; "IFS Purchase Lines")
            {
                Caption = 'Description of Items & Services Requested';
                SubPageLink = "Standard Purchase Code" = field(Code);
                ApplicationArea = All;
            }
            group("Budget Control Checks")
            {
                Editable = false;
                field("Requesting Region"; "Requesting Region")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Directorate"; "Requesting Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Department"; "Requesting Department")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan ID"; "Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No"; "Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Job)
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Job No.';
                }
                field("Job Task No."; "Job Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Job Task No.';
                }
                field("PP Planning Category"; "PP Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("PP Funding Source ID"; "PP Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Budget"; "PP Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Actual Costs"; "PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Commitments"; "PP Total Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Available Budget"; "PP Total Available Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Preference/Reservation Code"; "PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Project Details")
            {
                Editable = false;
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control116; "Approval FactBox")
            {
                SubPageLink = "Table ID" = filter(173),
                              "Document No." = field(Code);
                Visible = true;
                ApplicationArea = All;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
                ApplicationArea = All;
            }
            systempart(Control113; Links)
            {
                Visible = false;
                ApplicationArea = All;
            }
            systempart(Control112; Notes)
            {
                Visible = true;
                ApplicationArea = All;
            }
            systempart(Control108; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control109; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control110; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control111; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup135)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                // action(Release)
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Re&lease';
                //     Enabled = Status = Status::open;
                //     Image = ReleaseDoc;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     PromotedIsBig = true;
                //     PromotedOnly = true;
                //     ShortCutKey = 'Ctrl+F9';
                //     ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                //     trigger OnAction()
                //     var
                //         ReleasePurchDoc: Codeunit "Release Approval Document";
                //     begin
                //         ReleasePurchDoc.ReleaseITT(Rec);
                //     end;
                // }
                // action(Reopen)
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Re&open';
                //     Enabled = Status <> Status::Open;
                //     Image = ReOpen;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     PromotedOnly = true;
                //     ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                //     trigger OnAction()
                //     var
                //         ReleasePurchDoc: Codeunit "Release Approval Document";
                //     begin
                //         ReleasePurchDoc.ReopenITT(Rec);
                //     end;
                // }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy PRN Details';
                    Ellipsis = true;
                    Enabled = "code" <> '';
                    Image = CopyDocument;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        PRN.Reset;
                        PRN.SetRange("No.", "PRN No.");
                        if PRN.FindSet then
                            Procurement.CopyPRNDetails(PRN, Rec);

                    end;
                }
                action("Purchase Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Lines';
                    Ellipsis = true;
                    Enabled = "Code" <> '';
                    Image = PutawayLines;
                    RunObject = Page "IFS Purchase Lines";
                    RunPageLink = "Standard Purchase Code" = field(Code);

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        //Procurement.SuggestProcurementCategories(Rec);

                    end;
                }
                action("Suggest Required Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = "Code" <> '';
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestRequiredDocITT(Rec);

                    end;
                }
                action("Suggest Tender Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = "Code" <> '';
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestTenderSourceDoc(Rec);

                    end;
                }
                action("Create LPO/LSO")
                {
                    ApplicationArea = Basic;
                    Image = PrintCover;
                    Visible = status = status::Released;

                    trigger OnAction()
                    begin
                        TestField("Awarded Bidder No");
                        TestField("Awarded Quote No");
                        TestField(Posted, false);
                        // IF "Agreement Type"="Agreement Type"::New THEN BEGIN
                        // Procurement.FnGenerateFrameworkDirect(Rec);
                        //  END;
                        // IF "Agreement Type"="Agreement Type"::Existing THEN BEGIN
                        // TESTFIELD("Framework Agreement No");
                        Procurement.FnGenerateLPODirect(Rec);
                        //  END;
                        //  IF "Agreement Type"="Agreement Type"::" " THEN BEGIN
                        // ERROR('ERROR! Agreement Type cannot be blank');
                        //  END;
                        Posted := true;
                        "Posted By" := UserId;
                        "Posted On" := CurrentDatetime;
                        Modify(true);
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
                        Commit;
                        PRN.Reset;
                        PRN.SetRange("No.", "Awarded Quote No");
                        PRN.SetRange("Document Type", PRN."document type"::Quote);
                        if PRN.FindSet then begin
                            Report.Run(70138, true, true, PRN)
                        end;
                    end;
                }
                action(Responses)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responses';
                    Image = ReturnRelated;
                    RunObject = Page "Bid Response List";
                    RunPageLink = "Invitation For Supply No" = field(Code),
                                  "Document Type" = const(Quote);
                    Visible = true;
                }
                action("Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    RunObject = Page "IFS Required Document";
                    RunPageLink = "Document No" = field(Code);
                    Visible = true;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";

                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin

                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        Commit;
                        ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action("Personnel Specifications")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    RunObject = Page "IFS Key Staff";
                    RunPageLink = "IFS Code" = field(Code);
                    Visible = false;
                }
                action("Equipment Specifications")
                {
                    ApplicationArea = Basic;
                    Image = LiFo;
                    RunObject = Page "IFS Required Equipment";
                    RunPageLink = "Document No" = field(Code);
                    Visible = false;
                }
                action("Major Deliverables")
                {
                    ApplicationArea = Basic;
                    Image = Delivery;
                    RunObject = Page "IFS Major Work_Deliverable";
                    RunPageLink = "Document No" = field(Code);
                    Visible = false;
                }
                action("Cancel Invitation")
                {
                    ApplicationArea = Suite;
                    Image = CancelAllLines;
                    Visible = "Document Status" = "Document Status"::Draft;

                    trigger OnAction()
                    begin
                        Procurement.CancelIFSInvitation(Rec);
                        //Procurement.FnUncommitPRNNOA(Rec);
                    end;
                }
                action("Re-Tender Invitation")
                {
                    ApplicationArea = Suite;
                    Image = Replan;
                    Visible = status = status::Released;

                    trigger OnAction()
                    begin
                        //Procurement.CancelIFSInvitation(Rec);
                        //TESTFIELD("Document Status","Document Status"::Evaluation);
                        if Confirm('Are yOu sure you want to Initiate for Repeat of the process ?', true) then begin
                            "Document Status" := "document status"::"Re-Tendered";
                            "Retendered By" := UserId;
                            "Retendered On" := CurrentDatetime;
                            Message('Successfully Initiated');
                            PurchaHeader.Reset;
                            PurchaHeader.SetRange("No.", "PRN No.");
                            if PurchaHeader.FindFirst then begin
                                Procurement.CreateInvitationNoticeRetender(PurchaHeader);
                            end;
                        end;
                    end;
                }
                action("Close Invitation")
                {
                    ApplicationArea = Suite;
                    Image = CancelLine;
                    Visible = "Document Status" = "Document Status"::Cancelled;

                    trigger OnAction()
                    begin
                        //Procurement.FnNotifyonTenderTermination(Rec);
                        //  Procurement.FnUncommitPRNNOA(Rec);
                        "Document Status" := "document status"::Closed;
                        Message('Closed Successfully');
                        //Procurement.CancelIFSInvitation(Rec);
                        //Procurement.FnUncommitPRNNOA(Rec);
                    end;
                }
                action("Submit To HOD")
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;

                    trigger OnAction()
                    begin
                        TestField(Status, Status::Released);
                        TestField("Submission Status", "submission status"::Draft);
                        //Procurement.FnSendDirectnvitation(Rec,Vendor);
                        "Submission Status" := "submission status"::Submitted;
                        Modify(true);
                        Message('Submitted Successfully');
                    end;
                }
                // action(MakeOrder)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Make &Order';
                //     Image = MakeOrder;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     ToolTip = 'Convert the sales quote to a sales order.';

                //     trigger OnAction()
                //     var
                //         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                //     begin
                //         //IF //ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                //         Codeunit.Run(Codeunit::"Sales-Quote to Order (Yes/No)", Rec);
                //     end;
                // }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Re-Tender Invitation_Promoted"; "Re-Tender Invitation")
                {
                }
                actionref(CopyDocument_Promoted; CopyDocument)
                {
                }
                actionref("Purchase Lines_Promoted"; "Purchase Lines")
                {
                }
                actionref("Suggest Required Documents_Promoted"; "Suggest Required Documents")
                {
                }
                actionref("Suggest Tender Documents_Promoted"; "Suggest Tender Documents")
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Responses_Promoted; Responses)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref("Required Documents_Promoted"; "Required Documents")
                {
                }
                actionref("Personnel Specifications_Promoted"; "Personnel Specifications")
                {
                }
                actionref("Equipment Specifications_Promoted"; "Equipment Specifications")
                {
                }
                actionref("Major Deliverables_Promoted"; "Major Deliverables")
                {
                }
                actionref("Submit To HOD_Promoted"; "Submit To HOD")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Release', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("Create LPO/LSO_Promoted"; "Create LPO/LSO")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Posting', Comment = 'Generated from the PromotedActionCategories property index 5.';
            }
            group(Category_Category7)
            {
                Caption = 'Prepare', Comment = 'Generated from the PromotedActionCategories property index 6.';

                actionref("Cancel Invitation_Promoted"; "Cancel Invitation")
                {
                }
                actionref("Close Invitation_Promoted"; "Close Invitation")
                {
                }
            }
            group(Category_Category8)
            {
                Caption = 'Order', Comment = 'Generated from the PromotedActionCategories property index 7.';

                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category9)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category10)
            {
                Caption = 'Print/Send', Comment = 'Generated from the PromotedActionCategories property index 9.';
            }
            group(Category_Category11)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 10.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if "Awarded Quote No" <> '' then begin
            Purchheader.Reset;
            Purchheader.SetRange("No.", "Awarded Quote No");
            if Purchheader.FindSet then begin
                //"Awarded Bidder No":=Purchheader."Buy-from Vendor No.";
                "Awarded Bidder Name" := Purchheader."Buy-from Vendor Name";
                Purchheader.CalcFields("Amount Including VAT");
                "Awarded Bidder Sum" := Purchheader."Amount Including VAT";
                Modify(true);
            end;
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Procurement Method" := "procurement method"::RFQ;
    end;

    trigger OnOpenPage()
    begin
        if "Awarded Quote No" <> '' then begin
            Purchheader.Reset;
            Purchheader.SetRange("No.", "Awarded Quote No");
            if Purchheader.FindSet then begin
                //"Awarded Bidder No":=Purchheader."Buy-from Vendor No.";
                "Awarded Bidder Name" := Purchheader."Buy-from Vendor Name";
                Purchheader.CalcFields("Amount Including VAT");
                "Awarded Bidder Sum" := Purchheader."Amount Including VAT";
                Modify(true);
            end;
        end;
        if Status = Status::Released then begin
            CurrPage.Editable := false;
        end;
        if Status = Status::"Pending Approval" then begin
            CurrPage.Editable := false;
        end;
    end;

    var
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PRN: Record "Purchase Header";
        Vendor: Record Vendor;


        Purchheader: Record "Purchase Header";
        PurchaHeader: Record "Purchase Header";
        IsCustomerOrContactNotEmpty: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin



        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}

