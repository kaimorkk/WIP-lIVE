Page 52193424 "Document Approval Delegation1"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Document Approval Delegation";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(ApprovalDelegation)
            {
                Caption = 'Approval Delegation';
                field(DelegationNo;"Delegation No")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate;"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(NewApproverID;"New Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field(DelegationLimitsApproverID;"Delegation Limits Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(CurrentApproverID;"Current Approver ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action(DelegateApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Delegate Approval';

                    trigger OnAction()
                    begin
                        //Delegate(Rec);
                    end;
                }
            }
        }
    }
}

