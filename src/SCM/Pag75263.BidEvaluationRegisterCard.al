Page 75263 "Bid Evaluation Register Card"
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
                field("Evaluation Date"; "Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; "IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bid No."; "Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name"; "Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Venue"; "Evaluation Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Document No."; "Bid Scoring Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Register No."; "Bid Opening Register No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date"; "Bid Opening Date")
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
                field("No of Passed Requirements"; "No of Passed Requirements")
                {
                    ApplicationArea = Basic;
                }
                field("No of Failed Requirements"; "No of Failed Requirements")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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

                field("Evaluator Category"; Rec."Evaluator Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Evaluator Category field.';
                }



            }
            part(Control37; "Bid Evaluation Score Entry")
            {
                SubPageLink = Code = field(Code);
                ApplicationArea = All;
            }
            group("Evaluation Result")
            {
                Caption = 'Evaluation Result';
                field("Preliminary Evaluation Score"; "Preliminary Evaluation Score")
                {
                    ApplicationArea = Basic;
                    Caption = 'Preliminary Evaluation Decision';
                }
                field("Tender Evaluation Comm Remarks"; "Tender Evaluation Comm Remarks")
                {
                    ApplicationArea = Basic;
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
                        Report.Run(70041, true, true, Rec);
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
                //Visible = false;
                action("Bid Evaluation Tender Committee")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code);
                }
                action("Suggest Evaluation Criteria")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Evaluation Criteria';
                    Ellipsis = true;
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestBidEvaluationCriteria(Rec);
                    end;
                }
                action("Post Evaluation")
                {
                    ApplicationArea = all;
                    Caption = 'Post Evaluation';
                    Ellipsis = true;
                    Image = PostDocument;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.PostPreliminaryEvaluation(Rec, UserId);
                    end;
                }
                action("Filed Bid Response Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    RunObject = Page "Bid Filed Document";
                    RunPageLink = "No." = field("Bid No."),
                                  "Vendor No" = field("Vendor No.");
                }
                action("Suggest Committe Evaluation")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Committe Evaluation';
                    Ellipsis = true;
                    Image = SuggestCapacity;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestPreliminaryEvaluationEntries1(Rec);
                        Message('Suggested Successfully');
                        //Procurement.SuggestPreliminaryEvaluationEntrs(Rec);
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
                    Visible = false;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*IF ApprovalsMgmt.CheckBidEvaluationApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendBidEvaluationForApproval(Rec);*/

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
                        /*ApprovalsMgmt.OnCancelBidEvaluationApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(RECORDID);*/

                    end;
                }
                action("Individual Committee Evaluations")
                {
                    ApplicationArea = Basic;
                    Image = ItemTrackingLedger;
                    RunObject = Page "Individual Preliminary Evaluat";
                    RunPageLink = "Bid No." = field("Bid No."),
                                  "IFS Code" = field("IFS Code");
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Home', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Individual Committee Evaluations_Promoted"; "Individual Committee Evaluations")
                {
                }
                actionref("Bid Evaluation Tender Committee_Promoted"; "Bid Evaluation Tender Committee")
                {
                }
                actionref("Suggest Evaluation Criteria_Promoted"; "Suggest Evaluation Criteria")
                {
                }
                actionref("Post Evaluation_Promoted"; "Post Evaluation")
                {
                }
                actionref("Filed Bid Response Documents_Promoted"; "Filed Bid Response Documents")
                {
                }
                actionref("Suggest Committe Evaluation_Promoted"; "Suggest Committe Evaluation")
                {
                }
                actionref("Criteria Groups_Promoted"; "Criteria Groups")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Manage', Comment = 'Generated from the PromotedActionCategories property index 4.';
            }
            group(Category_Category6)
            {
                Caption = 'Posting', Comment = 'Generated from the PromotedActionCategories property index 5.';
            }
            group(Category_Category7)
            {
                Caption = 'Print', Comment = 'Generated from the PromotedActionCategories property index 6.';
            }
            group(Category_Category8)
            {
                Caption = 'Attachments', Comment = 'Generated from the PromotedActionCategories property index 7.';

                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
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

    trigger OnAfterGetCurrRecord()
    begin
        BidEvaluationScoreEntry.Reset;
        BidEvaluationScoreEntry.SetRange(Code, Code);
        BidEvaluationScoreEntry.SetRange("Evaluation Results", BidEvaluationScoreEntry."evaluation results"::Fail);
        if BidEvaluationScoreEntry.FindSet then begin
            "Preliminary Evaluation Score" := "preliminary evaluation score"::"Non-Responsive";
            Modify(true);

        end else begin
            "Preliminary Evaluation Score" := "preliminary evaluation score"::Responsive;
            Modify(true);
        end;
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
        Nopassreq: Integer;
        AllReq: Integer;
        BidEvaluationScoreEntry: Record "Bid Evaluation Score Entry";
}

