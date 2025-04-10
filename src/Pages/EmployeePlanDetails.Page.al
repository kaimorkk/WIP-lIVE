Page 52193984 "Employee Plan Details"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    Editable = true;
    PageType = ListPart;
    SourceTable = "Employee Leave Plan1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(NoofDays; "Days Applied")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Days';
                    NotBlank = true;
                }
                field(StartDate; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; "End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Comments; Comments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
            Names := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
    end;

    var
        Names: Text[250];
        Employee: Record Employee;
        UserRec: Record "User Setup";
        Emp: Record Employee;
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        Mail: Codeunit Mail;
        d: Date;
        LeavePlanRec: Record "Employee Leave Plan1";
}

