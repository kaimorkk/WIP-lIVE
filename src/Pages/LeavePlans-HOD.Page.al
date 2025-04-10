Page 52194099 "Leave Plans-HOD"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Employee Leave Plan1";
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
                field(Names;Names)
                {
                    ApplicationArea = Basic;
                    Caption = 'Names';
                    Editable = false;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(DaystoProceedonLeave;"Days Applied")
                {
                    ApplicationArea = Basic;
                    Caption = 'Days to Proceed on Leave';
                }
                field(StartDate;"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedDays;"Approved Days")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ApprovedStartDate;"Approved Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(VerifiedByManager;"Verified By Manager")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ApprovedEndDate;"Approved End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ApprovalDate;"Approval Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Employee.Reset;
        if Employee.Get("Employee No") then
        Names:=Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
    end;

    trigger OnOpenPage()
    begin
        UserRec.Reset;
        if UserRec.Get(UserId) then
         Emp.Reset;
         if Emp.Get(UserRec."Employee No.") then
           SetRange("Department Code",Emp."Global Dimension 2 Code");
    end;

    var
        Names: Text[250];
        Employee: Record Employee;
        UserRec: Record "User Setup";
        Emp: Record Employee;
}

