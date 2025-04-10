Page 50017 "HOD Leave Applications List"
{
    ApplicationArea = Basic;
    CardPageID = "Leave Application HR";
    PageType = List;
    SourceTable = "Employee Leave Application1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationNo;"Application No")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveCode;"Leave Code")
                {
                    ApplicationArea = Basic;
                }
                field(DaysApplied;"Days Applied")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate;"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationDate;"Application Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedDays;"Approved Days")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveStatus;"Leave Status")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedEndDate;"Approved End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalDate;"Approval Date")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveAllowancePayable;"Leave Allowance Payable")
                {
                    ApplicationArea = Basic;
                }
                field(days;days)
                {
                    ApplicationArea = Basic;
                }
                field(Noseries;"No. series")
                {
                    ApplicationArea = Basic;
                }
                field(ResumptionDate;"Resumption Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Balancebroughtforward;"Balance brought forward")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveEntitlment;"Leave Entitlment")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledDays;"Recalled Days")
                {
                    ApplicationArea = Basic;
                }
                field(TotalLeaveDaysTaken;"Total Leave Days Taken")
                {
                    ApplicationArea = Basic;
                }
                field(DaysAbsent;"Days Absent")
                {
                    ApplicationArea = Basic;
                }
                field(Leavebalance;"Leave balance")
                {
                    ApplicationArea = Basic;
                }
                field(DutiesTakenOverBy;"Duties Taken Over By")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(AnnualLeaveEntitlementBal;"Annual Leave Entitlement Bal")
                {
                    ApplicationArea = Basic;
                }
                field(MobileNo;"Mobile No")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedStartDate;"Approved Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveEarnedtoDate;"Leave Earned to Date")
                {
                    ApplicationArea = Basic;
                }
                field(MaturityDate;"Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field(DateofJoiningCompany;"Date of Joining Company")
                {
                    ApplicationArea = Basic;
                }
                field(FiscalStartDate;"Fiscal Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoofMonthsWorked;"No. of Months Worked")
                {
                    ApplicationArea = Basic;
                }
                field(OffDays;"Off Days")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(NoofApprovals;"No of Approvals")
                {
                    ApplicationArea = Basic;
                }
                field(ContractNo;"Contract No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        UserRec.Reset;
        if UserRec.Get(UserId) then
         //Emp.RESET;
         if Emp.Get(UserRec."Employee No.") then begin
           SetRange("Directorate Code",Emp."Global Dimension 1 Code");
           SetRange("Department Code",Emp."Global Dimension 2 Code");
         end;
    end;

    var
        UserRec: Record "User Setup";
        Emp: Record Employee;
}

