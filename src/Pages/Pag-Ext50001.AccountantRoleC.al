pageextension 50001 "Accountant Role C" extends "Accountant Role Center"
{
    actions
    {
        movebefore(Journals; "Cash Management", Action16 )
        modify(Action84)
        {
            Visible = false;
        }
        modify("Recurring General Journals")
        {
            Visible = false;
        }
        modify(Deferrals)
        {
            Visible = false;
        }
        modify(Partners)
        {
            Visible = false;
        }
        modify(Action171)
        {
            Visible = false;
        }
        modify(Action173)
        {
            Visible = false;
        }
        modify("Bank Acc. Statements")
        {
            Visible = false;
        }
        modify("Cash Flow Forecasts")
        {
            Visible = false;
        }
        modify("Chart of Cash Flow Accounts")
        {
            Visible = false;
        }
        modify("Cash Flow Manual Expenses")
        {
            Visible = false;
        }
        modify("Cash Flow Manual Revenues")
        {
            Visible = false;
        }

        movebefore("General Journals"; Action170, "Accounting Periods", "Bank Account Posting Groups", "G/L Account Categories", Currencies, Employees)

        addfirst("Cash Management")
        {
            action("Receipt List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Receipt List';
                RunObject = Page "Receipt List";
            }
            action("Posted Receipt List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Receipt List';
                RunObject = Page "Posted Receipt List";
            }
            action("Payment Vouchers List")
            {
                ApplicationArea = Basic, Suite;
                RunObject = Page "Payment Listing1";
            }
            action("Posted PVs")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Payment Vouchers';
                RunObject = Page "PVs Posted List";
            }
            action("Archived PVs List")
            {
                ApplicationArea = Basic, Suite;
                RunObject = Page "Payment Listing-Archiving";
            }
            action(EFT)
            {
                ApplicationArea = Basic, Suite;
                RunObject = Page EFT;
            }
            action("Cash Management Setup")
            {
                ApplicationArea = Basic, Suite;
                RunObject = Page "Cash Management Setup";
            }
            action("Transaction Types")
            {
                ApplicationArea = Basic, Suite;
                RunObject = Page "Transaction Types Finance111";
            }

            action("Imprest Customer Posting Group")
            {
                ApplicationArea = Basic, Suite;
                RunObject = Page "Imprest Customer Posting Group";
            }

        }
        addlast("Cash Management")
        {
            group(History1)
            {
                Caption = 'History';
                action("Posted Receipt")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Posted Receipt List";
                }
                action("Posted Payment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PVs Posted List";
                }
                action("Payment Registration")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Payment Registration";
                }
                action("Posted Claims Accounting")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Posted Claims Accounting";
                }

                action("Posted Payment Reconciliations")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Posted Payment Reconciliations";
                }
                action("Check Ledger Entries")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Check Ledger Entries";
                }

            }
        }
        addafter("Cash Management")
        {
            group("Imprest Management")
            {
                action("Open Imprest")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Request Listing Finance";
                }
                action("Imprest Pending Approval")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Imprest Pending Approval";
                }
                action("Approved Imprest")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Approved Imprest";
                }
                action("Imprest Posted")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Imprest Posted";
                }
                action("Open Imprest Surrender")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Claims Listing Finance";
                }
                action("Surrender Pending Approval")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Surrender Pending Approval";
                }
                action("Approved Imprest Surrender")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Approved Imprest Surrender";
                }
                action("Posted Imprest Surrender")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Posted Imprest Surrender";
                }
                action("Claims Refunds")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Claims_Refunds Listing Finance";
                }
                //  action("Receipts")
                // {
                //     ApplicationArea = Basic, Suite;
                //     RunObject = Page "Receipts";
                // }

            }
            group("Payroll Management")
            {
                action("Salary Processing2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Salary Vouchers Pending Approval';
                    Image = Loaners;
                    RunObject = Page "Payroll Processing List";
                    RunPageView = where(Status = filter("Pending Approval"));
                    ToolTip = 'Executes the Salary Processing action.';
                }
                action("Salary Processing1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Salary Vouchers';
                    Image = Loaners;
                    RunObject = Page "Approved Salary Vouchers";
                    ToolTip = 'Executes the Salary Processing action.';
                }
                action(PayrollCompanyPayslipDetailed)
                {
                    Caption = 'Organization Payslip Summary';
                    Image = Report;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Company Payslip Summary";
                }
                action(PRDeductionsSummary)
                {
                    Caption = 'PR Deductions Summary';
                    Image = Accounts;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Deductions Summary";
                }
                action(PRSalaryNetpays)
                {
                    Caption = 'PR Salary Netpays';
                    Image = Accounts;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Salary Netpay";
                }
            }
        }
        addbefore("Posted Documents")
        {
            group(Reports1)
            {
                Caption = 'Reports';
                action("Bank Account Register")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Bank Account Register";
                }
                action("Bank Account - Check Details")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Bank Account - Check Details";
                }
                action("Bank Account - Labels")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Bank Account - Labels";
                }
                action("Bank Account - List")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Bank Account - List";
                }
                action("Bank Acc. - Detail Trial Bal.")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Bank Acc. - Detail Trial Bal.";
                }
                action("Receivables-Payables")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Receivables-Payables";
                }
                action("Imprest-Claim Voucher")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Imprest-Claim Voucher";
                }
                action("Payment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Payment Vouchers";
                }
                // action("VAT Withholding Certificate")
                // {
                //     ApplicationArea = Basic, Suite;
                //     RunObject = Report "VAT Withholding Certificate";
                // }
                action("Cheque Payment Register")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Cheque Register";
                }
                action("Cheque Received Register")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Cheque Received";
                }
                action("Budget/Expenditure")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = Report "Budget/Expenditure";
                }

            }
        }
    }
}
