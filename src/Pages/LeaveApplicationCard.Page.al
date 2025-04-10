Page 52194097 "Leave Application Card"
{
    PageType = Card;
    SourceTable = "Employee Leave Application1";

    layout
    {
        area(content)
        {
            field(ApplicationNo;"Application No")
            {
                ApplicationArea = Basic;
            }
            field(ApplicationDate;"Application Date")
            {
                ApplicationArea = Basic;
            }
            field(LeaveCode;"Leave Code")
            {
                ApplicationArea = Basic;

                trigger OnValidate()
                begin
                    if EmployeeLeave.Get("Employee No","Leave Code") then;
                end;
            }
            label(EmployeeDetails)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19063076;
                Caption = 'Employee Details';
                Style = Standard;
                StyleExpr = true;
            }
            field(EmployeeNo;"Employee No")
            {
                ApplicationArea = Basic;
            }
            field(EmployeeName;"Employee Name")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Name';
            }
            label(CurrentApplicationsDetails)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19058156;
                Caption = 'Current Applications Details';
                Style = Standard;
                StyleExpr = true;
            }
            field(DaysApplied;"Days Applied")
            {
                ApplicationArea = Basic;
            }
            field(LeaveBalance;EmployeeLeave.Balance)
            {
                ApplicationArea = Basic;
                Caption = 'Leave Balance';
            }
            field(StartDate;"Start Date")
            {
                ApplicationArea = Basic;
            }
            field(EndDate;"End Date")
            {
                ApplicationArea = Basic;
            }
            label(ApprovalDetails)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19054402;
                Caption = 'Approval Details';
                Style = Standard;
                StyleExpr = true;
            }
            field(ApprovedDays;"Approved Days")
            {
                ApplicationArea = Basic;
            }
            field(ApprovedStartDate;"Approved Start Date")
            {
                ApplicationArea = Basic;
            }
            field(ApprovedEndDate;"Approved End Date")
            {
                ApplicationArea = Basic;
            }
            field(VerifiedByManager;"Verified By Manager")
            {
                ApplicationArea = Basic;
            }
            field(VerificationDate;"Verification Date")
            {
                ApplicationArea = Basic;
            }
            field(LeaveStatus;"Leave Status")
            {
                ApplicationArea = Basic;
            }
            field(ApprovalDate;"Approval Date")
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

    var
        Employee: Record Employee;
        EmployeeLeave: Record "Employee Leaves1";
        Text19063076: label 'Employee';
        Text19058156: label 'Application Details';
        Text19054402: label 'Approved Values';

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        if Employee.Get("Employee No") then

        if EmployeeLeave.Get("Employee No","Leave Code") then
;
    end;
}

