Page 75281 "Notice of Award Card"
{
    PageType = Card;
    SourceTable = "Bid Tabulation Header";

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
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Professional Opinion ID"; "Professional Opinion ID")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Report ID"; "Final Evaluation Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; "IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; "Primary Region")
                {
                    ApplicationArea = Basic;
                }
                group("Awarded Winner")
                {
                    Caption = 'Awarded Winner';
                    Visible = Corec;
                    field("Awarded Bid No"; "Awarded Bid No")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Awarded Bidder No."; "Awarded Bidder No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Awarded Bidder Name"; "Awarded Bidder Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Award Tender Sum Inc Taxes"; "Award Tender Sum Inc Taxes")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Award Acceptance Deadline"; "Award Acceptance Deadline")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                    field("Award Acceptance Response"; "Award Acceptance Response")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                }
                group("Holding Period Details")
                {
                    Caption = 'Holding Period Details';
                    field("Award Type"; "Award Type")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Min. Contract Holding"; "Min. Contract Holding")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Earliest Contract Issuance Dt"; "Earliest Contract Issuance Dt")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("General Procurement Remarks"; "General Procurement Remarks")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control20; "Notice of Award Lines")
            {
                Caption = 'Unsuccesful Bids';
                SubPageLink = "Tabulation ID" = field(Code);
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
                action("Print Intention to Award Letter")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Reset;
                        SetRange(Code, Code);
                        Report.Run(70114, true, false, Rec);
                    end;
                }
                action("Print Regret Letter")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;

                    trigger OnAction()
                    begin
                        if "Award Type" = "award type"::"Single Award" then
                            if "Awarded Bid No" <> '' then begin
                                BidTabulationLine.Reset;
                                BidTabulationLine.SetRange("Tabulation ID", Code);
                                BidTabulationLine.SetRange("Evaluation Committee Recomm", BidTabulationLine."evaluation committee recomm"::Unsuccesful);
                                if BidTabulationLine.FindSet then begin
                                    // REPEAT
                                    Report.Run(70045, true, true, BidTabulationLine);

                                    //UNTIL BidTabulationLine.NEXT=0;
                                end;
                            end else begin
                                BidTabulationLine.Reset;
                                BidTabulationLine.SetRange("Tabulation ID", Code);
                                BidTabulationLine.SetRange("Evaluation Committee Recomm", BidTabulationLine."evaluation committee recomm"::Unsuccesful);
                                if BidTabulationLine.FindSet then begin
                                    // REPEAT
                                    Report.Run(70115, true, true, BidTabulationLine);

                                    //UNTIL BidTabulationLine.NEXT=0;
                                end;


                            end;
                    end;
                }
                action("Print Award Letter")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;

                    trigger OnAction()
                    begin
                        Reset;
                        SetRange(Code, Code);
                        Report.Run(70044, true, true, Rec);
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

            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                //  Visible = false;
                action("Document Appeals")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code);
                }
                action("Send E-Award Letter")
                {
                    ApplicationArea = Suite;
                    Caption = 'Send E-Award Letter';
                    Ellipsis = true;
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to send ?', true) then begin
                            Procurement.FnNotifyTenderAwarded(Rec);
                        end;
                    end;
                }
                action("Send E-Regret Letter")
                {
                    ApplicationArea = Basic;
                    Image = Email;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to send ?', true) then begin
                            if "Awarded Bid No" <> '' then begin
                                Procurement.FnNotifyTenderRegrets(Rec);
                            end else begin
                                Procurement.FnNotifyTenderRegretsWhereNoAward(Rec);
                            end;
                        end;
                        Message('Sent');
                    end;
                }
                action("Create Purchase Contract")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Purchase Contract';
                    Ellipsis = true;
                    Image = PostDocument;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        UserSetup.Reset;
                        UserSetup.SetRange("User ID", UserId);
                        UserSetup.SetRange("Procurement Manager", true);
                        if UserSetup.FindSet then begin

                            if "Award Type" = "award type"::"Multiple Award" then begin

                                Procurement.PostNoticeOfAWardIndividualWards1(Rec);
                            end else begin
                                Procurement.PostNoticeOfAWard(Rec);
                            end;
                        end else begin
                            Error('ERROR!! You dont have sufficient rights to generate a purchase contract');

                        end;
                        /*Purch.RESET;
                        Purch.SETRANGE("Document Type",Purch."Document Type"::"Blanket Order");
                        Purch.SETRANGE("Buy-from Vendor No.","Awarded Bidder No.");
                        IF purch.FINDSET THEN BEGIN
                        CopyPurchDoc.SetPurchHeader(Purch);
                            CopyPurchDoc.RUNMODAL;
                            CLEAR(CopyPurchDoc);
                        END;*/
                        Posted := true;
                        "Posted By" := UserId;
                        "Posted Date" := Today;
                        Modify(true);
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
                    Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*IF ApprovalsMgmt.CheckVendDebarmentApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendVendDebarmentForApproval(Rec);*/

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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        /*ApprovalsMgmt.OnCancelVendDebarmentApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(RECORDID);*/

                    end;
                }
                action("Tender Bids")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Comparison WorkSheet';
                    Image = Worksheet;
                    RunObject = Page "Cost Comparison Sheet";
                    RunPageLink = "Bid Evaluation Register" = field("Finance Bid Evaluation Registe");
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Send E-Award Letter_Promoted"; "Send E-Award Letter")
                {
                }
                actionref("Send E-Regret Letter_Promoted"; "Send E-Regret Letter")
                {
                }
                actionref("Create Purchase Contract_Promoted"; "Create Purchase Contract")
                {
                }
            }
            group(Category_Report)
            {
                actionref("Print Intention to Award Letter_Promoted"; "Print Intention to Award Letter")
                {
                }
                actionref("Print Regret Letter_Promoted"; "Print Regret Letter")
                {
                }
                actionref("Print Award Letter_Promoted"; "Print Award Letter")
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
                actionref("Document Appeals_Promoted"; "Document Appeals")
                {
                }
            }
            group(Category_Category7)
            {
                actionref("Tender Bids_Promoted"; "Tender Bids")
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

    trigger OnAfterGetRecord()
    begin
        Corec := true;
        if "Award Type" = "award type"::"Multiple Award" then begin
            Corec := false;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Notice of Award";
    end;

    trigger OnOpenPage()
    begin
        Corec := true;
        if "Award Type" = "award type"::"Multiple Award" then begin
            Corec := false;
        end;

        if "Document Status" = "document status"::Submitted then begin
            CurrPage.Editable := false;
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
        Purch: Record "Purchase Header";
        CopyPurchDoc: Report "Copy Purchase Document";
        Corec: Boolean;
        UserSetup: Record "User Setup";
        BidTabulationLine: Record "Bid Tabulation Line";
}

