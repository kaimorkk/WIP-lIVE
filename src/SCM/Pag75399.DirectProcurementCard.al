page 75399 "Direct Procurement Card"
{
    // //check on format of email and if its attaching the email document
    caption = 'Procurement Card';
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
                    //  Caption = 'RFQ No.';
                    Importance = Promoted;
                }
                field(Reference; "External Document No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reference';
                    Importance = Promoted;
                }
                field(PRNNo; "PRN No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(LocationCode; "Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(TenderName; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementType; "Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field(RequisitionProductGroup; "Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementCategoryID; "Procurement Category ID")
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementCategory; "Procurement Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SolicitationType; "Solicitation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ProcurementMethod; "Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field(HasanEmailAttachment; "Has an Email Attachment ?")
                {
                    ApplicationArea = Basic;
                }
                field(RFQSent; "RFQ Sent")
                {
                    ApplicationArea = Basic;
                }
                field(PurchaserCode; "Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field(EvaluationCriteria; "Bid Scoring Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Criteria';
                }
                field(LanguageCode; "Language Code")
                {
                    ApplicationArea = Basic;
                }
                field(PreliminaryEvaluation; "Preliminary Evaluation")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                    Importance = Additional;
                }
                field(CreatedDateTime; "Created Date/Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(Createdby; "Created by")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            part(Control32; "IFS Intention To Bid")
            {
                Caption = 'Invited Bidder';
                SubPageLink = Code = field(Code),
                              Category = field("Procurement Category ID");
                ApplicationArea = All;
            }
            group(SupplierDetails)
            {
                Caption = 'Supplier Details';
                field(AwardedQuoteNo; "Awarded Quote No")
                {
                    ApplicationArea = Basic;
                }
                field(AwardedBidderNo; "Awarded Bidder No")
                {
                    ApplicationArea = Basic;
                }
                field(AwardedBidderName; "Awarded Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field(AwardedBidderSum; "Awarded Bidder Sum")
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
                // field(RequestingRegion; "Requesting Region")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(RequestingDirectorate; "Requesting Directorate")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(RequestingDepartment; "Requesting Department")
                // {
                //     ApplicationArea = Basic;
                // }
                field(ProcurementPlanID; "Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementPlanEntryNo; "Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                // field(Job; Job)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'PP Job No.';
                // }
                // field(PPJobTaskNo; "Job Task No.")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'PP Job Task No.';
                // }
                field(PPPlanningCategory; "PP Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field(PPFundingSourceID; "PP Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field(PPTotalBudget; "PP Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field(PPTotalActualCosts; "PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field(PPTotalCommitments; "PP Total Commitments")
                {
                    ApplicationArea = Basic;
                }
                field(PPTotalAvailableBudget; "PP Total Available Budget")
                {
                    ApplicationArea = Basic;
                }
                field(PPPreferenceReservationCode; "PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field(FinancialYearCode; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
            }
            // group("Project Details")
            // {
            //     Editable = false;
            //     field(ProjectID; "Project ID")
            //     {
            //         ApplicationArea = Basic;
            //     }
            // }
        }
        area(factboxes)
        {
            // part("Attached Documents"; "Document Attachments")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     SubPageLink = "Table ID" = filter(173),
            //                   "No." = field(Code);
            // }
            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Suite;
                Visible = true;
            }
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ApplicationArea = Suite;
                ShowFilter = false;
                Visible = true;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = true;
                Enabled = true;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Notes;
            }
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control6; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control3; Links)
            {
                ApplicationArea = Basic;
            }
            // chartpart("Q5402-01"; "Q5402-01")
            // {
            //     ApplicationArea = Basic;
            // }
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
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Enabled = Status = Status::open;
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit UnknownCodeunit50003;
                    begin
                        Status := Status::Released;
                        modify(true)
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Status <> Status::Open;
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit UnknownCodeunit50003;
                    begin
                        Status := Status::Open;
                        modify(true);
                    end;
                }
            }
            group(Functions)
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


                    trigger OnAction()
                    begin
                        TestField("Awarded Bidder No");
                        TestField("Awarded Quote No");
                        TestField(Posted, false);
                        TestField(Status, Status::Released);
                        Procurement.FnGenerateLPODirect(Rec);
                        Posted := true;
                        "Posted By" := UserId;
                        "Posted On" := CurrentDatetime;
                    end;
                }
                action(Print)
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
            group(RequestApproval)
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
                action("Prequalified Suppliers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invited Bidders';
                    Image = ReturnRelated;
                    RunObject = Page "IFS Intention To Bid";
                    RunPageLink = Code = field(Code),
                                  Category = field("Procurement Category ID");
                    Visible = true;
                }
                action("Preview Request")
                {
                    ApplicationArea = Basic;
                    Image = PrintVoucher;

                    trigger OnAction()
                    var
                        //rfqreport: Report RFQ;
                        Supplierrec: Record "Standard Vendor Purchase Code";
                    begin
                        Commit;
                        if Status = Status::Released then begin
                            StandardVendor.Reset;
                            StandardVendor.SetRange(Code, Code);
                            Report.Run(70151, true, true, StandardVendor);
                        end else begin
                            StandardVendor.Reset;
                            StandardVendor.SetRange(Code, Code);
                            Report.Run(70152, true, true, StandardVendor);
                        end;
                    end;
                }
                action("Send Direct Procurement Request")
                {
                    ApplicationArea = Basic;
                    Image = SendMail;

                    trigger OnAction()
                    begin
                        TestField("RFQ Sent", false);
                        TestField(Status, Status::Released);
                        Procurement.FnSendDirectnvitation(Rec, Vendor);
                        "RFQ Sent" := true;
                        "RFQ Sent By" := UserId;
                        "RFQ Sent On" := CurrentDatetime;
                        Modify(true);
                    end;
                }
                action("Submit To HOD")
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Visible = false;

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
                actionref("Preview Request_Promoted"; "Preview Request")
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
                actionref(Print_Promoted; Print)
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
                actionref("Prequalified Suppliers_Promoted"; "Prequalified Suppliers")
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
                actionref("Send Direct Procurement Request_Promoted"; "Send Direct Procurement Request")
                {
                }
                actionref("Submit To HOD_Promoted"; "Submit To HOD")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Release', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
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
        if Usersetup.Get(UserId) then begin
            if Usersetup."Procurement Manager" = true or Usersetup."Procurement officer" = true
              then
                CurrPage.Editable := true;
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
        if Usersetup.Get(UserId) then begin
            if Usersetup."Procurement Manager" = true or Usersetup."Procurement officer" = true
              then
                CurrPage.Editable := true;
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
        //DMSDocuments: Record UnknownRecord50007;
        //DMSManagement: Codeunit UnknownCodeunit50009;
        StandardVendor: Record "Standard Vendor Purchase Code";
        Purchheader: Record "Purchase Header";
        PRN2: Record "Purchase Header";
        PurchaHeader: Record "Purchase Header";
        Usersetup: Record "User Setup";

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

