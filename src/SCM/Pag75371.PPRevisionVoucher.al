
page 75371 "PP Revision Voucher"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Procurement Plan";
    caption = 'Procurement Plan Ammendments';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(PlanNo; Rec."Plan No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field(CreatedBy; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(DateCreated; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field(TimeCreated; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control21; "PP Revision Voucher Lines")
            {
                Caption = 'Voucher Lines';
                SubPageLink = "Procurement Plan ID" = field(Code),
                              "Document Type" = field("Document Type");
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            // part("Attached Documents"; "Document Attachments")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     SubPageLink = "Table ID" = const(70098),
            //                   "No." = field("Code");
            // }
            systempart(Control17; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control18; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control19; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control20; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ProcurementPlan)
            {
                Caption = 'Procurement Plan';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."Code" <> '';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }

                action(Comments)
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "No." = field(Code),
                                  "Document Line No." = const(0);
                    ToolTip = 'View or add comments for the record.';
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach to Sharepoint';
                    Image = Attach;
                    Visible = true;

                    trigger OnAction()
                    begin
                        //  DMSManagement.UploadDocument1(DMSDocuments."document type"::"Imprest Memo",Code,'Imprest Memo',RecordId);
                    end;
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
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
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
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
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
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
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
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Visible = false;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    // ReleasePurchDoc: Codeunit UnknownCodeunit50003;
                    begin
                        //ReleasePurchDoc.ReleaseProcPlan(Rec);
                        Rec."Approval Status" := Rec."approval status"::Released;
                        Rec.Modify(true);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Visible = false;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    // ReleasePurchDoc: Codeunit UnknownCodeunit50003;
                    begin
                        //ReleasePurchDoc.ReopenProcPlan(Rec);
                        Rec."Approval Status" := Rec."approval status"::Open;
                        Rec.Modify(true);
                    end;
                }
            }
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Suggest Procurement Plan Lines")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Visible = true;

                    trigger OnAction()
                    begin
                        Procurement.FnSuggestPlanLines(Rec);
                    end;
                }
                action("Export Revision Lines")
                {
                    ApplicationArea = Basic;
                    Image = Exportxcel;
                    Visible = true;

                    trigger OnAction()
                    begin
                        Procurement.exportToExcel(Rec);
                    end;
                }

                action("Import Plan Revision Voucher")
                {
                    ApplicationArea = Basic;
                    Image = ImportExcel;
                    //RunObject = XMLport "Import PP Revision Voucher";
                }
                //exportToExcel


                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70051, true, true, Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = Post;

                    trigger OnAction()
                    begin
                        Procurement.FnPostPlanRevisions(Rec);
                    end;
                }
            }
            group(RequestApproval)
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    //Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin

                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    // Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
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
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 1.';
            }
            group(Category_Report)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 2.';

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
                Caption = 'Amendment Process', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Release_Promoted; Release)
                {
                }
                actionref("Suggest Procurement Plan Lines_Promoted"; "Suggest Procurement Plan Lines")
                {
                }
                actionref("Export Revision Lines_Promoted"; "Export Revision Lines")
                {
                }
                actionref("Import Plan Revision Voucher_Promoted"; "Import Plan Revision Voucher")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Comments', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(AttachDocuments_Promoted; AttachDocuments)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref(Comments_Promoted; Comments)
                {
                }
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Plan Type" := Rec."plan type"::Functional;
        Rec.Type := Rec.Type::Functional;
        Rec."Revision Voucher" := true;
        Rec."Document Type" := Rec."document type"::"Revision Voucher";
    end;

    trigger OnOpenPage()
    begin
        corec := false;
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            corec := true;
        end;
    end;

    var
        // ProcPlanItem: Record UnknownRecord70008;
        // BudgetEntries: Record UnknownRecord70038;
        GenPostingSetup: Record "General Posting Setup";
        FAPostingGp: Record "FA Posting Group";
        FADepreciation: Record "FA Depreciation Book";
        ItemRec: Record Item;
        Window: Dialog;
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        // DMSDocuments: Record UnknownRecord50007;
        // DMSManagement: Codeunit UnknownCodeunit50009;
        corec: Boolean;
}

#pragma implicitwith restore

