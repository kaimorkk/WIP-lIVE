Page 75078 "Invitation To Tender"
{
    PageType = Document;
    SourceTable = "Standard Purchase Code";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Invitation Notice Type"; "Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Summary"; "Tender Summary")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; "External Document No")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Stage 1 EOI Invitation"; "Stage 1 EOI Invitation")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                }
                field("PRN No."; "PRN No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                // field("Responsibility Center"; "Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Type"; "Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Product Group"; "Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category ID"; "Procurement Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lot No."; "Lot No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Target Bidder Group"; "Target Bidder Group")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; "Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Selection Method"; "Bid Selection Method")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Template ID"; "Requisition Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Bid Scoring Template"; "Bid Scoring Template")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Committe"; "Bid Opening Committe")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Bid Evaluation Committe"; "Bid Evaluation Committe")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Method"; "Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Enforce Mandatory Pre-bid Visi"; "Enforce Mandatory Pre-bid Visi")
                {
                    ApplicationArea = Basic;
                }
                field("Mandatory Pre-bid Visit Date"; "Mandatory Pre-bid Visit Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prebid Meeting Address"; "Prebid Meeting Address")
                {
                    ApplicationArea = Basic;
                }
                field("Prebid Meeting Register ID"; "Prebid Meeting Register ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Bid Envelop Type"; "Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Sealed Bids"; "Sealed Bids")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validity Duration"; "Tender Validity Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validity Expiry Date"; "Tender Validity Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code"; "Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Officer';
                }
                field("Language Code"; "Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Mandatory Special Group Reserv"; "Mandatory Special Group Reserv")
                {
                    ApplicationArea = Basic;
                }
                field("Bid/Tender Security Required"; "Bid/Tender Security Required")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Bid Security %"; "Bid Security %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Bid Security Amount (LCY)"; "Bid Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                }
                field("Bid Security Validity Duration"; "Bid Security Validity Duration")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Bid Security Expiry Date"; "Bid Security Expiry Date")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Insurance Cover Required"; "Insurance Cover Required")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Performance Security Required"; "Performance Security Required")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Performance Security %"; "Performance Security %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Advance Payment Security Req"; "Advance Payment Security Req")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Advance Payment Security %"; "Advance Payment Security %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Advance Amount Limit %"; "Advance Amount Limit %")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Appointer of Bid Arbitrator"; "Appointer of Bid Arbitrator")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = All;
                    editable = false;
                    ToolTip = 'Specifies the value of the Published field.', Comment = '%';
                }
                field("Bid Submission Method"; "Bid Submission Method")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Cancel Reason Code"; "Cancel Reason Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Cancellation Date"; "Cancellation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Cancellation Secret Code"; "Cancellation Secret Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submission"; "No. of Submission")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                }
                field("Created Date/Time"; "Created Date/Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created by"; "Created by")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            group("Submission Details")
            {
                field("Submission Start Date"; "Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Time"; "Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Date"; "Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Time"; "Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date"; "Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Time"; "Bid Opening Time")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Venue"; "Bid Opening Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Procuring Entity Name/Contact"; "Procuring Entity Name/Contact")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Box Location Code"; "Tender Box Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Tender Submission"; "Primary Tender Submission")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Engineer Contact"; "Primary Engineer Contact")
                {
                    ApplicationArea = Basic;
                }
            }
            // group("Bid Processing Fee")
            // {
            //     field("Bid Charge Code"; "Bid Charge Code")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Bid Charge (LCY)"; "Bid Charge (LCY)")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Bid Charge Bank Code"; "Bid Charge Bank Code")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Bank Name"; "Bank Name")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Bank Account Name"; "Bank Account Name")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Bid Charge Bank Branch"; "Bid Charge Bank Branch")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Bid Charge Bank A/C No"; "Bid Charge Bank A/C No")
            //     {
            //         ApplicationArea = Basic;
            //     }
            // }
            group("Budget Control Checks")
            {
                field("Requesting Region"; "Requesting Region")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Directorate"; "Requesting Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Department"; "Requesting Department")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan ID"; "Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No"; "Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Job)
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Job No.';
                }
                field("Job Task No."; "Job Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'PP Job Task No.';
                }
                field("PP Planning Category"; "PP Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = All;
                    editable = false;
                    ToolTip = 'Specifies the value of the Document Status field.', Comment = '%';
                }
                field("PP Funding Source ID"; "PP Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Budget"; "PP Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Actual Costs"; "PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Commitments"; "PP Total Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Available Budget"; "PP Total Available Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Preference/Reservation Code"; "PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
            }
            // group("Project Details")
            // {
            //     field("Works Category"; "Works Category")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Project ID"; "Project ID")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Publish Engineers Estimate"; "Publish Engineers Estimate")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Engineer Estimate (LCY)"; "Engineer Estimate (LCY)")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Max Works Kickoff Duration"; "Max Works Kickoff Duration")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Max Works Charter Duration"; "Max Works Charter Duration")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Max Works Completion Duration"; "Max Works Completion Duration")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Payment Terms Code"; "Payment Terms Code")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Daily Liquidated Dam Unit Cost"; "Daily Liquidated Dam Unit Cost")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Liquidated Damages Limit %"; "Liquidated Damages Limit %")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Payment Retention %"; "Payment Retention %")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Retention Amount Limit %"; "Retention Amount Limit %")
            //     {
            //         ApplicationArea = Basic;
            //     }
            // }
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
                    Enabled = "Code" <> '';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        ShowDocDim;
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
                action(Print)
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
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy PRN Details';
                    Ellipsis = true;
                    Enabled = "code" <> '';
                    Image = CopyDocument;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        PRN.Reset;
                        PRN.SetRange("No.", "PRN No.");
                        if PRN.FindSet then
                            Procurement.CopyPRNDetails(PRN, Rec);

                    end;
                }
                action("Purchase Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Lines';
                    Ellipsis = true;
                    Enabled = "Code" <> '';
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
                    Enabled = "Code" <> '';
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestRequiredDocITT(Rec);

                    end;
                }
                action("Suggest Tender Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Tender Documents';
                    Ellipsis = true;
                    Enabled = "Code" <> '';
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        /*CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;*/
                        Procurement.SuggestTenderSourceDoc(Rec);

                    end;
                }

                action("Publish Invitations")
                {
                    ApplicationArea = Basic;
                    Enabled = Published = false;
                    Image = PrintCover;
                    Visible = status = status::Released;

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
                    Enabled = Published = true;
                    Image = ActivateDiscounts;
                    Visible = status = status::Released;

                    trigger OnAction()
                    begin
                        //Procurement.ActivateEvaluationsIFP(Rec);
                    end;
                }
                action("Close IFP")
                {
                    ApplicationArea = Suite;
                    Caption = 'Close IFP';
                    Enabled = "code" <> '';
                    Image = Close;
                    Visible = status = status::Released;

                    trigger OnAction()
                    begin
                        //Procurement.CloseIFP(Rec);
                    end;
                }
                action("Cancel Invitation")
                {
                    ApplicationArea = Suite;
                    Image = CancelAllLines;
                    Visible = status = status::Released;

                    trigger OnAction()
                    begin
                        Procurement.CancelIFSInvitation(Rec);
                    end;
                }
                action("IFP Response")
                {
                    ApplicationArea = Basic;
                    Caption = 'IFP Response';
                    Image = ReturnRelated;
                    RunObject = Page "RFI Response List";
                    RunPageLink = "RFI Document No." = field(Code);
                    Visible = false;
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
                }
                action("Create Addendum Notice")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Addendum Notice';
                    Ellipsis = true;
                    Enabled = "code" <> '';
                    Image = CreateForm;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        Procurement.CreateAddendumNoticeITT(Rec);
                    end;
                }
                action(Send)
                {
                    ApplicationArea = Basic;
                    Image = SendMail;
                }
                action("Tender Securities")
                {
                    ApplicationArea = Basic;
                    Image = SocialSecurity;
                    RunObject = Page "IFS Securities";
                    RunPageLink = "IFS Code" = field(Code);
                }
                action("Tender Document Sources")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    RunObject = Page "IFS Tender Document Source";
                    RunPageLink = "Document No." = field(Code);
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
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                    end;
                }
                action("Activity Schedules")
                {
                    ApplicationArea = Basic;
                    Image = ElectronicRegister;
                    RunObject = Page "IFS Purchase Activity Schedule";
                    RunPageLink = "Document No" = field(Code);
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
                }
                action("Equipment Specifications")
                {
                    ApplicationArea = Basic;
                    Image = LiFo;
                    RunObject = Page "IFS Required Equipment";
                    RunPageLink = "Document No" = field(Code);
                }
                action("Major Deliverables")
                {
                    ApplicationArea = Basic;
                    Image = Delivery;
                    RunObject = Page "IFS Major Work_Deliverable";
                    RunPageLink = "Document No" = field(Code);
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
                actionref("Create Addendum Notice_Promoted"; "Create Addendum Notice")
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
                Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 3.';

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
                actionref("Intention To Bid_Promoted"; "Intention To Bid")
                {
                }
                actionref("Required Documents_Promoted"; "Required Documents")
                {
                }
                actionref(Send_Promoted; Send)
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

                actionref("Publish Invitations_Promoted"; "Publish Invitations")
                {
                }
                actionref("Activate Evaluations_Promoted"; "Activate Evaluations")
                {
                }
                actionref("Close IFP_Promoted"; "Close IFP")
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
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
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

    trigger OnAfterGetRecord()
    begin
        corec := false;
        if Published = true then begin
            corec := true;
        end;
        corec1 := false;
        if Status = Status::Released then begin
            corec1 := true;
        end;
    end;

    trigger OnOpenPage()
    begin
        corec := false;
        if Published = true then begin
            corec := true;
        end;
        corec1 := false;
        if Status = Status::Released then begin
            corec1 := true;
        end;
        if Status = Status::"Pending Approval" then begin
            CurrPage.Editable := false;
        end;
        if Status = Status::Released then begin
            CurrPage.Editable := false;
        end;
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
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PRN: Record "Purchase Header";

        corec: Boolean;
        corec1: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin



        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}

