Page 50038 "BlackListed Vendors"
{
    ApplicationArea = Basic;
    Caption = 'BlackListed Vendors';
    CardPageID = "BlackListed Vendor Card";
    Editable = false;
    PageType = List;
    SourceTable = Vendor;
    SourceTableView = where(Blocked = filter(All | Payment));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(LocationCode; "Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(PostCode; "Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CountryRegionCode; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PhoneNo; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(FaxNo; "Fax No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ICPartnerCode; "IC Partner Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Control35; Contact)
                {
                    ApplicationArea = Basic;
                }
                field(PurchaserCode; "Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(VendorPostingGroup; "Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(GenBusPostingGroup; "Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(VATBusPostingGroup; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PaymentTermsCode; "Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(FinChargeTermsCode; "Fin. Charge Terms Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(LanguageCode; "Language Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(SearchName; "Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(LastDateModified; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ApplicationMethod; "Application Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Location Code2"; "Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ShipmentMethodCode; "Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(LeadTimeCalculation; "Lead Time Calculation")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(BaseCalendarCode; "Base Calendar Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part(Control1901138007; "Vendor Details FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = false;
            }
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
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(23),
                                      "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action(DimensionsMultiple)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;

                        trigger OnAction()
                        var
                            Vend: Record Vendor;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Vend);
                            ////DefaultDimMultiple.SetMultiVendor(Vend);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
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
                separator(Action55)
                {
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
                    Caption = 'Cross Re&ferences';
                    Image = Change;
                    // //RunObject = Page "Cross References";
                    // RunPageLink = "Cross-Reference Type"=const(Vendor),
                    //               "Cross-Reference Type No."=field("No.");
                    // RunPageView = sorting("Cross-Reference Type","Cross-Reference Type No.");
                }
                action("Supplier Complaints")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Supplier Complaints";
                    RunPageLink = "Supplier No." = field("No.");
                }
                separator(Action61)
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
                    RunPageView = sorting("Vendor No.");
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
                    Image = CustomerLedger;
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
                                  "Date Filter" = field("Date Filter"),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                }
                action(Action21)
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
            group(SupplierEvaluation)
            {
                Caption = 'Supplier Evaluation';
            }
            action(IndividualEvaluation)
            {
                ApplicationArea = Basic;
                Caption = 'Individual Evaluation';
                RunObject = Page "Individual Evaluation";
                RunPageLink = Vendor = field("No.");
            }
            action(ScoreCriteria)
            {
                ApplicationArea = Basic;
                Caption = 'Score Criteria';
                RunObject = Page "Score Criteria";
            }
            action(ScoreAwarding)
            {
                ApplicationArea = Basic;
                Caption = 'Score Awarding';
                RunObject = Page "Score Awarding";
                RunPageLink = Supplier = field("No.");
            }
            action(DueDiligenceInformation)
            {
                ApplicationArea = Basic;
                Caption = 'Due Diligence Information';
                RunObject = Page "Diligence Information";
            }
            action(DueDiligenceSheet)
            {
                ApplicationArea = Basic;
                Caption = 'Due Diligence Sheet';
                RunObject = Page "Due Delegence Sheet";
                RunPageLink = Supplier = field("No.");
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
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Journal";
            }
        }
        area(reporting)
        {
            group(General)
            {
                Caption = 'General';
                action(VendorList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - List';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor - List";
                }
                action(VendorRegister)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Register';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor Register";
                }
                action(VendorItemCatalog)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Item Catalog';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor Item Catalog";
                }
                action(VendorLabels)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Labels';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor - Labels";
                }
                action(VendorTop10List)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Top 10 List';
                    Image = "Report";
                    RunObject = Report "Vendor - Top 10 List";
                }
            }
            group(ActionGroup5)
            {
                Caption = 'Orders';
                Image = "Report";
                action(VendorOrderSummary)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Order Summary';
                    Image = "Report";
                    RunObject = Report "Vendor - Order Summary";
                }
                action(VendorOrderDetail)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Order Detail';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor - Order Detail";
                }
            }
            group(Purchase)
            {
                Caption = 'Purchase';
                Image = Purchase;
                action(VendorPurchaseList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Purchase List';
                    Image = "Report";
                    RunObject = Report "Vendor - Purchase List";
                }
                action(VendorItemPurchases)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor/Item Purchases';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor/Item Purchases";
                }
                action(PurchaseStatistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Statistics';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Purchase Statistics";
                }
            }
            group(FinancialManagement)
            {
                Caption = 'Financial Management';
                Image = "Report";
                action(PaymentsonHold)
                {
                    ApplicationArea = Basic;
                    Caption = 'Payments on Hold';
                    Image = "Report";
                    RunObject = Report "Payments on Hold";
                }
                action(VendorSummaryAging)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Summary Aging';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor - Summary Aging";
                }
                action(AgedAccountsPayable)
                {
                    ApplicationArea = Basic;
                    Caption = 'Aged Accounts Payable';
                    Image = "Report";
                    RunObject = Report "Aged Accounts Payable";
                }
                action(VendorBalancetoDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Balance to Date';
                    Image = "Report";
                    RunObject = Report "Vendor - Balance to Date";
                }
                action(VendorTrialBalance)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Trial Balance';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor - Trial Balance";
                }
                action(VendorDetailTrialBalance)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Detail Trial Balance';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor - Detail Trial Balance";
                }
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
                actionref(PaymentJournal_Promoted; PaymentJournal)
                {
                }
                actionref(LedgerEntries_Promoted; LedgerEntries)
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
            }
            group(Category_Report)
            {
                actionref(VendorTop10List_Promoted; VendorTop10List)
                {
                }
                actionref(VendorOrderSummary_Promoted; VendorOrderSummary)
                {
                }
                actionref(VendorPurchaseList_Promoted; VendorPurchaseList)
                {
                }
                actionref(PaymentsonHold_Promoted; PaymentsonHold)
                {
                }
                actionref(AgedAccountsPayable_Promoted; AgedAccountsPayable)
                {
                }
                actionref(VendorBalancetoDate_Promoted; VendorBalancetoDate)
                {
                }
            }
        }
    }


    procedure GetSelectionFilter(): Text
    var
        Vend: Record Vendor;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Vend);
        exit(SelectionFilterManagement.GetSelectionFilterForVendor(Vend));
    end;


    procedure SetSelection(var Vend: Record Vendor)
    begin
        CurrPage.SetSelectionFilter(Vend);
    end;
}

