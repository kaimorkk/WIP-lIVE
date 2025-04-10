Page 52193426 "Document Appr Delegation List1"
{
    CardPageID = "Document Approval Delegation1";
    PageType = List;
    SourceTable = "Document Approval Delegation";

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
                field(CurrentApproverID;"Current Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field(NewApproverID;"New Approver ID")
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

