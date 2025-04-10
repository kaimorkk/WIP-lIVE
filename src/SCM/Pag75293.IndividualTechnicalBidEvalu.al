

page 75293 "Individual Technical Bid Evalu"
{
    PageType = Card;
    SourceTable = "Bid Evaluation Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Evaluation Date"; Rec."Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Date field.';
                }

                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Preliminary Evaluation No"; Rec."Preliminary Evaluation No")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Bid Evaluation Register".Code where("Evaluation Type" = const("Preliminary Evaluation"),
                                                                          "Evaluator Category" = const("Individual Evaluator"));
                    ToolTip = 'Specifies the value of the Preliminary Evaluation No field.';
                }
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Evaluation Venue"; Rec."Evaluation Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Venue field.';
                }
                field("Bid Scoring Document No."; Rec."Bid Scoring Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Scoring Document No. field.';
                }
                field("Bid Opening Register No."; Rec."Bid Opening Register No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Register No. field.';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Date field.';
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Evaluation Deadline field.';
                }
                field("Appointed Bid Evaluation Commi"; Rec."Appointed Bid Evaluation Commi")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Committe';
                    ToolTip = 'Specifies the value of the Evaluation Committe field.';
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Envelop Type field.';
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Procurement Officer';
                    ToolTip = 'Specifies the value of the Lead Procurement Officer field.';
                }
                field("Evaluation Lead"; Rec."Evaluation Lead")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Lead field.';
                }
                field("Evaluation Lead Name"; Rec."Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Lead Name field.';
                }
                field("No of Passed Requirements"; Rec."No of Passed Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Passed Requirements field.';
                }
                field("No of Failed Requirements"; Rec."No of Failed Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Failed Requirements field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = all;
                }
            }
            part(Control37; "Bid Evaluation Score Entry")
            {
                SubPageLink = Code = field(Code);
                ApplicationArea = Basic;
            }
            group("Evaluation Result")
            {
                Caption = 'Evaluation Result';
                field("Technical Evaluation  Decision"; Rec."Technical Evaluation  Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technical Evaluation  Decision field.';
                }
                field("Tender Evaluation Comm Remarks"; Rec."Tender Evaluation Comm Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Evaluation Comm Remarks field.';
                }
                field("Tech Evaluation Ranking"; Rec."Tech Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Tech Evaluation Ranking field.';
                }
                field("Weighted Technical Eval Score"; Rec."Weighted Technical Eval Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Technical Eval Score field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control33; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control34; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control35; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control36; Links)
            {
                ApplicationArea = Basic;
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
                    Enabled = Rec."code" <> '';
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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
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
                    Visible = false;
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
                    ToolTip = 'Executes the Criteria Groups action.';
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
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
                    visible = false;
                    ToolTip = 'Approve the requested changes.';
                    // Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup46)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReleaseVendDebarment(Rec);
                        //Procurement.ReleaseSupplierRatingTemplate(Rec)
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReopenVendDebarment(Rec);
                        /*IF Released=FALSE THEN
                          ERROR('Document must be Released');
                        Released:=FALSE;
                        MODIFY;
                        MESSAGE('Supplier Rating Template %1 has been opened successfuly',Code);*/

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Bid Evaluation Tender Committee")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code);
                    ToolTip = 'Executes the Bid Evaluation Tender Committee action.';
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
                    // Ellipsis = true;
                    Image = PostDocument;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.PosTechnicalEvaluation(Rec,UserId);
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*//if //ApprovalsMgmt.CheckVendDebarmentApprovalPossible(Rec) THEN
                          //ApprovalsMgmt.OnSendVendDebarmentForApproval(Rec);*/


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
                        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        /*//ApprovalsMgmt.OnCancelVendDebarmentApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(RECORDID);*/

                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Post Evaluation_Promoted"; "Post Evaluation")
                {
                }
                actionref("Suggest Evaluation Criteria_Promoted"; "Suggest Evaluation Criteria")
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
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref("Bid Evaluation Tender Committee_Promoted"; "Bid Evaluation Tender Committee")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Evaluation Process', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Dimensions', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }
            group(Category_Category8)
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Evaluation Type" := Rec."evaluation type"::"Technical Evaluation";
        Rec."Evaluator Category" := Rec."evaluator category"::"Individual Evaluator";
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
}

#pragma implicitwith restore

