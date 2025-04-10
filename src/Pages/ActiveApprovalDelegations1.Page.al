Page 52193425 "Active Approval Delegations1"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Document Approval Delegation";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(DelegationNo;"Delegation No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(CurrentApproverID;"Current Approver ID")
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
}

