

page 75135 "IFS Prebid Register Card"
{
    PageType = Card;
    SourceTable = "IFS Prebid Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Description field.';
                }
                field("Pre-bid Visit Date"; Rec."Pre-bid Visit Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Visit Date field.';
                }
                field("Pre-bid Visit Start Time"; Rec."Pre-bid Visit Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Visit Start Time field.';
                }
                field("Pre-bid Visit End Date"; Rec."Pre-bid Visit End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Visit End Date field.';
                }
                field("Pre-bid Visit End Time"; Rec."Pre-bid Visit End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Visit End Time field.';
                }
                field("Prebid Meeting Venue"; Rec."Prebid Meeting Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prebid Meeting Venue field.';
                }
                field("Pre-bid Purchaser Code"; Rec."Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Purchaser Code field.';
                }
                field("No. of Bidders"; Rec."No. of Bidders")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Bidders field.';
                }
                field("No. of Prebid Attendees"; Rec."No. of Prebid Attendees")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Prebid Attendees field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
            }
            part(Control23; "IFS Prebid Register Line")
            {
                Caption = 'Participating Bidders';
                SubPageLink = "Prebid Register ID" = field(Code),
                              "IFS Code" = field("IFS Code");
                ApplicationArea = Basic;
            }
            part(Control27; "IFS Prebid Register Agenda")
            {
                Caption = 'Meeting Agenda';
                SubPageLink = "Prebid Register ID" = field(Code),
                              "IFS Code" = field("IFS Code");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control19; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Links)
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
                    Enabled = Rec.code <> '';
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
                action("Appointment Letter")
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    ToolTip = 'Executes the Appointment Letter action.';
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
            group(ActionGroup36)
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
                        //ReleasePurchDoc.ReleaseITT(Rec);
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
                        //ReleasePurchDoc.ReopenITT(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Notify Appointees")
                {
                    ApplicationArea = Basic;
                    Image = SendMail;
                    ToolTip = 'Executes the Notify Appointees action.';
                    trigger OnAction()
                    begin
                        Procurement.FnNotifyPrebidAttendees(Rec);
                    end;
                }
                action("IFS Prebid Bidder Attendance")
                {
                    ApplicationArea = Basic;
                    Image = Absence;
                    RunObject = Page "IFS Prebid Bidder Attendance";
                    RunPageLink = "Prebid Register ID" = field(Code),
                                  "IFS Code" = field("IFS Code");
                    ToolTip = 'Executes the IFS Prebid Bidder Attendance action.';
                }
                action("Prebid Summary Note")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prebid Summary Note';
                    Image = Notes;
                    RunObject = Page "IFS Prebid Summary Note";
                    RunPageLink = "Prebid Register ID" = field(Code);
                    ToolTip = 'Executes the Prebid Summary Note action.';
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostedServiceOrder;
                    ToolTip = 'Executes the Post action.';
                    trigger OnAction()
                    begin
                        IFS.Reset;
                        IFS.SetRange(Code, Rec."IFS Code");
                        if IFS.FindSet then begin
                            IFS."Prebid Meeting Register ID" := Rec.Code;
                            IFS.Modify;
                            Message('Prebid meeting for IFS no: %1 has been posted successfuly', IFS.Code);
                        end;
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
                actionref("IFS Prebid Bidder Attendance_Promoted"; "IFS Prebid Bidder Attendance")
                {
                }
                actionref("Prebid Summary Note_Promoted"; "Prebid Summary Note")
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
                actionref("Notify Appointees_Promoted"; "Notify Appointees")
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

