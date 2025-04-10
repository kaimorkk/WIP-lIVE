Page 52194323 "HODTraining Needs Request List"
{
    ApplicationArea = Basic;
    CardPageID = "Training Needs Request";
    PageType = List;
    SourceTable = "Training Needs Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(RequestNo; "Request No.")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateName; "Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentName; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(PeriodEndDate; "Period End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Period; Period)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
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
                        // //if ApprovalMgt.SendTrainingNeedsApprovalRequest(Rec) then;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        UserRec.Reset;
        if UserRec.Get(UserId) then
            // Emp.RESET;
            if Emp.Get(UserRec."Employee No.") then
                SetRange(Department, Emp."Global Dimension 2 Code");
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        UserRec: Record "User Setup";
        Emp: Record Employee;
}

