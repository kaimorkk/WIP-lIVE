Page 52193423 "Debtors List"
{
    Caption = 'Customer List';
    CardPageID = "Customer Card";
    Editable = false;
    PageType = List;
    SourceTable = Customer;
    SourceTableView = where("Customer Type" = filter(Debtor));

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
                field(Control34; Contact)
                {
                    ApplicationArea = Basic;
                }
                field(SalespersonCode; "Salesperson Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CustomerPostingGroup; "Customer Posting Group")
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
                field(CustomerPriceGroup; "Customer Price Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CustomerDiscGroup; "Customer Disc. Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PaymentTermsCode; "Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ReminderTermsCode; "Reminder Terms Code")
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
                field(CreditLimitLCY; "Credit Limit (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                field(CombineShipments; "Combine Shipments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Reserve; Reserve)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ShippingAdvice; "Shipping Advice")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ShippingAgentCode; "Shipping Agent Code")
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
            part(Control1903720907; "Sales Hist. Sell-to FactBox")
            {
                SubPageLink = "No." = field("No.");
                Visible = true;
            }
            part(Control1907234507; "Sales Hist. Bill-to FactBox")
            {
                SubPageLink = "No." = field("No.");
                Visible = false;
            }
            part(Control1902018507; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = field("No.");
                Visible = true;
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                SubPageLink = "No." = field("No.");
                Visible = false;
            }
            part(Control1907829707; "Service Hist. Sell-to FactBox")
            {
                SubPageLink = "No." = field("No.");
                Visible = false;
            }
            part(Control1902613707; "Service Hist. Bill-to FactBox")
            {
                SubPageLink = "No." = field("No.");
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
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = CustomerLedger;
                    RunObject = Page "Customer Ledger Entries";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                group(IssuedDocuments)
                {
                    Caption = 'Issued Documents';
                    action(IssuedReminders)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Issued &Reminders';
                        RunObject = Page "Issued Reminder List";
                        RunPageLink = "Customer No." = field("No.");
                        RunPageView = sorting("Customer No.", "Posting Date");
                    }
                    action(IssuedFinanceChargeMemos)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Issued &Finance Charge Memos';
                        RunObject = Page "Issued Fin. Charge Memo List";
                        RunPageLink = "Customer No." = field("No.");
                        RunPageView = sorting("Customer No.", "Posting Date");
                    }
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
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(18),
                                      "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action(DimensionsMultiple)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';

                        trigger OnAction()
                        var
                            Cust: Record Customer;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Cust);
                            // DefaultDimMultiple.SetMultiCust(Cust);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action(BankAccounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Accounts';
                    RunObject = Page "Customer Bank Account List";
                    RunPageLink = "Customer No." = field("No.");
                }
                action(ShiptoAddresses)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ship-&to Addresses';
                    RunObject = Page "Ship-to Address List";
                    RunPageLink = "Customer No." = field("No.");
                }
                action(Contact)
                {
                    ApplicationArea = Basic;
                    Caption = 'C&ontact';

                    trigger OnAction()
                    begin
                        ShowContact;
                    end;
                }
                separator(Action59)
                {
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
                action(EntryStatistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Entry Statistics';
                    RunObject = Page "Customer Entry Statistics";
                    RunPageLink = "No." = field("No."),
                                  "Date Filter" = field("Date Filter"),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                }
                action(Sales)
                {
                    ApplicationArea = Basic;
                    Caption = 'S&ales';
                    RunObject = Page "Customer Sales";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                }
                separator(Action44)
                {
                }
                action(CrossReferences)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cross Re&ferences';
                    // //RunObject = Page "Cross References";
                    // RunPageLink = "Cross-Reference Type"=const(Customer),
                    //               "Cross-Reference Type No."=field("No.");
                    // RunPageView = sorting("Cross-Reference Type","Cross-Reference Type No.");
                }
                separator(Action67)
                {
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
                    RunObject = Page "Service Items";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.", "Ship-to Code", "Item No.", "Serial No.");
                }
                separator(Action83)
                {
                }
                action(CreditCards)
                {
                    ApplicationArea = Basic;
                    Caption = 'C&redit Cards';
                    // //RunObject = Page "DO Payment Credit Card List";
                    // RunPageLink = "Customer No."=field("No.");
                }
                action(CreditCardsTransactionLogEntries)
                {
                    ApplicationArea = Basic;
                    //Caption = 'RunObject = Page "DO Payment Trans. Log Entries";
                    // RCredit Cards Transaction Lo&g Entries';
                    // unPageLink = "Customer No."=field("No.");
                }
            }
            group(ActionGroup24)
            {
                Caption = 'S&ales';
                action(InvoiceDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice &Discounts';
                    RunObject = Page "Cust. Invoice Discounts";
                    RunPageLink = Code = field("Invoice Disc. Code");
                }
                action(Prices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prices';
                    Image = ResourcePrice;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                }
                action(LineDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Line Discounts';
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                }
                action(PrepaymentPercentages)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Percentages';
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                }
                action(StdCustSalesCodes)
                {
                    ApplicationArea = Basic;
                    Caption = 'S&td. Cust. Sales Codes';
                    RunObject = Page "Standard Customer Sales Codes";
                    RunPageLink = "Customer No." = field("No.");
                }
                separator(Action74)
                {
                }
                action(Quotes)
                {
                    ApplicationArea = Basic;
                    Caption = 'Quotes';
                    Image = Quote;
                    RunObject = Page "Sales Quotes";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Sell-to Customer No.");
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
                action(Orders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Sales Order List";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Sell-to Customer No.");
                }
                action(ReturnOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Order List";
                }
                action(ServiceOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Service Orders';
                    Image = Document;
                    RunObject = Page "Service Orders";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Customer No.");
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
            action(FinancialChargeMemo)
            {
                ApplicationArea = Basic;
                Caption = 'Financial Charge Memo';
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
            action(CustomerList)
            {
                ApplicationArea = Basic;
                Caption = 'Customer List';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Customer - List";
            }
            action(CustomerRegister)
            {
                ApplicationArea = Basic;
                Caption = 'Customer Register';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Customer Register";
            }
            action(CustomerDetailTrialBal)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Detail Trial Bal.';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Customer - Detail Trial Bal.";
            }
            action(CustomerSummaryAging)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Summary Aging';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Customer - Summary Aging";
            }
            action(CustomerDetailedAging)
            {
                ApplicationArea = Basic;
                Caption = 'Customer Detailed Aging';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Customer Detailed Aging";
            }
            action(CustomerOrderSummary)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Order Summary';
                RunObject = Report "Customer - Order Summary";
            }
            action(CustomerOrderDetail)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Order Detail';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Customer - Order Detail";
            }
            action(CustomerTop10List)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Top 10 List';
                RunObject = Report "Customer - Top 10 List";
            }
            action(SalesStatistics)
            {
                ApplicationArea = Basic;
                Caption = 'Sales Statistics';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Sales Statistics";
            }
            action(CustomerItemSales)
            {
                ApplicationArea = Basic;
                Caption = 'Customer/Item Sales';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Customer/Item Sales";
            }
            action(Statement)
            {
                ApplicationArea = Basic;
                Caption = 'Statement';
                RunObject = Report Statement;
            }
            action(Action1903839806)
            {
                ApplicationArea = Basic;
                Caption = 'Reminder';
                Image = Reminder;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report Reminder;
            }
            action(CustomerSalesList)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Sales List';
                RunObject = Report "Customer - Sales List";
            }
            action(AgedAccountsReceivable)
            {
                ApplicationArea = Basic;
                Caption = 'Aged Accounts Receivable';
                RunObject = Report "Aged Accounts Receivable";
            }
            action(CustomerBalancetoDate)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Balance to Date';
                RunObject = Report "Customer - Balance to Date";
            }
            action(CustomerTrialBalance)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Trial Balance';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Customer - Trial Balance";
            }
            action(CustomerPaymentReceipt)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - Payment Receipt';
                RunObject = Report "Customer - Payment Receipt";
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(SalesQuote_Promoted; SalesQuote)
                {
                }
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
                actionref(CashReceiptJournal_Promoted; CashReceiptJournal)
                {
                }
                actionref(SalesJournal_Promoted; SalesJournal)
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
                actionref(CustomerOrderSummary_Promoted; CustomerOrderSummary)
                {
                }
                actionref(CustomerTop10List_Promoted; CustomerTop10List)
                {
                }
                actionref(Statement_Promoted; Statement)
                {
                }
                actionref(CustomerSalesList_Promoted; CustomerSalesList)
                {
                }
                actionref(AgedAccountsReceivable_Promoted; AgedAccountsReceivable)
                {
                }
                actionref(CustomerBalancetoDate_Promoted; CustomerBalancetoDate)
                {
                }
                actionref(CustomerPaymentReceipt_Promoted; CustomerPaymentReceipt)
                {
                }
            }
        }
    }


    procedure GetSelectionFilter(): Code[80]
    var
        Cust: Record Customer;
        FirstCust: Code[30];
        LastCust: Code[30];
        SelectionFilter: Code[250];
        CustCount: Integer;
        More: Boolean;
    begin
        CurrPage.SetSelectionFilter(Cust);
        CustCount := Cust.Count;
        if CustCount > 0 then begin
            Cust.Find('-');
            while CustCount > 0 do begin
                CustCount := CustCount - 1;
                Cust.MarkedOnly(false);
                FirstCust := Cust."No.";
                LastCust := FirstCust;
                More := (CustCount > 0);
                while More do
                    if Cust.Next = 0 then
                        More := false
                    else
                        if not Cust.Mark then
                            More := false
                        else begin
                            LastCust := Cust."No.";
                            CustCount := CustCount - 1;
                            if CustCount = 0 then
                                More := false;
                        end;
                if SelectionFilter <> '' then
                    SelectionFilter := SelectionFilter + '|';
                if FirstCust = LastCust then
                    SelectionFilter := SelectionFilter + FirstCust
                else
                    SelectionFilter := SelectionFilter + FirstCust + '..' + LastCust;
                if CustCount > 0 then begin
                    Cust.MarkedOnly(true);
                    Cust.Next;
                end;
            end;
        end;
        exit(SelectionFilter);
    end;


    procedure SetSelection(var Cust: Record Customer)
    begin
        CurrPage.SetSelectionFilter(Cust);
    end;
}

