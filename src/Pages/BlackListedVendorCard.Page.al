Page 50039 "BlackListed Vendor Card"
{
    Caption = 'BlackListed Vendor Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Vendor;
    SourceTableView = where(Blocked = filter(All | Payment));

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
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(PostCode; "Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(CountryRegionCode; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryContactNo; "Primary Contact No.")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        ActivateFields;
                    end;
                }
                field(Control16; Contact)
                {
                    ApplicationArea = Basic;
                    Editable = ContactEditable;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        ContactOnAfterValidate;
                    end;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field(SearchName; "Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(BalanceLCY; "Balance (LCY)")
                {
                    ApplicationArea = Basic;

                    trigger OnDrillDown()
                    var
                        VendLedgEntry: Record "Vendor Ledger Entry";
                        DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry";
                    begin
                        DtldVendLedgEntry.SetRange("Vendor No.", "No.");
                        Copyfilter("Global Dimension 1 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 1");
                        Copyfilter("Global Dimension 2 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 2");
                        Copyfilter("Currency Filter", DtldVendLedgEntry."Currency Code");
                        VendLedgEntry.DrillDownOnEntries(DtldVendLedgEntry);
                    end;
                }
                field(PurchaserCode; "Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(LastDateModified; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(Prequalification; Prequalification)
                {
                    ApplicationArea = Basic;
                }
                field(SupplierType; "Supplier Type")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No.2"; "Phone No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(FaxNo; "Fax No.")
                {
                    ApplicationArea = Basic;
                }
                field(EMail; "E-Mail")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(HomePage; "Home Page")
                {
                    ApplicationArea = Basic;
                }
                field(ICPartnerCode; "IC Partner Code")
                {
                    ApplicationArea = Basic;
                }
                field(SecondaryContactNo; "Secondary Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field(SecondaryContact; "Secondary Contact")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field(PaytoVendorNo; "Pay-to Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field(GenBusPostingGroup; "Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(VATBusPostingGroup; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(VendorPostingGroup; "Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(InvoiceDiscCode; "Invoice Disc. Code")
                {
                    ApplicationArea = Basic;
                }
                field(PricesIncludingVAT; "Prices Including VAT")
                {
                    ApplicationArea = Basic;
                }
                field(Prepayment; "Prepayment %")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumOrderAmount; "Maximum Order Amount")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumOrderAmount; "Minimum Order Amount")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumOrderQuantity; "Maximum Order Quantity")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumOrderQuantity; "Minimum Order Quantity")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                field(ApplicationMethod; "Application Method")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentTermsCode; "Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(PaymentMethodCode; "Payment Method Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(Priority; Priority)
                {
                    ApplicationArea = Basic;
                }
                field(CashFlowPaymentTermsCode; "Cash Flow Payment Terms Code")
                {
                    ApplicationArea = Basic;
                }
                field(OurAccountNo; "Our Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(BlockPaymentTolerance; "Block Payment Tolerance")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if "Block Payment Tolerance" then begin
                            if Confirm(Text002, false) then
                                PaymentToleranceMgt.DelTolVendLedgEntry(Rec);
                        end else begin
                            if Confirm(Text001, false) then
                                PaymentToleranceMgt.CalcTolVendLedgEntry(Rec);
                        end;
                    end;
                }
                field(PINNo; "PIN No.")
                {
                    ApplicationArea = Basic;
                }
                field(WorkingHours; "Working Hours")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Receiving)
            {
                Caption = 'Receiving';
                field(LocationCode; "Location Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(IncoTerms; "Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'IncoTerms';
                    Importance = Promoted;
                }
                field(LeadTimeCalculation; "Lead Time Calculation")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(BaseCalendarCode; "Base Calendar Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                }
                // field("Customized Calendar";CalendarMgmt.CustomizedCalendarExistText(CustomizedCalendar."source type"::Vendor,"No.",'',"Base Calendar Code"))
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Customized Calendar';
                //     Editable = false;

                //     trigger OnDrillDown()
                //     begin
                //         CurrPage.SaveRecord;
                //         TestField("Base Calendar Code");
                //         CalendarMgmt.ShowCustomizedCalendar(CustomizedCalEntry."source type"::Vendor,"No.",'',"Base Calendar Code");
                //     end;
                // }
            }
            group(ForeignTrade)
            {
                Caption = 'Foreign Trade';
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(LanguageCode; "Language Code")
                {
                    ApplicationArea = Basic;
                }
                field(VATRegistrationNo; "VAT Registration No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group(OwnerDetails)
            {
                Caption = 'Owner Details';
                part(Control1000000006; "Owner Details")
                {
                    SubPageLink = "Supplier No." = field("No.");
                }
            }
        }
        area(factboxes)
        {
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = false;
            }
            systempart(Control1900383207; Links)
            {
                Visible = true;
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
            group(Vendor)
            {
                Caption = 'Ven&dor';
                Image = Vendor;
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(23),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action(BankAccounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = Page "Vendor Bank Account List";
                    RunPageLink = "Vendor No." = field("No.");
                }
                action(Contact)
                {
                    ApplicationArea = Basic;
                    Caption = 'C&ontact';
                    Image = ContactPerson;

                    trigger OnAction()
                    begin
                        ShowContact;
                    end;
                }
                action(OrderAddresses)
                {
                    ApplicationArea = Basic;
                    Caption = 'Order &Addresses';
                    Image = Addresses;
                    RunObject = Page "Order Address List";
                    RunPageLink = "Vendor No." = field("No.");
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Vendor),
                                  "No." = field("No.");
                }
                action(CrossReferences)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cross References';
                    Image = Change;
                    // //RunObject = Page "Cross References";
                    // RunPageLink = "Cross-Reference Type"=const(Vendor),
                    //               "Cross-Reference Type No."=field("No.");
                    // RunPageView = sorting("Cross-Reference Type","Cross-Reference Type No.");
                }
                action(OnlineMap)
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    Image = Map;

                    trigger OnAction()
                    begin
                        DisplayMap;
                    end;
                }
                action("Supplier Complaints")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Supplier Complaints";
                    RunPageLink = "Supplier No." = field("No.");
                }
                separator(Action11)
                {
                }
                separator(Action83)
                {
                    Caption = '';
                }
                separator(Action108)
                {
                }
            }
            group(Purchases)
            {
                Caption = '&Purchases';
                Image = Purchasing;
                action(Items)
                {
                    ApplicationArea = Basic;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Vendor Item Catalog";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.", "Item No.");
                }
                action(InvoiceDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice &Discounts';
                    Image = CalculateInvoiceDiscount;
                    RunObject = Page "Vend. Invoice Discounts";
                    RunPageLink = Code = field("Invoice Disc. Code");
                }
                action(Prices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = Page "Purchase Prices";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                }
                action(LineDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Purchase Line Discounts";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                }
                action(PrepaymentPercentages)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Purchase Prepmt. Percentages";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                }
                action(StdVendPurchaseCodes)
                {
                    ApplicationArea = Basic;
                    Caption = 'S&td. Vend. Purchase Codes';
                    Image = CodesList;
                    RunObject = Page "Standard Vendor Purchase Codes";
                    RunPageLink = "Vendor No." = field("No.");
                }
                separator(Action117)
                {
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Administration;
                action(Quotes)
                {
                    ApplicationArea = Basic;
                    Caption = 'Quotes';
                    Image = Quote;
                    RunObject = Page "Purchase Quotes";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                }
                action(Orders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Purchase Order List";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                }
                action(ReturnOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Purchase Return Order List";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                }
                action(BlanketOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Blanket Orders';
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Purchase Orders";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = VendorLedger;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Vendor Ledger Entries";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    RunObject = Page "Vendor Statistics";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                }
                action(Action69)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchases';
                    Image = Purchase;
                    RunObject = Page "Vendor Purchases";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                }
                action(EntryStatistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Entry Statistics';
                    Image = EntryStatistics;
                    RunObject = Page "Vendor Entry Statistics";
                    RunPageLink = "No." = field("No."),
                                  "Date Filter" = field("Date Filter"),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                }
                action(StatisticsbyCurrencies)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics by C&urrencies';
                    Image = Currencies;
                    RunObject = Page "Gen. Jnl. Dim. Filters";
                    // RunPageLink = "Journal Template Name"=field("No."),
                    //               Field56=field("Global Dimension 1 Filter"),
                    //               Field57=field("Global Dimension 2 Filter"),
                    //               Field55=field("Date Filter");
                }
                action(ItemTrackingEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Item &Tracking Entries';
                    Image = ItemTrackingLedger;

                    trigger OnAction()
                    var
                        ItemTrackingMgt: Codeunit "Item Tracking Management";
                    begin
                        // //ItemTrackingMgt.CallItemTrackingEntryForm(2,"No.",'','','','','');
                    end;
                }
            }
        }
        area(creation)
        {
            action(BlanketPurchaseOrder)
            {
                ApplicationArea = Basic;
                Caption = 'Blanket Purchase Order';
                Image = BlanketOrder;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Blanket Purchase Order";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
            }
            action(PurchaseQuote)
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Quote';
                Image = Quote;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Purchase Quote";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
            }
            action(PurchaseInvoice)
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Invoice';
                Image = Invoice;
                RunObject = Page "Purchase Invoice";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
            }
            action(PurchaseOrder)
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Order';
                Image = Document;
                RunObject = Page "Purchase Order";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
            }
            action(PurchaseCreditMemo)
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Credit Memo';
                Image = CreditMemo;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Purchase Credit Memo";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
            }
            action(PurchaseReturnOrder)
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Return Order';
                Image = ReturnOrder;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Purchase Return Order";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(ApplyTemplate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Apply Template';
                    Ellipsis = true;
                    Image = ApplyTemplate;

                    trigger OnAction()
                    var
                        ConfigTemplateMgt: Codeunit "Config. Template Management";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        ConfigTemplateMgt.UpdateFromTemplateSelection(RecRef);
                    end;
                }
            }
            action(PaymentJournal)
            {
                ApplicationArea = Basic;
                Caption = 'Payment Journal';
                Image = PaymentJournal;
                RunObject = Page "Payment Journal";
            }
            action(PurchaseJournal)
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Journal';
                Image = Journals;
                RunObject = Page "Purchase Journal";
            }
        }
        area(reporting)
        {
            action(VendorLabels)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - Labels';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor - Labels";
            }
            action(VendorBalancetoDate)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - Balance to Date';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor - Balance to Date";
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(PurchaseInvoice_Promoted; PurchaseInvoice)
                {
                }
                actionref(PurchaseOrder_Promoted; PurchaseOrder)
                {
                }
            }
            group(Category_Process)
            {
                actionref(ApplyTemplate_Promoted; ApplyTemplate)
                {
                }
                actionref(PaymentJournal_Promoted; PaymentJournal)
                {
                }
                actionref(PurchaseJournal_Promoted; PurchaseJournal)
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        ActivateFields;
    end;

    trigger OnAfterGetRecord()
    begin
        ActivateFields;
    end;

    trigger OnInit()
    begin
        ContactEditable := true;
        MapPointVisible := true;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        ActivateFields;
        if not MapMgt.TestSetup then
            MapPointVisible := false;
    end;

    var
        CalendarMgmt: Codeunit "Calendar Management";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        Text001: label 'Do you want to allow payment tolerance for entries that are currently open?';
        Text002: label 'Do you want to remove payment tolerance from entries that are currently open?';

        MapPointVisible: Boolean;

        ContactEditable: Boolean;


    procedure ActivateFields()
    begin
        ContactEditable := "Primary Contact No." = '';
    end;

    local procedure ContactOnAfterValidate()
    begin
        ActivateFields;
    end;
}

