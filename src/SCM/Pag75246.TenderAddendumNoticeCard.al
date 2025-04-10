

page 75246 "Tender Addendum Notice Card"
{
    PageType = Card;
    SourceTable = "Tender Addendum Notice";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Addendum Notice No."; Rec."Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice No."; Rec."Invitation Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Addendum Instructions"; Rec."Addendum Instructions")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Primary Addendum Type ID"; Rec."Primary Addendum Type ID")
                {
                    ApplicationArea = Basic;
                }
                field("Addendum Type Description"; Rec."Addendum Type Description")
                {
                    ApplicationArea = Basic;
                }
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Original Submission Start Date"; Rec."Original Submission Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Submission Start Date"; Rec."New Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission Start Time"; Rec."Original Submission Start Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Submission Start Time"; Rec."New Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission End Date"; Rec."Original Submission End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Submission End Date"; Rec."New Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission End Time"; Rec."Original Submission End Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Submission End Time"; Rec."New Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Bid Opening Date"; Rec."Original Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Bid Opening Date"; Rec."New Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Bid Opening Time"; Rec."Original Bid Opening Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Bid Opening Time"; Rec."New Bid Opening Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Prebid Meeting Date"; Rec."Original Prebid Meeting Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Prebid Meeting Date"; Rec."New Prebid Meeting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control37; "Tender Addendum Amendment")
            {
                Caption = 'Addendum Amendment';
                SubPageLink = "Addendum Notice No." = field("Addendum Notice No.");
                ApplicationArea = Basic;
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
                    Enabled = Rec."Addendum Notice No." <> '';
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
                        //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "No." = field("Addendum Notice No.");
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
                action("Appointment Letter")
                {
                    ApplicationArea = Basic;
                    Image = Print;
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
            group(ActionGroup47)
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
                        // ReleasePurchDoc.ReleaseTenderAddendum(Rec);
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
                        //ReleasePurchDoc.ReopenTenderAddendum(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders';
                    Image = Notes;
                    RunObject = Page "Tender Addendum Bidder";
                    RunPageLink = "Addendum Notice No." = field("Addendum Notice No.");
                }
                action("Suggest Intention-To-Bid Vendors")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;

                    trigger OnAction()
                    begin
                        Procurement.suggestIntentionToBidVends(Rec);
                    end;
                }
                action("Send Addendum e-Notice")
                {
                    ApplicationArea = Basic;
                    Image = Email;

                    trigger OnAction()
                    begin
                        Procurement.SendAddendumNotice(Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostedServiceOrder;

                    trigger OnAction()
                    begin
                        Rec."Document Status" := Rec."document status"::Published;
                        Rec.Posted := true;
                        Rec.Modify(true);
                        Message('Tender Addedndum no: %1 has been issued successfuly', Rec."Addendum Notice No.");
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
                    Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*//if //ApprovalsMgmt.CheckIFPApprovalPossible(Rec) THEN
                          //ApprovalsMgmt.OnSendIFPForApproval(Rec);*/


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
                        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        /*//ApprovalsMgmt.OnCancelIFPApprovalRequest(Rec);*/
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);

                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Bidders_Promoted; Bidders)
                {
                }
                actionref("Suggest Intention-To-Bid Vendors_Promoted"; "Suggest Intention-To-Bid Vendors")
                {
                }
                actionref("Send Addendum e-Notice_Promoted"; "Send Addendum e-Notice")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Report)
            {
                actionref("Appointment Letter_Promoted"; "Appointment Letter")
                {
                }
            }
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
            }
            group(Category_Category5)
            {
                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Category8)
            {
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

    var
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PRN: Record "Purchase Header";
        IFS: Record "Standard Purchase Code";
}

#pragma implicitwith restore

