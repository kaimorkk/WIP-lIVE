page 90000 "Audit Role center"
{
    Caption = 'Audit Role center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group("Managers Role Centers")
            {
                part(Control1901197008; "Audit activities")
                {
                    ApplicationArea = Basic;
                }
                part(Control1907692008; "My Customers")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control1900724708)
            {
                part(Control17; "My Job Queue")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                part(Control1902476008; "My Vendors")
                {
                    ApplicationArea = Basic;
                }
                part(Control18; "Report Inbox Part")
                {
                    ApplicationArea = Basic;
                }
                systempart(Control1901377608; MyNotes)
                {
                    ApplicationArea = Basic;
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
                ApplicationArea = Basic;
                Caption = 'A&ccount Schedule';
                Image = "Report";
                RunObject = Report "Account Schedule";
            }
            group("&Trial Balance")
            {
                Caption = '&Trial Balance';
                Image = Balance;

                action("&G/L Trial Balance")
                {
                    ApplicationArea = Basic;
                    Caption = '&G/L Trial Balance';
                    Image = "Report";
                    RunObject = Report "Trial Balance";
                }
                action("Bank &Detail Trial Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank &Detail Trial Balance';
                    Image = "Report";
                    RunObject = Report "Bank Acc. - Detail Trial Bal.";
                }
                action("T&rial Balance/Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'T&rial Balance/Budget';
                    Image = "Report";
                    RunObject = Report "Trial Balance/Budget";
                }
                action("Trial Balance by &Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Trial Balance by &Period';
                    Image = "Report";
                    RunObject = Report "Trial Balance by Period";
                }
                action("Closing Tria&l Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closing Tria&l Balance';
                    Image = "Report";
                    RunObject = Report "Closing Trial Balance";
                }
            }
            action("&Fiscal Year Balance")
            {
                ApplicationArea = Basic;
                Caption = '&Fiscal Year Balance';
                Image = "Report";
                RunObject = Report "Fiscal Year Balance";
            }
            action("Balance C&omp. . Prev. Year")
            {
                ApplicationArea = Basic;
                Caption = 'Balance C&omp. . Prev. Year';
                Image = "Report";
                RunObject = Report "Balance Comp. - Prev. Year";
            }
            separator(Action49)
            {
            }
            action("&Aged Accounts Receivable")
            {
                ApplicationArea = Basic;
                Caption = '&Aged Accounts Receivable';
                Image = "Report";
                RunObject = Report "Aged Accounts Receivable";
            }
            action("Aged Accou&nts Payable")
            {
                ApplicationArea = Basic;
                Caption = 'Aged Accou&nts Payable';
                Image = "Report";
                RunObject = Report "Aged Accounts Payable";
            }
            action("Reconcile Cust. and &Vend. Accs")
            {
                ApplicationArea = Basic;
                Caption = 'Reconcile Cust. and &Vend. Accs';
                Image = "Report";
                RunObject = Report "Reconcile Cust. and Vend. Accs";
            }
            separator(Action53)
            {
            }
            action("VAT Reg&istration No. Check")
            {
                ApplicationArea = Basic;
                Caption = 'VAT Reg&istration No. Check';
                Image = "Report";
                RunObject = Report "VAT Registration No. Check";
            }
            action("VAT E&xceptions")
            {
                ApplicationArea = Basic;
                Caption = 'VAT E&xceptions';
                Image = "Report";
                RunObject = Report "VAT Exceptions";
            }
            action("VAT State&ment")
            {
                ApplicationArea = Basic;
                Caption = 'VAT State&ment';
                Image = "Report";
                RunObject = Report "VAT Statement";
            }
            action("VAT - VI&ES Declaration Tax Auth")
            {
                ApplicationArea = Basic;
                Caption = 'VAT - VI&ES Declaration Tax Auth';
                Image = "Report";
                RunObject = Report "VAT- VIES Declaration Tax Auth";
            }
            action("VAT - VIES Declaration Dis&k")
            {
                ApplicationArea = Basic;
                Caption = 'VAT - VIES Declaration Dis&k';
                Image = "Report";
                RunObject = Report "VAT- VIES Declaration Disk";
            }
            action("EC &Sales List")
            {
                ApplicationArea = Basic;
                Caption = 'EC &Sales List';
                Image = "Report";
                RunObject = Report "EC Sales List";
            }
        }
        area(embedding)
        {
            ToolTip = 'Collect and make payments, prepare statements, and manage reminders.';

            action("Chart of Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
            }
            action(Customers)
            {
                ApplicationArea = Basic;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
            }
            // action(Balance)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Balance';
            //     Image = Balance;
            //     RunObject = Page "Customer List";
            //     RunPageView = where("Balance (LCY)" = filter(<> 0));
            // }
            // action(Vendors)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Vendors';
            //     Image = Vendor;
            //     RunObject = Page "Vendor List";
            // }
            // action(Action5)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Balance';
            //     Image = Balance;
            //     RunObject = Page "Vendor List";
            //     RunPageView = where("Balance (LCY)" = filter(<> 0));
            // }
            // action("Payment on Hold")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Payment on Hold';
            //     RunObject = Page "Vendor List";
            //     RunPageView = where(Blocked = filter(Payment));
            // }
            // action("VAT Statements")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'VAT Statements';
            //     RunObject = Page "VAT Statement Names";
            // }
            // action("Purchase Invoices")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase Invoices';
            //     RunObject = Page "Purchase Invoices";
            // }
            // action("Purchase Orders")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Purchase Orders';
            //     // RunObject = Page "Purchase Order List";
            // }
            // action("Sales Invoices")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Sales Invoices';
            //     Image = Invoice;
            //     RunObject = Page "Sales Invoice List";
            // }
            // action("Sales Orders")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Sales Orders';
            //     Image = "Order";
            //     RunObject = Page "Sales Order List";
            // }
            // action(Approvals)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Approvals';
            //     Image = Approvals;
            //     RunObject = Page "Requests to Approve";
            // }
            // action("Cash Receipt Journals")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Cash Receipt Journals';
            //     Image = Journals;
            //     RunObject = Page "General Journal Batches";
            //     RunPageView = where("Template Type" = const("Cash Receipts"), Recurring = const(false));
            // }
            // action("Payment Journals")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Payment Journals';
            //     Image = Journals;
            //     RunObject = Page "General Journal Batches";
            //     RunPageView = where("Template Type" = const(Payments), Recurring = const(false));
            // }
            // action("General Journals")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'General Journals';
            //     Image = Journal;
            //     RunObject = Page "General Journal Batches";
            //     RunPageView = where("Template Type" = const(General), Recurring = const(false));
            // }
            // action("Recurring General Journals")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Recurring General Journals';
            //     RunObject = Page "General Journal Batches";
            //     RunPageView = where("Template Type" = const(General), Recurring = const(true));
            // }
            // action("Intrastat Journals")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Intrastat Journals';
            //     RunObject = Page "Intrastat Jnl. Batches";
            // }
        }
        area(sections)
        {
            group("Risk Governance")
            {
                Caption = 'Risk Governance';
                Image = FiledPosted;
                ToolTip = 'Risk Governance.';

                action("Risk Management Roles")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Management Roles';
                    Image = PostedShipment;
                    RunObject = Page "Risk Management Roles";
                }
                action("Risk Management Framework")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Management Framework';
                    Image = PostedOrder;
                    RunObject = Page "Risk Management Framework";
                }
                action("Risk Mgt Framework Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Mgt Framework Summary';
                    Image = PostedReturnReceipt;
                    RunObject = Report "Risk Mgt Framework Summary";
                }
                action("Risk Sources")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Sources';
                    Image = PostedOrder;
                    RunObject = Page "Risk Sources";
                }
                action("Risk Categories")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Categories';
                    RunObject = Page "Risk Categories";
                }
                action("Risk Identification Methods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Identification Methods';
                    RunObject = Page "Risk Identification Methods";
                }
                action("Risk Response Strategies")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Response Strategies';
                    RunObject = Page "Risk Response Strategies";
                }
                action("Risk Likelihood Rating Scales")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Likelihood Rating Scales';
                    RunObject = Page "Risk Likelihood Rating Scales";
                }
                action("Risk Impact Rating Scales")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Impact Rating Scales';
                    Image = OrderReminder;
                    RunObject = Page "Risk Impact Rating Scales";
                }
                action("Risk Overall Rating Scales")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Overall Rating Scales';
                    RunObject = Page "Risk Overall Rating Scales";
                }
                action("Risk Appetite Rating Scales")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Appetite Rating Scales';
                    Image = GLRegisters;
                    RunObject = Page "Risk Appetite Rating Scales";
                }
                action("StakeHolders")
                {
                    ApplicationArea = Basic;
                    Caption = 'StakeHolders';
                    Image = GLRegisters;
                    RunObject = Page "StakeHolders";
                }
                action("Risk & Audit Committee Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk & Audit Committee Types';
                    Image = GLRegisters;
                    RunObject = Page "Risk & Audit Committee Types";
                }
                action("Risk & Audit Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk & Audit Committee';
                    Image = GLRegisters;
                    RunObject = Page "Risk & Audit Committee";
                }
            }
            group("Risk & Compliance")
            {
                Caption = 'Risk & Compliance';
                Image = FiledPosted;
                ToolTip = 'Risk & Compliance.';

                // action("Strategic Risks - Top 10 List")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Strategic Risks - Top 10 List';
                //     Image = PostedShipment;
                //     RunObject = Report "Strategic Risks - Top 10 List";
                // }
                action("Strategic Risk Mgt. Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Strategic Risk Mgt. Plans';
                    Image = PostedOrder;
                    RunObject = Page "Strategic Risk Mgt. Plans";
                }
                action("Departmental Risk Mgt. Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Departmental Risk Mgt. Plans';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Departmental Risk Mgt. Plans";
                }
                action("Directorate Risk Mgt. Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Risk Mgt. Plans';
                    Image = PostedOrder;
                    RunObject = Page "Directorate Risk Mgt. Plans";
                }
                action("Project Risk Mgt. Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Risk Mgt. Plans';
                    RunObject = Page "Project Risk Mgt. Plans";
                }
                action("New Risk Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Risk Vouchers';
                    RunObject = Page "New Risk Vouchers";
                }
                action("Periodic Risk Status Reports")
                {
                    ApplicationArea = Basic;
                    Caption = 'Periodic Risk Status Reports';
                    RunObject = Page "Periodic Risk Status Reports";
                }
                action("Risk Incident Logs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Incident Logs';
                    RunObject = Page "Risk Incident Logs";
                }
                action("Approved StrategicRisk Management Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved StrategicRisk Management Plans';
                    Image = OrderReminder;
                    RunObject = Page "StrategicRisk Management Plans";
                }
                action("Posted New Risk Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted New Risk Vouchers';
                    RunObject = Page "Posted New Risk Vouchers";
                }
                action("Posted Risk Status Reports")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Risk Status Reports';
                    Image = GLRegisters;
                    RunObject = Page "Posted Risk Status Reports";
                }
                action("Posted Risk Incident Logs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Risk Incident Logs';
                    Image = GLRegisters;
                    RunObject = Page "Risk M&E List";
                }
                action("Risk Management Plan Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Management Plan Report';
                    Image = GLRegisters;
                    RunObject = Report "Risk Management Plan Report";
                }
                // action("Incident Condition& Activities")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Incident Severity Levels';
                //     Image = GLRegisters;
                //     RunObject = Page "Incident Condition& Activities";
                // }
                action("Responsibility Center List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibility Center List';
                    Image = GLRegisters;
                    RunObject = Page "Responsibility Center List";
                }
                action("Escalated Risk Incident List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Escalated Risk Incident List';
                    Image = GLRegisters;
                    RunObject = Page "Escalated Risk Incident List";
                }
                action("Implementation Status Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Implementation Status Report';
                    Image = GLRegisters;
                    RunObject = Page "Implementation Status Report";
                }
                action("Risk Incident Follow-Up List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Incident Follow-Up List';
                    Image = GLRegisters;
                    RunObject = Page "Risk Incident Follow-Up List";
                }
            }
            group("Audit Planning & Mobilization")
            {
                Caption = 'Audit Planning & Mobilization';
                Image = FiledPosted;
                ToolTip = 'Audit Planning & Mobilization.';

                action("Audit Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Plans';
                    Image = PostedShipment;
                    RunObject = Page "Audit Plans";
                }
                action("Audit Programs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Programs';
                    Image = PostedOrder;
                    RunObject = Page "Audit Projects";
                }
                action("Audit Commencement Notices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Commencement Notices';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Audit Commencement Notices";
                }
                action("Auditee Entrance Meetings")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Entrance Meetings';
                    Image = PostedOrder;
                    RunObject = Page "Auditee Entrance Meetings";
                }
                action("Pre-Audit Survey Invitations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pre-Audit Survey Invitations';
                    RunObject = Page "Audit Mobilization Headers";
                }
                action("Auditee Notice Responses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Auditee Notice Responses';
                    RunObject = Page "Audit Mobilization Headers";
                }
                action("Pre-Audit Survey Responses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pre-Audit Survey Responses';
                    RunObject = Page "Audit Mobilization Headers";
                }
                action("Posted Audit Commencement Notices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Audit Commencement Notices';
                    RunObject = Page "Audit Mobilization Headers";
                }
                action("Completed Audit Entrance Meetings")
                {
                    ApplicationArea = Basic;
                    Caption = 'Completed Audit Entrance Meetings';
                    Image = OrderReminder;
                    RunObject = Page "Audit Mobilization Headers";
                }
                action("Audit & Assurance Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit & Assurance Setup';
                    RunObject = Page "Audit & Assurance Setup";
                }
                action("Internal Audit Charter")
                {
                    ApplicationArea = Basic;
                    Caption = 'Internal Audit Charter';
                    Image = GLRegisters;
                    RunObject = Page "Internal Audit Charter";
                }
                action("Risk & Audit Officers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk & Audit Officers';
                    Image = GLRegisters;
                    RunObject = Page "Risk & Audit Officers";
                }
                action("Audit Work Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Work Types';
                    Image = GLRegisters;
                    RunObject = Page "Audit Work Types";
                }
                action("Audit Templates")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Templates';
                    Image = GLRegisters;
                    RunObject = Page "Audit Templates";
                }
                action("Audit Testing Methods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Testing Methods';
                    Image = GLRegisters;
                    RunObject = Page "Audit Testing Methods";
                }
                action("Compliance Frameworks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Compliance Frameworks';
                    Image = GLRegisters;
                    RunObject = Page "Compliance Frameworks";
                }
                action("Audit Locations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Locations';
                    Image = GLRegisters;
                    RunObject = Page "Audit Locations";
                }
            }
            group("Audit Fieldwork, Reporting & Exit")
            {
                Caption = 'Audit Fieldwork, Reporting & Exit';
                Image = FiledPosted;
                ToolTip = 'Audit Fieldwork, Reporting & Exit.';

                action("Ongoing Audit Projects")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ongoing Audit Projects';
                    Image = PostedShipment;
                    RunObject = Page "Audit Projects";
                }
                action("Audit Working Papers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Working Papers';
                    Image = PostedOrder;
                    RunObject = Page "Audit Fieldwork Vouchers";
                }
                action("Audit Exit Conferences")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Exit Meeting';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Audit Exit Conferences";
                }
                action("Draft Audit Reports")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Audit Reports';
                    Image = PostedOrder;
                    RunObject = Page "Draft Audit Report L";
                }
                action("Final Audit Reports")
                {
                    ApplicationArea = Basic;
                    Caption = 'Final Audit Reports';
                    RunObject = Page "Final Audit Report L";
                }
                action("Post-Audit Survey Invitations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post-Audit Survey Invitations';
                    RunObject = Page "Post-Audit Survey Invitations";
                }
                action("Post-Audit Survey Responses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post-Audit Survey Responses';
                    RunObject = Page "Post-Audit Survey Responses";
                }
                action("Posted Audit Fieldwork Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Audit Fieldwork Vouchers';
                    RunObject = Page "Audit Execution Headers";
                }
                action("Posted Audit Exit Meetings")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Audit Exit Meetings';
                    Image = OrderReminder;
                    RunObject = Page "Audit Execution Headers";
                }
                action("Posted Draft Audit Reports")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Draft Audit Reports';
                    RunObject = Page "Audit Execution Headers";
                }
                action("Posted Final Audit Reports")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Final Audit Reports';
                    Image = GLRegisters;
                    RunObject = Page "Audit Execution Headers";
                }
                action("Audit Assurance Levels")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Assurance Levels';
                    Image = GLRegisters;
                    RunObject = Page "Audit Assurance Levels";
                }
                action("Audit Finding Rating Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Finding Rating Codes';
                    Image = GLRegisters;
                    RunObject = Page "Audit Finding Rating Codes";
                }
                action("Audit Opinion Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Opinion Types';
                    Image = GLRegisters;
                    RunObject = Page "Audit Opinion Types";
                }

            }
            group("Audit Implementation & Follow-up")
            {
                Caption = 'Audit Implementation & Follow-up';
                Image = FiledPosted;
                ToolTip = 'Audit Implementation & Follow-up.';

                action("Completed Audit Projects")
                {
                    ApplicationArea = Basic;
                    Caption = 'Completed Audit Projects';
                    Image = PostedShipment;
                    RunObject = Page "Completed Audit Projects";
                }
                action("Audit Implementation Reports")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Implementation Reports';
                    Image = PostedOrder;
                    RunObject = Page "Audit Implementation Logs";
                }
                action("Follow-up Audit Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Follow-up Audit Vouchers';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Follow-up Audit Vouchers";
                }
                action("Open Audit Implentation Tasks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Open Audit Implentation Tasks';
                    Image = PostedOrder;
                    RunObject = Page "Audit Management Action Legers";
                }
                action("Posted Audit Implementation Reports")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Audit Implementation Reports';
                    RunObject = Page "Audit Implementation Logs";
                }
                action("Posted Follow-up Audits")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Follow-up Audits';
                    RunObject = Page "Follow-up Audit Vouchers";
                }
                action("Audit Management Action Legers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Management Action Legers';
                    RunObject = Page "Audit Management Action Legers";
                }
                // action("Action Plan Status Report")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Action Plan Status Report';
                //     RunObject = Report "Management Action Status";
                // }


            }
        }
        area(creation)
        {
            action("C&ustomer")
            {
                ApplicationArea = Basic;
                Caption = 'C&ustomer';
                Image = Customer;
                //    Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Customer Card";
                RunPageMode = Create;
            }
            //     action("Sales &Invoice")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Sales &Invoice';
            //         Image = Invoice;
            //         //   Promoted = false;
            //         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
            //         //PromotedCategory = Process;
            //         RunObject = Page "Sales Invoice";
            //         RunPageMode = Create;
            //     }
            //     action("Cash Receipt")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Cash Receipt';
            //         Image = CreditMemo;
            //         //  Promoted = false;
            //         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
            //         //PromotedCategory = Process;
            //         //RunObject = Page Receipt;
            //         RunPageMode = Create;
            //     }
            //     action("Sales &Fin. Charge Memo")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Sales &Fin. Charge Memo';
            //         Image = FinChargeMemo;
            //         //   Promoted = false;
            //         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
            //         //PromotedCategory = Process;
            //         RunObject = Page "Finance Charge Memo";
            //         RunPageMode = Create;
            //     }
            //     action("Sales &Reminder")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Sales &Reminder';
            //         Image = Reminder;
            //         //  Promoted = false;
            //         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
            //         //PromotedCategory = Process;
            //         RunObject = Page Reminder;
            //         RunPageMode = Create;
            //     }
            //     separator(Action554)
            //     {
            //     }
            //     action("&Vendor")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = '&Vendor';
            //         Image = Vendor;
            //         //  Promoted = false;
            //         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
            //         //PromotedCategory = Process;
            //         RunObject = Page "Vendor Card";
            //         RunPageMode = Create;
            //     }
            //     action("&Purchase Invoice")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = '&Purchase Invoice';
            //         Image = Invoice;
            //         //  Promoted = false;
            //         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
            //         //PromotedCategory = Process;
            //         RunObject = Page "Purchase Invoice";
            //         RunPageMode = Create;
            //     }
            // }
            // area(processing)
            // {
            //     separator(Action67)
            //     {
            //         Caption = 'Tasks';
            //         IsHeader = true;
            //     }
            //     action("Cash Re&ceipt Journal")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Cash Re&ceipt Journal';
            //         Image = CashReceiptJournal;
            //         RunObject = Page "Cash Receipt Journal";
            //     }
            //     action("Payment &Journal")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Payment &Journal';
            //         Image = PaymentJournal;
            //         RunObject = Page "Payment Journal";
            //     }
            //     action("Payment Registration")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Payment Registration';
            //         Image = Payment;
            //         RunObject = Page "Payment Registration";
            //     }
            //     separator(Action77)
            //     {
            //     }
            //     action("B&ank Account Reconciliations")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'B&ank Account Reconciliations';
            //         Image = BankAccountRec;
            //         RunObject = Page "Bank Acc. Reconciliation";
            //     }
            //     action("Adjust E&xchange Rates")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Adjust E&xchange Rates';
            //         Ellipsis = true;
            //         Image = AdjustExchangeRates;
            //         RunObject = Report "Adjust Exchange Rates";
            //     }
            //     action("Post Inventor&y Cost to G/L")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Post Inventor&y Cost to G/L';
            //         Ellipsis = true;
            //         Image = PostInventoryToGL;
            //         RunObject = Report "Post Inventory Cost to G/L";
            //     }
            //     action("Calc. and Pos&t VAT Settlement")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Calc. and Pos&t VAT Settlement';
            //         Ellipsis = true;
            //         Image = SettleOpenTransactions;
            //         RunObject = Report "Calc. and Post VAT Settlement";
            //     }
            //     separator(Action84)
            //     {
            //         Caption = 'Administration';
            //         IsHeader = true;
            //     }
            //     action("Sa&les && Receivables Setup")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Sa&les && Receivables Setup';
            //         Image = Setup;
            //         RunObject = Page "Sales & Receivables Setup";
            //     }
            //     separator(Action89)
            //     {
            //         Caption = 'History';
            //         IsHeader = true;
            //     }
            //     action("Navi&gate")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Navi&gate';
            //         Image = Navigate;
            //         RunObject = Page Navigate;
            //     }
        }
    }
}
profile "Audit Role center"
{
    Caption = 'Audit Role center';
    RoleCenter = "Audit Role center";
    ProfileDescription = 'Audit Role center';
}

