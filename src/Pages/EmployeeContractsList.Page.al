Page 52194005 "Employee Contracts List"
{
    ApplicationArea = Basic;
    CardPageID = "Employee Contract";
    PageType = List;
    SourceTable = "Employee Contracts1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(CreationDate;"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field(ContractNo;"Contract No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(ContractStartDate;"Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ContractEndDate;"Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ContractPeriod;"Contract Period")
                {
                    ApplicationArea = Basic;
                }
                field(ContractLeaveEntitlement;"Contract Leave Entitlement")
                {
                    ApplicationArea = Basic;
                }
                field(BalanceBroughtForward;"Balance Brought Forward")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledDays;"Recalled Days")
                {
                    ApplicationArea = Basic;
                }
                field(TotalDaysTaken;"Total Days Taken")
                {
                    ApplicationArea = Basic;
                }
                field(DaysAbsent;"Days Absent")
                {
                    ApplicationArea = Basic;
                }
                field(ContractLeaveBalance;"Contract Leave Balance")
                {
                    ApplicationArea = Basic;
                }
                field(Expired;Expired)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

