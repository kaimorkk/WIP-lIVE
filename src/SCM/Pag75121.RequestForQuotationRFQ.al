

page 75121 "Request For Quotation (RFQ)"
{
    Caption = 'Request For Quotation (RFQ) Card';
    PageType = Document;
    SourceTable = "Standard Purchase Code";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ No.';
                    Importance = Promoted;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("PRN No."; Rec."PRN No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                // field("Responsibility Center"; Rec."Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Date"; Rec."Submission End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Submission End Date';
                }
                field("Submission End Time"; Rec."Submission End Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Submission End Time';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Opening Date';
                }
                field("Bid Opening Time"; Rec."Bid Opening Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Opening Time';
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category ID"; Rec."Procurement Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Target Bidder Group"; Rec."Target Bidder Group")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Submission Method"; Rec."Bid Submission Method")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Sealed Bids"; Rec."Sealed Bids")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validity Duration"; Rec."Tender Validity Duration")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Validity Duration';
                }
                field("Tender Validity Expiry Date"; Rec."Tender Validity Expiry Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Validity Expiry Date';
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supply chain officer Code';
                }
                field("Purchaser Name"; Rec."Purchaser Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                }
                // field("Language Code"; Rec."Language Code")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Mandatory Special Group Reserv"; Rec."Mandatory Special Group Reserv")
                {
                    ApplicationArea = Basic;
                }
                field("Appointer of Bid Arbitrator"; Rec."Appointer of Bid Arbitrator")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appointer of RFQ Arbitrator';
                    Importance = Additional;
                }
                field("Bid Scoring Template"; Rec."Bid Scoring Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bid Evaluation Template';
                }
                field("Bid Opening Committe"; Rec."Bid Opening Committe")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Opening Committe';
                }
                field("Bid Evaluation Committe"; Rec."Bid Evaluation Committe")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Evaluation Committe';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Date/Time Published"; Rec."Date/Time Published")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                    Importance = Additional;
                }
                field("No. of Submission"; Rec."No. of Submission")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            part("Description of Items & Services Requested"; "IFS Purchase Lines")
            {
                Caption = 'Description of Items & Services Requested';
                SubPageLink = "Standard Purchase Code" = field(Code);
                ApplicationArea = Basic;
            }
            part(Control31; "IFS Intention To Bid")
            {
                Caption = 'Invited Bidders';
                // Editable = Recorec;
                SubPageLink = Code = field(Code),
                              Category = field("Procurement Category ID");
                ApplicationArea = All;
            }
            group("Budget Control Checks")
            {
                // field("Requesting Region"; Rec."Requesting Region")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Requesting Directorate"; Rec."Requesting Directorate")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Requesting Department"; Rec."Requesting Department")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                // field(Job; Rec.Job)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'PP Job No.';
                // }
                // field("Job Task No."; Rec."Job Task No.")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'PP Job Task No.';
                // }
                field("PP Planning Category"; Rec."PP Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("PP Funding Source ID"; Rec."PP Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Budget"; Rec."PP Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Actual Costs"; Rec."PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Commitments"; Rec."PP Total Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Available Budget"; Rec."PP Total Available Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Preference/Reservation Code"; Rec."PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                    Caption = 'Geographical Location';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                    Caption = 'Admin Unit';
                }
            }

        }
        area(factboxes)
        {
            // part("Attached Documents"; "Document Attachments")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     SubPageLink = "Table ID" = filter(173),
            //                   "No." = field(Code);
            // }
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
            systempart(Control11; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Notes;
            }
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control6; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control3; Links)
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
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
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
                action("Preview RFQ")
                {
                    ApplicationArea = Basic;
                    Image = PrintVoucher;

                    trigger OnAction()
                    var
                        //   rfqreport: Report RFQ;
                        Supplierrec: Record "Standard Vendor Purchase Code";
                        StandardVendor: Record "Standard Vendor Purchase Code";
                    begin

                        StandardVendor.Reset;
                        StandardVendor.SetRange(Code, Rec.Code);
                        Report.Run(70068, true, true, StandardVendor);

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
                        ApprovalsMgmt.ApproveRecordApprovalRequest(rec.RecordId);
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
            group(ActionGroup135)
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
                        //   ReleasePurchDoc.ReleaseITT(Rec);
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
                        //  ReleasePurchDoc.ReopenITT(Rec);
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
                    Caption = 'Copy PRN Details';
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
                        PRN.Reset;
                        PRN.SetRange("No.", Rec."PRN No.");
                        if PRN.FindSet then
                            Procurement.CopyPRNDetails(PRN, Rec);

                    end;
                }
                action("Purchase Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Lines';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = PutawayLines;
                    RunObject = Page "IFS Purchase Lines";
                    RunPageLink = "Standard Purchase Code" = field(Code);

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        //Procurement.SuggestProcurementCategories(Rec);

                    end;
                }
                action("Suggest Required Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestRequiredDocITT(Rec);

                    end;
                }
                action("Re-Tender Invitation")
                {
                    ApplicationArea = Suite;
                    Image = Replan;

                    trigger OnAction()
                    var
                        PurchaHeader: Record "Purchase Header";
                    begin
                        //Procurement.CancelIFSInvitation(Rec);
                        //TESTFIELD("Document Status","Document Status"::Evaluation);
                        if Confirm('Are yOu sure you want to Initiate for Repeat of the process ?', true) then begin
                            Rec."Document Status" := Rec."document status"::"Re-Tendered";
                            Rec."Retendered By" := UserId;
                            Rec."Retendered On" := CurrentDatetime;
                            Message('Successfully Initiated');
                            PurchaHeader.Reset;
                            PurchaHeader.SetRange("No.", Rec."PRN No.");
                            // PurchaHeader.SetRange(Status, PurchaHeader.Status::Released);
                            if PurchaHeader.FindFirst then
                                Procurement.CreateInvitationNoticeRetender(PurchaHeader);
                            // end else
                            //     Error('Purchase Requisition must be approved');
                        end;
                    end;
                }
                action("Prequalified Suppliers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invited Bidders';
                    Image = ReturnRelated;
                    RunObject = Page "IFS Intention To Bid";
                    RunPageLink = Code = field(Code),
                                  Category = field("Procurement Category ID");
                    Visible = true;
                }
                action("Suggest Tender Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = Rec."Code" <> '';
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestTenderSourceDoc(Rec);

                    end;
                }
                action("Suggest Prequalified Suppliers")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Prequalified Suppliers';
                    Ellipsis = true;
                    //  Enabled = Rec."Code" <> '';
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestPrequalifiedSuppliers(Rec);

                    end;
                }
                action("Publish Invitations")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Published = false;
                    Image = PrintCover;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        Procurement.PublishITT(Rec);
                    end;
                }
                action("Intention To Bid")
                {
                    ApplicationArea = Basic;
                    Image = Interaction;
                    RunObject = Page "IFS Intention To Bid";
                    RunPageLink = Code = field(Code);
                }
                action("Activate Evaluations")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Published = true;
                    Image = ActivateDiscounts;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        //Procurement.ActivateEvaluationsIFP(Rec);
                    end;
                }
                action("Close RFQ")
                {
                    ApplicationArea = Suite;
                    Caption = 'Close IFP';
                    Enabled = Rec."code" <> '';
                    Image = Close;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        //Procurement.CloseIFP(Rec);
                    end;
                }
                action("Cancel Invitation")
                {
                    ApplicationArea = Suite;
                    Image = CancelAllLines;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        Procurement.CancelIFSInvitation(Rec);
                    end;
                }
                action("RFQ Responses")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Responses';
                    Image = ReturnRelated;
                    RunObject = Page "Purchase Quotes";
                    RunPageLink = "Linked IFS No." = field(Code),
                                  "Document Type" = const(Quote);
                }
                action("IFP Evaluations")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                action("Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    RunObject = Page "IFS Required Document";
                    RunPageLink = "Document No" = field(Code);
                    Visible = true;
                }
                action("Create Addendum Notice")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Addendum Notice';
                    Ellipsis = true;
                    Enabled = Rec."code" <> '';
                    Image = CreateForm;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = true;

                    trigger OnAction()
                    begin
                        Procurement.CreateAddendumNoticeITT(Rec);
                    end;
                }
                action("Send RFQ")
                {
                    ApplicationArea = Basic;
                    Image = SendMail;

                    trigger OnAction()
                    begin
                        Procurement.FnSendRFQInvitation(Rec);
                    end;
                }
                action("Tender Securities")
                {
                    ApplicationArea = Basic;
                    Image = SocialSecurity;
                    RunObject = Page "IFS Securities";
                    RunPageLink = "IFS Code" = field(Code);
                    Visible = true;
                }
                action("Tender Document Sources")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    RunObject = Page "IFS Tender Document Source";
                    RunPageLink = "Document No." = field(Code);
                    Visible = true;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    //Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";

                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        if not Confirm('Do you want to send this Doc for approvals?') then exit;

                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    // Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        if not Confirm('Do you want to Cancell this Approval?') then exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action("Activity Schedules")
                {
                    ApplicationArea = Basic;
                    Image = ElectronicRegister;
                    RunObject = Page "RFI Bid Schedule";
                    RunPageLink = "Document No" = field(Code);
                    Visible = false;
                }
                action("RFI Responsibility Centers")
                {
                    ApplicationArea = Basic;
                    Image = Segment;
                    RunObject = Page "RFI Responsibility Center";
                    RunPageLink = "Document No" = field(Code);
                    Visible = false;
                }
                action("Preference and Reservations")
                {
                    ApplicationArea = Basic;
                    Image = Reserve;
                    RunObject = Page "IFS Restricted Vendor Category";
                    RunPageLink = "Document No" = field(Code);
                }
                action("Addendum Notices")
                {
                    ApplicationArea = Basic;
                    Image = Change;
                    RunObject = Page "Tender Addendum Notice";
                    RunPageLink = "Invitation Notice No." = field(Code);
                    Visible = false;
                }
                action("Appointed Committees")
                {
                    ApplicationArea = Basic;
                    Image = Agreement;
                    RunObject = Page "IFS Tender Committee";
                    RunPageLink = "IFS Code" = field(Code);
                }
                action("Personnel Specifications")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    RunObject = Page "IFS Key Staff";
                    RunPageLink = "IFS Code" = field(Code);
                    Visible = false;
                }
                action("Equipment Specifications")
                {
                    ApplicationArea = Basic;
                    Image = LiFo;
                    RunObject = Page "IFS Required Equipment";
                    RunPageLink = "Document No" = field(Code);
                    Visible = false;
                }
                action("Major Deliverables")
                {
                    ApplicationArea = Basic;
                    Image = Delivery;
                    RunObject = Page "IFS Major Work_Deliverable";
                    RunPageLink = "Document No" = field(Code);
                    Visible = false;
                }
                action("Related Invitation Notices")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Parent Invitation No" = field(Code);
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Re-Tender Invitation_Promoted"; "Re-Tender Invitation")
                {
                }
                actionref("Preview RFQ_Promoted"; "Preview RFQ")
                {
                }
                actionref(CopyDocument_Promoted; CopyDocument)
                {
                }
                actionref("Purchase Lines_Promoted"; "Purchase Lines")
                {
                }
                actionref("Suggest Required Documents_Promoted"; "Suggest Required Documents")
                {
                }
                actionref("Suggest Tender Documents_Promoted"; "Suggest Tender Documents")
                {
                }
                actionref("Suggest Prequalified Suppliers_Promoted"; "Suggest Prequalified Suppliers")
                {
                }
                actionref("Create Addendum Notice_Promoted"; "Create Addendum Notice")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref("Prequalified Suppliers_Promoted"; "Prequalified Suppliers")
                {
                }
                actionref("RFQ Responses_Promoted"; "RFQ Responses")
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref("Intention To Bid_Promoted"; "Intention To Bid")
                {
                }
                actionref("Required Documents_Promoted"; "Required Documents")
                {
                }
                actionref("Send RFQ_Promoted"; "Send RFQ")
                {
                }
                actionref("Tender Securities_Promoted"; "Tender Securities")
                {
                }
                actionref("Tender Document Sources_Promoted"; "Tender Document Sources")
                {
                }
                actionref("Preference and Reservations_Promoted"; "Preference and Reservations")
                {
                }
                actionref("Addendum Notices_Promoted"; "Addendum Notices")
                {
                }
                actionref("Appointed Committees_Promoted"; "Appointed Committees")
                {
                }
                actionref("Personnel Specifications_Promoted"; "Personnel Specifications")
                {
                }
                actionref("Equipment Specifications_Promoted"; "Equipment Specifications")
                {
                }
                actionref("Major Deliverables_Promoted"; "Major Deliverables")
                {
                }
                actionref("Related Invitation Notices_Promoted"; "Related Invitation Notices")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Release', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref("Publish Invitations_Promoted"; "Publish Invitations")
                {
                }
                actionref("Activate Evaluations_Promoted"; "Activate Evaluations")
                {
                }
                actionref("Close RFQ_Promoted"; "Close RFQ")
                {
                }
                actionref("Cancel Invitation_Promoted"; "Cancel Invitation")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Posting', Comment = 'Generated from the PromotedActionCategories property index 5.';
            }
            group(Category_Category7)
            {
                Caption = 'Prepare', Comment = 'Generated from the PromotedActionCategories property index 6.';
            }
            group(Category_Category8)
            {
                Caption = 'Order', Comment = 'Generated from the PromotedActionCategories property index 7.';

                actionref("Activity Schedules_Promoted"; "Activity Schedules")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("RFI Responsibility Centers_Promoted"; "RFI Responsibility Centers")
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
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 8.';

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
            group(Category_Category10)
            {
                Caption = 'Print/Send', Comment = 'Generated from the PromotedActionCategories property index 9.';
            }
            group(Category_Category11)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 10.';
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

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin



        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(rec.RecordId);
        // CanCancelApprovalForRecord :=  //ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}

#pragma implicitwith restore

