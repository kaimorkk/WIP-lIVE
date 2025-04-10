page 70132 "Asset Transfer Card"
{
    PageType = ListPlus;
    SourceTable = "Standard Sales Code";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Code)
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies a code which identifies this standard sales code.';

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.UPDATE;
                    end;
                }
                field("Document Date"; "Document Date")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("External Document No"; "External Document No")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Method of Disposal"; "Method of Disposal")
                {
                    ApplicationArea = All;
                }
                field("Disposal Type"; "Disposal Type")
                {
                    ApplicationArea = All;
                }
                field("Disposal  Plan ID"; "Disposal  Plan ID")
                {
                    ApplicationArea = All;
                }
                field("Disposal Requisition No"; "Disposal Requisition No")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Cancel Reason Code"; "Cancel Reason Code")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Cancellation Date"; "Cancellation Date")
                {
                    ApplicationArea = All;
                }
                field("Cancellation Secret Code"; "Cancellation Secret Code")
                {
                    ApplicationArea = All;
                }
                field("No. of Submission"; "No. of Submission")
                {
                    Importance = Additional;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Created Date/Time"; "Created Date/Time")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Created by"; "Created by")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
            }
            part(StdSalesLines; "Asset Tranfer Subform")
            {
                ApplicationArea = Suite;
                SubPageLink = "Standard Sales Code" = field("Code");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Disposal)
            {
                Caption = 'Disposal';
                Image = "Order";
                action(Approvals)
                {
                    AccessByPermission = TableData 454 = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
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
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
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
                        ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
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
                        ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
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
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release2)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    //  ReleasePurchDoc: Codeunit "50003";
                    begin
                        //ReleasePurchDoc.ReleaseTenderCommitte(Rec);
                        TESTFIELD(Status, Status::Open);
                        Status := Status::Released;
                        MESSAGE('Released Successfully');
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
                    //    ReleasePurchDoc: Codeunit "50003";
                    begin
                        //ReleasePurchDoc.ReopenTenderCommitte(Rec);
                        TESTFIELD(Status, Status::Released);
                        Status := Status::Open;
                        MESSAGE('Reopened Successfully');
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Create Sales Order")
                {
                    Image = SendMail;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Procurement.FnInitiateDisposalContract(Rec);
                        MESSAGE('Sales Orders Generated Successfully');
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
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
                        // IF ApprovalsMgmt.CheckIFDApprovalPossible(Rec) THEN
                        //     ApprovalsMgmt.OnSendIFDForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "1535";
                    // WorkflowWebhookMgt: Codeunit "1543";
                    begin
                        // ApprovalsMgmt.OnCancelIFDApprovalRequest(Rec);
                        // WorkflowWebhookMgt.FindAndCancel(RECORDID);
                    end;
                }
                // action(Attendance)
                // {
                //     Image = Accounts;
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     PromotedIsBig = true;
                //     RunObject = Page 70147;
                //     RunPageLink = "Code" = FIELD("Code");
                // }
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
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
                actionref("Create Sales Order_Promoted"; "Create Sales Order")
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Release2_Promoted; Release2)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Category8)
            {
                actionref(Approvals_Promoted; Approvals)
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
        ProcCommType: Record "Procurement Committee Types";
        IfsCommitteMembers: Record "IFS Tender Committee Member";
        NoOfMembers: Integer;
        IFS: Record "Standard Purchase Code";
}

