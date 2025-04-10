Page 75265 "Technical Bid Evaluation Card"
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
                field("Preliminary Evaluation No"; "Preliminary Evaluation No")
                {
                    ApplicationArea = Basic;
                }
                field("Bid No."; "Bid No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                SubPageLink = Code = field(Code);
                ApplicationArea = All;
            }
            group("Evaluation Result")
            {
                Caption = 'Evaluation Result';
                field("Technical Evaluation  Decision"; "Technical Evaluation  Decision")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Tender Evaluation Comm Remarks"; "Tender Evaluation Comm Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Tech Evaluation Ranking"; "Tech Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Weighted Technical Eval Score"; "Weighted Technical Eval Score")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = all;

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
            group(ActionGroup45)
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
                // Visible = false;
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
                action("Post Evaluation")
                {
                    ApplicationArea = Suite;
                    Caption = 'Post Evaluation';
                    Ellipsis = true;
                    Image = PostDocument;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.PosTechnicalEvaluation(Rec, UserId);
                    end;
                }
            }
            // group("Request Approval")
            // {
            //     Caption = 'Request Approval';
            //     Visible = false;
            //     action(SendApprovalRequest)
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Send A&pproval Request';
            //         Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
            //         Image = SendApprovalRequest;
            //         Promoted = true;
            //         PromotedCategory = Category9;
            //         PromotedIsBig = true;
            //         ToolTip = 'Request approval of the document.';

            //         trigger OnAction()
            //         var
            //             ApprovalsMgmt: Codeunit "Approvals Mgmt.";
            //         begin
            //             /*IF ApprovalsMgmt.CheckVendDebarmentApprovalPossible(Rec) THEN
            //               ApprovalsMgmt.OnSendVendDebarmentForApproval(Rec);*/

            //         end;
            //     }
            //     action(CancelApprovalRequest)
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Cancel Approval Re&quest';
            //         Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
            //         Image = CancelApprovalRequest;
            //         Promoted = true;
            //         PromotedCategory = Category9;
            //         ToolTip = 'Cancel the approval request.';

            //         trigger OnAction()
            //         var
            //             ApprovalsMgmt: Codeunit "Approvals Mgmt.";
            //             WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
            //         begin
            //             /*ApprovalsMgmt.OnCancelVendDebarmentApprovalRequest(Rec);
            //             WorkflowWebhookMgt.FindAndCancel(RECORDID);*/

            //         end;
            //     }
            //     action("Individual Committee Evaluations")
            //     {
            //         ApplicationArea = Basic;
            //         Image = ItemTrackingLedger;
            //         Promoted = true;
            //         PromotedCategory = Category4;
            //         PromotedIsBig = true;
            //         RunObject = Page "Individual Technical Bid Eval";
            //         RunPageLink = "Bid No." = field("Bid No."),
            //                       "IFS Code" = field("IFS Code");
            //     }
            // }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Suggest Committe Evaluation_Promoted"; "Suggest Committe Evaluation")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
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
                Caption = 'Committee', Comment = 'Generated from the PromotedActionCategories property index 3.';
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
                Caption = 'Comments', Comment = 'Generated from the PromotedActionCategories property index 7.';

                actionref(Comment_Promoted; Comment)
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
                Caption = 'Workflow Process', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Delegate_Promoted; Delegate)
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
            "Technical Evaluation  Decision" := "technical evaluation  decision"::Fail;
            Modify(true);
        end else begin
            "Technical Evaluation  Decision" := "technical evaluation  decision"::Pass;
            Modify(true);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Evaluation Type" := "evaluation type"::"Technical Evaluation";
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
        Nopassreq: Integer;
        AllReq: Integer;
        BidEvaluationScoreEntry: Record "Bid Evaluation Score Entry";
}

