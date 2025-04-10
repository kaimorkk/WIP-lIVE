Page 52194324 "Training Needs Request"
{
    PageType = Card;
    SourceTable = "Training Needs Header";

    layout
    {
        area(content)
        {
            group(General)
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
            part(Control1000000006; "Training Needs HOD")
            {
                SubPageLink = Directorate = field(Directorate),
                              "Department Code" = field(Department),
                              "Period End Date" = field("Period End Date"),
                              "Header No." = field("Request No.");
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
                        ////if ApprovalMgt.SendTrainingNeedsApprovalRequest(Rec) then;
                    end;
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}

