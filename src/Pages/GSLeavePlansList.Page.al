Page 52194262 "GS Leave Plans List"
{
    CardPageID = "Employee Leave Plan-GS";
    PageType = List;
    SourceTable = "Employee Leave Plan Header1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfJoiningCompany;"Date Of Joining Company")
                {
                    ApplicationArea = Basic;
                }
                field(ContractType;"Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                }
                field(LeaveCode;"Leave Code")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveEntitlement;"Leave Entitlement")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveEarnedtoDate;"Leave Earned to Date")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveBalance;"Leave Balance")
                {
                    ApplicationArea = Basic;
                }
                field(DaysinPlan;"Days in Plan")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationDate;"Application Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationNo;"Application No")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(FiscalStartDate;"Fiscal Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(MaturityDate;"Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(Noseries;"No. series")
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
          SetRange("User ID",UserId);
    end;
}

