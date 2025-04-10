Page 52193461 "Grievance List-GS"
{
    CardPageID = "Grievance Card-GS";
    PageType = List;
    SourceTable = "User Support Incidences1";
    SourceTableView = where(Category = const(Grievance));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(GrievanceReference; "Incident Reference")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grievance Reference';
                }
                field(GrievanceDescription; "Incident Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grievance Description';
                }
                field(GrievanceDate; "Incident Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grievance Date';
                }
                field(User; User)
                {
                    ApplicationArea = Basic;
                }
                field(UseremailAddress; "User email Address")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(GrievanceStatus; "Incident Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grievance Status';
                }
                field(WorkplaceController; "Work place Controller")
                {
                    ApplicationArea = Basic;
                }
                field(WorkplaceControllerName; "Work place Controller Name")
                {
                    ApplicationArea = Basic;
                }
                field(Actiontaken; "Action taken")
                {
                    ApplicationArea = Basic;
                }
                field(ActionDate; "Action Date")
                {
                    ApplicationArea = Basic;
                }
                field(SystemSupportEmailAddress; "System Support Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(RemarksHR; "Remarks HR")
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
        SetRange(User, UserId);
    end;
}

