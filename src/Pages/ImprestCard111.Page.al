Page 52193719 "Imprest Card111"
{
    Caption = 'Customer Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Customer;
    SourceTableView = where("Customer Type" = filter(Imprest));

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
                field(City; City)
                {
                    ApplicationArea = Basic;
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
                field(SearchName; "Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(BalanceLCY; "Balance (LCY)")
                {
                    ApplicationArea = Basic;

                    trigger OnDrillDown()
                    var
                        DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
                        CustLedgEntry: Record "Cust. Ledger Entry";
                    begin
                        DtldCustLedgEntry.SetRange("Customer No.", "No.");
                        Copyfilter("Global Dimension 1 Filter", DtldCustLedgEntry."Initial Entry Global Dim. 1");
                        Copyfilter("Global Dimension 2 Filter", DtldCustLedgEntry."Initial Entry Global Dim. 2");
                        Copyfilter("Currency Filter", DtldCustLedgEntry."Currency Code");
                        CustLedgEntry.DrillDownOnEntries(DtldCustLedgEntry);
                    end;
                }
                field(CreditLimitLCY; "Credit Limit (LCY)")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;

                    trigger OnValidate()
                    begin
                        StyleTxt := SetStyle;
                    end;
                }
                field(SalespersonCode; "Salesperson Code")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceZoneCode; "Service Zone Code")
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
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field(BilltoCustomerNo; "Bill-to Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field(InvoiceCopies; "Invoice Copies")
                {
                    ApplicationArea = Basic;
                }
                field(InvoiceDiscCode; "Invoice Disc. Code")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(CopySelltoAddrtoQteFrom; "Copy Sell-to Addr. to Qte From")
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
                field(CustomerPostingGroup; "Customer Posting Group")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(CustomerPriceGroup; "Customer Price Group")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(CustomerDiscGroup; "Customer Disc. Group")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(AllowLineDisc; "Allow Line Disc.")
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
            }
            group(Payments)
            {
                Caption = 'Payments';
                field(ApplicationMethod; "Application Method")
                {
                    ApplicationArea = Basic;
                }
                field(PartnerType; "Partner Type")
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
                field(ReminderTermsCode; "Reminder Terms Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(FinChargeTermsCode; "Fin. Charge Terms Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(CashFlowPaymentTermsCode; "Cash Flow Payment Terms Code")
                {
                    ApplicationArea = Basic;
                }
                field(PrintStatements; "Print Statements")
                {
                    ApplicationArea = Basic;
                }
                field(LastStatementNo; "Last Statement No.")
                {
                    ApplicationArea = Basic;
                }
                field(BlockPaymentTolerance; "Block Payment Tolerance")
                {
                    ApplicationArea = Basic;
                }
                // field(PreferredBankAccount;"Preferred Bank Account")
                // {
                //     ApplicationArea = Basic;
                // }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field(LocationCode; "Location Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(CombineShipments; "Combine Shipments")
                {
                    ApplicationArea = Basic;
                }
                field(Reserve; Reserve)
                {
                    ApplicationArea = Basic;
                }
                field(ShippingAdvice; "Shipping Advice")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(ShipmentMethodCode; "Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(ShippingAgentCode; "Shipping Agent Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(ShippingAgentServiceCode; "Shipping Agent Service Code")
                {
                    ApplicationArea = Basic;
                }
                field(ShippingTime; "Shipping Time")
                {
                    ApplicationArea = Basic;
                }
                field(BaseCalendarCode; "Base Calendar Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                }
                field("Customized Calendar"; CalendarMgmt.CustomizedChangesExist(CustomizedCalEntry."source type"::Customer))
                {
                    ApplicationArea = Basic;
                    Caption = 'Customized Calendar';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        CurrPage.SaveRecord;
                        TestField("Base Calendar Code");
                        CalendarMgmt.ShowCustomizedCalendar(CustomizedCalEntry."source type"::Customer);
                    end;
                }
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
        }
        area(factboxes)
        {
            part(Control1903720907; "Sales Hist. Sell-to FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1907234507; "Sales Hist. Bill-to FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = false;
            }
            part(Control1902018507; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1905532107; "Dimensions FactBox")
            {
                SubPageLink = "Table ID" = const(18),
                              "No." = field("No.");
                Visible = false;
            }
            part(Control1907829707; "Service Hist. Sell-to FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = false;
            }
            part(Control1902613707; "Service Hist. Bill-to FactBox")
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
            group(Customer)
            {
                Caption = '&Customer';
                Image = Customer;
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(18),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action(BankAccounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = Page "Customer Bank Account List";
                    RunPageLink = "Customer No." = field("No.");
                }
                action(DirectDebitMandates)
                {
                    ApplicationArea = Basic;
                    Caption = 'Direct Debit Mandates';
                    Image = MakeAgreement;
                    RunObject = Page "SEPA Direct Debit Mandates";
                    RunPageLink = "Customer No." = field("No.");
                }
                action(ShiptoAddresses)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ship-&to Addresses';
                    Image = ShipAddress;
                    RunObject = Page "Ship-to Address List";
                    RunPageLink = "Customer No." = field("No.");
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
                action(CrossReferences)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cross Re&ferences';
                    Image = Change;
                    // //RunObject = Page "Cross References";
                    // RunPageLink = "Cross-Reference Type"=const(Customer),
                    //               "Cross-Reference Type No."=field("No.");
                    // RunPageView = sorting("Cross-Reference Type","Cross-Reference Type No.");
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Customer),
                                  "No." = field("No.");
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
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Customer Ledger Entries";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    RunObject = Page "Customer Statistics";
                    RunPageLink = "No." = field("No."),
                                  "Date Filter" = field("Date Filter"),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                }
                action(Sales)
                {
                    ApplicationArea = Basic;
                    Caption = 'S&ales';
                    Image = Sales;
                    RunObject = Page "Customer Sales";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                }
                action(EntryStatistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Entry Statistics';
                    Image = EntryStatistics;
                    RunObject = Page "Customer Entry Statistics";
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
                    RunObject = Page "Cust. Stats. by Curr. Lines";
                    RunPageLink = "Customer Filter" = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                  "Date Filter" = field("Date Filter");
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
                        // //ItemTrackingMgt.CallItemTrackingEntryForm(1,"No.",'','','','','');
                    end;
                }
                separator(Action140)
                {
                }
            }
            group(ActionGroup82)
            {
                Caption = 'S&ales';
                Image = Sales;
                action(InvoiceDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice &Discounts';
                    Image = CalculateInvoiceDiscount;
                    RunObject = Page "Cust. Invoice Discounts";
                    RunPageLink = Code = field("Invoice Disc. Code");
                }
                action(Prices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                }
                action(LineDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                }
                action(PrepaymentPercentages)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                }
                action(StdCustSalesCodes)
                {
                    ApplicationArea = Basic;
                    Caption = 'S&td. Cust. Sales Codes';
                    Image = CodesList;
                    RunObject = Page "Standard Customer Sales Codes";
                    RunPageLink = "Customer No." = field("No.");
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action(Quotes)
                {
                    ApplicationArea = Basic;
                    Caption = 'Quotes';
                    Image = Quote;
                    RunObject = Page "Sales Quotes";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Customer No.");
                }
                action(Orders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Sales Order List";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Customer No.");
                }
                action(ReturnOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Order List";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Customer No.");
                }
                group(IssuedDocuments)
                {
                    Caption = 'Issued Documents';
                    Image = Documents;
                    action(IssuedReminders)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Issued &Reminders';
                        Image = OrderReminder;
                        RunObject = Page "Issued Reminder List";
                        RunPageLink = "Customer No." = field("No.");
                        RunPageView = sorting("Customer No.", "Posting Date");
                    }
                    action(IssuedFinanceChargeMemos)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Issued &Finance Charge Memos';
                        Image = FinChargeMemo;
                        RunObject = Page "Issued Fin. Charge Memo List";
                        RunPageLink = "Customer No." = field("No.");
                        RunPageView = sorting("Customer No.", "Posting Date");
                    }
                }
                action(BlanketOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Blanket Orders';
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Sales Orders";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Customer No.");
                }
                action(Jobs)
                {
                    ApplicationArea = Basic;
                    Caption = '&Jobs';
                    Image = Job;
                    RunObject = Page "Job List";
                    RunPageLink = "Bill-to Customer No." = field("No.");
                    RunPageView = sorting("Bill-to Customer No.");
                }
            }
            group(CreditCard)
            {
                Caption = 'Credit Card';
                Image = CreditCard;
                group(CreditCards)
                {
                    Caption = 'Credit Cards';
                    Image = CreditCard;
                    action(Action149)
                    {
                        ApplicationArea = Basic;
                        Caption = 'C&redit Cards';
                        Image = CreditCard;
                        // //RunObject = Page "DO Payment Credit Card List";
                        // RunPageLink = "Customer No."=field("No.");
                    }
                    action(CreditCardsTransactionLogEntries)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Credit Cards Transaction Lo&g Entries';
                        Image = CreditCardLog;
                        // //RunObject = Page "DO Payment Trans. Log Entries";
                        // RunPageLink = "Customer No."=field("No.");
                    }
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceItem;
                action(ServiceOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Service Orders';
                    Image = Document;
                    RunObject = Page "Service Orders";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Customer No.");
                }
                action(ServiceContracts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ser&vice Contracts';
                    Image = ServiceAgreement;
                    RunObject = Page "Customer Service Contracts";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.", "Ship-to Code");
                }
                action(ServiceItems)
                {
                    ApplicationArea = Basic;
                    Caption = 'Service &Items';
                    Image = ServiceItem;
                    RunObject = Page "Service Items";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.", "Ship-to Code", "Item No.", "Serial No.");
                }
            }
        }
        area(creation)
        {
            action(BlanketSalesOrder)
            {
                ApplicationArea = Basic;
                Caption = 'Blanket Sales Order';
                Image = BlanketOrder;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Blanket Sales Order";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(SalesQuote)
            {
                ApplicationArea = Basic;
                Caption = 'Sales Quote';
                Image = Quote;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Sales Quote";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(SalesInvoice)
            {
                ApplicationArea = Basic;
                Caption = 'Sales Invoice';
                Image = Invoice;
                RunObject = Page "Sales Invoice";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(SalesOrder)
            {
                ApplicationArea = Basic;
                Caption = 'Sales Order';
                Image = Document;
                RunObject = Page "Sales Order";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(SalesCreditMemo)
            {
                ApplicationArea = Basic;
                Caption = 'Sales Credit Memo';
                Image = CreditMemo;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Sales Credit Memo";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(SalesReturnOrder)
            {
                ApplicationArea = Basic;
                Caption = 'Sales Return Order';
                Image = ReturnOrder;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Sales Return Order";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(ServiceQuote)
            {
                ApplicationArea = Basic;
                Caption = 'Service Quote';
                Image = Quote;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Service Quote";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(ServiceInvoice)
            {
                ApplicationArea = Basic;
                Caption = 'Service Invoice';
                Image = Invoice;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Service Invoice";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(ServiceOrder)
            {
                ApplicationArea = Basic;
                Caption = 'Service Order';
                Image = Document;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Service Order";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(ServiceCreditMemo)
            {
                ApplicationArea = Basic;
                Caption = 'Service Credit Memo';
                Image = CreditMemo;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Service Credit Memo";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(Reminder)
            {
                ApplicationArea = Basic;
                Caption = 'Reminder';
                Image = Reminder;
                RunObject = Page Reminder;
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
            }
            action(FinanceChargeMemo)
            {
                ApplicationArea = Basic;
                Caption = 'Finance Charge Memo';
                Image = FinChargeMemo;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Finance Charge Memo";
                RunPageLink = "Customer No." = field("No.");
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
            action(CashReceiptJournal)
            {
                ApplicationArea = Basic;
                Caption = 'Cash Receipt Journal';
                Image = CashReceiptJournal;
                RunObject = Page "Cash Receipt Journal";
            }
            action(SalesJournal)
            {
                ApplicationArea = Basic;
                Caption = 'Sales Journal';
                Image = Journals;
                RunObject = Page "Sales Journal";
            }
        }
        area(reporting)
        {
            action(CustomerDetailedAging)
            {
                ApplicationArea = Basic;
                Caption = 'Customer Detailed Aging';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Customer Detailed Aging";
            }
            action(CustomerLabels)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Labels';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Customer - Labels";
            }
            action(CustomerBalancetoDate)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Balance to Date';
                Image = "Report";
                RunObject = Report "Customer - Balance to Date";
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(SalesInvoice_Promoted; SalesInvoice)
                {
                }
                actionref(SalesOrder_Promoted; SalesOrder)
                {
                }
                actionref(Reminder_Promoted; Reminder)
                {
                }
            }
            group(Category_Process)
            {
                actionref(ApplyTemplate_Promoted; ApplyTemplate)
                {
                }
                actionref(CashReceiptJournal_Promoted; CashReceiptJournal)
                {
                }
                actionref(SalesJournal_Promoted; SalesJournal)
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
            }
            group(Category_Report)
            {
                actionref(CustomerBalancetoDate_Promoted; CustomerBalancetoDate)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        ActivateFields;
        StyleTxt := SetStyle;
    end;

    trigger OnAfterGetRecord()
    begin
        ActivateFields;
        StyleTxt := SetStyle;
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
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        CalendarMgmt: Codeunit "Calendar Management";
        StyleTxt: Text;

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

