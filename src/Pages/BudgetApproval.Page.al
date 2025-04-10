Page 52193427 "Budget Approval"
{
    PageType = Card;
    SourceTable = "G/L Budget Name";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(StartDate; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentFilter; "Department Filter")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000008; "G/L Budget Entry")
            {
                SubPageLink = "Budget Name" = field(Name);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup1000000010)
            {
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        // ApprovalMgt.SendBudgetApprovalRequest(Rec)
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        // ApprovalMgt.CancelBudgetApprovalRequest(Rec, true, true);
                    end;
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}

