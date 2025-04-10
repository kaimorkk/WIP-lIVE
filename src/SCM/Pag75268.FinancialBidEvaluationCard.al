Page 75268 "Financial Bid Evaluation Card"
{
    PageType = Card;
    SourceTable = "Bid Evaluation Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; "IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Date"; "Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Venue"; "Evaluation Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Finance Opening Register No."; "Finance Opening Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Finance Opening Date"; "Finance Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Document No."; "Bid Scoring Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Evaluation Deadline"; "Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Commi"; "Appointed Bid Evaluation Commi")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Committe';
                }
                field("Primary Region"; "Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelop Type"; "Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Award Type"; "Award Type")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Style = Strong;
                    StyleExpr = true;
                }
                field("Purchaser Code"; "Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Procurement Officer';
                }
                field("Evaluation Lead"; "Evaluation Lead")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead Name"; "Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }


            }
            part(Control37; "Bid Evaluation Score Entry")
            {
                Caption = 'Finance Evaluation Criteria';
                SubPageLink = Code = field(Code);
                Visible = false;
                ApplicationArea = All;
            }
            part(Control23; "Finance Evaluation Line")
            {
                Caption = 'Bid Responses';
                SubPageLink = "Document ID" = field(Code);
                SubPageView = where("Bidder No" = filter(<> ''));
                ApplicationArea = All;
            }
            group("Procurement Plan Details")
            {
                Caption = 'Procurement Plan Details';
                Editable = false;
                Visible = false;
                field("Annual Procurement Plan ID"; "Annual Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Line No."; "Procurement Plan Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No1"; "Procurement Plan Entry No1")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Narration"; "Budget Narration")
                {
                    ApplicationArea = Basic;
                }
                field("Available Procurement Budget"; "Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Financial Evaluation Remarks")
            {
                Caption = 'Financial Evaluation Remarks';
                field("Weighted Financial Eval Score"; "Weighted Financial Eval Score")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Award Decision"; "Award Decision")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Tender Evaluation Comm Remarks"; "Tender Evaluation Comm Remarks")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    Visible = true;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control33; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control34; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control35; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control36; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = "code" <> '';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        //CurrPage.SAVERECORD;
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
                        ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "No." = field(Code);
                    ToolTip = 'View or add comments for the record.';
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

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
                action("Criteria Groups")
                {
                    ApplicationArea = Basic;
                    Image = Navigate;
                    RunObject = Page "Bid evaluation Criteria Group";
                    RunPageLink = "Template ID" = field("Bid Scoring Document No."),
                                  "Document No" = field(Code);
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;

                    trigger OnAction()
                    begin
                        Reset;
                        SetRange(Code, Code);
                        Report.Run(70042, true, true, Rec);
                    end;
                }
            }
        }
        area(processing)
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
            group(ActionGroup46)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                // action(Release)
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Re&lease';
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
                //         //ReleasePurchDoc.ReleaseVendDebarment(Rec);
                //         //Procurement.ReleaseSupplierRatingTemplate(Rec)
                //     end;
                // }
                // action(Reopen)
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Re&open';
                //     Image = ReOpen;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     PromotedOnly = true;
                //     ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                //     trigger OnAction()
                //     var
                //         ReleasePurchDoc: Codeunit "Release Approval Document";
                //     begin
                //         //ReleasePurchDoc.ReopenVendDebarment(Rec);
                //         /*IF Released=FALSE THEN
                //           ERROR('Document must be Released');
                //         Released:=FALSE;
                //         MODIFY;
                //         MESSAGE('Supplier Rating Template %1 has been opened successfuly',Code);*/

                //     end;
                // }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                //  Visible = false;
                action("Bid Evaluation Tender Committee")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code);
                }
                action("Bid Evaluation Criteria")
                {
                    ApplicationArea = Basic;
                    Image = DataEntry;
                    RunObject = Page "Bid Evaluation Score Entry";
                    RunPageLink = Code = field(Code);
                }
                action("Tender Bids")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Comparison WorkSheet';
                    Image = Worksheet;

                    trigger OnAction()
                    begin
                        //75417//70236
                        if ("Award Type" <> "award type"::"Multiple Award") then begin
                            Error('ERROR! Award Type must be of type Multiple Award');
                            CurrPage.Close;
                        end;
                        if "Cost Comparison Generated" = false then begin
                            CostComparisonSheet.Reset;
                            CostComparisonSheet.SetRange("Bid Evaluation Register", Code);
                            if CostComparisonSheet.FindSet then
                                CostComparisonSheet.DeleteAll;
                            PurchaseHeader.Reset;
                            PurchaseHeader.SetRange("Invitation For Supply No", "IFS Code");
                            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::Quote);
                            if PurchaseHeader.FindSet then begin
                                repeat
                                    PurchaseLine.Reset;
                                    PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                                    PurchaseLine.SetRange("Document Type", PurchaseLine."document type"::Quote);
                                    if PurchaseLine.FindSet then begin
                                        repeat
                                            CostComparisonSheet.Init;
                                            CostComparison.Reset;
                                            if CostComparison.FindLast then
                                                CostComparisonSheet."Entry No" := CostComparison."Entry No" + 1;
                                            CostComparisonSheet."Bid Evaluation Register" := Code;
                                            CostComparisonSheet."Document No." := PurchaseLine."Document No.";
                                            CostComparisonSheet."Document Type" := PurchaseLine."Document Type";
                                            CostComparisonSheet."No." := PurchaseLine."No.";
                                            CostComparisonSheet."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                            CostComparisonSheet."Line No." := PurchaseLine."Line No.";
                                            CostComparisonSheet.Type := PurchaseLine.Type;
                                            CostComparisonSheet."Location Code" := PurchaseLine."Location Code";
                                            CostComparisonSheet.Quantity := PurchaseLine.Quantity;
                                            CostComparisonSheet.Description := PurchaseLine.Description;
                                            CostComparisonSheet."Technical Specifications" := PurchaseLine."Technical Specifications";
                                            CostComparisonSheet."Unit of Measure" := PurchaseLine."Unit of Measure";
                                            CostComparisonSheet."Direct Unit Cost" := PurchaseLine."Direct Unit Cost";
                                            CostComparisonSheet.Amount := PurchaseLine.Amount;
                                            CostComparisonSheet."Amount Including VAT" := PurchaseLine."Amount Including VAT";
                                            CostComparisonSheet."Procurement Plan ID" := PurchaseLine."Procurement Plan ID";
                                            CostComparisonSheet."Procurement Plan Entry No" := PurchaseLine."Procurement Plan Entry No";
                                            CostComparisonSheet."PP Planning Category" := PurchaseLine."PP Planning Category";
                                            CostComparisonSheet."Bidder Name" := PurchaseHeader."Buy-from Vendor Name";
                                            CostComparisonSheet."Unit of Measure Code" := PurchaseLine."Unit of Measure Code";
                                            CostComparisonSheet."Unit Cost (LCY)" := PurchaseLine."Unit Cost (LCY)";
                                            CostComparisonSheet."Job No" := PurchaseLine."Job No.";
                                            CostComparisonSheet."Job Task No" := PurchaseLine."Job Task No.";
                                            CostComparisonSheet."PP Preference/Reservation Code" := PurchaseLine."PP Preference/Reservation Code";
                                            CostComparisonSheet."PP Procurement Method" := PurchaseHeader."PP Procurement Method";
                                            CostComparisonSheet."PP Solicitation Type" := PurchaseHeader."PP Solicitation Type";
                                            CostComparisonSheet."PP Funding Source ID" := PurchaseHeader."PP Funding Source ID";
                                            CostComparisonSheet."IFS Code" := "IFS Code";
                                            CostComparisonSheet.Insert(true);
                                        until PurchaseLine.Next = 0;
                                    end;
                                //PAGE.RUN(75418,CostComparisonSheet);
                                until PurchaseHeader.Next = 0;
                            end;
                            "Cost Comparison Generated" := true;
                        end;
                        CostComparison2.Reset;
                        CostComparison2.SetRange("Bid Evaluation Register", Code);
                        if CostComparison2.FindSet then
                            Page.Run(75418, CostComparison2);
                    end;
                }
                action("Suggest Technical Passed Bids")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Technical Passed Bids';
                    Ellipsis = true;
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestFinanceBids(Rec);
                        Message('Bids Suggested Successfully');
                    end;
                }
                action("Suggest RFQ Bids")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest RFQ Bids';
                    Ellipsis = true;
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        IFS.Reset;
                        IFS.SetRange(Code, "IFS Code");
                        IFS.SetRange("Special RFQ", true);
                        if IFS.FindSet then begin
                            Procurement.FnSuggestRFQBids(Rec, PurchaseHeader);
                            //Procurement.FnSuggestRFQBi(Rec,PurchaseHeader);
                            Message('Bids Suggested Successfully');
                        end else begin
                            Error('ERROR!!, This Functionality is Only used for Special RFQs');
                        end;
                    end;
                }
                action("Post Evaluation")
                {
                    ApplicationArea = Suite;
                    Caption = 'Post Evaluation';
                    Ellipsis = true;
                    Image = PostDocument;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        if "Award Type" = "award type"::" " then begin
                            Error('Error! Kindly specify the Award type');
                        end;
                        Procurement.PosFinanceEvaluation(Rec, UserId);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Visible = false;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalsMgmt.CheckBidEvaluationApprovalPossible(Rec) THEN
                        ///ApprovalsMgmt.OnSendBidEvaluationForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Visible = false;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //ApprovalsMgmt.OnCancelBidEvaluationApprovalRequest(Rec);
                        //WorkflowWebhookMgt.FindAndCancel(RECORDID);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("Suggest Technical Passed Bids_Promoted"; "Suggest Technical Passed Bids")
                {
                }
                actionref("Suggest RFQ Bids_Promoted"; "Suggest RFQ Bids")
                {
                }
                actionref("Post Evaluation_Promoted"; "Post Evaluation")
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
                {
                }
                actionref("Criteria Groups_Promoted"; "Criteria Groups")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'report', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Workflow Process', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Evaluation Process', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("Tender Bids_Promoted"; "Tender Bids")
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref("Bid Evaluation Tender Committee_Promoted"; "Bid Evaluation Tender Committee")
                {
                }
                actionref("Bid Evaluation Criteria_Promoted"; "Bid Evaluation Criteria")
                {
                }
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Evaluation Type" := "evaluation type"::"Financial Evaluation";
        "Evaluator Category" := "evaluator category"::"Evaluation Committee";
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        BidEvaluationReg: Record "Bid Evaluation Register";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        CostComparisonSheet: Record "Cost Comparison Sheet";
        CostComparison: Record "Cost Comparison Sheet";
        CostComparison2: Record "Cost Comparison Sheet";
        IFS: Record "Standard Purchase Code";
}

