

page 75214 "EOI Card"
{
    Caption = 'Expression of Interest(EOI)';
    PageType = Card;
    SourceTable = "Request For Information";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'IFP Notice No.';
                    Editable = false;
                    ToolTip = 'Link to  No Series on the E-Procurement Setup Table (Different No. Series shall be defined for different Request for Information e.g. IFP,EOI';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is used for categorization of the prequalifications since the different supplier clusters may have different sets of unique requirements. NB: We separate Contractors because of the dedicated Contractors Portal used during Project execution';
                }
                field("Tender Summary"; Rec."Tender Summary")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Tender Summary field.';
                }
                field("Primary Target Vendor Cluster"; Rec."Primary Target Vendor Cluster")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is used for categorization of the prequalifications since the different supplier clusters may have different sets of unique requirements. NB: We separate Contractors because of the dedicated Contractors Portal used during Project execution';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'For external references such as Memo etc';
                }
                field("Period Start Date"; Rec."Period Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prequalification Period Start Date';
                    ToolTip = 'Indicate the Prequalification Start Date (To define period of prequalification of the vendor)';
                }
                field("Period End Date"; Rec."Period End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prequalification Period End Date';
                    ToolTip = 'Indicate the Prequalification End Date (To define period of prequalification of the vendor)';
                }
                field("Procurement Document Template"; Rec."Procurement Document Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Document Template';
                    ToolTip = 'Specifies the value of the Procurement Document Template field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("RFI Scoring Template"; Rec."RFI Scoring Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFI Scoring Template field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("No. of Submission"; Rec."No. of Submission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Submission field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created by field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
            }
            part(Control47; "RFI Prequalification Category")
            {
                SubPageLink = "Document No" = field(Code);
                ApplicationArea = Basic;
            }
            group("Submission Details")
            {
                Caption = 'Submission Details';
                group("Critical Submission Date")
                {
                    Caption = 'Critical Submission Date';
                    field("Submission Start Date"; Rec."Submission Start Date")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Submission Start Date field.';
                    }
                    field("Submission Start Time"; Rec."Submission Start Time")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Submission Start Time field.';
                    }
                    field("Submission End Date"; Rec."Submission End Date")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Submission End Date field.';
                    }
                    field("Submission End Time"; Rec."Submission End Time")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Submission End Time field.';
                    }
                }
                group("Submission Address Details")
                {
                    Caption = 'Submission Address Details';
                    field(Name; Rec.Name)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Procuring Entity Name';
                        ToolTip = 'Specifies the value of the Procuring Entity Name field.';
                    }
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Address field.';
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Address 2 field.';
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Post Code field.';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the City field.';
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Country/Region Code field.';
                    }
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Phone No. field.';
                    }
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Email field.';
                    }
                    field("Tender Box Location Code"; Rec."Tender Box Location Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Tender Box Location Code field.';
                    }
                }
            }
            group("Prequalification Charges")
            {
                Caption = 'Prequalification Charges';
                field("Prequalification Charge Code"; Rec."Prequalification Charge Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification Charge Code field.';
                }
                field("Charge Amount (LCY)"; Rec."Charge Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Charge Amount (LCY) field.';
                }
                field("Charge Bank Code"; Rec."Charge Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Charge Bank Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Account Holder Name"; Rec."Account Holder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Holder Name field.';
                }
                field("Charge Bank Branch"; Rec."Charge Bank Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Charge Bank Branch field.';
                }
                field("Charge Bank A/C No"; Rec."Charge Bank A/C No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Charge Bank A/C No field.';
                }
            }
            part(Control50; "RFI Required Document")
            {
                SubPageLink = "Document No" = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(70084),
                              "No." = field(Code);
            }
            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Suite;
                Visible = true;
            }
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ApplicationArea = Suite;
                ShowFilter = false;
                Visible = true;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = true;
                Enabled = true;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control83; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control82; Notes)
            {
                ApplicationArea = Notes;
            }
            systempart(Control42; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control43; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control44; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control45; Links)
            {
                ApplicationArea = Basic;
            }
            // chartpart("Q5402-01"; "Q5402-01")
            // {
            //     ApplicationArea = Basic;
            // }
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
                    // RunPageLink = "Document Type" = field("Document Type"),
                    //               "No." = field("No. of Submission"),
                    //               "Document Line No." = const(0);
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
            group(ActionGroup61)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Enabled = Rec.Status = Rec.Status::open;
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //   ReleasePurchDoc.ReleaseIFP(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        // ReleasePurchDoc.ReopenIFP(Rec);
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
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/

                    end;
                }
                action("Suggest Procurement Categories")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Procurement Categories';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = SuggestCapacity;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestProcurementCategories(Rec);

                    end;
                }
                action("Suggest Required Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = CopyDocument;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestRequiredDoc(Rec);

                    end;
                }
                action(Publish)
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Published = false;
                    Image = PrintCover;
                    Visible = Rec.status = Rec.status::Released;
                    ToolTip = 'Executes the Publish action.';
                    trigger OnAction()
                    begin
                        Procurement.PublishIFP(Rec);
                    end;
                }
                action("Activate Evaluations")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Published = true;
                    Image = ActivateDiscounts;
                    Visible = Rec.status = Rec.status::Released;
                    ToolTip = 'Executes the Activate Evaluations action.';
                    trigger OnAction()
                    begin
                        Procurement.ActivateEvaluationsIFP(Rec);
                    end;
                }
                action("Close IFP")
                {
                    ApplicationArea = Suite;
                    Caption = 'Close IFP';
                    Enabled = Rec."code" <> '';
                    Image = Close;
                    Visible = Rec.status = Rec.status::Released;
                    ToolTip = 'Executes the Close IFP action.';
                    trigger OnAction()
                    begin
                        Procurement.CloseIFP(Rec);
                    end;
                }
                action("Cancel IFP")
                {
                    ApplicationArea = Suite;
                    Image = CancelAllLines;
                    Visible = Rec.status = Rec.status::Released;
                    ToolTip = 'Executes the Cancel IFP action.';
                    trigger OnAction()
                    begin
                        Procurement.CancelIFP(Rec);
                    end;
                }
                action("IFP Response")
                {
                    ApplicationArea = Basic;
                    Caption = 'IFP Response';
                    Image = ReturnRelated;
                    RunObject = Page "RFI Response List";
                    RunPageLink = "RFI Document No." = field(Code);
                    ToolTip = 'Executes the IFP Response action.';
                }
                action("IFP Evaluations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the IFP Evaluations action.';
                }
                action("Filed Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    RunObject = Page "RFI Response Filed Document";
                    RunPageLink = "Document No" = field(Code);
                    ToolTip = 'Executes the Filed Documents action.';
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
                        //if //ApprovalsMgmt.CheckIFPApprovalPossible(Rec) then
                        //ApprovalsMgmt.OnSendIFPForApproval(Rec);

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
                        //ApprovalsMgmt.OnCancelIFPApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action("Activity Schedules")
                {
                    ApplicationArea = Basic;
                    Image = ElectronicRegister;
                    RunObject = Page "RFI Bid Schedule";
                    RunPageLink = "Document No" = field(Code);
                    ToolTip = 'Executes the Activity Schedules action.';
                }
                action("RFI Responsibility Centers")
                {
                    ApplicationArea = Basic;
                    Image = Segment;
                    RunObject = Page "RFI Responsibility Center";
                    RunPageLink = "Document No" = field(Code);
                    ToolTip = 'Executes the RFI Responsibility Centers action.';
                }
                action("Preference & Reservation")
                {
                    ApplicationArea = Basic;
                    Image = Reserve;
                    RunObject = Page "RFI Restricted Vendor Category";
                    RunPageLink = "Document No" = field(Code);
                    ToolTip = 'Executes the Preference & Reservation action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(CopyDocument_Promoted; CopyDocument)
                {
                }
                actionref("Suggest Procurement Categories_Promoted"; "Suggest Procurement Categories")
                {
                }
                actionref("Suggest Required Documents_Promoted"; "Suggest Required Documents")
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
                actionref("IFP Response_Promoted"; "IFP Response")
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref("Filed Documents_Promoted"; "Filed Documents")
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
                actionref(Publish_Promoted; Publish)
                {
                }
                actionref("Activate Evaluations_Promoted"; "Activate Evaluations")
                {
                }
                actionref("Close IFP_Promoted"; "Close IFP")
                {
                }
                actionref("Cancel IFP_Promoted"; "Cancel IFP")
                {
                }
            }
            group(Category_Category8)
            {
                actionref("Activity Schedules_Promoted"; "Activity Schedules")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("RFI Responsibility Centers_Promoted"; "RFI Responsibility Centers")
                {
                }
                actionref("Preference & Reservation_Promoted"; "Preference & Reservation")
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
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.Page.LoadDataFromRecord(Rec);
        CurrPage.ApprovalFactBox.Page.UpdateApprovalEntriesFromSourceRecord(Rec.RecordId);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Invitation For Prequalification";
        Rec."Document Date" := Today;
    end;

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

    local procedure SetControlAppearance()
    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin



        // OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        // OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        // CanCancelApprovalForRecord :=  //ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}

#pragma implicitwith restore

