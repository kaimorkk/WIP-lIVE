

page 75190 "Dept Procurement Plan Card"
{
    PageType = Card;
    SourceTable = "Procurement Plan";
    Caption = 'Functional Procurement Plan Card';
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Consolidated Procurement Plan"; Rec."Consolidated Procurement Plan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consolidated Procurement Plan field.';
                    Enabled = Cust;
                }
                // field("Planning Responsibility Center"; Rec."Planning Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Planning Responsibility Center field.';
                // }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan ID field.';
                }
                field("Annual Workplan Plan ID"; Rec."Annual Workplan Plan ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Annual Workplan Plan ID field.', Comment = '%';
                }
                field("Financial Budget ID"; Rec."Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Budget ID field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Year Code';
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Shortcut Dimension 1 Filter"; Rec."Shortcut Dimension 1 Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Filter"; Rec."Shortcut Dimension 2 Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
                }
                field("Total Budget (Goods)"; Rec."Total Budget (Goods)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget (Goods) field.';
                }
                field("Total Budget (Works)"; Rec."Total Budget (Works)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget (Works) field.';
                }
                field("Total Budget (Services)"; Rec."Total Budget (Services)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget (Services) field.';
                }
                field("Total Budgeted Spend"; Rec."Total Budgeted Spend")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budgeted Spend field.';
                }
                field("Total Actual (Goods)"; Rec."Total Actual (Goods)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actual (Goods) field.';
                }
                field("Total Actual (Works)"; Rec."Total Actual (Works)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actual (Works) field.';
                }
                field("Total Actual (Services)"; Rec."Total Actual (Services)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actual (Services) field.';
                }
                field("Total Actual Spend"; Rec."Total Actual Spend")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actual Spend field.';
                }
                field("Spend %"; Rec."Spend %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Spend % field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    // Enabled = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
            }
            part(Control21; "Procurement Plan Lines")
            {
                SubPageLink = "Procurement Plan ID" = field(Code);
                // SubPageView = where("Total Budgeted Cost" = filter(> 0));
                ApplicationArea = all;
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
                ApplicationArea = Basic;
            }
            systempart(Control18; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Procurement Plan")
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

                action("Co&mments")
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
                    Visible = false;
                    ToolTip = 'Executes the Attach to Sharepoint action.';
                    trigger OnAction()
                    begin
                        //DMSManagement.UploadDocument(DMSDocuments."Document Type"::"Imprest Memo",Code,'Imprest Memo',RECORDID);
                    end;
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
            group(ActionGroup51)
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
                        //ReleasePurchDoc.ReleaseProcPlan(Rec);
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
                        // ReleasePurchDoc.ReopenProcPlan(Rec);
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
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Enabled = Rec."code" <> '';
                    Image = CopyDocument;
                    Visible = false;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/

                    end;
                }
                action("Copy Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Procurement Plan';
                    // RunObject = Report "Rejected Purchase Invoices";
                    ToolTip = 'Executes the Copy Procurement Plan action.';
                }
                action("Import Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Image = ImportExcel;
                    RunObject = XMLport "Import Procurement Plan1";
                    ToolTip = 'Executes the Import Procurement Plan action.';
                }
                action("Suggest Workplan Workings")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Visible = true;
                    ToolTip = 'Executes the Suggest Planned PP Schedule action.';
                    trigger OnAction()
                    begin

                        Procurement.FnSuggestWorkPlanLines(Rec);
                        Procurement.FnSuggestWorkPlanLinesENTRY(Rec);
                    end;
                }
                // action(Print)
                // {
                //     ApplicationArea = Basic;
                //     Image = Print;
                //     Promoted = true;
                //     PromotedCategory = "Report";
                //     ToolTip = 'Executes the Print action.';
                //     trigger OnAction()
                //     begin
                //         Rec.Reset;
                //         Rec.SetRange(Code, Rec.Code);
                //         Report.Run(70125, true, true, Rec);
                //     end;
                // }
                action("Print")
                {
                    ApplicationArea = Basic;
                    Image = report;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        rec.SetRange(code, rec.Code);
                        report.Run(70051, true, true, Rec);
                    end;
                }
                action("Procurement Plan Summary Goods")
                {
                    ApplicationArea = Basic;
                    //   RunObject = Report "Annual Procurement Plan G&S";
                    ToolTip = 'Executes the Procurement Plan Summary Goods action.';
                }
                action("Procurement Plan  Services")
                {
                    ApplicationArea = Basic;
                    //  RunObject = Report "Annual Procurement Plan Consul";
                    ToolTip = 'Executes the Procurement Plan  Services action.';
                }
                action("Post To Consolidated Plan ")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    ToolTip = 'Executes the Post To Consolidated Plan  action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Posted, false);
                        Rec.TestField("Approval Status", Rec."Approval Status"::Released);
                        Procurement.PostToConsolidatedPlan(Rec);
                        REC.Posted := true;
                    end;
                }
            }


        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Import Procurement Plan_Promoted"; "Import Procurement Plan")
                {
                }
                actionref("Suggest Workplan Workings_Promoted"; "Suggest Workplan Workings")
                {
                }
                actionref(AttachDocuments_Promoted; AttachDocuments)
                {
                }
                actionref(CopyDocument_Promoted; CopyDocument)
                {
                }
                actionref("Post To Consolidated Plan _Promoted"; "Post To Consolidated Plan ")
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
                Caption = 'Manage', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
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
                Caption = 'Attachment', Comment = 'Generated from the PromotedActionCategories property index 7.';

                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
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
        Rec."Document Type" := Rec."Document Type"::"Procurement Plan";
    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false
        else
            currpage.editable := true;

    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false
        else
            currpage.editable := true;

    end;

    trigger OnAfterGetRecord()

    begin
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false
        else
            currpage.editable := true;

        Cust := false;
        if Rec."Approval Status" = Rec."Approval Status"::Released then begin
            Cust := true;
        end;
    end;

    var
        Cust: Boolean;
        ProcPlanItem: Record "Procurement Plan1";
        BudgetEntries: Record "Procurement Plan Entry1";
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
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        // DMSDocuments: Record "DMS Documents";
        // DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

