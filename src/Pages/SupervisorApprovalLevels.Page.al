Page 52193561 "Supervisor Approval Levels"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Supervisors Approval Levels";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(SupervisorID;SupervisorID)
                {
                    ApplicationArea = Basic;
                }
                field(MaximumApprovalAmount;"Maximum Approval Amount")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000007;Notes)
            {
            }
            systempart(Control1000000006;MyNotes)
            {
            }
            systempart(Control1000000005;Links)
            {
            }
        }
    }

    actions
    {
    }
}

