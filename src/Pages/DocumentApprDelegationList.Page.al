Page 52194283 "Document Appr Delegation List"
{
    ApplicationArea = Basic;
    CardPageID = "Document Approval Delegation";
    Editable = false;
    PageType = List;
    SourceTable = "Document Approval Delegation";
    SourceTableView = where(Status=const(Open));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
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

    trigger OnOpenPage()
    begin
         SetRange("Current Approver ID",UserId);
    end;
}

