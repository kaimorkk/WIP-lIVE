Page 52194095 "Corporate Leave Plan"
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
                field(DirectorateCode;"Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
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

    var
        Names: Text[250];
        Employee: Record Employee;
}

