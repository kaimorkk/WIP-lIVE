page 50225 "Leave Management"
{
    Caption = 'Leave Management';
    PageType = RoleCenter;


    layout
    {
        area(rolecenter)
        {
            part(Control76; "Headline Judiciary")
            {
                ApplicationArea = Basic, Suite;
            }
            part("HR Leave Activities Cue"; "HR Leave Activities Cue")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
        }
    }
    actions
    {
        area(Sections)
        {

            group("Setup")
            {
                action("HRLeavePeriods")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'HR Leave Periods';
                    RunObject = page "HR Leave Periods";
                }
                action("Base Leave Calender")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Base Leave Calender';
                    RunObject = page "Base Calendar Card";
                }
                action("HRLeaveTypes")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'HR Leave Types';
                    RunObject = page "HR Leave Types";
                }
                action("HRLeaveTypes2")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Adoption Leave Setup';
                    RunObject = page "Adoption Leave Setup";
                }
                action("Leave Adjustment")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Leave Adjustment List';
                    RunObject = page "Leave Adjustment List";
                }

                action("Leave Batches")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Leave Batches';
                    RunObject = page "HR Leave Batches";
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
                action("Emp12")
                {
                    Caption = 'Attachee List';
                    ApplicationArea = BasicHR;
                    RunObject = page "Attachee List";
                }

                action("Emp14")
                {
                    Caption = 'Intern List';
                    ApplicationArea = BasicHR;
                    RunObject = page "Intern List";
                }
                action("Emp19")
                {
                    Caption = 'Temporary Employees';
                    ApplicationArea = BasicHR;
                    RunObject = page "Temporary Employees";
                }
                action("Employee List-Casual")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee List-Casual';
                    RunObject = page "Casual Employees List";
                }

                // action("Hardship Allowance Setup")
                // {
                //     ApplicationArea = BasicHR;
                //     Caption = 'Hardship Allowance Setup';
                //     RunObject = page "Hardship Allowance Setup";
                // }
                action("Employee Transfers History")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Transfers History';
                    RunObject = page "Employee Transfers History";
                }
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
            group("Leave Planner")
            {

                action("Leave Planner List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Leave Planner List';
                    RunObject = page "Leave Planner List";

                }
                action("ALeave Planner List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Approved Leave Plans';
                    RunObject = page "Approved Leave Plans";

                }

            }

            group("Leave Management List")
            {
                Caption = 'Leave Applications';
                action("Leave Application")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Leave Applications';
                    RunObject = page "Leave Applications List";
                }
                action("pLeave Application")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Pending Leave Applications';
                    RunObject = page "Pending Leave Applications";
                }
                action("Canceled Application")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Canceled Leave Applications';
                    RunObject = page "Canceled Leave Applications";
                }

                action("Rejected Application")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Rejected Leave Applications';
                    RunObject = page "Rejected Leave Applications";
                }
                action(HRApprovedLeave1)
                {
                    Caption = 'Time-Off Lieu Applications';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "HR Leave Reimbursements List";
                    RunPageView = WHERE("Application Type" = filter("Time Off"));
                }
                action(SubmittedTimeOff)
                {
                    Caption = 'Submitted Time-Offs';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Submitted Time Offs";

                }

                action("Employee Leave Balances")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Leave Balances';
                    RunObject = page "Employee Leave Balances";
                }

                action("ApprovedLeave Applications")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Approved Leave Applications';
                    Visible = false;
                    RunObject = page "Approved Leave Applications";
                }
                action("Posted Leave Applications")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Posted Leave Applications';
                    RunObject = page "Posted Leave Applications..";
                }
            }
            group("Leave Recall Application")
            {
                action("Leave Recall Applications")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Leave Application Recall';
                    RunObject = page "Leave Application Recall";
                }
                action("Posted Recalls")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Posted Leave Recalls';
                    RunObject = page "Posted Leave Recalls";
                }
            }
            group("Leave Reimbursement")
            {
                action(HRLeaveReimbursements)
                {
                    Caption = 'HR Leave Reimbursement';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Leave Reimbursements";
                    RunPageView = where("Application Type" = filter("Re-Imbursement" | "Carry Forward"));
                }
                action(HRApprovedLeaveReimbursements)
                {
                    Caption = 'Approved Leave Reimbursement';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Approved Leave Reimbursments";
                    RunPageView = where("Application Type" = filter("Re-Imbursement" | "Carry Forward"));
                }
                action(HRApprovedLeave)
                {
                    Caption = 'Time-Off Lieu Applications';
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "HR Leave Reimbursements List";
                    RunPageView = where("Application Type" = filter("Time Off"));
                }
                action(HRLeaveApplicatio)
                {
                    Caption = 'Paternity / Maternity Notification Applications';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "HR Leave Reimbursements List";
                    RunPageView = where("Application Type" = filter("Paternity" | "Maternity"));
                }
                action(HRApprovedLeaveCarryForward)
                {
                    Caption = 'Leave Carry Forward Applications';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "HR Leave Reimbursements List";
                    RunPageView = where("Application Type" = filter("Carry Forward"));
                }
                action(HRApprovedLeaveOther)
                {
                    Caption = 'Other Leave Applications';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "HR Leave Reimbursements List";
                    RunPageView = where("Application Type" = filter(Normal));
                }
            }

            // group("Overtime Management")
            // {
            //     Caption = 'Attendance Management';
            //     action("Employee Clock-In List")
            //     {
            //         ApplicationArea = BasicHR;
            //         Caption = 'Attendance List';
            //         RunObject = page "Employee Clock-In List";
            //     }
            //     action("Overtime List")
            //     {
            //         ApplicationArea = BasicHR;
            //         Caption = 'Overtime List';
            //         RunObject = page "Overtime List";
            //     }
            //     action("Approved Overtime")
            //     {
            //         ApplicationArea = BasicHR;
            //         Caption = 'Approved Overtime';
            //         RunObject = page "Approved Overtime List";
            //     }
            //     action("Overtime Report")
            //     {
            //         ApplicationArea = BasicHR;
            //         Caption = 'Overtime Report';
            //         //  RunObject = report "Overtime Report";
            //     }
            //     action("Overtime Types")
            //     {
            //         ApplicationArea = BasicHR;
            //         Caption = 'Overtime Types';
            //         RunObject = page "Overtime Types";
            //     }
            // }
            group("Absence Registration")
            {
                Caption = 'Absence Registration';
                action("Causes of Absence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Causes of Absence';
                    RunObject = page "Causes of Absence";
                }
                action("Absence Registration12")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Absence Registration';
                    RunObject = page "Absence Registration";
                }
                action("Staff Absences")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Staff Absences';
                    RunObject = report "Employee - Staff Absences";
                }
                action("Employee Absences by Causes")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Absences by Causes';
                    RunObject = report "Employee - Absences by Causes";
                }
            }













            group("Reports999999")
            {
                Caption = 'Reports';
                action("Leave Application Form")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Leave Application Form';
                    RunObject = Report "Leave Application Form";
                }
                action("Employee Leave Trend Analysis")
                {
                    ApplicationArea = BasicHR;

                    Caption = 'Leave Statement';
                    RunObject = Report "Leave Statement";
                }
                action("Employee Leave Balance")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Leave Balances';
                    RunObject = Report "Leave Balances Report";
                }
                action(Stats)
                {
                    ApplicationArea = BasicHR;
                    Caption = 'HR Leave Statistics';
                    RunObject = Report "HR Leave Statistics";
                }
                action("Employee Leave Allowance Payment Status")
                {
                    ApplicationArea = BasicHR;

                    Caption = 'Leave Applications';
                    RunObject = Report "Hr Leave Application";
                }
                action("HR Employees On Leave")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees On Leave';
                    RunObject = Report "HR Employees On Leave";
                }
                action("Leave Liability")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Leave Liability';
                    RunObject = Report "Leave Liability";
                }
            }
            group(PayrollGroup)
            {
                Caption = 'PCA';
                Image = AdministrationSalesPurchases;

                action("Open Paychange Advice")
                {
                    Caption = 'Open Paychange Advice';
                    ApplicationArea = basic;
                    RunObject = Page "prPCA list";
                    RunPageView = where(Status = filter(Open));
                }
                action("Pending Paychange Advice")
                {
                    Caption = 'Pending Paychange Advice';
                    ApplicationArea = basic;
                    RunObject = Page "prPCA list";
                    RunPageView = where(Status = filter("Pending Approval"));
                }
                action("Approved Paychange Advice")
                {
                    Caption = 'Approved Paychange Advice';
                    ApplicationArea = basic;
                    RunObject = Page "prPCA list";
                    RunPageView = where(Status = filter(Approved));
                }
                action("Posted Paychange Advice")
                {
                    Caption = 'Posted Paychange Advice';
                    ApplicationArea = basic;
                    RunObject = Page "prPCA list";
                    RunPageView = where(Status = filter(Posted));
                }

            }

            // group("Notices/Memos")
            // {
            //     Caption = 'Notice';
            //     Image = Ledger;


            //     action("Publish A Notice/Memo")
            //     {
            //         Caption = 'Create A Notice/Memo';
            //         ApplicationArea = basic;
            //         RunObject = page "Hr Noticeboard";
            //     }

            //     action("Published Notices")
            //     {
            //         Caption = 'Created Notices/Memos';
            //         ApplicationArea = basic;
            //         RunObject = page "Hr Noticeboard";
            //         RunPageView = where(Status = filter(true));
            //     }

            // }





        }
    }
}

