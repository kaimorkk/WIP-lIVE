Page 52193447 "Dir Employee Leave Plan List"
{
    ApplicationArea = Basic;
    CardPageID = "Employee Leave Plan 2";
    PageType = List;
    SourceTable = "Employee Leave Plan Header1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveCode; "Leave Code")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveBalance; "Leave Balance")
                {
                    ApplicationArea = Basic;
                }
                field(FiscalStartDate; "Fiscal Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(MaturityDate; "Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field(UserID; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode; "Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveEntitlement; "Leave Entitlement")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfJoiningCompany; "Date Of Joining Company")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationDate; "Application Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationNo; "Application No")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Noseries; "No. series")
                {
                    ApplicationArea = Basic;
                }
                field(DaysinPlan; "Days in Plan")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveEarnedtoDate; "Leave Earned to Date")
                {
                    ApplicationArea = Basic;
                }
                field(ContractType; "Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                }
                field(RecalledDays; "Recalled Days")
                {
                    ApplicationArea = Basic;
                }
                field(OffDays; "Off Days")
                {
                    ApplicationArea = Basic;
                }
                field(TotalLeaveDays; "Total Leave Days")
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
            // Emp.RESET;
            if Emp.Get(UserRec."Employee No.") then
                SetRange("Directorate Code", Emp."Global Dimension 1 Code");
    end;

    var
        UserRec: Record "User Setup";
        Emp: Record Employee;
}

