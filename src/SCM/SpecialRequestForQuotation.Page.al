Page 75439 "Special Request For Quotation"
{
    Caption = 'Request For Quotation (RFQ) Card';
    DeleteAllowed = false;
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
                    Caption = 'IFS No.';
                    Importance = Promoted;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("External Document No"; "External Document No")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ No.';
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("PRN No."; "PRN No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice Type"; "Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Special RFQ"; "Special RFQ")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
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
                    Caption = 'RFQ Submission End Date';
                }
                field("Submission End Time"; "Submission End Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Submission End Time';
                }
                field("Bid Opening Date"; "Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Opening Date';
                }
                field("Bid Opening Time"; "Bid Opening Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Opening Time';
                }
                field("Bid Selection Method"; "Bid Selection Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Requisition Product Group"; "Requisition Product Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Category ID"; "Procurement Category ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Has an Email Attachment ?"; "Has an Email Attachment ?")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; "Solicitation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Method"; "Procurement Method")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Sealed Bids"; "Sealed Bids")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validity Duration"; "Tender Validity Duration")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Validity Duration';
                }
                field("Tender Validity Expiry Date"; "Tender Validity Expiry Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Validity Expiry Date';
                }
                field("Purchaser Code"; "Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Procurement Officer';
                }
                field("Supplier Type"; "Supplier Type")
                {
                    ApplicationArea = Basic;
                }
                field("Language Code"; "Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Mandatory Special Group Reserv"; "Mandatory Special Group Reserv")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Submission Method"; "Bid Submission Method")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Template"; "Bid Scoring Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Evaluation Criteria';
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field(Published; Published)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Date/Time Published"; "Date/Time Published")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                    Importance = Additional;
                }
                field("No. of Submission"; "No. of Submission")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
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
                field("Bid Opening Committe"; "Bid Opening Committe")
                {
                    ApplicationArea = Basic;
                }
                field("Resason To Reopen"; "Resason To Reopen")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason To Reopen';
                }
                field("Preliminary Evaluation"; "Preliminary Evaluation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Other Preliminary Examination';
                    MultiLine = true;
                }
            }
            part("Description of Items & Services Requested"; "IFS Purchase Lines")
            {
                Caption = 'Description of Items & Services Requested';
                SubPageLink = "Standard Purchase Code" = field(Code);
                ApplicationArea = All;
            }
            part(Control31; "IFS Intention To Bid")
            {
                Caption = 'Invited Bidders';
                Editable = Recorec;
                SubPageLink = Code = field(Code),
                              Category = field("Procurement Category ID");
                ApplicationArea = All;
            }
            group("Budget Control Checks")
            {
                Editable = Recorec;
                field("Responsibility Center"; "Responsibility Center")
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
                    Caption = 'Budget No';
                }
                field("Job Task No."; "Job Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Vote No';
                }
                field("PP Preference/Reservation Code"; "PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("PP Planning Category"; "PP Planning Category")
                {
                    ApplicationArea = Basic;
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
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Project Details")
            {
                Editable = Recorec;
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Works Category"; "Works Category")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control116; "Approval FactBox")
            {
                SubPageLink = "Table ID" = filter(173),
                              "Document No." = field(Code);
                Visible = true;
                ApplicationArea = All;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
                ApplicationArea = All;
            }
            systempart(Control113; Links)
            {
                Visible = false;
                ApplicationArea = All;
            }
            systempart(Control112; Notes)
            {
                Visible = true;
                ApplicationArea = All;
            }
            systempart(Control108; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control109; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control110; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control111; Links)
            {
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

                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "No." = field(Code);
                    ToolTip = 'View or add comments for the record.';
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Visible = true;

                    trigger OnAction()
                    begin

                        //DMSManagement.UploadRFQNDocuments(Code,'Request for Quotation',RECORDID,"Global Dimension 1 Code");
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
                action("Suggest Tender Documents")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Required Documents';
                    Ellipsis = true;
                    Enabled = "Code" <> '';
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
                        Procurement.SuggestPrequalifiedSuppliers(Rec);

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
                action("Close RFQ")
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
                action("Re-Tender Invitation")
                {
                    ApplicationArea = Suite;
                    Image = Replan;
                    Visible = status = status::Released;

                    trigger OnAction()
                    begin
                        //Procurement.CancelIFSInvitation(Rec);
                        //TESTFIELD("Document Status","Document Status"::Evaluation);
                        if Confirm('Are yOu sure you want to Initiate for Repeat of the process ?', true) then begin
                            "Document Status" := "document status"::"Re-Tendered";
                            "Retendered By" := UserId;
                            "Retendered On" := CurrentDatetime;
                            Message('Successfully Initiated');
                            PurchaHeader.Reset;
                            PurchaHeader.SetRange("No.", "PRN No.");
                            if PurchaHeader.FindFirst then begin
                                Procurement.CreateInvitationNoticeRetender(PurchaHeader);
                            end;
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
                action("RFQ Respones")
                {
                    ApplicationArea = Basic;
                    Caption = 'RFQ Responses';
                    Image = ReturnRelated;
                    RunObject = Page "Bid Response List";
                    RunPageLink = "Invitation For Supply No" = field(Code),
                                  "Document Type" = const(Quote);
                    Visible = true;
                }
                action("IFP Evaluations")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                action("Preview RFQ")
                {
                    ApplicationArea = Basic;
                    Image = PrintVoucher;

                    trigger OnAction()
                    var
                        // rfqreport: Report RFQ;
                        Supplierrec: Record "Standard Vendor Purchase Code";
                    begin
                        if Status = Status::Released then begin
                            StandardVendor.Reset;
                            StandardVendor.SetRange(Code, Code);
                            Report.Run(70140, true, true, StandardVendor);
                        end else begin
                            StandardVendor.Reset;
                            StandardVendor.SetRange(Code, Code);
                            Report.Run(70150, true, true, StandardVendor);
                        end;


                        // 51511025
                        /*Supplierrec.RESET;
                        Supplierrec.SETRANGE(Supplierrec."IFS Code",Code);
                         IF Supplierrec.FINDSET THEN BEGIN
                           rfqreport.SETTABLEVIEW(Supplierrec);
                           rfqreport.RUN;
                         END;*/
                        // RESET;
                        // SETRANGE(Code,Code);
                        // REPORT.RUN(70062,TRUE,TRUE,Rec);

                    end;
                }
                action("Preview Single RFQ")
                {
                    ApplicationArea = Basic;
                    Image = PrintVoucher;
                    Visible = false;

                    trigger OnAction()
                    var
                        //rfqreport: Report RFQ;
                        Supplierrec: Record "Standard Vendor Purchase Code";
                    begin
                        //IF Status=Status::Released THEN BEGIN
                        // StandardVendor.RESET;
                        // StandardVendor.set(Code,'=%1','');
                        // REPORT.RUN(70100,TRUE,TRUE,Rec);
                        //END;
                        // 51511025
                        /*Supplierrec.RESET;
                        Supplierrec.SETRANGE(Supplierrec."IFS Code",Code);
                         IF Supplierrec.FINDSET THEN BEGIN
                           rfqreport.SETTABLEVIEW(Supplierrec);
                           rfqreport.RUN;
                         END;*/
                        Reset;
                        SetRange(Code, Code);
                        Report.Run(70100, true, true, Rec);

                    end;
                }
                action("Preview New RFQ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print RFQ';
                    Image = PrintVoucher;
                    Visible = false;

                    trigger OnAction()
                    var
                        //   rfqreport: Report RFQ;
                        Supplierrec: Record "Standard Vendor Purchase Code";
                    begin
                        StandardVendor.Reset;
                        StandardVendor.SetRange(Code, Code);
                        Report.Run(70140, true, true, StandardVendor);
                        // 51511025
                        /*Supplierrec.RESET;
                        Supplierrec.SETRANGE(Supplierrec."IFS Code",Code);
                         IF Supplierrec.FINDSET THEN BEGIN
                           rfqreport.SETTABLEVIEW(Supplierrec);
                           rfqreport.RUN;
                         END;*/
                        // RESET;
                        // SETRANGE(Code,Code);
                        // REPORT.RUN(70062,TRUE,TRUE,Rec);

                    end;
                }
                action("Create Addendum Notice")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Addendum Notice';
                    Ellipsis = true;
                    Enabled = "code" <> '';
                    Image = CreateForm;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        Procurement.CreateAddendumNoticeITT(Rec);
                    end;
                }
                action("Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    RunObject = Page "IFS Required Document";
                    RunPageLink = "Document No" = field(Code);
                }
                action("Send RFQ")
                {
                    ApplicationArea = Basic;
                    Image = SendMail;

                    trigger OnAction()
                    begin
                        if "RFQ Sent" = true then begin
                            if Confirm('Are you sure You want to resend again this RFQ?', true) then begin
                                TestField(Status, Status::Released);
                                Procurement.FnSendSpecialRFQInvitation(Rec, Vendor);
                                "RFQ Sent" := true;
                                "RFQ Sent By" := UserId;
                                "RFQ Sent On" := CurrentDatetime;
                                Modify(true);
                            end;
                        end else begin
                            TestField(Status, Status::Released);
                            Procurement.FnSendSpecialRFQInvitation(Rec, Vendor);
                            "RFQ Sent" := true;
                            "RFQ Sent By" := UserId;
                            "RFQ Sent On" := CurrentDatetime;
                            Modify(true);
                        end;
                    end;
                }
                action("Tender Securities")
                {
                    ApplicationArea = Basic;
                    Image = SocialSecurity;
                    RunObject = Page "IFS Securities";
                    RunPageLink = "IFS Code" = field(Code);
                    Visible = false;
                }
                action("Tender Document Sources")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    RunObject = Page "IFS Tender Document Source";
                    RunPageLink = "Tender Source ID" = field(Code);
                    Visible = false;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
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
                        Commit;
                        ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                actionref("Preview Single RFQ_Promoted"; "Preview Single RFQ")
                {
                }
                actionref("Preview New RFQ_Promoted"; "Preview New RFQ")
                {
                }
                actionref(AttachDocuments_Promoted; AttachDocuments)
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
                actionref("Prequalified Suppliers_Promoted"; "Prequalified Suppliers")
                {
                }
                actionref("RFQ Respones_Promoted"; "RFQ Respones")
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
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
                actionref(Approvals_Promoted; Approvals)
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
        Corec := true;
        if (Status = Status::Released) then begin
            Corec := false;
        end;
        Recorec := true;
        if (Status = Status::Released) or (Status = Status::"Pending Approval") then begin
            Recorec := false;
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Procurement Method" := "procurement method"::RFQ;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Procurement Method" := "procurement method"::RFQ;
    end;

    trigger OnOpenPage()
    begin
        Corec := true;
        if (Status = Status::Released) then begin
            Corec := false;
        end;
        Recorec := true;
        if (Status = Status::Released) or (Status = Status::"Pending Approval") then begin
            Recorec := false;
        end;
        if "Invitation Notice Type" = "invitation notice type"::"Special RFQ" then begin
            "Special RFQ" := true;
            Modify(true);
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
        Vendor: Record Vendor;

        StandardVendor: Record "Standard Vendor Purchase Code";
        Corec: Boolean;
        Recorec: Boolean;
        PurchaHeader: Record "Purchase Header";

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

