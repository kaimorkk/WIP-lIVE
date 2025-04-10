Page 50002 "Held Purchase Order"
{
    Caption = 'Held Purchase Order';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Order),
                            Status = const(4));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(BuyfromVendorNo; "Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        BuyfromVendorNoOnAfterValidate;
                    end;
                }
                field(BuyfromContactNo; "Buy-from Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field(BuyfromVendorName; "Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field(BuyfromAddress; "Buy-from Address")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(BuyfromAddress2; "Buy-from Address 2")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(BuyfromPostCode; "Buy-from Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(BuyfromCity; "Buy-from City")
                {
                    ApplicationArea = Basic;
                }
                field(BuyfromContact; "Buy-from Contact")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(NoofArchivedVersions; "No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(PostingDate; "Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(OrderDate; "Order Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(QuoteNo; "Quote No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(VendorOrderNo; "Vendor Order No.")
                {
                    ApplicationArea = Basic;
                }
                field(VendorShipmentNo; "Vendor Shipment No.")
                {
                    ApplicationArea = Basic;
                }
                field(VendorInvoiceNo; "Vendor Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field(OrderAddressCode; "Order Address Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(PurchaserCode; "Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;

                    trigger OnValidate()
                    begin
                        PurchaserCodeOnAfterValidate;
                    end;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(AssignedUserID; "Assigned User ID")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(JobQueueStatus; "Job Queue Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(ProcurementPlanYear; "Procurement Plan Year")
                {
                    ApplicationArea = Basic;
                }
                field(RequisitionNo; "Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field(PlanItemNo; "Plan Item No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(RequestRefNo; "Request Ref No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ContractNo; "Contract No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part(PurchLines; "Purchase Order Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field(PaytoVendorNo; "Pay-to Vendor No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        PaytoVendorNoOnAfterValidate;
                    end;
                }
                field(PaytoContactNo; "Pay-to Contact No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(PaytoName; "Pay-to Name")
                {
                    ApplicationArea = Basic;
                }
                field(PaytoAddress; "Pay-to Address")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(PaytoAddress2; "Pay-to Address 2")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(PaytoPostCode; "Pay-to Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(PaytoCity; "Pay-to City")
                {
                    ApplicationArea = Basic;
                }
                field(PaytoContact; "Pay-to Contact")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field(PaymentTermsCode; "Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(DueDate; "Due Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(PaymentDiscount; "Payment Discount %")
                {
                    ApplicationArea = Basic;
                }
                field(PmtDiscountDate; "Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(PaymentMethodCode; "Payment Method Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(OnHold; "On Hold")
                {
                    ApplicationArea = Basic;
                }
                field(PricesIncludingVAT; "Prices Including VAT")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
                field(VATBusPostingGroup; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field(ShiptoName; "Ship-to Name")
                {
                    ApplicationArea = Basic;
                }
                field(ShiptoAddress; "Ship-to Address")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(ShiptoAddress2; "Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(ShiptoPostCode; "Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(ShiptoCity; "Ship-to City")
                {
                    ApplicationArea = Basic;
                }
                field(ShiptoContact; "Ship-to Contact")
                {
                    ApplicationArea = Basic;
                }
                field(LocationCode; "Location Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(InboundWhseHandlingTime; "Inbound Whse. Handling Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(ShipmentMethodCode; "Shipment Method Code")
                {
                    ApplicationArea = Basic;
                }
                field(LeadTimeCalculation; "Lead Time Calculation")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(RequestedReceiptDate; "Requested Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(PromisedReceiptDate; "Promised Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedReceiptDate; "Expected Receipt Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(SelltoCustomerNo; "Sell-to Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field(ShiptoCode; "Ship-to Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group(ForeignTrade)
            {
                Caption = 'Foreign Trade';
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if "Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", "Posting Date")
                        else
                            ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = Action::OK then begin
                            Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrencyCodeOnAfterValidate;
                    end;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionSpecification; "Transaction Specification")
                {
                    ApplicationArea = Basic;
                }
                field(TransportMethod; "Transport Method")
                {
                    ApplicationArea = Basic;
                }
                field(EntryPoint; "Entry Point")
                {
                    ApplicationArea = Basic;
                }
                field("Area"; Area)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control1900201301)
            {
                Caption = 'Prepayment';
                field(Control197; "Prepayment %")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        Prepayment37OnAfterValidate;
                    end;
                }
                field(CompressPrepayment; "Compress Prepayment")
                {
                    ApplicationArea = Basic;
                }
                field(PrepmtPaymentTermsCode; "Prepmt. Payment Terms Code")
                {
                    ApplicationArea = Basic;
                }
                field(PrepaymentDueDate; "Prepayment Due Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(PrepmtPaymentDiscount; "Prepmt. Payment Discount %")
                {
                    ApplicationArea = Basic;
                }
                field(PrepmtPmtDiscountDate; "Prepmt. Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                }
                field(VendorCrMemoNo; "Vendor Cr. Memo No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control1903326807; "Item Replenishment FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "No." = field("No.");
                Visible = false;
            }
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = false;
            }
            part(Control1901138007; "Vendor Details FactBox")
            {
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = false;
            }
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = true;
            }
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = true;
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                SubPageLink = "No." = field("Pay-to Vendor No.");
                Visible = false;
            }
            part(Control3; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "No." = field("No."),
                              "Line No." = field("Line No.");
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Order")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    ShortCutKey = 'F7';

                    trigger OnAction()
                    begin
                        CalcInvDiscForHeader;
                        Commit;
                        Page.RunModal(Page::"Purchase Order Statistics", Rec);
                    end;
                }
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page "Vendor Card";
                    RunPageLink = "No." = field("Buy-from Vendor No.");
                    ShortCutKey = 'Shift+F7';
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.SetRecordFilters(Database::"Purchase Header", "Document Type", "No.");
                        ApprovalEntries.Run;
                    end;
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action(Receipts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipts';
                    Image = PostedReceipts;
                    RunObject = Page "Posted Purchase Receipts";
                    RunPageLink = "Order No." = field("No.");
                    RunPageView = sorting("Order No.");
                }
                action(Invoices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoices';
                    Image = Invoice;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page "Posted Purchase Invoices";
                    RunPageLink = "Order No." = field("No.");
                    RunPageView = sorting("Order No.");
                }
                action(PrepaymentInvoices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Invoices';
                    Image = PrepaymentInvoice;
                    RunObject = Page "Posted Purchase Invoices";
                    RunPageLink = "Prepayment Order No." = field("No.");
                    RunPageView = sorting("Prepayment Order No.");
                }
                action(PrepaymentCreditMemos)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepayment Credi&t Memos';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page "Posted Purchase Credit Memos";
                    RunPageLink = "Prepayment Order No." = field("No.");
                    RunPageView = sorting("Prepayment Order No.");
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                separator(Action181)
                {
                }
                action(InvtPutawayPickLines)
                {
                    ApplicationArea = Basic;
                    Caption = 'In&vt. Put-away/Pick Lines';
                    Image = PickLines;
                    RunObject = Page "Warehouse Activity List";
                    RunPageLink = "Source Document" = const("Purchase Order"),
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Document", "Source No.", "Location Code");
                }
                action(WhseReceiptLines)
                {
                    ApplicationArea = Basic;
                    Caption = 'Whse. Receipt Lines';
                    Image = ReceiptLines;
                    RunObject = Page "Whse. Receipt Lines";
                    RunPageLink = "Source Type" = const(39),
                                  "Source Subtype" = field("Document Type"),
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                }
                separator(Action182)
                {
                }
                group(DropShipment)
                {
                    Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action(GetSalesOrder)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";
                        RunObject = Codeunit "Purch.-Get Drop Shpt.";
                    }
                }
                group(SpecialOrder)
                {
                    Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action(Action228)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";

                        trigger OnAction()
                        var
                            PurchHeader: Record "Purchase Header";
                            DistIntegration: Codeunit "Dist. Integration";
                        begin
                            PurchHeader.Copy(Rec);
                            DistIntegration.GetSpecialOrders(PurchHeader);
                            Rec := PurchHeader;
                        end;
                    }
                }
            }
        }
        area(processing)
        {
            group(ActionGroup13)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action73)
                {
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action611)
                {
                }
            }
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CalculateInvoiceDiscount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;

                    trigger OnAction()
                    begin
                        ApproveCalcInvDisc;
                    end;
                }
                separator(Action190)
                {
                }
                action(GetStdVendPurchaseCodes)
                {
                    ApplicationArea = Basic;
                    Caption = 'Get St&d. Vend. Purchase Codes';
                    Ellipsis = true;
                    Image = VendorCode;

                    trigger OnAction()
                    var
                        StdVendPurchCode: Record "Standard Vendor Purchase Code";
                    begin
                        StdVendPurchCode.InsertPurchLines(Rec);
                    end;
                }
                separator(Action75)
                {
                }
                action(CopyDocument)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Image = CopyDocument;

                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal;
                        Clear(CopyPurchDoc);
                    end;
                }
                action(MoveNegativeLines)
                {
                    ApplicationArea = Basic;
                    Caption = 'Move Negative Lines';
                    Ellipsis = true;
                    Image = MoveNegativeLines;

                    trigger OnAction()
                    begin
                        Clear(MoveNegPurchLines);
                        MoveNegPurchLines.SetPurchHeader(Rec);
                        MoveNegPurchLines.RunModal;
                        MoveNegPurchLines.ShowDocument;
                    end;
                }
                group(ActionGroup225)
                {
                    Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action(Action184)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";
                        RunObject = Codeunit "Purch.-Get Drop Shpt.";
                    }
                }
                group(ActionGroup186)
                {
                    Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action(Action187)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";

                        trigger OnAction()
                        var
                            DistIntegration: Codeunit "Dist. Integration";
                            PurchHeader: Record "Purchase Header";
                        begin
                            PurchHeader.Copy(Rec);
                            DistIntegration.GetSpecialOrders(PurchHeader);
                            Rec := PurchHeader;
                        end;
                    }
                }
                action("Archive Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'Archi&ve Document';
                    Image = Archive;

                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.Update(false);
                    end;
                }
                action(SendICPurchaseOrder)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send IC Purchase Order';
                    Image = IntercompanyOrder;

                    trigger OnAction()
                    var
                        ICInOutboxMgt: Codeunit ICInboxOutboxMgt;
                        SalesHeader: Record "Sales Header";
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        // //if ApprovalMgt.PrePostApprovalCheck(SalesHeader, Rec) then
                        //     ICInOutboxMgt.SendPurchDoc(Rec, false);
                    end;
                }
                separator(Action189)
                {
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                Image = Approval;
                group(ActionGroup21)
                {
                    Caption = 'Approval';
                    Image = Approval;
                    action(SendApprovalRequest)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Send A&pproval Request';
                        Image = SendApprovalRequest;

                        trigger OnAction()
                        var
                            ApprovalMgt: Codeunit "Approvals Mgmt.";
                        begin
                            // //if ApprovalMgt.SendPurchaseApprovalRequest(Rec) then;
                        end;
                    }
                    action(CancelApprovalRequest)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Cancel Approval Re&quest';
                        Image = Cancel;

                        trigger OnAction()
                        var
                            ApprovalMgt: Codeunit "Approvals Mgmt.";
                        begin
                            // //if ApprovalMgt.CancelPurchaseApprovalRequest(Rec, true, true) then;
                        end;
                    }
                }
            }
            group(ActionGroup17)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                action(CreateWhseReceipt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create &Whse. Receipt';
                    Image = NewReceipt;

                    trigger OnAction()
                    var
                        GetSourceDocInbound: Codeunit "Get Source Doc. Inbound";
                    begin
                        GetSourceDocInbound.CreateFromPurchOrder(Rec);

                        if not Find('=><') then
                            Init;
                    end;
                }
                action(CreateInventoryPutawayPick)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Inventor&y Put-away / Pick';
                    Ellipsis = true;
                    Image = CreateInventoryPickup;

                    trigger OnAction()
                    begin
                        CreateInvtPutAwayPick;

                        if not Find('=><') then
                            Init;
                    end;
                }
                separator(Action74)
                {
                }
            }
            group(Posting)
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post1)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        Post(Codeunit::"Purch.-Post (Yes/No)");
                    end;
                }
                action(PostandPrint)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post and &Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    begin
                        Post(Codeunit::"Purch.-Post + Print");
                    end;
                }
                action(TestReport)
                {
                    ApplicationArea = Basic;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction()
                    begin
                        ReportPrint.PrintPurchHeader(Rec);
                    end;
                }
                action(PostBatch)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;

                    trigger OnAction()
                    begin
                        Report.RunModal(Report::"Batch Post Purchase Orders", true, true, Rec);
                        CurrPage.Update(false);
                    end;
                }
                action(RemoveFromJobQueue)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove From Job Queue';
                    Image = RemoveLine;
                    Visible = JobQueueVisible;

                    trigger OnAction()
                    begin
                        CancelBackgroundPosting;
                    end;
                }
                separator(Action201)
                {
                }
                group(Prepayment)
                {
                    Caption = 'Prepa&yment';
                    Image = Prepayment;
                    action(PrepaymentTestReport)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Prepayment Test &Report';
                        Ellipsis = true;
                        Image = PrepaymentSimulation;

                        trigger OnAction()
                        begin
                            ReportPrint.PrintPurchHeaderPrepmt(Rec);
                        end;
                    }
                    action(PostPrepaymentInvoice)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post Prepayment &Invoice';
                        Ellipsis = true;
                        Image = PrepaymentPost;

                        trigger OnAction()
                        var
                            SalesHeader: Record "Sales Header";
                            ApprovalMgt: Codeunit "Approvals Mgmt.";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            // //if ApprovalMgt.PrePostApprovalCheck(SalesHeader, Rec) then
                            //     PurchPostYNPrepmt.PostPrepmtInvoiceYN(Rec, false);
                        end;
                    }
                    action(PostandPrintPrepmtInvoice)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post and Print Prepmt. Invoic&e';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;

                        trigger OnAction()
                        var
                            SalesHeader: Record "Sales Header";
                            ApprovalMgt: Codeunit "Approvals Mgmt.";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            // //if ApprovalMgt.PrePostApprovalCheck(SalesHeader, Rec) then
                            //     PurchPostYNPrepmt.PostPrepmtInvoiceYN(Rec, true);
                        end;
                    }
                    action(PostPrepaymentCreditMemo)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post Prepayment &Credit Memo';
                        Ellipsis = true;
                        Image = PrepaymentPost;

                        trigger OnAction()
                        var
                            SalesHeader: Record "Sales Header";
                            ApprovalMgt: Codeunit "Approvals Mgmt.";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            // //if ApprovalMgt.PrePostApprovalCheck(SalesHeader, Rec) then
                            //     PurchPostYNPrepmt.PostPrepmtCrMemoYN(Rec, false);
                        end;
                    }
                    action(PostandPrintPrepmtCrMemo)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post and Print Prepmt. Cr. Mem&o';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;

                        trigger OnAction()
                        var
                            SalesHeader: Record "Sales Header";
                            ApprovalMgt: Codeunit "Approvals Mgmt.";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            // //if ApprovalMgt.PrePostApprovalCheck(SalesHeader, Rec) then
                            //     PurchPostYNPrepmt.PostPrepmtCrMemoYN(Rec, true);
                        end;
                    }
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action(Action82)
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;

                    trigger OnAction()
                    begin
                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
            group(Prints)
            {
                Caption = 'Prints';
                Image = "Action";
                action(PrintLPO)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print LPO';

                    trigger OnAction()
                    begin
                        //ApproveCalcInvDisc;
                        Reset;
                        Rec.SetRange("No.", "No.");
                        Report.Run(51511096, true, true, Rec);
                        Rec.SetRange("No.");
                    end;
                }
                action(PrintLSO)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print LSO';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        StdVendPurchCode: Record "Standard Vendor Purchase Code";
                    begin
                        //StdVendPurchCode.InsertPurchLines(Rec);
                        Reset;
                        Rec.SetRange("No.", "No.");
                        Report.Run(51511095, true, true, Rec);
                        Rec.SetRange("No.");
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post1)
                {
                }
                actionref(PostandPrint_Promoted; PostandPrint)
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
                actionref(Release_Promoted; Release)
                {
                }
                actionref(CopyDocument_Promoted; CopyDocument)
                {
                }
                actionref(CreateInventoryPutawayPick_Promoted; CreateInventoryPutawayPick)
                {
                }
                actionref(Action82_Promoted; Action82)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := "Job Queue Status" = "job queue status"::"Scheduled for Posting";
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Responsibility Center" := UserMgt.GetPurchasesFilter;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter <> '' then begin
            FilterGroup(2);
            SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
            FilterGroup(0);
        end;
    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;

        JobQueueVisible: Boolean;

    local procedure Post(PostingCodeunitID: Integer)
    begin
        SendToPosting(PostingCodeunitID);
        if "Job Queue Status" = "job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        if GetFilter("Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
            if "Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
                SetRange("Buy-from Vendor No.");
        CurrPage.Update;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
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

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update;
    end;
}

