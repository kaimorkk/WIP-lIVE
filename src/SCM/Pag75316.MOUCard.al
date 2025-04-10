

page 75316 "MOU Card"
{
    PageType = Card;
    SourceTable = "Purchase Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Contract Description"; Rec."Contract Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'MOU Description';
                    ToolTip = 'Specifies the value of the MOU Description field.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Start Date field.';
                }
                field("Contract Duration"; Rec."Contract Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Duration field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Party Description"; Rec."Party Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Party Description field.';
                }
                field("Vendor Description"; Rec."Vendor Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Party Name';
                    ToolTip = 'Specifies the value of the Party Name field.';
                }
                field("Vendor Party"; Rec."Vendor Party")
                {
                    ApplicationArea = Basic;
                    Caption = 'Party Designation';
                    ToolTip = 'Specifies the value of the Party Designation field.';
                }
                field("Company Head"; Rec."Company Head")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Head field.';
                }
                field("Mou Description"; Rec."Mou Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mou Description field.';
                }
                field("Scope of Service"; Rec."Scope of Service")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Scope of Service field.';
                }
                field("Scope Description"; Rec."Scope Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Scope of Service';
                    ToolTip = 'Specifies the value of the Scope of Service field.';
                }
                field("Notice of Award No."; Rec."Notice of Award No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Notice of Award No. field.';
                }
                field("Awarded Bid No"; Rec."Awarded Bid No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Awarded Bid No field.';
                }
                field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Tender Sum Inc Taxes (LCY) field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Area Space"; Rec."Area Space")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Area Space field.';
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Status field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field("Governing Laws"; Rec."Governing Laws")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Governing Laws field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Status field.';
                }
                field("Procuring Entity (PE) Name"; Rec."Procuring Entity (PE) Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procuring Entity (PE) Name field.';
                }
                field("PE Representative"; Rec."PE Representative")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Cordinator';
                    ToolTip = 'Specifies the value of the Contract Cordinator field.';
                }
                field("Directorate Code1"; Rec."Directorate Code1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Code1 field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount Paid';
                    Editable = true;
                    ToolTip = 'Specifies the sum of amounts in the Line Amount field on the purchase order lines.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies when the purchase invoice is due for payment.';
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Your Reference field.';
                }
                field("Reason For ammendment"; Rec."Reason For ammendment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For ammendment field.';
                }
                field(Renewed; Rec.Renewed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewed field.';
                }
                field("Renewed Date"; Rec."Renewed Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewed Date field.';
                }
            }
            group("Contracting Vendor Details")
            {
                Caption = 'Contracting Vendor Details';
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Suite;
                    Caption = 'Vendor No.';
                    Importance = Additional;
                    NotBlank = true;
                    ToolTip = 'Specifies the number of the vendor who delivers the products.';

                    trigger OnValidate()
                    begin
                        Rec.OnAfterValidateBuyFromVendorNo(Rec, xRec);
                        CurrPage.Update;
                    end;
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Suite;
                    Caption = 'Vendor Name';
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the vendor who delivers the products.';

                    trigger OnValidate()
                    begin
                        Rec.OnAfterValidateBuyFromVendorNo(Rec, xRec);

                        CurrPage.Update;
                    end;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tax Registration (PIN)';
                    ToolTip = 'Specifies the value of the Tax Registration (PIN) field.';
                }
                field("Buy-from Address"; Rec."Buy-from Address")
                {
                    ApplicationArea = Suite;
                    Caption = 'Address';
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies the address of the vendor who ships the items.';
                }
                field("Buy-from Address 2"; Rec."Buy-from Address 2")
                {
                    ApplicationArea = Suite;
                    Caption = 'Address 2';
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Buy-from Post Code"; Rec."Buy-from Post Code")
                {
                    ApplicationArea = Suite;
                    Caption = 'Post Code';
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Buy-from City"; Rec."Buy-from City")
                {
                    ApplicationArea = Suite;
                    Caption = 'City';
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies the city of the vendor who ships the items.';
                }
                field("Buy-from Contact No."; Rec."Buy-from Contact No.")
                {
                    ApplicationArea = Suite;
                    Caption = 'Contact No.';
                    Importance = Additional;
                    ToolTip = 'Specifies the number of your contact at the vendor.';
                }
                field("Buy-from Country/Region Code"; Rec."Buy-from Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Country';
                    ToolTip = 'Specifies the city of the vendor who delivered the items.';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Language Code field.';
                }
            }
            part(PurchLines; "Contract Lines Subform")
            {
                ApplicationArea = Suite;
                Caption = 'Contract Lines';
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
            part(Control68; "Purchase Contract Payment Term")
            {
                Caption = 'Contract Payment Terms';
                SubPageLink = "No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(38),
                              "No." = field("No."),
                              "Document Type" = field("Document Type");
            }
            part(Control30; "Pending Approval FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = OpenApprovalEntriesExistForCurrUser;
            }
            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
            part(Control9; "Vendor Details FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Buy-from Vendor No.");
            }
            part(Control8; "Vendor Statistics FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Pay-to Vendor No.");
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control5; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control4; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Statistics)
                {
                    ApplicationArea = Suite;
                    Caption = 'Statistics';
                    Image = Statistics;
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';

                    trigger OnAction()
                    begin
                        Rec.OpenPurchaseOrderStatistics;
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action(Card)
                {
                    ApplicationArea = Suite;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Vendor Card";
                    RunPageLink = "No." = field("Buy-from Vendor No.");
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'View or edit detailed information about the vendor on the purchase document.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Suite;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = const("Blanket Order"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'View or add comments for the record.';
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."No." <> '';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                    end;
                }
                action("Draft Contract")
                {
                    ApplicationArea = Suite;
                    Caption = 'Contract Tempelete';
                    Ellipsis = true;
                    Image = Print;
                    ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';
                    Visible = true;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange("No.", Rec."No.");
                        ;
                        Report.Run(70068, true, true, Rec);
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
                        // WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, Database::"Purchase Header", Rec."Document Type", Rec."No.");
                    end;
                }
                action("MOU Tempelete")
                {
                    ApplicationArea = Suite;
                    Caption = 'MOU Tempelete';
                    Ellipsis = true;
                    Image = design;
                    //  RunObject = Report "Mou Template Report";
                    ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';
                    Visible = true;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange("No.", Rec."No.");
                        ;
                        Report.Run(80038, true, true, Rec);
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
                    ToolTip = 'Reject the approval request.';
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
                    ToolTip = 'Delegate the approval to a substitute approver.';
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
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CalculateInvoiceDiscount)
                {
                    AccessByPermission = TableData "Vendor Invoice Disc." = R;
                    ApplicationArea = Suite;
                    Caption = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;
                    ToolTip = 'Calculate the invoice discount for the entire purchase invoice.';

                    trigger OnAction()
                    begin
                        ApproveCalcInvDisc;
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                separator(Action49)
                {
                }
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = CopyDocument;
                    ToolTip = 'Copy document lines and header information from another sales document to this document. You can copy a posted sales invoice into a new sales invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal;
                        Clear(CopyPurchDoc);
                    end;
                }
                action("Archi&ve Document")
                {
                    ApplicationArea = Suite;
                    Caption = 'Archi&ve Document';
                    Image = Archive;
                    ToolTip = 'Archive Document.';

                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.Update(false);
                    end;
                }
                action("Set Contract To Ongoing")
                {
                    ApplicationArea = Suite;
                    Caption = 'Set Contract To Ongoing';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Renews the expired contracts ';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Rec.Status := Rec.Status::"In Progress";
                        if Confirm('Are you Sure you want to Renew This contract .?', true) then
                            Message('Contract Pushed to On-Going Sucessfully.');
                    end;
                }
                action("Expired Contract")
                {
                    ApplicationArea = Suite;
                    Caption = 'Expired Contract';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Renews the expired contracts ';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Rec.TestField("Contract End Date");

                        //  Status := Status::"5";
                    end;
                }
                action(Renew)
                {
                    ApplicationArea = Suite;
                    Caption = 'Renew';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Renews the expired contracts ';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                        if Confirm('Are you Sure you want to Renew This contract .?', true) then
                            Rec.Renewed := true;
                        Rec."Renewed Date" := Today;
                    end;
                }
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
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
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                action("Contract Documents")
                {
                    ApplicationArea = Basic;
                    Image = ContactReference;
                    RunObject = Page "Purchase Contract Documents";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Contract Documents action.';
                }
                action("Contract Insurance")
                {
                    ApplicationArea = Basic;
                    Image = Insurance;
                    RunObject = Page "Purchase Contract Insurance";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Contract Insurance action.';
                }
                action("Contract Payment Terms")
                {
                    ApplicationArea = Basic;
                    Image = PaymentPeriod;
                    RunObject = Page "Purchase Contract Payment Term";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Contract Payment Terms action.';
                }
                action("Contract Milestone")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    RunObject = Page "Purchase Contract Milestone";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Contract Milestone action.';
                }
                action("Contract Representative")
                {
                    ApplicationArea = Basic;
                    Image = Resource;
                    RunObject = Page "Contract Representative";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Contract Representative action.';
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
                action(MakeOrder)
                {
                    ApplicationArea = Suite;
                    Caption = 'Make &Order';
                    Image = MakeOrder;
                    ToolTip = 'Convert the blank purchase order to a purchase order.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //if //ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) then
                        Codeunit.Run(Codeunit::"Blnkt Purch Ord. to Ord. (Y/N)", Rec);
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Suite;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange("No.", Rec."No.");
                        ;
                        Report.Run(70046, true, true, Rec);
                    end;
                }
            }
            group(ActionGroup92)
            {
                action("Page Addendum Contract List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Addendum Contract List';
                    Image = "Action";
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    //The property 'PromotedOnly' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedOnly = true;
                    RunObject = Page "Addendum Contract List";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Addendum Contract List action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Reason For ammendment");
                        if Confirm('Do you wish to push the contract for ammendments') = true then
                            Message('Contract Moved to Addendum Sucessfully');
                        Rec."Contract Type" := Rec."contract type"::"Contract Variation";


                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(MakeOrder_Promoted; MakeOrder)
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
                actionref("Contract Documents_Promoted"; "Contract Documents")
                {
                }
                actionref("Contract Insurance_Promoted"; "Contract Insurance")
                {
                }
                actionref("Contract Payment Terms_Promoted"; "Contract Payment Terms")
                {
                }
                actionref("Contract Milestone_Promoted"; "Contract Milestone")
                {
                }
                actionref("Contract Representative_Promoted"; "Contract Representative")
                {
                }
            }
            group(Category_Category5)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category6)
            {
                actionref(Print_Promoted; Print)
                {
                }
                actionref("Draft Contract_Promoted"; "Draft Contract")
                {
                }
                actionref("MOU Tempelete_Promoted"; "MOU Tempelete")
                {
                }
            }
            group(Category_Category7)
            {
                actionref("Set Contract To Ongoing_Promoted"; "Set Contract To Ongoing")
                {
                }
                actionref("Expired Contract_Promoted"; "Expired Contract")
                {
                }
                actionref(Renew_Promoted; Renew)
                {
                }
                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Category8)
            {
                actionref(Statistics_Promoted; Statistics)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Card_Promoted; Card)
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
            }
        }
    }

    trigger OnInit()
    begin
        Rec."Document Type" := Rec."document type"::MOU;
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::MOU;
    end;

    var
        CopyPurchDoc: Report "Copy Purchase Document";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        PurchCalcDiscByType: Codeunit "Purch - Calc Disc. By Type";
        ChangeExchangeRate: Page "Change Exchange Rate";
        DocNoVisible: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.PurchaseDocumentNoIsVisible(Doctype::"Blanket Order", Rec."No.");
    end;

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        // OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        message('');
        //     CanCancelApprovalForRecord := //ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);
    end;
}

#pragma implicitwith restore

