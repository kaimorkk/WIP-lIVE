Page 52193541 "Stores Cues"
{
    PageType = CardPart;
    SourceTable = "Requisition Header1";

    layout
    {
        area(content)
        {
            cuegroup(RequisitionstoApprove)
            {
                Caption = 'Requisitions to Approve';
                // field(PendingRQsforApproval;"Requisitions To Approve")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Pending RQs for Approval';

                //     trigger OnDrillDown()
                //     begin
                //         ApprovalEntry.Reset;
                //         ApprovalEntry.FilterGroup(10);
                //         ApprovalEntry.SetFilter("Approval Code",'%1','STORE');
                //         ApprovalEntry.SetFilter("Approver ID",'%1',UserId);
                //         ApprovalEntry.FilterGroup(0);
                //         Page.Run(662,ApprovalEntry);
                //     end;
                // }
                // field(PendingRequisitions;"Pending Requisitions")
                // {
                //     ApplicationArea = Basic;

                //     trigger OnDrillDown()
                //     begin
                //         Page.Run(51511833);
                //     end;
                // }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        // SetRange("USERID Filter",UserId);
    end;

    var
        ApprovalEntry: Record "Approval Entry";
        RequeststoApprove: Page "Approval Request Entries";
}

