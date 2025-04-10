
page 50140 "Legal Services  Role Center"
{
    Caption = 'HOD Legal Services Role Center', Comment = '{Dependency=Match,"ProfileDescription_Legal Services Role Center"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1901197008; "New Case Register List")
                {
                    ApplicationArea = Basic, Suite;
                }
                part(Control1907692008; "My Customers")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group(Control1900724708)
            {
                part(Control17; "My Job Queue")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control1902476008; "My Vendors")
                {
                    ApplicationArea = Basic, Suite;
                }
                part(Control18; "Report Inbox Part")
                {
                    ApplicationArea = Basic, Suite;
                }
                systempart(Control1901377608; MyNotes)
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("A&ccount Schedule")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'A&ccount Schedule';
                Image = "Report";
                RunObject = Report "Account Schedule";
                ToolTip = 'Analyze figures in general ledger accounts or compare general ledger entries with general ledger budget entries. For example, you can view the G/L entries as percentages of the budget entries. You use the Account Schedule window to set up account schedules.';
            }
            group("&Trial Balance")
            {
                Caption = '&Trial Balance';
                Image = Balance;
                action("&G/L Trial Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&G/L Trial Balance';
                    Image = "Report";
                    RunObject = Report "Trial Balance";
                    ToolTip = 'View, print, or send a report that shows the balances for the general ledger accounts, including the debits and credits. You can use this report to ensure accurate accounting practices.';
                }
                action("Bank &Detail Trial Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank &Detail Trial Balance';
                    Image = "Report";
                    RunObject = Report "Bank Acc. - Detail Trial Bal.";
                    ToolTip = 'View transactions for all bank accounts with subtotals per account. Each account shows the opening balance on the first line, the list of transactions for the account and a closing balance on the last line.';
                }
                action("T&rial Balance/Budget")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'T&rial Balance/Budget';
                    Image = "Report";
                    RunObject = Report "Trial Balance/Budget";
                    ToolTip = 'View a trial balance in comparison to a budget. You can choose to see a trial balance for selected dimensions. You can use the report at the close of an accounting period or fiscal year.';
                }
                action("Trial Balance by &Period")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Trial Balance by &Period';
                    Image = "Report";
                    RunObject = Report "Trial Balance by Period";
                    ToolTip = 'Show the opening balance by general ledger account, the movements in the selected period of month, quarter, or year, and the resulting closing balance.';
                }
                action("Closing Tria&l Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Closing Tria&l Balance';
                    Image = "Report";
                    RunObject = Report "Closing Trial Balance";
                    ToolTip = 'View this year''s and last year''s figures as an ordinary trial balance. For income statement accounts, the balances are shown without closing entries. Closing entries are listed on a fictitious date that falls between the last day of one fiscal year and the first day of the next one. The closing of the income statement accounts is posted at the end of a fiscal year. The report can be used in connection with closing a fiscal year.';
                }
            }
            action("&Fiscal Year Balance")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Fiscal Year Balance';
                Image = "Report";
                RunObject = Report "Fiscal Year Balance";
                ToolTip = 'View, print, or send a report that shows balance sheet movements for selected periods. The report shows the closing balance by the end of the previous fiscal year for the selected ledger accounts. It also shows the fiscal year until this date, the fiscal year by the end of the selected period, and the balance by the end of the selected period, excluding the closing entries. The report can be used at the close of an accounting period or fiscal year.';
            }
            action("Balance C&omp. . Prev. Year")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance C&omp. . Prev. Year';
                Image = "Report";
                RunObject = Report "Balance Comp. - Prev. Year";
                ToolTip = 'View a report that shows your company''s assets, liabilities, and equity compared to the previous year.';
            }
            separator(Action49)
            {
            }
            action("&Aged Accounts Receivable")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Aged Accounts Receivable';
                Image = "Report";
                RunObject = Report "Aged Accounts Receivable";
                ToolTip = 'View overdue customer payments.';
            }
            action("Aged Accou&nts Payable")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Aged Accou&nts Payable';
                Image = "Report";
                RunObject = Report "Aged Accounts Payable";
                ToolTip = 'View an overview of when your payables to vendors are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
            }
            action("Reconcile Customer and &Vendor Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Reconcile Customer and &Vendor Accounts';
                Image = "Report";
                RunObject = Report "Reconcile Cust. and Vend. Accs";
                ToolTip = 'View if a certain general ledger account reconciles the balance on a certain date for the corresponding posting group. The report shows the accounts that are included in the reconciliation with the general ledger balance and the customer or the vendor ledger balance for each account and shows any differences between the general ledger balance and the customer or vendor ledger balance.';
            }
            separator(Action53)
            {
            }
            action("VAT Reg&istration No. Check")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT Reg&istration No. Check';
                Image = "Report";
                RunObject = Report "VAT Registration No. Check";
                ToolTip = 'Use an EU VAT number validation service to validated the VAT number of a business partner.';
            }
            action("VAT E&xceptions")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT E&xceptions';
                Image = "Report";
                RunObject = Report "VAT Exceptions";
                ToolTip = 'View the VAT entries that were posted and placed in a general ledger register in connection with a VAT difference. The report is used to document adjustments made to VAT amounts that were calculated for use in internal or external auditing.';
            }
            action("VAT State&ment")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT State&ment';
                Image = "Report";
                RunObject = Report "VAT Statement";
                ToolTip = 'View a statement of posted VAT and calculate the duty liable to the customs authorities for the selected period.';
            }
            action("G/L - VAT Reconciliation")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'G/L - VAT Reconciliation';
                Image = "Report";
                RunObject = Report "G/L - VAT Reconciliation";
                ToolTip = 'Verify that the VAT amounts on the VAT statements match the amounts from the G/L entries.';
            }
            action("VAT - VI&ES Declaration Tax Auth")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT - VI&ES Declaration Tax Auth';
                Image = "Report";
                RunObject = Report "VAT- VIES Declaration Tax Auth";
                ToolTip = 'View information to the customs and tax authorities for sales to other EU countries/regions. If the information must be printed to a file, you can use the VAT- VIES Declaration Disk report.';
            }
            action("VAT - VIES Declaration Dis&k")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT - VIES Declaration Dis&k';
                Image = "Report";
                RunObject = Report "VAT- VIES Declaration Disk";
                ToolTip = 'Report your sales to other EU countries or regions to the customs and tax authorities. If the information must be printed out on a printer, you can use the VAT- VIES Declaration Tax Auth report. The information is shown in the same format as in the declaration list from the customs and tax authorities.';
            }
            action("EC &Sales List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'EC &Sales List';
                Image = "Report";
                RunObject = Report "EC Sales List";
                ToolTip = 'Calculate VAT amounts from sales, and submit the amounts to a tax authority.';
            }
        }
        area(embedding)
        {
            ToolTip = 'Collect and make payments, prepare statements, and manage reminders.';
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'View the chart of accounts.';
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            }
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(CustomersBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Customer List";
                RunPageView = where("Balance (LCY)" = filter(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action(VendorsBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Vendor List";
                RunPageView = where("Balance (LCY)" = filter(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action(VendorsPaymentonHold)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Payment on Hold';
                RunObject = Page "Vendor List";
                RunPageView = where(Blocked = filter(Payment));
                ToolTip = 'View a list of all vendor ledger entries on which the On Hold field is marked.';
            }
            action("VAT Statements")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VAT Statements';
                RunObject = Page "VAT Statement Names";
                ToolTip = 'View a statement of posted VAT amounts, calculate your VAT settlement amount for a certain period, such as a quarter, and prepare to send the settlement to the tax authorities.';
            }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoices';
                RunObject = Page "Purchase Invoices";
                ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action("Purchase Orders")
            {
                ApplicationArea = Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action("Sales Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoices';
                Image = Invoice;
                RunObject = Page "Sales Invoice List";
                ToolTip = 'Register your sales to customers and invite them to pay according to the delivery and payment terms by sending them a sales invoice document. Posting a sales invoice registers shipment and records an open receivable entry on the customer''s account, which will be closed when payment is received. To manage the shipment process, use sales orders, in which sales invoicing is integrated.';
            }
            action("Sales Orders")
            {
                ApplicationArea = Suite;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
                ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
            }
            action(Approvals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Approvals';
                Image = Approvals;
                RunObject = Page "Requests to Approve";
                ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';
            }
            action(CashReceiptJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cash Receipt Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const("Cash Receipts"),
                                    Recurring = const(false));
                ToolTip = 'Register received payments by manually applying them to the related customer, vendor, or bank ledger entries. Then, post the payments to G/L accounts and thereby close the related ledger entries.';
            }
            action(PaymentJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(Payments),
                                    Recurring = const(false));
                ToolTip = 'Register payments to vendors. A payment journal is a type of general journal that is used to post outgoing payment transactions to G/L, bank, customer, vendor, employee, and fixed assets accounts. The Suggest Vendor Payments functions automatically fills the journal with payments that are due. When payments are posted, you can export the payments to a bank file for upload to your bank if your system is set up for electronic banking. You can also issue computer checks from the payment journal.';
            }
            action(GeneralJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'General Journals';
                Image = Journal;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(General),
                                    Recurring = const(false));
                ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
            }
            action(RecurringGeneralJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Recurring General Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(General),
                                    Recurring = const(true));
                ToolTip = 'Define how to post transactions that recur with few or no changes to general ledger, bank, customer, vendor, or fixed asset accounts';
            }
            action("Intrastat Journals")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Intrastat Journals';
                visible = false;
                // RunObject = Page "Intrastat Jnl. Batches";
                ToolTip = 'Summarize the value of your purchases and sales with business partners in the EU for statistical purposes and prepare to send it to the relevant authority.';
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View posted invoices and credit memos, and analyze G/L registers.';
                action("Posted Sales Shipments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Sales Shipments";
                    ToolTip = 'Open the list of posted sales shipments.';
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action("Posted Return Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Return Receipts';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Posted Return Receipts";
                    ToolTip = 'Open the list of posted return receipts.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action("Posted Return Shipments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Open the list of posted return shipments.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("Issued Reminders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Reminders';
                    Image = OrderReminder;
                    RunObject = Page "Issued Reminder List";
                    ToolTip = 'View the list of issued reminders.';
                }
                action("Issued Fi. Charge Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Fi. Charge Memos';
                    RunObject = Page "Issued Fin. Charge Memo List";
                    ToolTip = 'View the list of issued finance charge memos.';
                }
                action("G/L Registers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = Page "G/L Registers";
                    ToolTip = 'View posted G/L entries.';
                }
            }
            group("Case Management")
            {
                Caption = 'Case Management';
                action("New Case Register List")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Case Register List';
                    RunObject = Page "New Case Register List";
                    ToolTip = 'Executes the New Case Register List action.';
                }
                action("On-Going Case")
                {
                    ApplicationArea = Basic;
                    Caption = 'On-Going Case';
                    RunObject = Page "Case Register List";
                    ToolTip = 'Executes the On-Going Case action.';
                }
                action("Closed Cases")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Cases';
                    RunObject = Page "Close Case Registers";
                    ToolTip = 'Executes the Closed Cases action.';
                }
                action("Appealed Case Register List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appealed Case Register List';
                    // RunObject = Page "Appealed Case Register List";
                    // ToolTip = 'Executes the Appealed Case Register List action.';
                }

                action("Litigation Status Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Litigation Status Report';
                    Visible = false;
                    // RunObject = Report "Litigation Status Report New";
                    ToolTip = 'Executes the Litigation Status Report action.';
                }
                action("Case Register Detailed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Case Register Detailed';
                    // RunObject = Report "Case Register New";
                    Visible = false;
                    ToolTip = 'Executes the Case Register Detailed action.';
                }
                action("Archived Cases Detailed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Archived Cases Detailed';
                    // RunObject = Report "Archived Cases New 2";
                    Visible = false;
                    ToolTip = 'Executes the Archived Cases Detailed action.';
                }
            }
            group("Contract Administration")
            {
                Caption = 'Contract Administration';
                action("Contract List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract List';
                    RunObject = Page "Contract List";
                    ToolTip = 'Executes the Contract List action.';
                }
                action("On-Going Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'On-Going Contracts';
                    RunObject = Page "Ongoing Contracts";
                    ToolTip = 'Executes the On-Going Contracts action.';
                }
                action("Approved Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Contracts';
                    RunObject = Page "Approved Contracts";
                    ToolTip = 'Executes the Approved Contracts action.';
                }
                action("Expired Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Expired Contracts';
                    RunObject = Page "Expired Contracts";
                    ToolTip = 'Executes the Expired Contracts action.';
                }
                action("Framework Agreements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Framework Agreements';
                    RunObject = Page "Framework Agreements";
                    ToolTip = 'Executes the Framework Agreements action.';
                }
                action("Purchase Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Order';
                    RunObject = Page "Purchase Order List";
                    ToolTip = 'Executes the Purchase Order action.';
                }
                action("Inspection Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inspection Vouchers';
                    ToolTip = 'Executes the Inspection Vouchers action.';
                }
                action("Payment Certificate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payment Certificate';
                    ToolTip = 'Executes the Payment Certificate action.';
                }
                action("Addendum Contract List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Addendum Contract List';
                    RunObject = Page "Addendum Contract List";
                    ToolTip = 'Executes the Addendum Contract List action.';
                }
            }
            group("E-Board Management")
            {
                Caption = 'E-Board Management';
                Image = FiledPosted;
                ToolTip = 'View posted invoices and credit memos, and analyze G/L registers.';
                action(Board)
                {
                    ApplicationArea = Basic;
                    Caption = 'Board';
                    // RunObject = Page "Board Committee";
                    Visible = false;
                    ToolTip = 'Executes the Board action.';
                }
                action("Board Committes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Committes';
                    RunObject = Page "Board Committees";
                    ToolTip = 'Executes the Board Committes action.';
                }
                action(Trusts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Trusts';
                    // RunObject = Page Trusts;
                    Visible = false;
                    ToolTip = 'Executes the Trusts action.';
                }
                action("Board Meetings")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meetings';
                    RunObject = Page "Board Meetings List";
                    ToolTip = 'Executes the Board Meetings action.';
                }
                action("Board Committe Meetings")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Committe Meetings';
                    // RunObject = Page "Board Meetings";
                    Visible = false;
                    ToolTip = 'Executes the Board Committe Meetings action.';
                }
                action("Board Resolutions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Resolutions';
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    // RunObject = Page "Board Resolutions";
                    Visible = false;
                    ToolTip = 'Executes the Board Resolutions action.';
                }
                action("Published Board Meeting List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Published Board Meeting List';
                    Visible = false;
                    // RunObject = Page "Published Board Meeting List";
                    ToolTip = 'Executes the Published Board Meeting List action.';
                }
            }
            group(Members)
            {
                Caption = 'Members';
                action("Member List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member List';
                    //    RunObject = Page "Director List";
                    ToolTip = 'Executes the Member List action.';
                }
                action("Member Earnings")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Earnings';
                    // RunObject = Page "Directors Earnings";
                    Visible = false;
                    ToolTip = 'Executes the Member Earnings action.';
                }
                action("Member Deduction")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Deduction';
                    // RunObject = Page "Director Deduction";
                    Visible = false;
                    ToolTip = 'Executes the Member Deduction action.';
                }
                action("Member Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Ledger Entries';
                    // RunObject = Page "Director Ledger Entries";
                    Visible = false;
                    ToolTip = 'Executes the Member Ledger Entries action.';
                }
                action("Inactive Director List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inactive Director List';
                    //  RunObject = Page "Inactive Director List";
                    ToolTip = 'Executes the Inactive Director List action.';
                }
            }
            group(Setup)
            {
                Caption = 'Setup';
                action("Court Houses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Court Houses';
                    RunObject = Page "Court Houses";
                    ToolTip = 'Executes the Court Houses action.';
                }
                action("Company Judges")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Judges';
                    RunObject = Page "Case Judges";
                    ToolTip = 'Executes the Company Judges action.';
                }
                action(Action108)
                {
                    ApplicationArea = Basic;
                    Caption = 'Setup';
                    ToolTip = 'Executes the Setup action.';
                }
                action("Plainfiffs All")
                {
                    ApplicationArea = Basic;
                    Caption = 'Plainfiffs All';
                    RunObject = Page "Plaintiffs All";
                    ToolTip = 'Executes the Plainfiffs All action.';
                }
                action("Defendanst All")
                {
                    ApplicationArea = Basic;
                    Caption = 'Defendanst All';
                    RunObject = Page "Defendants All";
                    ToolTip = 'Executes the Defendanst All action.';
                }
                action("Nature Of Cases")
                {
                    ApplicationArea = Basic;
                    Caption = 'Nature Of Cases';
                    RunObject = Page "Nature of Cases";
                    ToolTip = 'Executes the Nature Of Cases action.';
                }
                action("Case Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'Case Types';
                    RunObject = Page "Case Types";
                    ToolTip = 'Executes the Case Types action.';
                }
                action("Case Advocates")
                {
                    ApplicationArea = Basic;
                    Caption = 'Case Advocates';
                    RunObject = Page "Case Advocates";
                    ToolTip = 'Executes the Case Advocates action.';
                }
            }
            group(ActionGroup22)
            {
                Caption = 'Approvals';
                ToolTip = 'Request approval of your documents, cards, or journal lines or, as the approver, approve requests made by other users.';
                action("Requests Sent for Approval")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Requests Sent for Approval';
                    Image = Approvals;
                    RunObject = Page "Approval Entries";
                    RunPageView = where(Status = filter(Open));
                    ToolTip = 'View the approval requests that you have sent.';
                }
                action(RequestsToApprove)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Requests to Approve';
                    Image = Approvals;
                    RunObject = Page "Requests to Approve";
                    ToolTip = 'Accept or reject other users'' requests to create or change certain documents, cards, or journal lines that you must approve before they can proceed. The list is filtered to requests where you are set up as the approver.';
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                Image = Administration;
                action(Currencies)
                {
                    ApplicationArea = Suite;
                    Caption = 'Currencies';
                    Image = Currency;
                    RunObject = Page Currencies;
                    ToolTip = 'View the different currencies that you trade in or update the exchange rates by getting the latest rates from an external service provider.';
                }
                action("Accounting Periods")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Accounting Periods';
                    Image = AccountingPeriods;
                    RunObject = Page "Accounting Periods";
                    ToolTip = 'Set up the number of accounting periods, such as 12 monthly periods, within the fiscal year and specify which period is the start of the new fiscal year.';
                }
                action("Number Series")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Number Series';
                    RunObject = Page "No. Series";
                    ToolTip = 'View or edit the number series that are used to organize transactions';
                }
            }
        }
        // Page "Customer Card";
        //     RunPageMode = Create;
        //     ToolTip = 'Create a new customer card.';
        // Page "Sales Invoice";
        //     RunPageMode = Create;
        //     ToolTip = 'Create a new invoice for the sales of items or services. Invoice quantities cannot be posted partially.';
        // Page "Sales Credit Memo";
        //     RunPageMode = Create;
        //     ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
        // Page "Finance Charge Memo";
        //     RunPageMode = Create;
        //     ToolTip = 'Create a new finance charge memo to fine a customer for late payment.';
        // Page Reminder;
        //     RunPageMode = Create;
        //     ToolTip = 'Create a new reminder for a customer who has overdue payments.';
        // Page "Vendor Card";
        //     RunPageMode = Create;
        //     ToolTip = 'Set up a new vendor from whom you buy goods or services. ';
        // Page "Purchase Invoice";
        //     RunPageMode = Create;
        //     ToolTip = 'Create new purchase invoice.';
        // Page "Cash Receipt Journal";
        //     ToolTip = 'Open the cash receipt journal to post incoming payments.';
        // Page "Payment Journal";
        //     ToolTip = 'View or edit the payment journal where you can register payments to vendors.';
        // Page "Payment Registration";
        //     ToolTip = 'Apply customer payments observed on your bank account to non-posted sales documents to record that payment is made.';
        // Page "Pmt. Reconciliation Journals";
        //     RunPageMode = View;
        //     ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing a bank statement feed or file. In the payment reconciliation journal, incoming or outgoing payments on your bank are automatically, or semi-automatically, applied to their related open customer or vendor ledger entries. Any open bank account ledger entries related to the applied customer or vendor ledger entries will be closed when you choose the Post Payments and Reconcile Bank Account action. This means that the bank account is automatically reconciled for payments that you post with the journal.';
        // Page "Bank Acc. Reconciliation";
        //     ToolTip = 'Reconcile entries in your bank account ledger entries with the actual transactions in your bank account, according to the latest bank statement.';
        // Report "Adjust Exchange Rates";
        //     ToolTip = 'Adjust general ledger, customer, vendor, and bank account entries to reflect a more updated balance if the exchange rate has changed since the entries were posted.';
        // Report "Post Inventory Cost to G/L";
        //     ToolTip = 'Post the quantity and value changes to the inventory in the item ledger entries and the value entries when you post inventory transactions, such as sales shipments or purchase receipts.';
        // Report "Calc. and Post VAT Settlement";
        //     ToolTip = 'Close open VAT entries and transfers purchase and sales VAT amounts to the VAT settlement account. For every VAT posting group, the batch job finds all the VAT entries in the VAT Entry table that are included in the filters in the definition window.';
        // Page "Sales & Receivables Setup";
        //     ToolTip = 'Define your general policies for sales invoicing and returns, such as when to show credit and stockout warnings and how to post sales discounts. Set up your number series for creating customers and different sales documents.';
        // Page Navigate;
        //     ""
    }
}
