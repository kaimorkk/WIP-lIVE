Page 52194396 "Administration Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1904484608;"IT Operations Activities")
                {
                }
                systempart(Control1901420308;Outlook)
                {
                }
            }
            group(Control1900724708)
            {
                part(Control32;"My Job Queue")
                {
                    Visible = false;
                }
                part(Control1903012608;"Copy Profile")
                {
                }
                systempart(Control1901377608;MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action(CheckonNegativeInventory)
            {
                ApplicationArea = Basic;
                Caption = 'Check on Ne&gative Inventory';
                Image = "Report";
                RunObject = Report "Items with Negative Inventory";
            }
            group(MyReports)
            {
                Caption = 'My Reports';
                action(MyPayslip)
                {
                    ApplicationArea = Basic;
                    Caption = 'My Payslip';
                    RunObject = Report "New Payslipx1";
                }
            }
        }
        area(embedding)
        {
            action(NoSeries)
            {
                ApplicationArea = Basic;
                Caption = 'No. Series';
                RunObject = Page "No. Series";
            }
            action(JobQueueEntries)
            {
                ApplicationArea = Basic;
                Caption = 'Job Queue Entries';
                RunObject = Page "Job Queue Entries";
            }
            action(UserSetup)
            {
                ApplicationArea = Basic;
                Caption = 'User Setup';
                Image = UserSetup;
                RunObject = Page "User Setup";
            }
            action(ApprovalUserSetup)
            {
                ApplicationArea = Basic;
                Caption = 'Approval User Setup';
                RunObject = Page "Approval User Setup";
            }
            // action(ApprovalTemplates)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Approval Templates';
            //     RunObject = Page "Approval Templates";
            // }
            action(BaseCalendarList)
            {
                ApplicationArea = Basic;
                Caption = 'Base Calendar List';
                RunObject = Page "Base Calendar List";
            }
            action(PostCodes)
            {
                ApplicationArea = Basic;
                Caption = 'Post Codes';
                RunObject = Page "Post Codes";
            }
            action(ReasonCodes)
            {
                ApplicationArea = Basic;
                Caption = 'Reason Codes';
                RunObject = Page "Reason Codes";
            }
            action(ExtendedText)
            {
                ApplicationArea = Basic;
                Caption = 'Extended Text';
                RunObject = Page "Extended Text List";
            }
            action(DataTemplatesList)
            {
                ApplicationArea = Basic;
                Caption = 'Data Templates List';
                RunObject = Page "Config. Template List";
            }
        }
        area(sections)
        {
            group(JobQueue)
            {
                Caption = 'Job Queue';
                Image = CheckList;
                action(JobQueues)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Queues';
                    RunObject = Page "Concurrent Session List";
                }
                action(Action54)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Queue Entries';
                    RunObject = Page "Job Queue Entries";
                }
                action(JobQueueCategoryList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Queue Category List';
                    RunObject = Page "Job Queue Category List";
                }
                action(JobQueueLogEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Queue Log Entries';
                    RunObject = Page "Job Queue Log Entries";
                }
            }
        }
        area(creation)
        {
            separator(Action1000000002)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            separator(Action1000000001)
            {
            }
        }
        area(processing)
        {
            separator(Action23)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action(CompanyInformation)
            {
                ApplicationArea = Basic;
                Caption = 'Com&pany Information';
                Image = CompanyInformation;
                RunObject = Page "Company Information";
            }
            // action(ManageStyleSheets)
            // {
            //     ApplicationArea = Basic;
            //     Caption = '&Manage Style Sheets';
            //     Image = StyleSheet;
            //     RunObject = Page "Manage Style Sheets - Pages";
            // }
            action(MigrationOverview)
            {
                ApplicationArea = Basic;
                Caption = 'Migration O&verview';
                Image = Migration;
                RunObject = Page "Config. Package Card";
            }
            action(RelocateAttachments)
            {
                ApplicationArea = Basic;
                Caption = 'Relocate &Attachments';
                Image = ChangeTo;
                RunObject = Report "Relocate Attachments";
            }
            action(CreateWarehouseLocation)
            {
                ApplicationArea = Basic;
                Caption = 'Create Warehouse &Location';
                Image = NewWarehouse;
                RunObject = Report "Create Warehouse Location";
            }
            action(ChangeLogSetup)
            {
                ApplicationArea = Basic;
                Caption = 'C&hange Log Setup';
                Image = LogSetup;
                RunObject = Page "Change Log Setup";
            }
            separator(Action30)
            {
            }
            group(ChangeSetup)
            {
                Caption = '&Change Setup';
                Image = Setup;
                action(GeneralLedgerSetup)
                {
                    ApplicationArea = Basic;
                    Caption = '&General Ledger Setup';
                    Image = Setup;
                    RunObject = Page "General Ledger Setup";
                }
                action(HumanResourceSetup)
                {
                    ApplicationArea = Basic;
                    Caption = '&Human Resource Setup';
                    Image = HRSetup;
                    RunObject = Page "Human Resources Setup";
                }
                action(SalesReceivablesSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales && Re&ceivables Setup';
                    Image = Setup;
                    RunObject = Page "Sales & Receivables Setup";
                }
                action(PurchasePayablesSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase && &Payables Setup';
                    Image = ReceivablesPayablesSetup;
                    RunObject = Page "Purchases & Payables Setup";
                }
                action(FixedAssetSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Fixed &Asset Setup';
                    Image = Setup;
                    RunObject = Page "Fixed Asset Setup";
                }
                action(InventorySetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Inve&ntory Setup';
                    Image = InventorySetup;
                    RunObject = Page "Inventory Setup";
                }
                action(SMTPMailSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'SMTP Mai&l Setup';
                    Image = MailSetup;
                    RunObject = Page "Email Accounts";
                }
                action(JobQueueSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Qu&eue Setup';
                    Image = JobListSetup;
                    RunObject = Page "Concurrent Session List";
                }
                action(Action77)
                {
                    ApplicationArea = Basic;
                    Caption = 'C&hange Log Setup';
                    Image = LogSetup;
                    RunObject = Page "Change Log Setup";
                }
                action(ApprovalSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Appro&val Setup';
                    Image = ApprovalSetup;
                    RunObject = Page "Approval User Setup";
                }
                action(MarketingSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Mar&keting Setup';
                    Image = MarketingSetup;
                    RunObject = Page "Marketing Setup";
                }
                action(ResourcesSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Res&ources Setup';
                    Image = ResourceSetup;
                    RunObject = Page "Resources Setup";
                }
                action(SetupQuestionnaire)
                {
                    ApplicationArea = Basic;
                    Caption = 'Setup &Questionnaire';
                    Image = QuestionaireSetup;
                    RunObject = Page "Config. Questionnaire";
                }
                action(ProfileQuestionnaireSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Profile Quest&ionnaire Setup';
                    Image = QuestionaireSetup;
                    RunObject = Page "Profile Questionnaire Setup";
                }
                action(NonstockItemSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Nonstock &Item Setup';
                    Image = NonStockItemSetup;
                    RunObject = Page "Catalog Item Setup";
                }
                action(InteractionTemplateSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Interaction &Template Setup';
                    Image = InteractionTemplateSetup;
                    RunObject = Page "Interaction Template Setup";
                }
                action(Miniforms)
                {
                    ApplicationArea = Basic;
                    Caption = 'Mini&forms';
                    Image = MiniForm;
                    RunObject = Page Miniforms;
                }
                action(OrderPromisingSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Or&der Promising Setup';
                    Image = OrderPromisingSetup;
                    RunObject = Page "Order Promising Setup";
                }
                action(ServiceSetup)
                {
                    ApplicationArea = Basic;
                    Caption = '&Service Setup';
                    Image = ServiceSetup;
                    RunObject = Page "Service Mgt. Setup";
                }
                action(RepairStatusSetup)
                {
                    ApplicationArea = Basic;
                    Caption = '&Repair Status Setup';
                    Image = ServiceSetup;
                    RunObject = Page "Repair Status Setup";
                }
                action(MapPointSetup)
                {
                    ApplicationArea = Basic;
                    Caption = '&MapPoint Setup';
                    Image = MapSetup;
                    RunObject = Page "Online Map Setup";
                }
            }
            group(ReportSelection)
            {
                Caption = '&Report Selection';
                Image = SelectReport;
                action(ReportSelectionBankAccount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Selection - &Bank Account';
                    Image = SelectReport;
                    RunObject = Page "Report Selection - Bank Acc.";
                }
                action(ReportSelectionReminderFinanceCharge)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Selection - &Reminder && Finance Charge';
                    Image = SelectReport;
                    RunObject = Page "Report Selection - Reminder";
                }
                action(ReportSelectionSales)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Selection - &Sales';
                    Image = SelectReport;
                    RunObject = Page "Report Selection - Sales";
                }
                action(ReportSelectionPurchase)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Selection - &Purchase';
                    Image = SelectReport;
                    RunObject = Page "Report Selection - Purchase";
                }
                action(ReportSelectionInventory)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Selection - &Inventory';
                    Image = SelectReport;
                    RunObject = Page "Report Selection - Inventory";
                }
                action(ReportSelectionProdOrder)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Selection - Prod. &Order';
                    Image = SelectReport;
                    RunObject = Page "Report Selection - Prod. Order";
                }
                action(ReportSelectionService)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Selection - S&ervice';
                    Image = SelectReport;
                    RunObject = Page "Report Selection - Service";
                }
                action(ReportSelectionCashFlow)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Selection - Cash Flow';
                    Image = SelectReport;
                    RunObject = Page "Report Selection - Cash Flow";
                }
            }
            group(DateCompression)
            {
                Caption = '&Date Compression';
                Image = Compress;
                action(DateCompressGLEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Compress &G/L Entries';
                    Image = GeneralLedger;
                    RunObject = Report "Date Compress General Ledger";
                }
                // action(DateCompressVATEntries)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Date Compress &VAT Entries';
                //     Image = VATStatement;
                //     RunObject = Report "Date Compress VAT Entries";
                // }
                action(DateCompressBankAccountLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Compress Bank &Account Ledger Entries';
                    Image = BankAccount;
                    RunObject = Report "Date Compress Bank Acc. Ledger";
                }
                action(DateCompressGLBudgetEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Compress G/L &Budget Entries';
                    Image = LedgerBudget;
                    RunObject = Report "Date Compr. G/L Budget Entries";
                }
                action(DateCompressCustomerLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Compress &Customer Ledger Entries';
                    Image = Customer;
                    RunObject = Report "Date Compress Customer Ledger";
                }
                action(DateCompressVendorLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Compress V&endor Ledger Entries';
                    Image = Vendor;
                    RunObject = Report "Date Compress Vendor Ledger";
                }
                action(DateCompressResourceLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Compress &Resource Ledger Entries';
                    Image = Resource;
                    RunObject = Report "Date Compress Resource Ledger";
                }
                action(DateCompressFALedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Compress &FA Ledger Entries';
                    Image = FixedAssets;
                    RunObject = Report "Date Compress FA Ledger";
                }
                action(DateCompressMaintenanceLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Compress &Maintenance Ledger Entries';
                    Image = Tools;
                    RunObject = Report "Date Compress Maint. Ledger";
                }
                action(DateCompressInsuranceLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Compress &Insurance Ledger Entries';
                    Image = Insurance;
                    RunObject = Report "Date Compress Insurance Ledger";
                }
                action(DateCompressWarehouseEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Compress &Warehouse Entries';
                    Image = Bin;
                    RunObject = Report "Date Compress Whse. Entries";
                }
            }
            separator(Action264)
            {
            }
            group(Contacts)
            {
                Caption = 'Con&tacts';
                Image = CustomerContact;
                action(CreateContactsfromCustomer)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Contacts from &Customer';
                    Image = CustomerContact;
                    RunObject = Report "Create Conts. from Customers";
                }
                action(CreateContactsfromVendor)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Contacts from &Vendor';
                    Image = VendorContact;
                    RunObject = Report "Create Conts. from Vendors";
                }
                action(CreateContactsfromBankAccount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Contacts from &Bank Account';
                    Image = BankContact;
                    RunObject = Report "Create Conts. from Bank Accs.";
                }
                action(TodoActivities)
                {
                    ApplicationArea = Basic;
                    Caption = 'To-do &Activities';
                    Image = TaskList;
                    RunObject = Page Activity;
                }
            }
            separator(Action47)
            {
            }
            action(ServiceTroubleshooting)
            {
                ApplicationArea = Basic;
                Caption = 'Service Trou&bleshooting';
                Image = Troubleshoot;
                RunObject = Page Troubleshooting;
            }
            group(Import)
            {
                Caption = '&Import';
                Image = Import;
                action(ImportIRIStoAreaSymptomCode)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import IRIS to &Area/Symptom Code';
                    Image = Import;
                    RunObject = XMLport "Imp. IRIS to Area/Symptom Code";
                }
                action(ImportIRIStoFaultCodes)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import IRIS to &Fault Codes';
                    Image = Import;
                    RunObject = XMLport "Import IRIS to Fault Codes";
                }
                action(ImportIRIStoResolutionCodes)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import IRIS to &Resolution Codes';
                    Image = Import;
                    RunObject = XMLport "Import IRIS to Resol. Codes";
                }
            }
            separator(Action263)
            {
            }
            group(SalesAnalysis)
            {
                Caption = '&Sales Analysis';
                Image = Segment;
                action(SalesAnalysisLineTemplates)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales Analysis &Line Templates';
                    Image = SetupLines;
                    RunObject = Page "Analysis Line Templates";
                    RunPageView = sorting("Analysis Area",Name)
                                  where("Analysis Area"=const(Sales));
                }
                action(SalesAnalysisColumnTemplates)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales Analysis &Column Templates';
                    Image = SetupColumns;
                    RunObject = Page "Analysis Column Templates";
                    RunPageView = sorting("Analysis Area",Name)
                                  where("Analysis Area"=const(Sales));
                }
            }
            group(PurchaseAnalysis)
            {
                Caption = 'P&urchase Analysis';
                Image = Purchasing;
                action(PurchaseAnalysisLineTemplates)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase &Analysis Line Templates';
                    Image = SetupLines;
                    RunObject = Page "Analysis Line Templates";
                    RunPageView = sorting("Analysis Area",Name)
                                  where("Analysis Area"=const(Purchase));
                }
                action(PurchaseAnalysisColumnTemplates)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Analysis &Column Templates';
                    Image = SetupColumns;
                    RunObject = Page "Analysis Column Templates";
                    RunPageView = sorting("Analysis Area",Name)
                                  where("Analysis Area"=const(Purchase));
                }
            }
        }
    }
}

