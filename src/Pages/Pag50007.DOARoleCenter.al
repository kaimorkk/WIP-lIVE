 
    /// <summary>
/// Page DBSL Accountant Role Center (ID 69999).
/// </summary>
page 50007 "GRM Accountant Role Center"
{
    Caption = 'Accountant', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control76; "Headline Judiciary")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control99; "Finance Performance")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control1902304208; "Accountant Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control123; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control1907692008; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control103; "Trailing Sales Orders Chart")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control106; "My Job Queue")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control9; "Help And Chart Wrapper")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control100; "Cash Flow Forecast Chart")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control108; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
            // part(PowerBIEmbeddedReportPart; "Power BI Embedded Report Part")
            // {
            //     ApplicationArea = Basic, Suite;
            // }
            part(Control122; "Power BI Report Spinner Part")
            {
                ApplicationArea = Basic, Suite;
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced by PowerBIEmbeddedReportPart';
                Visible = false;
                ObsoleteTag = '21.0';
            }
            // part(Control1901377608; MyNotes)
            // {
            //     ApplicationArea = Basic, Suite;
            // }
        }
    }
    actions
    {
        area(reporting)
        {
            group("G/L Reports")
            {
                Caption = 'G/L Reports';

                action("&G/L Trial Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&G/L Trial Balance';
                    Image = "Report";
                    RunObject = Report "Trial Balance";
                    ToolTip = 'View, print, or send a report that shows the balances for the general ledger accounts, including the debits and credits. You can use this report to ensure accurate accounting practices.';
                }
                action("&Bank Detail Trial Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Bank Detail Trial Balance';
                    Image = "Report";
                    RunObject = Report "Bank Acc. - Detail Trial Bal.";
                    ToolTip = 'View, print, or send a report that shows a detailed trial balance for selected bank accounts. You can use the report at the close of an accounting period or fiscal year.';
                }
                action("&Account Schedule")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Account Schedule';
                    Image = "Report";
                    RunObject = Report "Account Schedule";
                    ToolTip = 'Open an account schedule to analyze figures in general ledger accounts or to compare general ledger entries with general ledger budget entries.';
                }
                action("Bu&dget")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bu&dget';
                    Image = "Report";
                    RunObject = Report Budget;
                    ToolTip = 'View or edit estimated amounts for a range of accounting periods.';
                }
                action("Trial Bala&nce/Budget")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Trial Bala&nce/Budget';
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
                action("&Fiscal Year Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Fiscal Year Balance';
                    Image = "Report";
                    RunObject = Report "Fiscal Year Balance";
                    ToolTip = 'View, print, or send a report that shows balance sheet movements for selected periods. The report shows the closing balance by the end of the previous fiscal year for the selected ledger accounts. It also shows the fiscal year until this date, the fiscal year by the end of the selected period, and the balance by the end of the selected period, excluding the closing entries. The report can be used at the close of an accounting period or fiscal year.';
                }
                action("Balance Comp. - Prev. Y&ear")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Balance Comp. - Prev. Y&ear';
                    Image = "Report";
                    RunObject = Report "Balance Comp. - Prev. Year";
                    ToolTip = 'View a report that shows your company''s assets, liabilities, and equity compared to the previous year.';
                }
                action("&Closing Trial Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Closing Trial Balance';
                    Image = "Report";
                    RunObject = Report "Closing Trial Balance";
                    ToolTip = 'View, print, or send a report that shows this year''s and last year''s figures as an ordinary trial balance. The closing of the income statement accounts is posted at the end of a fiscal year. The report can be used in connection with closing a fiscal year.';
                }
                action("Dimensions - Total")
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions - Total';
                    Image = "Report";
                    RunObject = Report "Dimensions - Total";
                    ToolTip = 'View how dimensions or dimension sets are used on entries based on total amounts over a specified period and for a specified analysis view.';
                }
            }
            group("Cash Flow")
            {
                Caption = 'Cash Flow';

                action("Cash Flow Date List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Date List';
                    Image = "Report";
                    RunObject = Report "Cash Flow Date List";
                    ToolTip = 'View forecast entries for a period of time that you specify. The registered cash flow forecast entries are organized by source types, such as receivables, sales orders, payables, and purchase orders. You specify the number of periods and their length.';
                }
            }
            group("Customers and Vendors")
            {
                Caption = 'Customers and Vendors';

                action("Aged Accounts &Receivable")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Aged Accounts &Receivable';
                    Image = "Report";
                    RunObject = Report "Aged Accounts Receivable";
                    ToolTip = 'View an overview of when your receivables from customers are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
                }
                action("Aged Accounts Pa&yable")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Aged Accounts Pa&yable';
                    Image = "Report";
                    RunObject = Report "Aged Accounts Payable";
                    ToolTip = 'View an overview of when your payables to vendors are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
                }
                action("Reconcile Cus&t. and Vend. Accs")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Reconcile Cus&t. and Vend. Accs';
                    Image = "Report";
                    RunObject = Report "Reconcile Cust. and Vend. Accs";
                    ToolTip = 'View if a certain general ledger account reconciles the balance on a certain date for the corresponding posting group. The report shows the accounts that are included in the reconciliation with the general ledger balance and the customer or the vendor ledger balance for each account and shows any differences between the general ledger balance and the customer or vendor ledger balance.';
                }
                action("Duplicate Vendors")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Duplicate Vendors';
                    Image = "Report";
                    // RunObject = Report "Duplicate Vendors";
                    ToolTip = 'Duplicate Vendors';
                }
            }
            group("VAT Reports")
            {
                Caption = 'VAT Reports';

                action("&VAT Registration No. Check")
                {
                    ApplicationArea = VAT;
                    Caption = '&VAT Registration No. Check';
                    Image = "Report";
                    RunObject = Report "VAT Registration No. Check";
                    ToolTip = 'Use an EU VAT number validation service to validated the VAT number of a business partner.';
                }
                action("VAT E&xceptions")
                {
                    ApplicationArea = VAT;
                    Caption = 'VAT E&xceptions';
                    Image = "Report";
                    RunObject = Report "VAT Exceptions";
                    ToolTip = 'View the VAT entries that were posted and placed in a general ledger register in connection with a VAT difference. The report is used to document adjustments made to VAT amounts that were calculated for use in internal or external auditing.';
                }
                action("VAT &Statement")
                {
                    ApplicationArea = VAT;
                    Caption = 'VAT &Statement';
                    Image = "Report";
                    RunObject = Report "VAT Statement";
                    ToolTip = 'View a statement of posted VAT and calculate the duty liable to the customs authorities for the selected period.';
                }
                action("VAT - VIES Declaration Tax Aut&h")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'VAT - VIES Declaration Tax Aut&h';
                    Image = "Report";
                    RunObject = Report "VAT- VIES Declaration Tax Auth";
                    ToolTip = 'View information to the customs and tax authorities for sales to other EU countries/regions. If the information must be printed to a file, you can use the VAT- VIES Declaration Disk report.';
                }
                action("VAT - VIES Declaration Dis&k")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'VAT - VIES Declaration Dis&k';
                    Image = "Report";
                    RunObject = Report "VAT- VIES Declaration Disk";
                    ToolTip = 'Report your sales to other EU countries or regions to the customs and tax authorities. If the information must be printed out on a printer, you can use the VAT- VIES Declaration Tax Auth report. The information is shown in the same format as in the declaration list from the customs and tax authorities.';
                }
                action("EC Sales &List")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'EC Sales &List';
                    Image = "Report";
                    RunObject = Report "EC Sales List";
                    ToolTip = 'Calculate VAT amounts from sales, and submit the amounts to a tax authority.';
                }
            }
            group(Action60)
            {
                Caption = 'Intrastat';

                action("&Intrastat - Checklist")
                {
                    ApplicationArea = BasicEU;
                    Caption = '&Intrastat - Checklist';
                    Image = "Report";
                    // RunObject = Report "Intrastat - Checklist";
                    ToolTip = 'View a checklist that you can use to find possible errors before printing and also as documentation for what is printed. You can use the report to check the Intrastat journal before you use the Intrastat - Make Disk Tax Auth batch job.';
                }
                action("Intrastat - For&m")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'Intrastat - For&m';
                    Image = "Report";
                    // RunObject = Report "Intrastat - Form";
                    ToolTip = 'View all the information that must be transferred to the printed Intrastat form.';
                }
            }
            group("Cost Accounting")
            {
                Visible = false;
                Caption = 'Cost Accounting';

                action("Cost Accounting P/L Statement")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Accounting P/L Statement';
                    Image = "Report";
                    RunObject = Report "Cost Acctg. Statement";
                    ToolTip = 'View the credit and debit balances per cost type, together with the chart of cost types.';
                }
                action("CA P/L Statement per Period")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'CA P/L Statement per Period';
                    Image = "Report";
                    RunObject = Report "Cost Acctg. Stmt. per Period";
                    ToolTip = 'View profit and loss for cost types over two periods with the comparison as a percentage.';
                }
                action("CA P/L Statement with Budget")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'CA P/L Statement with Budget';
                    Image = "Report";
                    RunObject = Report "Cost Acctg. Statement/Budget";
                    ToolTip = 'View a comparison of the balance to the budget figures and calculates the variance and the percent variance in the current accounting period, the accumulated accounting period, and the fiscal year.';
                }
                action("Cost Accounting Analysis")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Accounting Analysis';
                    Image = "Report";
                    RunObject = Report "Cost Acctg. Analysis";
                    ToolTip = 'View balances per cost type with columns for seven fields for cost centers and cost objects. It is used as the cost distribution sheet in Cost accounting. The structure of the lines is based on the chart of cost types. You define up to seven cost centers and cost objects that appear as columns in the report.';
                }
            }
        }
        area(embedding)
        {
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'Open the chart of accounts.';
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
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                RunPageView = where("Vendor Type" = filter(<> Trade));
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
            action("Purchase Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
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
            action("Incoming Documents")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Incoming Documents';
                Image = Documents;
                RunObject = Page "Incoming Documents";
                ToolTip = 'Handle incoming documents, such as vendor invoices in PDF or as image files, that you can manually or automatically convert to document records, such as purchase invoices. The external files that represent incoming documents can be attached at any process stage, including to posted documents and to the resulting vendor, customer, and general ledger entries.';
            }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoices';
                Image = Invoice;
                RunObject = Page "Purchase Invoices";
                ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action("EC Sales List")
            {
                ApplicationArea = VAT;
                Caption = 'EC Sales List';
                RunObject = Page "EC Sales List Reports";
                ToolTip = 'Calculate VAT amounts from sales, and submit the amounts to a tax authority.';
            }
            action("VAT Returns")
            {
                ApplicationArea = VAT;
                Caption = 'VAT Returns';
                RunObject = Page "VAT Report List";
                ToolTip = 'Prepare the VAT Return report so you can submit VAT amounts to a tax authority.';
            }
            action(Budgets)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Budgets';
                RunObject = Page "G/L Budget Names";
                ToolTip = 'View or edit estimated amounts for a range of accounting periods.';
            }
            action("VAT Statements")
            {
                ApplicationArea = VAT;
                Caption = 'VAT Statements';
                Image = VATStatement;
                RunObject = Page "VAT Statement Names";
                ToolTip = 'View a statement of posted VAT amounts, calculate your VAT settlement amount for a certain period, such as a quarter, and prepare to send the settlement to the tax authorities.';
            }
            action(Votebook)
            {
                ApplicationArea = All;
                Caption = 'Votebook';
                // RunObject = Report "Station Votebook";
            }
        }
        area(sections)
        {
            group(Action172)
            {
                Caption = 'Finance';
                Image = Journals;
                ToolTip = 'Collect and make payments, prepare statements, and reconcile bank accounts.';

                action("General Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Journals';
                    Image = Journal;
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(General), Recurring = const(false));
                    ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
                }
                action("Recurring General Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Recurring General Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(General), Recurring = const(true));
                    ToolTip = 'Define how to post transactions that recur with few or no changes to general ledger, bank, customer, vendor, or fixed asset accounts';
                }
                action(Action170)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Accounts';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Chart of Accounts";
                    ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
                }
                action("G/L Account Categories")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Account Categories';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "G/L Account Categories";
                    ToolTip = 'Personalize the structure of your financial statements by mapping general ledger accounts to account categories. You can create category groups by indenting subcategories under them. Each grouping shows a total balance. When you choose the Generate Account Schedules action, the account schedules for the underlying financial reports are updated. The next time you run one of these reports, such as the balance statement, new totals and subentries are added, based on your changes.';
                }
                action(Currencies)
                {
                    ApplicationArea = Suite;
                    Caption = 'Currencies';
                    Image = Currency;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page Currencies;
                    ToolTip = 'View the different currencies that you trade in or update the exchange rates by getting the latest rates from an external service provider.';
                }
                action(Employees)
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Employee List";
                    ToolTip = 'View or modify employees'' details and related information, such as qualifications and pictures, or register and analyze employee absence. Keeping up-to-date records about your employees simplifies personnel tasks. For example, if an employee''s address changes, you register this on the employee card.';
                }
                action(Action14)
                {
                    ApplicationArea = VAT;
                    Caption = 'VAT Statements';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "VAT Statement Names";
                    ToolTip = 'View a statement of posted VAT amounts, calculate your VAT settlement amount for a certain period, such as a quarter, and prepare to send the settlement to the tax authorities.';
                }
                action("Intrastat Journals")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'Intrastat Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    // RunObject = Page "Intrastat Jnl. Batches";
                    ToolTip = 'Summarize the value of your purchases and sales with business partners in the EU for statistical purposes and prepare to send it to the relevant authority.';
                }
                action("Analysis Views")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Analysis Views';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Analysis View List";
                    ToolTip = 'Analyze amounts in your general ledger by their dimensions using analysis views that you have set up.';
                }
                // action("Account Schedules")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Financial Reporting';
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Financial Reports";
                //     ToolTip = 'Get insight into the financial data stored in your chart of accounts. Financial reports analyze figures in G/L accounts, and compare general ledger entries with general ledger budget entries. For example, you can view the general ledger entries as percentages of the budget entries. Financial reports provide the data for core financial statements and views, such as the Cash Flow chart.';
                // }
                action(Deferrals)
                {
                    ApplicationArea = Suite;
                    Caption = 'Deferrals';
                    RunObject = Page "Deferral Template List";
                    ToolTip = 'Distribute revenues or expenses to the relevant accounting periods instead of the date of posting the transaction. Set up a deferral template for the resource, item, or G/L account that the revenue or expense will be posted for. When you post the related sales or purchase document, the revenue or expense is deferred to the involved accounting periods, according to a deferral schedule that is governed by settings in the deferral template and the posting date.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Suite;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page Dimensions;
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action(Partners)
                {
                    ApplicationArea = Intercompany;
                    Caption = 'Partners';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IC Partner List";
                    ToolTip = 'Set up each company or department within the group of companies as an intercompany partner of type Vendor or Customer. Intercompany partners can then be inserted on regular sales and purchase documents or journal lines that are exchanged through the intercompany inbox/outbox system and posted to agreed accounts in an intercompany chart of accounts.';
                }
                action(Action171)
                {
                    ApplicationArea = Intercompany;
                    Caption = 'IC Chart of Accounts';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IC Chart of Accounts";
                    ToolTip = 'Manage intercompany transactions within your group of companies in an aligned chart of accounts that uses the same account numbers and settings. In the setup phase, the parent company of the group can create a simplified version of their own chart of accounts and exports it to an XML file that each subsidiary can quickly implement.';
                }
                action(Action173)
                {
                    ApplicationArea = Intercompany;
                    Caption = 'Intercompany Dimensions';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IC Dimensions";
                    ToolTip = 'Enable companies within a group to exchange transactions with dimensions and to perform financial analysis by dimensions across the group. The parent company of the group can create a simplified version of their own set of dimensions and export them to an XML file that each subsidiary can import into the intercompany Dimensions window and then map them to their own dimensions.';
                }
                action(Action38)
                {
                    ApplicationArea = Suite;
                    Caption = 'Currencies';
                    Image = Currency;
                    RunObject = Page Currencies;
                    ToolTip = 'View the different currencies that you trade in or update the exchange rates by getting the latest rates from an external service provider.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Duplicated action use action(Currencies)';
                    ObsoleteTag = '19.0';
                }
                action(Action144)
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    Visible = false;
                    RunObject = Page "Employee List";
                    ToolTip = 'Manage employees'' details and related information, such as qualifications and pictures, or register and analyze employee absence. Keeping up-to-date records about your employees simplifies personnel tasks. For example, if an employee''s address changes, you register this on the employee card.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Duplicated action use action(Employees)';
                    ObsoleteTag = '19.0';
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
                action(Action116)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Account Categories';
                    RunObject = Page "G/L Account Categories";
                    ToolTip = 'Personalize the structure of your financial statements by mapping general ledger accounts to account categories. You can create category groups by indenting subcategories under them. Each grouping shows a total balance. When you choose the Generate Account Schedules action, the account schedules for the underlying financial reports are updated. The next time you run one of these reports, such as the balance statement, new totals and subentries are added, based on your changes.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Duplicated action use action("G/L Account Categories")';
                    ObsoleteTag = '19.0';
                }
                action("Bank Account Posting Groups")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account Posting Groups';
                    RunObject = Page "Bank Account Posting Groups";
                    ToolTip = 'Set up posting groups, so that payments in and out of each bank account are posted to the specified general ledger account.';
                }
            }
            group(Journals)
            {
                Caption = 'Journals';
                Image = Journals;
                ToolTip = 'Post financial transactions.';

                action(GeneralJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Journals';
                    Image = Journal;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(General), Recurring = const(false));
                    ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
                }
                action("<Action3>")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Recurring General Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(General), Recurring = const(true));
                    ToolTip = 'Define how to post transactions that recur with few or no changes to general ledger, bank, customer, vendor, or fixed asset accounts';
                }
                action(PurchaseJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(Purchases), Recurring = const(false));
                    ToolTip = 'Post any purchase-related transaction directly to a vendor, bank, or general ledger account instead of using dedicated documents. You can post all types of financial purchase transactions, including payments, refunds, and finance charge amounts. Note that you cannot post item quantities with a purchase journal.';
                }
                action(SalesJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(Sales), Recurring = const(false));
                    ToolTip = 'Post any sales-related transaction directly to a customer, bank, or general ledger account instead of using dedicated documents. You can post all types of financial sales transactions, including payments, refunds, and finance charge amounts. Note that you cannot post item quantities with a sales journal.';
                }
                action(ICGeneralJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'IC General Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(Intercompany), Recurring = const(false));
                    ToolTip = 'Post intercompany transactions. IC general journal lines must contain either an IC partner account or a customer or vendor account that has been assigned an intercompany partner code.';
                }
                action(Action1102601002)
                {
                    ApplicationArea = BasicEU;
                    Caption = 'Intrastat Journals';
                    Image = "Report";
                    // RunObject = Page "Intrastat Jnl. Batches";
                    ToolTip = 'Summarize the value of your purchases and sales with business partners in the EU for statistical purposes and prepare to send it to the relevant authority.';
                }
                action(PostedGeneralJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted General Journals';
                    RunObject = Page "Posted General Journal";
                    ToolTip = 'Open the list of posted general journal lines.';
                }
            }
            group("Cash Management")
            {
                Caption = 'Cash Management';
                ToolTip = 'Process incoming and outgoing payments. Set up bank accounts and service connections for electronic banking.  ';

                action(CashReceiptJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Receipt Journals';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const("Cash Receipts"), Recurring = const(false));
                    ToolTip = 'Register received payments by manually applying them to the related customer, vendor, or bank ledger entries. Then, post the payments to G/L accounts and thereby close the related ledger entries.';
                }
                action(PaymentJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Journals';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(Payments), Recurring = const(false));
                    ToolTip = 'Register payments to vendors. A payment journal is a type of general journal that is used to post outgoing payment transactions to G/L, bank, customer, vendor, employee, and fixed assets accounts. The Suggest Vendor Payments functions automatically fills the journal with payments that are due. When payments are posted, you can export the payments to a bank file for upload to your bank if your system is set up for electronic banking. You can also issue computer checks from the payment journal.';
                }
                action(Action164)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Account List";
                    ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
                }
                action("Direct Debit Collections")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Direct Debit Collections';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Direct Debit Collections";
                    ToolTip = 'Instruct your bank to withdraw payment amounts from your customer''s bank account and transfer them to your company''s account. A direct debit collection holds information about the customer''s bank account, the affected sales invoices, and the customer''s agreement, the so-called direct-debit mandate. From the resulting direct-debit collection entry, you can then export an XML file that you send or upload to your bank for processing.';
                }
                action("Payment Recon. Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Recon. Journals';
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Pmt. Reconciliation Journals";
                    ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing a bank statement feed or file. In the payment reconciliation journal, incoming or outgoing payments on your bank are automatically, or semi-automatically, applied to their related open customer or vendor ledger entries. Any open bank account ledger entries related to the applied customer or vendor ledger entries will be closed when you choose the Post Payments and Reconcile Bank Account action. This means that the bank account is automatically reconciled for payments that you post with the journal.';
                }
                action("Bank Acc. Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Acc. Statements';
                    Image = BankAccountStatement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Account Statement List";
                    ToolTip = 'View statements for selected bank accounts. For each bank transaction, the report shows a description, an applied amount, a statement amount, and other information.';
                }
                action("Payment Terms")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Terms';
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Payment Terms";
                    ToolTip = 'Set up the payment terms that you select from customer cards or sales documents to define when the customer must pay, such as within 14 days.';
                }
                action(Deposit)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Deposit';
                    Image = DepositSlip;
                    RunObject = Codeunit "Open Deposits Page";
                    ToolTip = 'Create a new deposit. ';
                }
                action("Cash Flow Forecasts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Forecasts';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Cash Flow Forecast List";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Chart of Cash Flow Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Cash Flow Accounts';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Chart of Cash Flow Accounts";
                    ToolTip = 'View a chart contain a graphical representation of one or more cash flow accounts and one or more cash flow setups for the included general ledger, purchase, sales, services, or fixed assets accounts.';
                }
                action("Cash Flow Manual Revenues")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Manual Revenues';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Cash Flow Manual Revenues";
                    ToolTip = 'Record manual revenues, such as rental income, interest from financial assets, or new private capital to be used in cash flow forecasting.';
                }
                action("Cash Flow Manual Expenses")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Manual Expenses';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Cash Flow Manual Expenses";
                    ToolTip = 'Record manual expenses, such as salaries, interest on credit, or planned investments to be used in cash flow forecasting.';
                }
                action(BankAccountReconciliations)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account Reconciliations';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Acc. Reconciliation List";
                    ToolTip = 'Reconcile bank accounts in your system with bank statements received from your bank.';
                }
            }
            group("Funds Management")
            {
                Caption = 'Funds Management';
                ToolTip = 'Process on incoming and outgoing funds.  ';
                group("Payment Vouchers")
                {
                    group("Normal Payment Vouchers")
                    {
                        action(PaymentVouchers)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Payment Vouchers';
                            Image = Journals;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Payments Vouchers";
                            RunPageLink = Posted = const(false),
                            Status = filter(Open | "Pending Approval"),
                            "Archive Document" = filter(false);

                            ToolTip = 'Pay Vendors and Suppliers.';
                            RunPageMode = View;

                        }
                        action(ApprovedPaymentVouchers)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Payment Vouchers';
                            Image = Journals;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Approved Payment Vouchers";
                            RunPageLink = Posted = const(false),
                            Status = filter(Released),
                            "Archive Document" = filter(false);


                            ToolTip = 'Pay Vendors and Suppliers.';
                            RunPageMode = View;
                        }
                        action(PostedPaymentVouchers)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Payment Vouchers';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            // RunObject = Page "Posted Payment Vouchers";
                             RunObject = Page "Approved Payment Vouchers";
                            RunPageLink = Posted = const(true),
                            Status = filter(Released),
                            "Archive Document" = filter(false),
                            Reversed = const(false);

                            ToolTip = 'Pay Vendors and Suppliers.';
                            RunPageMode = View;
                        }

                        action(ReversedPayments)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Reversed Payment Vouchers';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            // RunObject = Page "Posted Payment Vouchers";
                             RunObject = Page "Approved Payment Vouchers";
                            RunPageLink = Posted = const(true),
                            Status = filter(Released),
                            "Archive Document" = filter(false),
                            Reversed = const(true);
                            ToolTip = 'Pay Vendors and Suppliers.';
                            RunPageMode = View;
                        }
                        action(ArchivedPayments)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Archived Payment Vouchers';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            // RunObject = Page "Posted Payment Vouchers";
                             RunObject = Page "Approved Payment Vouchers";
                            RunPageLink = Posted = const(true),
                            Status = filter(Released),
                            "Archive Document" = filter(true);
                            ToolTip = 'Pay Vendors and Suppliers.';
                            RunPageMode = View;
                        }
                    }
                    group("Tax Payment Vouchers")
                    {
                        action("Tax PVS")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Tax Payment Vouchers';
                            // RunObject = Page "Tax Payment Vouchers";
                            // RunPageLink = Status = const(Open), "Archive Document" = const(false);

                        }
                        action("Pending Tax PVS")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Pending Tax Payment Vouchers';
                            // RunObject = Page "Tax Payment Vouchers";
                            // RunPageLink = Status = const("Pending Approval"), "Archive Document" = const(false);
                            RunPageMode = View;
                        }
                        action("Approved Tax PVS")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Tax Payment Vouchers';
                            // RunObject = Page "Tax Payment Vouchers";
                            // RunPageLink = Status = const(Released), Posted = const(false), "Archive Document" = const(false);
                            RunPageMode = View;
                        }
                        action("Posted Tax PVS")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Tax Payment Vouchers';
                            // RunObject = Page "Tax Payment Vouchers";
                            // RunPageLink = Posted = const(true), "Archive Document" = const(false);
                            RunPageMode = View;
                        }
                    }
                    group("Payroll Payment Vouchers")
                    {
                        action(PayrollPaymentVouchers)
                        {
                            Caption = 'Payroll Payment Vouchers';
                            ApplicationArea = Basic, Suite;
                            RunObject = page "Payroll Payment Vouchers";
                            RunPageLink = Status = const(Open);
                        }
                        action(PendingPaymentVouchers)
                        {
                            Caption = 'Pending Payroll Payment Vouchers';
                            ApplicationArea = Basic, Suite;
                            RunObject = page "Payroll Payment Vouchers";
                            RunPageLink = Status = const("Pending Approval");
                            RunPageMode = View;
                        }
                        action(ApprovedPayrollPaymentVouchers)
                        {
                            Caption = 'Approved Payroll Payment Vouchers';
                            ApplicationArea = Basic, Suite;
                            RunObject = page "Payroll Payment Vouchers";
                            RunPageLink = Status = const(Released), Posted = const(false);
                            RunPageMode = View;
                        }
                        action(PostedPayrollPaymentVouchers)
                        {
                            Caption = 'Posted Payroll Payment Vouchers';
                            ApplicationArea = Basic, Suite;
                            RunObject = page "Payroll Payment Vouchers";
                            RunPageLink = Posted = const(true);
                            RunPageMode = View;
                        }
                    }
                    group("Retention Payment Vouchers")
                    {
                        group("Retention PVS")
                        {
                            action("Retention PVS1")
                            {
                                ApplicationArea = Basic, Suite;
                                Caption = 'Retention Vouchers';
                                RunObject = Page "Retention Payment Vouchers";
                                RunPageLink = Status = const(Open);
                            }
                            action("Pending Retention PVS")
                            {
                                ApplicationArea = Basic, Suite;
                                Caption = 'Pending Retention Vouchers';
                                RunObject = Page "Retention Payment Vouchers";
                                RunPageLink = Status = const("Pending Approval");
                                RunPageMode = View;
                            }
                            action("Approved Retention PVS")
                            {
                                ApplicationArea = Basic, Suite;
                                Caption = 'Approved Retention Vouchers';
                                RunObject = Page "Retention Payment Vouchers";
                                RunPageLink = Status = const(Released), Posted = const(false);
                                RunPageMode = View;
                            }
                            action("Posted Retention PVS")
                            {
                                ApplicationArea = Basic, Suite;
                                Caption = 'Posted Retention Payment Vouchers';
                                RunObject = Page "Retention Payment Vouchers";
                                RunPageLink = Posted = const(true);
                                RunPageMode = View;
                            }
                        }
                        action("Retention Movement PVS")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = page "Retention Movt Vouchers";
                            RunPageMode = View;
                        }
                    }


                }
                group("Receipts1")
                {
                    Caption = 'Receipts';
                    group(AIEReceipt)
                    {
                        Caption = 'Exchequer Receipts';
                        action(AIEReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Exchequer Receipts';
                            RunObject = page "AIE Receipts";
                            RunPageLink = Status = filter('Open');
                        }
                        action(ApprovedAIEReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Exchequer Receipts';
                            RunObject = page "AIE Receipts";
                            RunPageLink = Status = const(Released), Posted = const(false);
                        }
                        action(PostedAIEReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Exchequer Receipts';
                            RunObject = page "AIE Receipts";
                            RunPageLink = Posted = const(true);
                        }
                    }
                    group(NormalReceipts)
                    {
                        Caption = 'Normal Receipts';
                        action(Receipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Receipts';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Receipt List";
                            RunPageLink = Status = filter(Open | "Pending Approval"), "Receipt Type" = filter(Normal);
                            ToolTip = 'Receipts Funds from Customers';
                        }
                        action(ReceiptsApproved)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Receipts';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Receipt List";
                            RunPageLink = Status = const(Released), "Receipt Type" = filter(Normal);
                            ToolTip = 'Receipts Funds from Customers';
                        }

                        action(PostedReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Receipts';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Receipt List";
                            RunPageLink = Posted = const(true), "Receipt Type" = filter(Normal);
                            ToolTip = 'Posted Receipts.';
                        }
                    }

                    group(SurrenderReceipts)
                    {
                        Caption = 'Surrender Receipts';
                        action(SurrenderRecpts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Surrender Receipts';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Receipt List";
                            RunPageLink = Status = filter(Open | "Pending Approval"), "Receipt Type" = filter(Surrender);
                            ToolTip = 'Receipts Funds from Customers';
                        }
                        action(SurrReceiptsApproved)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Surrender Receipts';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Receipt List";
                            RunPageLink = Status = filter(Released), "Receipt Type" = filter(Surrender);
                            ToolTip = 'Receipts Funds from Customers';
                        }

                        action(SurrPostedReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Surrender Receipts';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Receipt List";
                            RunPageLink = Posted = const(true), "Receipt Type" = filter(Surrender);
                            ToolTip = 'Posted Receipts.';
                        }
                    }
                    group(RetentionReceipts)
                    {
                        Caption = 'Retention Receipts';
                        action(OpenRetentionReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Retention Receipts';
                            RunObject = page "Retention Movt Vouchers";
                            RunPageLink = Status = filter(Open | "Pending Approval");
                        }
                        action(ApprovedRetentionReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Retention Receipts';
                            RunObject = page "Retention Movt Vouchers";
                            
                            RunPageLink = Status = const(Released), Posted = const(false);
                        }
                        action(PostedRetentionReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Retention Receipts';
                            RunObject = page "Retention Movt Vouchers";
                            RunPageLink = Posted = const(true);
                        }
                    }
                    group(RevenueReceipts)
                    {
                        Caption = 'Revenue Receipts';
                        action(OpenRevenueReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Revenue Receipts';
                            RunObject = page "Receipt List";
                            RunPageLink = Status = filter(Open | "Pending Approval"), "Receipt Type" = filter(Fee);
                        }

                        action(ApprovedRevenueReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Revenue Receipts';
                            RunObject = page "Receipt List";
                            RunPageLink = Status = const(Released), Posted = const(false), "Receipt Type" = filter(Fee);
                        }

                        action(PostedRevenueReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Revenue Receipts';
                            RunObject = page "Receipt List";
                            RunPageLink = Posted = const(true), "Receipt Type" = filter(Fee);
                        }

                    }
                    group(DepositReceipts)
                    {
                        Caption = 'Deposit Receipts';

                        action(OvenueReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Deposit Receipts';
                            RunObject = page "Receipt List";
                            RunPageLink = Status = filter(Open | "Pending Approval"), "Receipt Type" = filter(Deposit);
                        }

                        action(ApprovedDepositReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Deposit Receipts';
                            RunObject = page "Receipt List";
                            RunPageLink = Status = const(Released), Posted = const(false), "Receipt Type" = filter(Deposit);
                        }

                        action(PostedDepositReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Deposit Receipts';
                            RunObject = page "Receipt List";
                            RunPageLink = Posted = const(true), "Receipt Type" = filter(Deposit);
                        }
                    }
                    group(RDReceipts)
                    {
                        Caption = 'RD Receipts';
                        action(RDOpenReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'RD Receipts';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Receipt List";
                            RunPageLink = Status = filter(Open | "Pending Approval"), "Receipt Type" = filter("RD Receipts");
                            ToolTip = 'Receipts Funds from Customers';
                        }
                        action(RDReceiptsApproved)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved RD Receipts';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Receipt List";
                            RunPageLink = Status = const(Released), "Receipt Type" = filter("RD Receipts");
                        }

                        action(RDPostedReceipts)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted RD Receipts';
                            Image = BankAccount;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Receipt List";
                            RunPageLink = Posted = const(true), "Receipt Type" = filter("RD Receipts");
                            ToolTip = 'Posted RD Receipts.';
                        }
                    }








                }
                group("Direct Income Vouchers")
                {
                    action(DIV)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Direct Income Voucher List';
                        Image = BankAccount;
                        Promoted = true;
                        PromotedCategory = Process;
                        // RunObject = Page "Direct Income Voucher List";
                        ToolTip = 'Direct Income Voucher List';
                    }
                    action(DIV2)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Direct Voucher';
                        Image = BankAccount;
                        Promoted = true;
                        PromotedCategory = Process;
                        // RunObject = Page "Posted Direct Voucher List";
                        ToolTip = 'Posted Direct Voucher';
                    }
                }
                group("Petty Cash Vouchers")
                {
                    Visible = false;
                    action(PettyCashVoucher)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Petty Cash Voucher';
                        Promoted = true;
                        PromotedCategory = Process;
                        // RunObject = Page "Petty Cash Vouchers";
                        ToolTip = 'Petty Cash Voucher';
                    }
                    action(ApprovedPettyCashVouchers)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Approved Petty Cash Vouchers';
                        Image = ApplyEntries;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Approved Petty Cash Vouchers";
                        ToolTip = 'Approved Petty Cash Vouchers.';
                    }
                }
                group("Petty Cash Surrenders")
                {
                    Visible = false;
                    action(PettyCashSurrenders)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Petty Cash Surrenders';
                        Image = Payment;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Petty Cash Surrenders";
                        ToolTip = 'Petty Cash Surrenders.';
                    }
                    action(PostedPettyCashVouchers)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Petty Cash Surrenders';
                        Image = DepositSlip;
                        RunObject = Page "Petty Cash Surrender";
                        ToolTip = 'Posted Petty Cash Vouchers . ';
                    }
                }
                group("Bounced Payment Vouchers")
                {
                    Caption = 'Bounced Payments';
                    action(BouncedPaymentVouchers)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Open Pvs';
                        Image = Journals;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Bounced Payments";
                        RunPageMode = View;
                        RunPageLink = "Status" = const(Open);

                    }
                    action(BouncedPPaymentVouchers)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Pending Approval';
                        Image = Journals;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Bounced Payments";
                        RunPageMode = View;
                        RunPageLink = "Status" = const("Pending Approval");

                    }
                    action(ApprovedBPaymentVouchers)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Approved';
                        Image = Journals;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Bounced Payments";
                        RunPageMode = View;
                        RunPageLink = "Status" = const("Released"), "Posted" = const(false);
                    }
                    action(PostedBPaymentVouchers)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted';
                        Image = BankAccount;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Bounced Payments";
                        RunPageMode = View;
                        RunPageLink = "Status" = const("Released"), "Posted" = const(true);

                    }
                    // action(ArchivedBPaymentVouchers)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Archived';
                    //     Image = BankAccount;
                    //     Promoted = true;
                    //     PromotedCategory = Process;
                    //     RunObject = Page "Bounced Payments";
                    //     RunPageMode = View;
                    //     RunPageLink = "Archive Document" = const(true);

                    // }
                }
                group("Staff Claims1")
                {
                    Caption = 'Staff Claims';
                    action("Staff Claims")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Staff Claims';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Staff Claims";
                        RunPageLink = "Document Type" = filter(<> "Bounced Payment Voucher"), Status = filter(Open | "Pending Approval"),
                            Posted = const(false);

                        ToolTip = 'Staff Claims';
                    }
                    action("Approved Staff Claims")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Approved Staff Claims';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Staff Claims";
                        RunPageLink = "Document Type" = filter(<> "Bounced Payment Voucher");

                        ToolTip = 'Approved Staff Claims';
                    }

                    action("Posted Staff Claims")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Staff Claims';
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Staff Claims";
                        RunPageLink = "Document Type" = filter(<> "Bounced Payment Voucher");

                        ToolTip = 'Posted Staff Claims';
                    }

                    action(ReversedClaimsPayments)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Reversed Staff Claims';
                        Image = BankAccount;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Staff Claims";
                        RunPageLink = Reversed = const(true);

                        ToolTip = 'Pay Vendors and Supplier.';
                        RunPageMode = View;
                    }
                    action(ArchivedClaimsPayments)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Archived Staff Claims';
                        Image = BankAccount;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Staff Claims";
                        RunPageLink = "Archive Document" = const(true);

                        ToolTip = 'Pay Vendors and Supplier.';
                        RunPageMode = View;
                    }
                }
                group("Imprests1")
                {
                    Caption = 'Imprests';
                    group("Imprest Memos1")
                    {
                        Caption = 'Safari Imprests';
                        action("Approved Expenditure Requisitions")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Safari Imprest Memo';
                            RunObject = Page "Expense Requisitions";
                            RunPageLink = "Approval Status" = const(Released), Status = const("Pending Commitment");
                        }
                        action("Imprest Memos")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Safari Imprests';
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Imprest Memo";
                        }
                        action("Approved Imprest Memos")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Imprest Memos';
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Imprest Posted";
                            ToolTip = 'Approved Safari Imprests';
                        }
                    }
                    group("Standing Imprests1")
                    {
                        Caption = 'Standing Imprest Warrant(s)';
                        action("Standing Imprest Requsitions")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Standing Imprest Warrant(s)';
                            Promoted = true;
                            PromotedCategory = Process;
                            Visible=false;
                            // RunObject = Page "Standing Imprest Requsitions";
                            // RunPageLink = Posted = const(false), Status = filter(Open | "Pending Approval");
                        }
                        action("Approved Standing Imprests")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Standing Imprest Warrant(s)';
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Approved Standing Imprests";
                        }
                        action("Posted Standing Imprests")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Standing Imprest Warrant(s)';
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Imprest Posted";
                            ToolTip = 'Posted Standing Imprests';
                        }
                        action("Reversed  S.Imprest Requsitions")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Reversed Standing Imprest Warrant(s)';
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Standing Imprest Requsitions";
                            RunPageLink = Reversed = const(true);
                        }
                        action("Archived Standing Imprest")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Archived Standing Imprest Warrant(s)';
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Standing Imprest Requsitions";
                            RunPageLink = "Archive Document" = const(true);
                        }

                    }



                    group(ImprestRequisitions)
                    {
                        Caption = 'Safari Imprest Warrant(s)';
                        action("Imprest Requisition")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Safari Imprest Warrant(s)';
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Imprest Requisitions";
                            RunPageLink = Status = filter(<> Released), Posted = const(false), Reversed = const(false);
                            ToolTip = 'Imprest Requisition.';
                        }
                        action("Approved Imprest Requisitions")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Approved Safari Imprest Warrant(s) ';
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Approved Imprest Requisitions";
                            ToolTip = 'Approved Imprest Requisitions.';
                        }
                        action("Posted Imprest Requisitions")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Posted Safari Imprest Warrant(s)';
                            Image = BankAccountRec;
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Imprest Requisitions";
                            RunPageLink=Status=filter(Released),Posted=filter(true);
                            ToolTip = 'Posted Imprest Requisitions.';
                        }
                        action("Reversed Imprest Requisition")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Reversed Safari Imprest Warrant(s)';
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Imprest Requisitions";
                            ToolTip = 'R Imprest Requisition.';
                            RunPageLink = Reversed = const(true);

                        }
                        action("Archived Imprest Requisition")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Archived Safari Imprest Warrant(s)';
                            Promoted = true;
                            PromotedCategory = Process;
                            RunObject = Page "Imprest Requisitions";
                            ToolTip = 'R Imprest Requisition.';
                            RunPageLink = "Archive Document" = const(true);

                        }
                    }
                    group("Special Imprests")
                    {
                        Caption = 'Special Imprest Warranties';
                        action("Special Imprests1")
                        {
                            Caption = 'Special Imprest Warrant(s)';
                            ApplicationArea = Basic, Suite;
                            RunObject = page "Special Imprests";
                            RunPageLink = Status = filter(Open | "Pending Approval");
                        }
                        action("Approved Special Imprests")
                        {
                            Caption = 'Approved Special Imprest Warrant(s)';
                            ApplicationArea = Basic, Suite;
                            RunObject = page "Special Imprests";
                            RunPageLink = Status = const(Released), Posted = const(false);
                        }
                        action("Posted Special Imprests")
                        {
                            Caption = 'Posted Special Imprest Warrant(s)';
                            ApplicationArea = Basic, Suite;
                            RunObject = page "Special Imprests";
                            RunPageLink = Posted = const(true);
                        }
                        action("Reversed Special Imprests1")
                        {
                            Caption = 'Special Imprest Warrant(s)';
                            ApplicationArea = Basic, Suite;
                            RunObject = page "Special Imprests";
                            RunPageLink = Reversed = const(true);
                        }
                        action("Archived Special Imprests1")
                        {
                            Caption = 'Archived Imprest Warrant(s)';
                            ApplicationArea = Basic, Suite;
                            RunObject = page "Special Imprests";
                            RunPageLink = "Archive Document" = const(true);
                        }
                    }
                }
                group("Imprest Surrenders1")
                {
                    Caption = 'Imprest Surrenders';
                    action("Imprest Surrenders")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Imprest Surrenders';
                        Image = BankAccountRec;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Imprest Surrenders";
                        ToolTip = 'Imprest Surrenders.';
                    }
                    action("Approved Imprest Surrenders")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Approved Imprest Surrenders';
                        Image = BankAccountRec;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Approved Imprest Surrenders";
                        ToolTip = 'Approved Imprest Surrenders.';
                    }
                    action("Posted Imprest Surrenders ")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Imprest Surrenders ';
                        Image = BankAccountRec;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Posted Imprest Surrenders";
                        ToolTip = 'Posted Imprest Surrenders .';
                    }
                }
                group("Bank Transfers1")
                {
                    Caption = 'Bank Transfers';
                    action("Bank Transfers")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Inter Bank Transfers';
                        Image = BankAccountRec;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Bank Transfers";
                        ToolTip = 'Bank Transfers .';
                    }
                    action("Approved Bank Transfers")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Approved Bank Transfers';
                        Image = BankAccountRec;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Bank Transfers";
                        RunPageLink= Status=filter(released);
                        ToolTip = 'Approved Bank Transfers.';
                    }
                    action("Posted Bank Transfers ")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Bank Transfers ';
                        Image = BankAccountRec;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Bank Transfers";
                        RunPageLink=Status=filter(Released),Posted=filter(true);
                        ToolTip = 'Posted Bank Transfers .';
                    }

                }
                action(BankAccountStatementList1)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account Statement List';
                    Image = BankAccountStatement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Account Statement List";
                    ToolTip = '.';
                }
                group("EFT Processing")
                {
                    action("EFT Processing1")
                    {
                        Caption = 'EFT Processing';
                        ApplicationArea = Basic, Suite;
                        RunObject = page "EFT List";
                        RunPageLink = Status = filter(Open | "Pending Approval");
                    }
                    action("Approved EFT Processing")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "EFT List";
                        RunPageLink = Status = const(Released), Transferred = const(false);
                    }

                    action("Processed EFTs")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "EFT List";
                        RunPageLink = Status = const(Released), Transferred = const(true);
                    }
                    action("Scheduled EFTs to Bank")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "Outward Payment Buffer";
                        // RunPageLink = SentToBank = const(false);
                    }
                    action("Scheduled Tax Vouchers to Bank")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "KRABuffer List";
                        // RunPageLink = SentToBank = const(false);
                    }
                    action("EFTs sent to Bank")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "Outward Payment Buffer";
                        // RunPageLink = SentToBank = const(true);
                    }
                    action("Tax Vouchers Sent to Bank")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "KRABuffer List";
                        // RunPageLink = SentToBank = const(true);
                    }

                    action("Paid EFTs")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "Outward Payment Buffer";
                        // RunPageLink = Paid = const(true);
                    }

                    action("Failed EFTs To Bank")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "Outward Payment Buffer";
                        // RunPageLink = Failed = filter(true);
                    }
                    action("Voided EFTS")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "EFT List";
                        RunPageLink = Voided = const(true);
                    }
                    action("Outward Bank Statement")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "Outward Bank Statement";

                    }
                }
                group("Revenue Account Sweeps")
                {
                    action(RevenueAccountSweep)
                    {
                        Caption = 'Revenue Account Sweeps';
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "Revenue Account Sweep List";
                        // RunPageLink = Status = filter(Open | "Pending Approval");
                    }
                    action(ApprovedRevenueAccountSweep)
                    {
                        Caption = 'Approved Revenue Account Sweeps';
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "Revenue Account Sweep List";
                        // RunPageLink = Status = const(Released), Posted = const(false);
                        RunPageMode = view;
                    }
                    action(PostedRevenueAccountSweep)
                    {
                        Caption = 'Revenue Account Sweeps';
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "Revenue Account Sweep List";
                        // RunPageLink = Posted = cons/t(true);
                        RunPageMode = view;
                    }
                }
                group("SetUps1")
                {
                    Caption = 'Setups';
                    action("Cash Management Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Cash Management Setup';
                        Image = BankAccountRec;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Cash Management Setup";
                        ToolTip = 'Cash Management Setup .';
                    }
                    action("Pay Mode")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Pay Mode';
                        Image = BankAccountRec;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Pay Mode";
                        ToolTip = 'Pay Mode.';
                    }
                    action("Receipts and Payment Types")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Transaction Type List';
                        Image = BankAccountRec;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Receipts and Payment Types";
                        ToolTip = 'Set Transaction Types';
                    }
                    action(TariffCodes)
                    {
                        Caption = 'Tariff Codes';
                        ApplicationArea = Basic, Suite;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = page "Tariff Codes1";
                    }
                    action("Document Check List")
                    {
                        ApplicationArea = Basic, Suite;
                        Promoted = true;
                        PromotedCategory = Process;
                        // RunObject = page "Payment Doc Check List";
                    }
                    action("Bank List")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "PR Bank Accounts";
                    }
                    action("Bank Branches")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = page "PR Bank Branches";
                    }
                    action("Default Dimensions")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "Default Dimension List";
                    }
                    action("EFT Batches")
                    {
                        ApplicationArea = Basic, Suite;
                        // RunObject = page "EFT Batches";
                    }
                }
            }
            group("Bank Statement")
            {
                action("BankStatementReport")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Statement';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Bank Ledger Entries Report";
                    ToolTip = '.';
                }
                action("Outward Payment Report")
                {
                    ApplicationArea = Basic, Suite;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Outward Bank Statement";

                }
            }

            group(Action84)
            {
                Caption = 'Cost Accounting';
                ToolTip = 'Allocate actual and budgeted costs of operations, departments, products, and projects to analyze the profitability of your company.';
                action("Cost Types")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Types';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Chart of Cost Types";
                    ToolTip = 'View the chart of cost types with a structure and functionality that resembles the general ledger chart of accounts. You can transfer the general ledger income statement accounts or create your own chart of cost types.';
                }
                action("Cost Centers")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Centers';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Chart of Cost Centers";
                    ToolTip = 'Manage cost centers, which are departments and profit centers that are responsible for costs and income. Often, there are more cost centers set up in cost accounting than in any dimension that is set up in the general ledger. In the general ledger, usually only the first level cost centers for direct costs and the initial costs are used. In cost accounting, additional cost centers are created for additional allocation levels.';
                }
                action("Cost Objects")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Objects';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Chart of Cost Objects";
                    ToolTip = 'Set up cost objects, which are products, product groups, or services of a company. These are the finished goods of a company that carry the costs. You can link cost centers to departments and cost objects to projects in your company.';
                }
                action("Cost Allocations")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Allocations';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Cost Allocation Sources";
                    ToolTip = 'Manage allocation rules to allocate costs and revenues between cost types, cost centers, and cost objects. Each allocation consists of an allocation source and one or more allocation targets. For example, all costs for the cost type Electricity and Heating are an allocation source. You want to allocate the costs to the cost centers Workshop, Production, and Sales, which are three allocation targets.';
                }
                action("Cost Budgets")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Budgets';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Cost Budget Names";
                    ToolTip = 'Set up cost accounting budgets that are created based on cost types just as a budget for the general ledger is created based on general ledger accounts. A cost budget is created for a certain period of time, for example, a fiscal year. You can create as many cost budgets as needed. You can create a new cost budget manually, or by importing a cost budget, or by copying an existing cost budget as the budget base.';
                }
            }
            group(Action16)
            {
                Caption = 'Fixed Assets';
                Image = FixedAssets;
                ToolTip = 'Manage depreciation and insurance of your fixed assets.';

                action(Action17)
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Assets';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Fixed Asset List";
                    ToolTip = 'Manage periodic depreciation of your machinery or machines, keep track of your maintenance costs, manage insurance policies related to fixed assets, and monitor fixed asset statistics.';
                }
                action("Fixed Assets G/L Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Assets G/L Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(Assets), Recurring = const(false));
                    ToolTip = 'Post fixed asset transactions, such as acquisition and depreciation, in integration with the general ledger. The FA G/L Journal is a general journal, which is integrated into the general ledger.';
                }
                action("Fixed Assets Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Assets Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "FA Journal Batches";
                    RunPageView = where(Recurring = const(false));
                    ToolTip = 'Post fixed asset transactions, such as acquisition and depreciation book without integration to the general ledger.';
                }
                action("Fixed Assets Reclass. Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Assets Reclass. Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "FA Reclass. Journal Batches";
                    ToolTip = 'Transfer, split, or combine fixed assets by preparing reclassification entries to be posted in the fixed asset journal.';
                }
                action(Insurance)
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Insurance';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Insurance List";
                    ToolTip = 'Manage insurance policies for fixed assets and monitor insurance coverage.';
                }
                action("Insurance Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Insurance Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Insurance Journal Batches";
                    ToolTip = 'Post entries to the insurance coverage ledger.';
                }
                action("Recurring Fixed Asset Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Recurring Fixed Asset Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "FA Journal Batches";
                    RunPageView = where(Recurring = const(true));
                    ToolTip = 'Post recurring fixed asset transactions, such as acquisition and depreciation book without integration to the general ledger.';
                }
            }
            group(Workplans)
            {
                Caption = 'Planning and Budgeting';
                group("Resource Requirements1")
                {
                    Caption = 'Resource Requirements';
                    action("Open Resource Requirements")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Functional Annual Workplans";
                        RunPageLink = "Planning Budget Type" = const(Original), "Approval Status" = Const(Open), Archived = const(false), Consolidated = const(false);
                    }
                    action("Resource Requirements Pending Approval")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Functional Annual Workplans";
                        RunPageLink = "Planning Budget Type" = const(Original), "Approval Status" = Const("Pending Approval"), Archived = const(false), Consolidated = const(false);
                    }
                    action("Submitted Resource Requirements")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Functional Annual Workplans";
                        RunPageLink = "Planning Budget Type" = const(Original), Archived = const(false), Consolidated = const(true);
                    }
                    action("Archived Resource Requirements")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Functional Annual Workplans";
                        RunPageLink = "Planning Budget Type" = const(Original), Archived = const(true), Consolidated = const(false);
                    }

                    action("Commitment Report")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Commitment Report';
                        RunObject = Report "Commitment Entries";
                    }

                }
                group("Draft Workplans")
                {
                    Caption = 'Workplans';
                    group("Draft Workplans (Stations)")
                    {
                        Caption = 'Draft Workplans';
                        action("Open Draft Workplans")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Draft Workplan List";
                            RunPageLink = "Approval Status" = Const(Open), Archived = const(false), Consolidated = const(false);
                        }
                        action("Draft Workplans Pending Approval")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Draft Workplan List";
                            RunPageLink = "Approval Status" = Const("Pending Approval"), Archived = const(false), Consolidated = const(false);
                        }
                        action("Submitted Draft Workplans")
                        {
                            Caption = 'Submitted Workplans';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Draft Workplan List";
                            RunPageLink = Consolidated = const(true);
                        }
                        action("Archived Draft Workplans")
                        {
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Draft Workplan List";
                            RunPageLink = Archived = const(true), Consolidated = const(false);
                        }
                    }
                }
                group("Expenditure Requisitions")
                {
                    action(ExpReq1)
                    {
                        Caption = 'Expenditure Requisitions';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Expense Requisitions";
                        RunPageLink = "Approval Status" = const(Open);
                    }
                    action("Expenditure Requisitions Pending Approval")
                    {
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Expense Requisitions";
                        RunPageLink = "Approval Status" = const("Pending Approval");
                    }

                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View the posting history for sales, shipments, and inventory.';

                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
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
                    ToolTip = 'Open the list of issued reminders.';
                }
                action("Issued Fin. Charge Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Fin. Charge Memos';
                    Image = PostedMemo;
                    RunObject = Page "Issued Fin. Charge Memo List";
                    ToolTip = 'Open the list of issued finance charge memos.';
                }
                action("G/L Registers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = Page "G/L Registers";
                    ToolTip = 'View auditing details for all general ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action("Posted Bank Deposits")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Bank Deposits';
                    Image = PostedDeposit;
                    RunObject = codeunit "Open P. Bank Deposits L. Page";
                    ToolTip = 'View the posted deposit header, deposit header lines, deposit comments, and deposit dimensions.';
                }
                action("Cost Accounting Registers")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Accounting Registers';
                    RunObject = Page "Cost Registers";
                    ToolTip = 'View auditing details for all cost accounting entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action("Cost Accounting Budget Registers")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Accounting Budget Registers';
                    RunObject = Page "Cost Budget Registers";
                    ToolTip = 'View auditing details for all cost accounting budget entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
            }

            group("Deposit Reports")
            {
                Caption = 'Deposit Reports';
                Image = Reports;

                action("Deposit Collection")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Deposit Collection';
                    // RunObject = Report "Deposit Collection Report";
                }
                action("Detailed Deposit Collection")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Detailed Deposit Collection';
                    // RunObject = Report "Detailed Deposit Collection";
                }
                action("Payment Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Report';
                    // RunObject = Report "Payment Report";
                }

                action("Detailed Payment Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Detailed Payment Report';
                    // RunObject = Report "Detailed Payment Report";
                }
                action("Outstanding Deposits")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Outstanding Deposits';
                    // RunObject = Report "Outstanding Deposits";
                }
                action("Detailed Outstanding Deposits")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Detailed Outstanding Deposits';
                    // RunObject = Report "Detailed Outstanding deposits";
                }

                action("Deposits Movement")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Deposits Movement';
                    // RunObject = Report "Deposit Movement";
                }
                action("Detailed Deposits Movement")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Deposit Ledger';
                    // RunObject = Report "Detailed Deposit Movement";
                }




            }

            group("Revenue Reports")
            {
                Caption = 'Revenue Reports';
                Image = Reports;

                action("Summary By Court")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Revenue Summary By Court';
                    // RunObject = Report "Revenue - Summary By Court";
                }
                action("Monthly Revenue")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Revenue Payment';
                    // RunObject = Report "Monthly Revenue Returns";
                }
                action("court fines")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Consolidated Revenue Collection';
                    // RunObject = Report "GL Account Summary";
                }
                action("Revenue Collection - Geo")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Revenue Collection - Admin';
                    // RunObject = Report "Consolidated/ Revenue";
                }
                action("Revenue Collection")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Detailed Revenue Collection';
                    // RunObject = Report "Detailed Revenue Collection";
                }
                action("Cashbook")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cashbook';
                    // RunObject = Report "Cashbook Report - Custom";
                }
                action("Financial Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Financial Report';
                    RunObject = page "Financial Reports";
                }


            }
        }
        area(creation)
        {
            action("Sales &Credit Memo")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales &Credit Memo';
                RunObject = Page "Sales Credit Memo";
                RunPageMode = Create;
                ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
            }
            action("P&urchase Credit Memo")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'P&urchase Credit Memo';
                RunObject = Page "Purchase Credit Memo";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase credit memo so you can manage returned items to a vendor.';
            }
            action("G/L Journal Entry")
            {
                AccessByPermission = TableData "G/L Entry" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'G/L Journal Entry';
                RunObject = Page "General Journal";
                ToolTip = 'Prepare to post any transaction to the company books.';
            }
            action("Payment Journal Entry")
            {
                AccessByPermission = TableData "Gen. Journal Batch" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Journal Entry';
                RunObject = Page "Payment Journal";
                ToolTip = 'Pay your vendors by filling the payment journal automatically according to payments due, and potentially export all payment to your bank for automatic processing.';
            }
            action(Action1020012)
            {
                AccessByPermission = TableData "Gen. Journal Template" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Deposit';
                RunObject = Codeunit "Open Deposit Page";
                RunPageMode = Create;
                ToolTip = 'Create a new bank deposit. ';
            }
        }
        area(processing)
        {
            group(Payments)
            {
                Caption = 'Payments';

                action("Cas&h Receipt Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cas&h Receipt Journal';
                    Image = CashReceiptJournal;
                    RunObject = Page "Cash Receipt Journal";
                    ToolTip = 'Apply received payments to the related non-posted sales documents.';
                }
                action("Pa&yment Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pa&yment Journal';
                    Image = PaymentJournal;
                    RunObject = Page "Payment Journal";
                    ToolTip = 'Make payments to vendors.';
                }
            }
            group(Analysis)
            {
                Caption = 'Analysis';

                action("Analysis &Views")
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Analysis &Views';
                    Image = AnalysisView;
                    RunObject = Page "Analysis View List";
                    ToolTip = 'Analyze amounts in your general ledger by their dimensions using analysis views that you have set up.';
                }
                action("Analysis by &Dimensions")
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Analysis by &Dimensions';
                    Image = AnalysisViewDimension;
                    RunObject = Page "Analysis by Dimensions";
                    ToolTip = 'Analyze activities using dimensions information.';
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'This functionality runs correctly from the Analysis View List page';
                    ObsoleteTag = '18.0';
                }
            }
            group(Tasks)
            {
                Caption = 'Tasks';

                action("Calculate Deprec&iation")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Calculate Deprec&iation';
                    Ellipsis = true;
                    Image = CalculateDepreciation;
                    RunObject = Report "Calculate Depreciation";
                    ToolTip = 'Calculate depreciation according to the conditions that you define. If the fixed assets that are included in the batch job are integrated with the general ledger (defined in the depreciation book that is used in the batch job), the resulting entries are transferred to the fixed assets general ledger journal. Otherwise, the batch job transfers the entries to the fixed asset journal. You can then post the journal or adjust the entries before posting, if necessary.';
                }
                action("Import Co&nsolidation from Database")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Import Co&nsolidation from Database';
                    Ellipsis = true;
                    Image = ImportDatabase;
                    RunObject = Report "Import Consolidation from DB";
                    ToolTip = 'Import entries from the business units that will be included in a consolidation. You can use the batch job if the business unit comes from the same database in Business Central as the consolidated company.';
                }
                action("Bank Account R&econciliation")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account R&econciliation';
                    Image = BankAccountRec;
                    RunObject = Page "Bank Acc. Reconciliation";
                    ToolTip = 'View the entries and the balance on your bank accounts against a statement from the bank.';
                }
                action("Payment Reconciliation Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Reconciliation Journals';
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Pmt. Reconciliation Journals";
                    RunPageMode = View;
                    ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing a bank statement feed or file. In the payment reconciliation journal, incoming or outgoing payments on your bank are automatically, or semi-automatically, applied to their related open customer or vendor ledger entries. Any open bank account ledger entries related to the applied customer or vendor ledger entries will be closed when you choose the Post Payments and Reconcile Bank Account action. This means that the bank account is automatically reconciled for payments that you post with the journal.';
                }
                action("Adjust E&xchange Rates")
                {
                    ApplicationArea = Suite;
                    Caption = 'Adjust E&xchange Rates';
                    Ellipsis = true;
                    Image = AdjustExchangeRates;
                    RunObject = Codeunit "Exch. Rate Adjmt. Run Handler";
                    ToolTip = 'Adjust general ledger, customer, vendor, and bank account entries to reflect a more updated balance if the exchange rate has changed since the entries were posted.';
                }
                action("P&ost Inventory Cost to G/L")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'P&ost Inventory Cost to G/L';
                    Image = PostInventoryToGL;
                    RunObject = Report "Post Inventory Cost to G/L";
                    ToolTip = 'Record the quantity and value changes to the inventory in the item ledger entries and the value entries when you post inventory transactions, such as sales shipments or purchase receipts.';
                }
                action("Intrastat &Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Intrastat &Journal';
                    Image = Journal;
                    // RunObject = Page "Intrastat Jnl. Batches";
                    ToolTip = 'Summarize the value of your purchases and sales with business partners in the EU for statistical purposes and prepare to send it to the relevant authority.';
                }
                action("Calc. and Pos&t VAT Settlement")
                {
                    ApplicationArea = VAT;
                    Caption = 'Calc. and Pos&t VAT Settlement';
                    Image = SettleOpenTransactions;
                    RunObject = Report "Calc. and Post VAT Settlement";
                    ToolTip = 'Close open VAT entries and transfers purchase and sales VAT amounts to the VAT settlement account. For every VAT posting group, the batch job finds all the VAT entries in the VAT Entry table that are included in the filters in the definition window.';
                }
            }
            group(Create)
            {
                Caption = 'Create';

                action("C&reate Reminders")
                {
                    ApplicationArea = Suite;
                    Caption = 'C&reate Reminders';
                    Ellipsis = true;
                    Image = CreateReminders;
                    RunObject = Report "Create Reminders";
                    ToolTip = 'Create reminders for one or more customers with overdue payments.';
                }
                action("Create Finance Charge &Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Finance Charge &Memos';
                    Ellipsis = true;
                    Image = CreateFinanceChargememo;
                    RunObject = Report "Create Finance Charge Memos";
                    ToolTip = 'Create finance charge memos for one or more customers with overdue payments.';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';

                group("Financial Statements")
                {
                    Caption = 'Financial Statements';
                    Image = ReferenceData;

                    action("Balance Sheet")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Balance Sheet';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Balance Sheet";
                        ToolTip = 'View a report that shows your company''s assets, liabilities, and equity.';
                    }
                    action("Income Statement")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Income Statement';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Income Statement";
                        ToolTip = 'View a report that shows your company''s income and expenses.';
                    }
                    action("Statement of Cash Flows")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Cash Flows';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Statement of Cashflows";
                        ToolTip = 'View a financial statement that shows how changes in balance sheet accounts and income affect the company''s cash holdings, displayed for operating, investing, and financing activities respectively.';
                    }
                    action("Statement of Retained Earnings")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Retained Earnings';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Retained Earnings Statement";
                        ToolTip = 'View a report that shows your company''s changes in retained earnings for a specified period by reconciling the beginning and ending retained earnings for the period, using information such as net income from the other financial statements.';
                    }
                }
                group("Audit Reports")
                {
                    Caption = 'Audit Reports';
                    Image = ReferenceData;

                    action("ACTION2")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Purchase Invoice Audit Report';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        // RunObject = Report 75002;
                        ToolTip = '.';
                    }
                    action("ACTION3")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Sales Invoice Audit Report';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        // RunObject = Report 7500/3;
                        ToolTip = '.';
                    }
                    action("ACTION4")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'General Ledger Audit Report';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        // RunObject = Report 75004;
                        ToolTip = '.';
                    }

                }
                group("Excel Reports")
                {
                    Caption = 'Excel Reports';
                    Image = Excel;

                    action(ExcelTemplatesBalanceSheet)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Balance Sheet';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Balance Sheet";
                        ToolTip = 'Open a spreadsheet that shows your company''s assets, liabilities, and equity.';
                    }
                    action(ExcelTemplateIncomeStmt)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Income Statement';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Income Stmt.";
                        ToolTip = 'Open a spreadsheet that shows your company''s income and expenses.';
                    }
                    action(ExcelTemplateCashFlowStmt)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Cash Flow Statement';
                        Image = "Report";
                        RunObject = Codeunit "Run Template CashFlow Stmt.";
                        ToolTip = 'Open a spreadsheet that shows how changes in balance sheet accounts and income affect the company''s cash holdings.';
                    }
                    action(ExcelTemplateRetainedEarn)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Retained Earnings Statement';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Retained Earn.";
                        ToolTip = 'Open a spreadsheet that shows your company''s changes in retained earnings based on net income from the other financial statements.';
                    }
                    action(ExcelTemplateTrialBalance)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Trial Balance';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Trial Balance";
                        ToolTip = 'Open a spreadsheet that shows a summary trial balance by account.';
                    }
                    action(ExcelTemplateAgedAccPay)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Aged Accounts Payable';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Aged Acc. Pay.";
                        ToolTip = 'Open a spreadsheet that shows a list of aged remaining balances for each vendor by period.';
                    }
                    action(ExcelTemplateAgedAccRec)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Aged Accounts Receivable';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Aged Acc. Rec.";
                        ToolTip = 'Open a spreadsheet that shows when customer payments are due or overdue by period.';
                    }
                }
                action("Run Consolidation")
                {
                    ApplicationArea = Suite;
                    Caption = 'Run Consolidation';
                    Ellipsis = true;
                    Image = ImportDatabase;
                    RunObject = Report "Import Consolidation from DB";
                    ToolTip = 'Run the Consolidation report.';
                }
            }
            group(Setup)
            {
                Caption = 'Setup';
                Visible = false;
                ObsoleteState = Pending;
                ObsoleteReason = 'Setup is no longer shown in this page.';
                ObsoleteTag = '19.0';

                action(Action112)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Assisted Setup';
                    Image = QuestionaireSetup;
                    RunObject = Page "Assisted Setup";
                    ToolTip = 'Set up core functionality such as sales tax, sending documents as email, and approval workflow by running through a few pages that guide you through the information.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("General &Ledger Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General &Ledger Setup';
                    Image = Setup;
                    RunObject = Page "General Ledger Setup";
                    ToolTip = 'Define your general accounting policies, such as the allowed posting period and how payments are processed. Set up your default dimensions for financial analysis.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("&Sales && Receivables Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Sales && Receivables Setup';
                    Image = Setup;
                    RunObject = Page "Sales & Receivables Setup";
                    ToolTip = 'Define your general policies for sales invoicing and returns, such as when to show credit and stockout warnings and how to post sales discounts. Set up your number series for creating customers and different sales documents.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("&Purchases && Payables Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Purchases && Payables Setup';
                    Image = Setup;
                    RunObject = Page "Purchases & Payables Setup";
                    ToolTip = 'Define your general policies for purchase invoicing and returns, such as whether to require vendor invoice numbers and how to post purchase discounts. Set up your number series for creating vendors and different purchase documents.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("&Fixed Asset Setup")
                {
                    ApplicationArea = FixedAssets;
                    Caption = '&Fixed Asset Setup';
                    Image = Setup;
                    RunObject = Page "Fixed Asset Setup";
                    ToolTip = 'Define your accounting policies for fixed assets, such as the allowed posting period and whether to allow posting to main assets. Set up your number series for creating new fixed assets.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("Cash Flow Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Setup';
                    Image = CashFlowSetup;
                    RunObject = Page "Cash Flow Setup";
                    ToolTip = 'Set up the accounts where cash flow figures for sales, purchase, and fixed-asset transactions are stored.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("Cost Accounting Setup")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Accounting Setup';
                    Image = CostAccountingSetup;
                    RunObject = Page "Cost Accounting Setup";
                    ToolTip = 'Specify how you transfer general ledger entries to cost accounting, how you link dimensions to cost centers and cost objects, and how you handle the allocation ID and allocation document number.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
                action("Business Units")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Business Units';
                    Image = Setup;
                    RunObject = Page "Business Unit List";
                    ToolTip = 'Set up Business Units that you need to consolidate into this company.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Setup is no longer shown in this page.';
                    ObsoleteTag = '19.0';
                }
            }
            group(History)
            {
                Caption = 'History';

                action("Navi&gate")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Find entries...';
                    Image = Navigate;
                    RunObject = Page Navigate;
                    ShortCutKey = 'Ctrl+Alt+Q';
                    ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
                }
            }
            group("Notices/Memos")
            {
                Caption = 'Notice';
                Image = Ledger;


                action("Publish A Notice/Memo")
                {
                    Caption = 'Create A Notice/Memo';
                    ApplicationArea = basic;
                    // RunObject = page "Hr Noticeboard";
                }

                action("Published Notices")
                {
                    Caption = 'Created Notices/Memos';
                    ApplicationArea = basic;
                    // RunObject = page "Hr Noticeboard";
                    // RunPageView = where(Status = filter(true));
                }

            }


        }
    }
}
