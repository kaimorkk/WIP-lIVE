page 52193886 "HR PAYROLL ROLECENTRE"
{
    PageType = RoleCenter;
    Caption = 'Human Resource and Payroll Management RC';

    layout
    {
        area(rolecenter)
        {
            // part(Headline; "HR Headline")
            // {
            //     ApplicationArea = Basic, Suite;
            // }


            part("PR Payroll Activities Cue"; "PR Payroll Activities Cue")
            {
                Caption = 'PAYROLL ACTIVITIES';
                ApplicationArea = Basic, Suite;
            }
            part("HR Activities Cue"; "HR Activities Cue")
            {
                Caption = 'HUMAN RESOURCE ACTIVITIES';
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            // part("My Approval Entries"; "Requests to Approve")
            // {
            //     ApplicationArea = basic;
            //     Caption = 'My Approval Entries';
            // }

            part(Control46; "Team Member Activities No Msgs")
            {
                ApplicationArea = Suite;
            }


        }
    }

    actions
    {
        area(embedding)
        {

            action(PayrollPeriodAct)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Period Management';
                Image = Employee;
                RunObject = Page "PR Payroll Periods";
            }
        }

        area(processing)
        {
        }
        area(sections)
        {
            group(JobsManagement)
            {
                Caption = 'Jobs Management';
                Image = HumanResources;
                action("Jobs Management")
                {
                    ApplicationArea = Basic;
                    Caption = 'Jobs List';
                    Image = Employee;
                    RunObject = Page Positions;
                    ToolTip = 'List the Jobs.';
                }
                action("Jobs Grade")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Grades';
                    Image = Employee;
                    RunObject = Page "Job Grades";
                    ToolTip = 'List the Jobs.';
                }
                action("Salary Pointers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Salary Pointers';
                    Image = Employee;
                    RunObject = Page "Salary pointers";
                    ToolTip = 'List the Jobs.';
                }
            }

            group(PayrollGroup)
            {
                Caption = 'Payroll Management';
                Image = AdministrationSalesPurchases;
                // action("Payroll Data Form List")
                // {
                //     Caption = 'Payroll Data Form';
                //     ApplicationArea = basic;
                //     RunObject = Page "Payroll Data Form List";
                //     RunPageView = where(Status = filter(Open));
                // }
                // action("Pending Payroll Data Form")
                // {
                //     Caption = 'Pending Payroll Data Form';
                //     ApplicationArea = basic;
                //     RunObject = Page "Payroll Data Form List";
                //     RunPageView = where(Status = filter("Pending Approval"));
                // }
                // action("Approved Payroll Data Form")
                // {
                //     Caption = 'Approved Payroll Data Form';
                //     ApplicationArea = basic;
                //     RunObject = Page "Payroll Data Form List";
                //     RunPageView = where(Status = filter(Approved));
                // }
                // action("Posted Payroll Data Form")
                // {
                //     Caption = 'Posted Payroll Data Form';
                //     ApplicationArea = basic;
                //     RunObject = Page "Payroll Data Form List";
                //     RunPageView = where(Status = filter(Posted));
                // }

                // action("Open Paychange Advice")
                // {
                //     Caption = 'Open Paychange Advice';
                //     ApplicationArea = basic;
                //     RunObject = Page "prPCA list";
                //     RunPageView = where(Status = filter(Open));
                // }
                // action("Pending Paychange Advice")
                // {
                //     Caption = 'Pending Paychange Advice';
                //     ApplicationArea = basic;
                //     RunObject = Page "prPCA list";
                //     RunPageView = where(Status = filter("Pending Approval"));
                // }
                // action("Approved Paychange Advice")
                // {
                //     Caption = 'Approved Paychange Advice';
                //     ApplicationArea = basic;
                //     RunObject = Page "Approved PCAs";
                //     RunPageView = where(Status = filter(Approved));
                // }
                // action("Posted Paychange Advice")
                // {
                //     Caption = 'Posted Paychange Advice';
                //     ApplicationArea = basic;
                //     RunObject = Page "prPCA list";
                //     RunPageView = where(Status = filter(Posted));
                // }
                // action("Cancelled Paychange Advice")
                // {
                //     Caption = 'Cancelled Paychange Advice';
                //     ApplicationArea = basic;
                //     RunObject = Page "prPCA list";
                //     RunPageView = where(Status = filter(Cancelled));
                // }
                // action("Salary Advance List")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Salary Advance List";
                //     ToolTip = 'Executes the Salary Advance List action.';
                // }

                // action("Approved Salary Advance List")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Approved Salary Advance List";
                //     ToolTip = 'Executes the Approved Salary Advance List action.';
                // }
                // action("Posted  Salary Advance List")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Page "Posted  Salary Advance List";
                //     ToolTip = 'Executes the Posted  Salary Advance List action.';
                // }

                action(PRSalaryList)
                {
                    Caption = 'PR Salary List';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Salary List (ALL)";
                }
                action(PRSalaryList2)
                {
                    Caption = 'Inactive Salary List';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Salary List Inactive";
                }

                action("Salary Processing")
                {
                    ApplicationArea = Basic;
                    Caption = 'Salary Vouchers';
                    Image = Loaners;
                    RunObject = Page "Payroll Processing List";
                    RunPageView = where(Status = filter(Open));
                    ToolTip = 'Executes the Salary Processing action.';
                }
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

                action("Employee List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee List';
                    Image = Employee;
                    RunObject = Page "Employee List-P";
                    ToolTip = 'Executes the Employee List action.';
                }
                action(PRPeriodTransactions)
                {
                    Caption = 'PR Period Transactions';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Period Transaction List";
                    RunPageMode = view;
                }
                action("PR Employer Contributions")
                {
                    Caption = 'PR Employer Contributions';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Employer Contributions";
                    RunPageMode = view;
                }



                action(PRPayrollTransactions)
                {
                    Caption = 'PR Transaction Codes';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Transaction Codes List";
                    RunPageMode = View;
                }

                action(PRPayrollThirdParty)
                {
                    Caption = 'PR Third Party Charges';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Third Party Charges";
                    RunPageMode = View;
                }
                action(PREmployeeTransactions)
                {
                    Caption = 'PR Employee Transactions';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Employee Transactions";
                    RunPageMode = View;
                }

                action(HRBankSummary)
                {
                    Caption = 'HR Bank Summary';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "HR Bank Summary";
                    RunPageMode = View;
                }

                action(PRPayrollBuffer)
                {
                    Caption = 'PR Payroll Buffer';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Payroll Buffer List";
                    RunPageMode = view;
                    RunPageView = where(Status = filter(Open));
                }

                action(PayrollJournal)
                {
                    ApplicationArea = All;
                    Caption = 'Payroll Journal';
                    Image = Journal;
                    RunObject = page "General Journal";
                }
                action(StaffAdance)
                {
                    ApplicationArea = All;
                    Caption = 'Staff Advance';
                    Image = Apply;
                    RunObject = page "Staff Advance";
                }
            }
            group("Employee Management")
            {


                action("Employees12")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'All Employees';
                    RunObject = page "Employee List-HR";
                }
                // action("Emp12")
                // {
                //     Caption = 'Attachee List';
                //     ApplicationArea = BasicHR;
                //     RunObject = page "Attachee List";
                // }

                // action("Emp14")
                // {
                //     Caption = 'Intern List';
                //     ApplicationArea = BasicHR;
                //     RunObject = page "Intern List";
                // }



                action("Emp19")
                {
                    Caption = 'Temporary Employees';
                    ApplicationArea = BasicHR;
                    RunObject = page "Temporary Employees";
                }
                action("Emp20")
                {
                    Caption = 'Inactive Employees';
                    ApplicationArea = BasicHR;
                    RunObject = page "Inactive Employees";
                }
                // action("Employee List-Casual")
                // {
                //     ApplicationArea = BasicHR;
                //     Caption = 'Employee List-Casual';
                //     RunObject = page "Casual Employees List";

                // }


                // action("Employee Transfers History")
                // {
                //     ApplicationArea = BasicHR;
                //     Caption = 'Employee Transfers History';
                //     RunObject = page "Employee Transfers History";
                // }
                group("Reports2")
                {
                    Caption = 'Reports and Analysis';
                    action("Employee List Per Region/Towns")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List Per Region/Towns';
                        RunObject = page "Employee List";
                    }
                    action("Employee - Absences by Causes1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Absences by Causes';
                        //   RunObject = report "Employee - Absences by Causes";
                    }
                    action("Employee - Addresses1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Addresses';
                        RunObject = report "Employee - Addresses";
                    }
                    action("Employee - Alt. Addresses1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Alt. Addresses';
                        RunObject = report "Employee - Alt. Addresses";
                    }
                    action("Employee - Birthdays1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Birthdays';
                        RunObject = report "Employee - Birthdays";
                    }
                    action("Employee - Confidential Info.1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Confidential Info.';
                        RunObject = report "Employee - Confidential Info.";
                    }
                    action("Employee - Contracts1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = report "Employee - Contracts";
                    }
                    action("Employee - Labels1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Labels';
                        RunObject = report "Employee - Labels";
                    }
                    action("Employee - List1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = report "Employee - List";
                    }
                    action("Employee - Misc. Article Info.1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Misc. Article Info.';
                        RunObject = report "Employee - Misc. Article Info.";
                    }
                    action("Employee - Qualifications1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Qualifications';
                        RunObject = report "Employee - Qualifications";
                    }
                    action("Employee - Relatives1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Relatives';
                        RunObject = report "Employee - Relatives";
                    }
                    action("Employee - Staff Absences1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Absences';
                        // RunObject = report "Employee - Staff Absences";
                    }
                    action("Employee - Unions1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Unions';
                        RunObject = report "Employee - Unions";
                    }

                }
            }
            group("Bulk Emailing")
            {

                group(Approvals)
                {
                    Caption = 'Approvals';
                    // Image = Alerts;

                    action("Pending My Approval")
                    {
                        Caption = 'Pending My Approval';
                        ApplicationArea = all;
                        RunObject = Page "Requests to Approve";
                    }
                    action("My Approval requests")
                    {
                        Caption = 'My Approval requests';
                        ApplicationArea = all;
                        RunObject = Page "Approval Request Entries";
                    }
                }

            }
            group(PayrollSetups)
            {

                Caption = 'Payroll Setups';

                action(PREmployeePostingGroups)
                {
                    Caption = 'PR Employee Posting Groups';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Employee Posting Group";
                }

                action(PRThirdPartyCharges)
                {
                    Caption = 'PR Third Party Charges';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Third Party Charges";
                }

                action(PRTransCodeGrp)
                {
                    Caption = 'PR Transaction Code Groups';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Transaction Code Groups";
                }
                action(PRAccessRights)
                {
                    Caption = 'PR Access Rights';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Payroll Access Rights";
                }

                action(PRTransCodes)
                {
                    Caption = 'PR Transaction Codes';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR Transaction Codes List";
                }
                action(LoanSetups)
                {
                    Caption = 'Loan Products';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Loan Products";
                }

                action(PRRatesandCeilings)
                {
                    Caption = 'PR Rates and Ceilings';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Rates & Ceilings";
                }

                action(BankAccounts)
                {
                    Caption = 'PR Bank Accounts';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Bank Accounts";
                }

                action(BankBranches)
                {
                    Caption = 'PR Bank Branches';
                    RunObject = Page "PR Bank Branches";
                    ApplicationArea = All;
                }
                action(PayrollPeriods)
                {
                    Caption = 'PR Payroll Periods';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR Payroll Periods";
                }

                action(PRPayeSetup)
                {
                    Caption = 'PR PAYE Setup';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "PR PAYE Setup";
                }

                action(PRNHIF)
                {
                    Caption = 'PR NHIF';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR NHIF Setup";
                }
                action(PRNSSF)
                {
                    Caption = 'PR NSSF';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PR NSSF Setup";
                }
            }
        }
        area(Creation)
        {

            group(HRSetupGroup)
            {
                Caption = 'Human Resource Setups';
                Image = HumanResources;
                // action(HRLookupValuesAct)
                // {
                //     Caption = 'HR Lookup Values';
                //     ApplicationArea = Basic, Suite;
                //     RunObject = Page "HR Lookup Values List";
                // }
                action(HRSetup)
                {
                    Caption = 'HR Setup Card';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Human Resources Setup";
                }
                action(HRSetupList)
                {
                    Caption = 'HR Setup List';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "HR SetUp List";
                }


            }


            group(ApplicationSetups)
            {

                Caption = 'Application Setups ';

                action(ConfigPackages)
                {
                    Caption = 'Configuration Packages';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Config. Packages";

                }

                action(CompanyInfo)
                {
                    Caption = 'Company Information';
                    ApplicationArea = basic, suite;
                    RunObject = page "Company Information";
                }

                action(Workflow3)
                {
                    Caption = 'Workflow';
                    ApplicationArea = basic, suite;
                    RunObject = page Workflow;
                }

                action(WorkflowTableRelations)
                {
                    Caption = 'Workflow - Table Relations';
                    ApplicationArea = basic, suite;
                    RunObject = page "Workflow - Table Relations";
                }
                action(WorkflowEventCombinations)
                {
                    Caption = 'Workflow Event Combinations';
                    ApplicationArea = basic, suite;
                    RunObject = page "WF Event/Response Combinations";
                }
                action(ReportLayouts)
                {
                    Caption = 'Report Layouts';
                    ApplicationArea = basic, suite;
                    RunObject = page "Report Layout Selection";
                }
                action(Extensions)
                {
                    Caption = 'Extensions';
                    ApplicationArea = basic, suite;
                    RunObject = page "Extension Management";
                }

                action(Users)
                {
                    Caption = 'Users';
                    ApplicationArea = basic, suite;
                    RunObject = page Users;
                }

                action(Workflow)
                {
                    Caption = 'Workflow';
                    ApplicationArea = basic, suite;
                    RunObject = page Workflows;
                }
                action(WorkflowEvents)
                {
                    Caption = 'Workflow Events';
                    ApplicationArea = basic, suite;
                    RunObject = page "Workflow Events";
                }

            }

            group(ApprovalEntriesGrp)
            {

                Caption = 'Request to Approve';

                action(MyApprovalEntries)
                {
                    Caption = 'Request to Approve';
                    ApplicationArea = Basic, Suite;
                    RunObject = page "Requests to Approve";

                }
            }

        }

        area(Reporting)
        {

            group(PayrollReports)
            {
                Caption = 'Bank Reports';



                action(PayrollCompanyPayslip4)
                {
                    Caption = 'Detailed Bank Summary';
                    Image = Report;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Bank Summary Report";
                }
                action(PayrollCompanyPayslip14)
                {
                    Caption = 'Bank Net Salary Listing';
                    Image = Report;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Bank Net Salary Listing";
                }
                action(Summary)
                {
                    Caption = 'Bank Summary Report';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Bank Summary Report";
                }
                // action(PayrollCompanyPayslip87)
                // {
                //     Caption = 'Employee Bank Transfer File';
                //     Image = Transactions;
                //     ApplicationArea = Basic, Suite;
                //     RunObject = report "PR Employee Bank Transfer";
                // }

            }
            group(Statutory)
            {
                Caption = 'Statutory Reports';
                action(PRNHIFRemmitance)
                {
                    Caption = 'PR NHIF Remmitance';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR NHIF Report";
                }

                action(PRNSSSFRemmitance)
                {
                    Caption = 'PR NSSF Remmitance';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR NSSF Report";
                }
                action("PR Housing Levy")
                {
                    Caption = 'PR Housing Levy';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Housing Levy";
                }
                action("PR NITA")
                {
                    Caption = 'NITA';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report NITA;
                }
                action("PR HELB")
                {
                    Caption = 'HELB';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report HELB1;
                }
                action(MonthlyPAYE)
                {
                    Caption = 'Monthly PAYE Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Monthly PAYE Report";
                }
                action(PItax)
                {
                    Caption = 'PR iTax Report Final';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR iTax Report Final";
                }
                action(PItaxDisabili)
                {
                    Caption = 'PWD iTax Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PWD Online Itax Report1";
                }
                action(PItaxCar)
                {
                    Caption = 'Car Benefits iTax Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Itax Car Benefits";
                }

            }
            group(PensionReports)
            {
                Caption = 'Pension Reports';
                action(PRPensionReport2)
                {
                    Caption = 'PR Pension Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Pension Report";
                }
            }
            group(ManagementReports)
            {
                action(NewEmployees)
                {
                    Caption = 'New Employees';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "New Employees";
                }
                action(EmployeeExits)
                {
                    Caption = 'Employee Exits';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Employee Exits";
                }
                action("Salary Per Scale")
                {
                    Caption = 'Salary Per Scale';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Salary Per Scale";
                }
                // action("PayrollProjection")
                // {
                //     Caption = 'Payroll Year projections';
                //     Image = SelectReport;
                //     ApplicationArea = Basic, Suite;
                //     RunObject = report "Payroll Projections Report";
                // }
                action("Payroll Summary By Grade")
                {

                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Payroll Summary By Grade";
                }

            }
            group(MonthlyReports)
            {
                Caption = 'Monthly Reports';
                action(PayrollCompanyPayslipDetailed)
                {
                    Caption = 'Organization Payslip Summary';
                    Image = Report;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Company Payslip Summary";
                }
                action(PRSummaryDetailed)
                {
                    Caption = 'Payroll Extract';
                    Image = Transactions;
                    ApplicationArea = basic, suite;
                    RunObject = report "PR Master Roll Report";
                }
                action(master)
                {
                    Caption = 'Master Data';
                    Image = Transactions;
                    ApplicationArea = basic, suite;
                    RunObject = report "Master Data";
                }
                action(Party)
                {
                    Caption = 'Third Party Deductions';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Third Party Deductions2";
                }
                action(Party1)
                {
                    Caption = 'Third Party Deductions Individual';
                    Image = RefreshDiscount;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Third Party Deductions Individ";
                }
                action(Variance)
                {
                    Caption = 'Payroll Variance Summary';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Payroll Variance Summary";
                }
                // action(PayrollVarianceNEW2)
                // {
                //     Caption = 'Payroll Variance Report';
                //     Image = Transactions;
                //     ApplicationArea = Basic, Suite;
                //     RunObject = report "PRVariance";
                // }
                action(PREarningandDeductions)
                {
                    Caption = 'Monthly Transactions Summary- PY 20';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Company Payroll Summary 3";
                }
                action(PRDeductionsSummary)
                {
                    Caption = 'PR Deductions Summary';
                    Image = Accounts;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR Deductions Summary";
                }

            }



            group(AnnualReports)
            {
                Caption = 'Annual Reports';
                action(P9Report)
                {
                    Caption = 'P9';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "P9 Report (Final)";
                }

                action(P10Report2)
                {
                    Caption = 'P10';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "P10A.";
                }

                action(P10Report)
                {
                    Caption = 'P10A';
                    Image = SelectReport;
                    //Visible = false;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "P10A.";
                }

                action(PItax2)
                {
                    Caption = 'PR iTax Report Final"';
                    Image = Transactions;
                    //Visible = false;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "PR iTax Report Final";
                }

            }
        }
    }


}
profile "HR PAYROLL ROLECENTRE"
{
    Caption = 'HR PAYROLL';
    RoleCenter = "HR PAYROLL ROLECENTRE";
    ProfileDescription = 'HR PAYROLL';
}
