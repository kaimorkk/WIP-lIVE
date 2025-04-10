

page 75253 "Bid Response Card"
{
    Caption = 'Purchase Quote';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Quote));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Suite;
                    Caption = 'Bid Response No.';
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = DocNoVisible;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Suite;
                    Editable = true;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Invitation For Supply No"; Rec."Invitation For Supply No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation For Supply No field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Suite;
                    Caption = 'Vendor Name';
                    Editable = false;
                    Importance = Promoted;
                    ShowMandatory = true;
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
                    Caption = 'Tax Registration (PIN) No.';
                    ToolTip = 'Specifies the value of the Tax Registration (PIN) No. field.';
                }
                group("Buy-from")
                {
                    Caption = 'Buy-from';
                    field("Buy-from Address"; Rec."Buy-from Address")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Address';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the address of the vendor who delivered the items.';
                    }
                    field("Buy-from Address 2"; Rec."Buy-from Address 2")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Address 2';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies an additional part of the address of the vendor who delivered the items.';
                    }
                    group(Control79)
                    {
                        Visible = IsBuyFromCountyVisible;
                        field("Buy-from County"; Rec."Buy-from County")
                        {
                            ApplicationArea = Suite;
                            Caption = 'County';
                            Importance = Additional;
                            QuickEntry = false;
                            ToolTip = 'Specifies the state, province or county as a part of the address.';
                        }
                    }
                    field("Buy-from Post Code"; Rec."Buy-from Post Code")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Post Code';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the post code of the vendor who delivered the items.';
                    }
                    field("Buy-from City"; Rec."Buy-from City")
                    {
                        ApplicationArea = Suite;
                        Caption = 'City';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the city of the vendor who delivered the items.';
                    }
                    field("Buy-from Country/Region Code"; Rec."Buy-from Country/Region Code")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Country/Region';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the city of the vendor who delivered the items.';
                        trigger OnValidate()
                        begin
                            IsBuyFromCountyVisible := FormatAddress.UseCounty(Rec."Buy-from Country/Region Code");
                        end;
                    }
                    field("Buy-from Contact No."; Rec."Buy-from Contact No.")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Contact No.';
                        Importance = Additional;
                        ToolTip = 'Specifies the number of contact person of the vendor who delivered the items.';
                    }
                }
                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                    ApplicationArea = Suite;
                    Caption = 'Contact';
                    Editable = Rec."Buy-from Vendor No." <> '';
                    ToolTip = 'Specifies the contact person at the vendor who delivered the items.';
                }
                field("Bidder Type"; Rec."Bidder Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Type field.';
                }
                field("Joint Venture Partner"; Rec."Joint Venture Partner")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Joint Venture Partner field.';
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invitation Notice Type field.';
                }
                field("Bid Envelope Type"; Rec."Bid Envelope Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Envelope Type field.';
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Description field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                    Visible = false;
                }
                field("Bidder Representative Name"; Rec."Bidder Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Representative Name field.';
                }
                field("Bidder Representative Desgn"; Rec."Bidder Representative Desgn")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Representative Designation field.';
                }
                field("Bidder Representative Address"; Rec."Bidder Representative Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Representative Address field.';
                }
                field("Bid Bond"; Rec."Bid Bond")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Pages Submitted"; Rec."No. of Pages Submitted")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Witness Name"; Rec."Bidder Witness Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Witness Name field.';
                    Visible = false;
                }
                field("Bidder Witness Designation"; Rec."Bidder Witness Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Witness Designation field.';
                    Visible = false;
                }
                field("Bidder Witness Address"; Rec."Bidder Witness Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Witness Address field.';
                    Visible = false;
                }
                field("Tender Document Source"; Rec."Tender Document Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Document Source field.';
                    Visible = false;
                }
                field("Bid Charge Code"; Rec."Bid Charge Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Charge Code field.';
                    Visible = false;
                }
                field("Bid Charge (LCY)"; Rec."Bid Charge (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Charge (LCY) field.';
                    Visible = false;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Reference No. field.';
                    Visible = false;
                }
                field("Posted Direct Income Voucher"; Rec."Posted Direct Income Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Direct Income Voucher field.';
                    Visible = false;
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Language Code field.';
                    Visible = false;
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies which purchaser is assigned to the vendor.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the currency of the amounts on the purchase lines.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the sum of amounts in the Line Amount field on the purchase order lines.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total of the amounts, including VAT, on all the lines on the document.';
                }
                field("No. of Addendum Notices issued"; Rec."No. of Addendum Notices issued")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Addendum Notices issued field.';
                    Visible = false;
                }
                field("Last Addendum Notice No."; Rec."Last Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Addendum Notice No. field.';
                    Visible = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
            }
            part(PurchLines; "Bid Response Purchase Lines")
            {
                ApplicationArea = Suite;
                Editable = Rec."Buy-from Vendor No." <> '';
                Enabled = Rec."Buy-from Vendor No." <> '';
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
            group("Confidential Business Questionnaire")
            {
                Caption = 'Confidential Business Questionnaire';
                field("Building/House No"; Rec."Building/House No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Building/House No field.';
                }
                field("Plot No"; Rec."Plot No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plot No field.';
                }
                field(Street; Rec.Street)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Street field.';
                }
                field("Nature of Business"; Rec."Nature of Business")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Business field.';
                }
                field("Current Trade Licence No"; Rec."Current Trade Licence No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Trade Licence No field.';
                }
                field("Trade Licence Expiry Date"; Rec."Trade Licence Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trade Licence Expiry Date field.';
                }
                field("Max Value of Business"; Rec."Max Value of Business")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Value of Business field.';
                }
                field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preferred Bank Account Code field.';
                }
                field("Bankers Name"; Rec."Bankers Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bankers Name field.';
                }
                field("Bankers Branch"; Rec."Bankers Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bankers Branch field.';
                }
                field("KNTC Agent"; Rec."KNTC Agent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KNTC Agent field.';
                }
                field("Business Type"; Rec."Business Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Type field.';
                }
                field("Nominal Capital LCY"; Rec."Nominal Capital LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominal Capital LCY field.';
                }
                field("Issued Capital LCY"; Rec."Issued Capital LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Capital LCY field.';
                }
            }
            group("Project Terms & Conditions")
            {
                Caption = 'Project Terms & Conditions';
                Visible = false;
                field("Works Category"; Rec."Works Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Category field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link Name field.';
                }
                field(Consitituency; Rec.Consitituency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consitituency field.';
                }
                field("Engineer Estimate (LCY)"; Rec."Engineer Estimate (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineer Estimate (LCY) field.';
                }
                field("Max Works Kickoff Duration"; Rec."Max Works Kickoff Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Works Kickoff Duration (After Contract/Order) field.';
                }
                field("Max Works Charter Duration"; Rec."Max Works Charter Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Works Charter/Program Duration (After Contract/Order) field.';
                }
                field("Max Works Completion Duration"; Rec."Max Works Completion Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Works Completion Duration (After Contract/Order field.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Defects Liability Period"; Rec."Defects Liability Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Defects Liability Period field.';
                }
                field("Daily Liquidated Dam Unit Cost"; Rec."Daily Liquidated Dam Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Liquidated Damages Unit Cost (LCY) field.';
                }
                field("Liquidated Damages Limit %"; Rec."Liquidated Damages Limit %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Liquidated Damages Limit % (Contract Value) field.';
                }
                field("Payment Retention %"; Rec."Payment Retention %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Retention % field.';
                }
                field("Retention Amount Limit %"; Rec."Retention Amount Limit %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Amount Limit % (Contract Value) field.';
                }
                field("Min Interim Certificate Amount"; Rec."Min Interim Certificate Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Interim Certificate Amount (LCY) field.';
                }
            }
            group("Sourcing History")
            {
                Caption = 'Sourcing History';
                field("Pre-bid Register No."; Rec."Pre-bid Register No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-bid Register No. field.';
                }
                field("Prebid Conference Date"; Rec."Prebid Conference Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prebid Conference Date field.';
                }
                field("Bid Opening Register No."; Rec."Bid Opening Register No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bid Opening Register No. (Technical)';
                    ToolTip = 'Specifies the value of the Bid Opening Register No. (Technical) field.';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bid Opening Date (Technical)';
                    ToolTip = 'Specifies the value of the Bid Opening Date (Technical) field.';
                }
                field("Late Bid (Opening Stage)"; Rec."Late Bid (Opening Stage)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Late Bid (Opening Stage) field.';
                }
                field("Withdrawn Bid (Opening Stage)"; Rec."Withdrawn Bid (Opening Stage)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withdrawn Bid (Opening Stage) field.';
                }
                field("Weighted Tech Score %"; Rec."Weighted Tech Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Tech Score % field.';
                }
                field("Read-out Bid Price (A)"; Rec."Read-out Bid Price (A)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Read-out Bid Price (A) field.';
                }
                field("Arithmetic Corrections (B)"; Rec."Arithmetic Corrections (B)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Arithmetic Corrections (B) field.';
                }
                field("Corrected Bid Price (C=A+B)"; Rec."Corrected Bid Price (C=A+B)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corrected Bid Price (C=A+B) field.';
                }
                field("Unconditional Discount % (D)"; Rec."Unconditional Discount % (D)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unconditional Discount % (D) field.';
                }
                field("Unconditional Disc Amount (E)"; Rec."Unconditional Disc Amount (E)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unconditional Discount Amount (E) field.';
                }
                field("Corrected & Disc Bid Price"; Rec."Corrected & Disc Bid Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corrected & Discounted Bid Price (F=C-E) field.';
                }
                field("Any Additional Adjustments (G)"; Rec."Any Additional Adjustments (G)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Any Additional Adjustments (G) field.';
                }
                field("Any Priced Deviations (H))"; Rec."Any Priced Deviations (H))")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Any Priced Deviations (H)) field.';
                }
                field("Final Evaluated Bid Price"; Rec."Final Evaluated Bid Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluated Bid Price (I=F+G+H) field.';
                }
                field("Final Tender Outcome"; Rec."Final Tender Outcome")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Tender Outcome field.';
                }
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
            part(Control13; "Pending Approval FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = OpenApprovalEntriesExistForCurrUser;
            }
            part(Control1901138007; "Vendor Details FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = false;
            }
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Pay-to Vendor No.");
            }
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Buy-from Vendor No.");
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Pay-to Vendor No.");
                Visible = false;
            }
            part(Control5; "Purchase Line FactBox")
            {
                ApplicationArea = Suite;
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
            }
            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ApplicationArea = Suite;
                ShowFilter = false;
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Quote")
            {
                Caption = '&Quote';
                Image = Quote;
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Visible = true;
                    ToolTip = 'Executes the Attach Document action.';
                    // trigger OnAction()
                    // begin
                    //   //  DMSManagement.UploadInspectionDocuments(DMSDocuments."document type"::Imprest, "No.", 'Imprest Memo', RecordId);
                    // end;
                }
                action(Statistics)
                {
                    ApplicationArea = Suite;
                    Caption = 'Statistics';
                    Image = Statistics;
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';

                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader;
                        Commit;
                        Page.RunModal(Page::"Purchase Statistics", Rec);
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action(Vendor)
                {
                    ApplicationArea = Suite;
                    Caption = 'Vendor';
                    Enabled = Rec."Buy-from Vendor No." <> '';
                    Image = Vendor;
                    RunObject = Page "Vendor Card";
                    RunPageLink = "No." = field("Buy-from Vendor No.");
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'View or edit detailed information about the vendor on the purchase document.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
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
                        // WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, Database::"Purchase Header", Rec."Document Type", Rec."No.");
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
                action("Owners/Directors")
                {
                    ApplicationArea = Basic;
                    Image = Absence;
                    RunObject = Page "Bid Business Owner";
                    RunPageLink = No = field("No.");
                    ToolTip = 'Executes the Owners/Directors action.';
                }
                action("Preference & Reservation")
                {
                    ApplicationArea = Basic;
                    Image = Reserve;
                    RunObject = Page "Bid Preference & Reservation";
                    RunPageLink = "Document No." = field("No.");
                    ToolTip = 'Executes the Preference & Reservation action.';
                }
                action("Litigation History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                    RunObject = Page "Bid Litigation History";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Litigation History action.';
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = Page "Bid Vendor Bank Account";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'View or set up the vendor''s bank accounts. You can set up any number of bank accounts for each vendor.';
                }
                action("Past Experience")
                {
                    ApplicationArea = Basic;
                    Image = Relationship;
                    RunObject = Page "Bid Past Experience";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Past Experience action.';
                }
                action("Audited Balance Sheet")
                {
                    ApplicationArea = Basic;
                    Image = Balance;
                    RunObject = Page "Bid Audited Balance Sheet";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Audited Balance Sheet action.';
                }
                action("Audited Income Statement")
                {
                    ApplicationArea = Basic;
                    Image = GLAccountBalance;
                    RunObject = Page "Bid Audited Income Statement";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Audited Income Statement action.';
                }
                action("Tender Security")
                {
                    ApplicationArea = Basic;
                    Image = SocialSecurity;
                    RunObject = Page "Bid_Contract Security Register";
                    RunPageLink = "No." = field("No."),
                                  "IFS No" = field("Invitation For Supply No"),
                                  "Vendor No." = field("Vendor No.");
                    ToolTip = 'Executes the Tender Security action.';
                }
                action("Proposed Personnel Specification")
                {
                    ApplicationArea = Basic;
                    Image = SalesPerson;
                    RunObject = Page "Bid Key Staff";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Proposed Personnel Specification action.';
                }
                action("Personnel Compliance Checklist")
                {
                    ApplicationArea = Basic;
                    Image = CheckList;
                    RunObject = Page "Bid Personnel Compliance";
                    RunPageLink = "Document No." = field("No.");
                    ToolTip = 'Executes the Personnel Compliance Checklist action.';
                }
                action("Proposed Equipment Specification")
                {
                    ApplicationArea = Basic;
                    Image = MachineCenterLoad;
                    RunObject = Page "Bid Equipment Specification";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Proposed Equipment Specification action.';
                }
                action("Equipment Compliance Checklist")
                {
                    ApplicationArea = Basic;
                    Image = CheckList;
                    RunObject = Page "Bid Equipment Compliance";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Equipment Compliance Checklist action.';
                }
                action("Filed Bid Response Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    RunObject = Page "Bid Filed Document";
                    RunPageLink = "No." = field("No."),
                                  "Vendor No" = field("Vendor No.");
                    ToolTip = 'Executes the Filed Bid Response Documents action.';
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
                    ToolTip = 'Reject to approve the incoming document. Note that this is not related to approval workflows.';
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
            group(ActionGroup92)
            {
                Caption = 'Print';
                action(Print)
                {
                    ApplicationArea = Suite;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                    trigger OnAction()
                    var
                        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
                    begin
                        if ApplicationAreaMgmtFacade.IsFoundationEnabled then
                            LinesInstructionMgt.PurchaseCheckAllLinesHaveQuantityAssigned(Rec);

                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
                action(Send)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send';
                    Ellipsis = true;
                    Image = SendToMultiple;
                    ToolTip = 'Prepare to send the document according to the vendor''s sending profile, such as attached to an email. The Send document to window opens first so you can confirm or select a sending profile.';

                    trigger OnAction()
                    var
                        PurchaseHeader: Record "Purchase Header";
                    begin
                        PurchaseHeader := Rec;
                        CurrPage.SetSelectionFilter(PurchaseHeader);
                        PurchaseHeader.SendRecords;
                    end;
                }
            }
            group(ActionGroup3)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action148)
                {
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
                    ToolTip = 'Calculate the invoice discount for the purchase quote.';

                    trigger OnAction()
                    begin
                        ApproveCalcInvDisc;
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                separator(Action144)
                {
                }
                action("Get St&d. Vend. Purchase Codes")
                {
                    ApplicationArea = Suite;
                    Caption = 'Get St&d. Vend. Purchase Codes';
                    Ellipsis = true;
                    Image = VendorCode;
                    ToolTip = 'View a list of the standard purchase lines that have been assigned to the vendor to be used for recurring purchases.';

                    trigger OnAction()
                    var
                        StdVendPurchCode: Record "Standard Vendor Purchase Code";
                    begin
                        StdVendPurchCode.InsertPurchLines(Rec);
                    end;
                }
                separator(Action146)
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
                        if Rec.Get(Rec."Document Type", Rec."No.") then;
                    end;
                }
                action("Archive Document")
                {
                    ApplicationArea = Suite;
                    Caption = 'Archi&ve Document';
                    Image = Archive;
                    ToolTip = 'Send the document to the archive, for example because it is too soon to delete it. Later, you delete or reprocess the archived document.';

                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.Update(false);
                    end;
                }
                group(IncomingDocument)
                {
                    Caption = 'Incoming Document';
                    Image = Documents;
                    action(IncomingDocCard)
                    {
                        ApplicationArea = Suite;
                        Caption = 'View Incoming Document';
                        Enabled = HasIncomingDocument;
                        Image = ViewOrder;
                        ToolTip = 'View any incoming document records and file attachments that exist for the entry or document, for example for auditing purposes';

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                        begin
                            IncomingDocument.ShowCardFromEntryNo(Rec."Incoming Document Entry No.");
                        end;
                    }
                    action(SelectIncomingDoc)
                    {
                        AccessByPermission = TableData "Incoming Document" = R;
                        ApplicationArea = Suite;
                        Caption = 'Select Incoming Document';
                        Image = SelectLineToApply;
                        ToolTip = 'Select an incoming document record and file attachment that you want to link to the entry or document.';

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                        begin
                            Rec.Validate("Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(Rec."Incoming Document Entry No.", Rec.RecordId));
                        end;
                    }
                    action(IncomingDocAttachFile)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Create Incoming Document from File';
                        Ellipsis = true;
                        Enabled = (Rec."Incoming Document Entry No." = 0) and (Rec."No." <> '');
                        Image = Attach;
                        ToolTip = 'Create an incoming document from a file that you select from the disk. The file will be attached to the incoming document record.';

                        trigger OnAction()
                        var
                            IncomingDocumentAttachment: Record "Incoming Document Attachment";
                        begin
                            IncomingDocumentAttachment.NewAttachmentFromPurchaseDocument(Rec);
                        end;
                    }
                    action(RemoveIncomingDoc)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Remove Incoming Document';
                        Enabled = HasIncomingDocument;
                        Image = RemoveLine;
                        ToolTip = 'Remove any incoming document records and file attachments.';

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                        begin
                            if IncomingDocument.Get(Rec."Incoming Document Entry No.") then
                                IncomingDocument.RemoveLinkToRelatedRecord;
                            Rec."Incoming Document Entry No." := 0;
                            Rec.Modify(true);
                        end;
                    }
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
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
            }
            group("Make Order")
            {
                Caption = 'Make Order';
                Image = MakeOrder;
                action(MakeOrder)
                {
                    ApplicationArea = Suite;
                    Caption = 'Make &Order';
                    Image = MakeOrder;
                    ToolTip = 'Convert the purchase quote to a purchase order.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //if //ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) then
                        Codeunit.Run(Codeunit::"Purch.-Quote to Order (Yes/No)", Rec);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(MakeOrder_Promoted; MakeOrder)
                {
                }
                actionref(AttachDocuments_Promoted; AttachDocuments)
                {
                }
                actionref(CopyDocument_Promoted; CopyDocument)
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
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref("Proposed Personnel Specification_Promoted"; "Proposed Personnel Specification")
                {
                }
                actionref("Personnel Compliance Checklist_Promoted"; "Personnel Compliance Checklist")
                {
                }
                actionref("Proposed Equipment Specification_Promoted"; "Proposed Equipment Specification")
                {
                }
                actionref("Equipment Compliance Checklist_Promoted"; "Equipment Compliance Checklist")
                {
                }
                actionref("Filed Bid Response Documents_Promoted"; "Filed Bid Response Documents")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Print/Send', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(Print_Promoted; Print)
                {
                }
                actionref(Send_Promoted; Send)
                {
                }
            }
            group(Category_Category7)
            {
                Caption = 'Quote', Comment = 'Generated from the PromotedActionCategories property index 6.';

                actionref(Statistics_Promoted; Statistics)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
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
                actionref("Owners/Directors_Promoted"; "Owners/Directors")
                {
                }
                actionref("Litigation History_Promoted"; "Litigation History")
                {
                }
                actionref("Bank Accounts_Promoted"; "Bank Accounts")
                {
                }
                actionref("Past Experience_Promoted"; "Past Experience")
                {
                }
                actionref("Audited Balance Sheet_Promoted"; "Audited Balance Sheet")
                {
                }
                actionref("Audited Income Statement_Promoted"; "Audited Income Statement")
                {
                }
                actionref("Tender Security_Promoted"; "Tender Security")
                {
                }
            }
            group(Category_Category8)
            {
                Caption = 'Release', Comment = 'Generated from the PromotedActionCategories property index 7.';

                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref("Preference & Reservation_Promoted"; "Preference & Reservation")
                {
                }
            }
            group(Category_Category9)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(Vendor_Promoted; Vendor)
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

    trigger OnAfterGetRecord()
    begin
        CalculateCurrentShippingAndPayToOption;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnInit()
    begin
        //ShowShippingOptionsWithLocation := ApplicationAreaMgmtFacade.IsLocationEnabled OR ApplicationAreaMgmtFacade.IsAllDisabled;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;

        if (not DocNoVisible) and (Rec."No." = '') then
            Rec.SetBuyFromVendorFromFilter;

        CalculateCurrentShippingAndPayToOption;
    end;

    trigger OnOpenPage()
    begin
        /*IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetPurchasesFilter);
          FILTERGROUP(0);
        END;
        */
        //ActivateFields;

        //SetDocNoVisible;

    end;

    var
        CopyPurchDoc: Report "Copy Purchase Document";
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        PurchCalcDiscByType: Codeunit "Purch - Calc Disc. By Type";
        FormatAddress: Codeunit "Format Address";
        ChangeExchangeRate: Page "Change Exchange Rate";
        ShipToOptions: Option "Default (Company Address)",Location,"Custom Address";
        PayToOptions: Option "Default (Vendor)","Another Vendor";
        HasIncomingDocument: Boolean;
        DocNoVisible: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;
        ShowShippingOptionsWithLocation: Boolean;
        IsBuyFromCountyVisible: Boolean;
        IsPayToCountyVisible: Boolean;
        IsShipToCountyVisible: Boolean;
        // DMSDocuments: Record "DMS Documents";
        // DMSManagement: Codeunit "DMS Management";

    local procedure ActivateFields()
    begin
        IsBuyFromCountyVisible := FormatAddress.UseCounty(Rec."Buy-from Country/Region Code");
        IsPayToCountyVisible := FormatAddress.UseCounty(Rec."Pay-to Country/Region Code");
        IsShipToCountyVisible := FormatAddress.UseCounty(Rec."Ship-to Country/Region Code");
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure SaveInvoiceDiscountAmount()
    var
        DocumentTotals: Codeunit "Document Totals";
    begin
        CurrPage.SaveRecord;
        DocumentTotals.PurchaseRedistributeInvoiceDiscountAmountsOnDocument(Rec);
        CurrPage.Update(false);
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.Update;
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
        DocNoVisible := DocumentNoVisibility.PurchaseDocumentNoIsVisible(Doctype::Quote, Rec."No.");
    end;

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        // OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        // OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        // CanCancelApprovalForRecord :=  //ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);
        HasIncomingDocument := Rec."Incoming Document Entry No." <> 0;
    end;

    local procedure ValidateShippingOption()
    begin
        case ShipToOptions of
            Shiptooptions::"Default (Company Address)",
          Shiptooptions::"Custom Address":
                Rec.Validate("Location Code", '');
            Shiptooptions::Location:
                Rec.Validate("Location Code");
        end;
    end;

    local procedure CalculateCurrentShippingAndPayToOption()
    begin
        if Rec."Location Code" <> '' then
            ShipToOptions := Shiptooptions::Location
        else
            if Rec.ShipToAddressEqualsCompanyShipToAddress then
                ShipToOptions := Shiptooptions::"Default (Company Address)"
            else
                ShipToOptions := Shiptooptions::"Custom Address";

        if Rec."Pay-to Vendor No." = Rec."Buy-from Vendor No." then
            PayToOptions := Paytooptions::"Default (Vendor)"
        else
            PayToOptions := Paytooptions::"Another Vendor";
    end;
}

#pragma implicitwith restore

