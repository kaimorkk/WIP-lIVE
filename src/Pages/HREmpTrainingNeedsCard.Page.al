Page 50036 "HR Emp Training Needs Card"
{
    SourceTable = "Employee Training Needs Table";

    layout
    {
        area(content)
        {
            group("Employee Training Needs")
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DirectorateName; "Directorate Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DepartmentCode; "Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DepartmentName; "Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Needs';
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(TrainingNeeds)
            {
                Caption = 'Training Needs';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.SendEmpTrainNeedApprovalRequest(Rec) then;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        /*UserSetup.RESET;
        IF UserSetup.GET(USERID) THEN
         SETRANGE("Employee No",UserSetup."Employee No.");
          */

    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
}

