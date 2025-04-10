page 90001 "Audit activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Finance Cue";

    layout
    {
        area(content)
        {
            cuegroup(Payments)
            {
                Caption = 'Payments';
                field("Posted Payment Vouchers"; Rec."Posted Payment Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Payment Vouchers';
                    // DrillDownPageID = "Posted Payment Vouchers";
                    ToolTip = 'Specifies the value of the Posted Payment Vouchers field.';
                }
            }
            cuegroup(Receivables)
            {
                Caption = 'Receivables';
                field("Posted Surrenders"; Rec."Posted Surrenders")
                {
                    ApplicationArea = Basic;
                    // DrillDownPageID = "Posted Direct Voucher List";
                    ToolTip = 'Specifies the value of the Posted Surrenders field.';
                }
            }
            cuegroup(Approvals)
            {
                Caption = 'Approvals';
                // field("Requests Sent for Approval"; "Requests Sent for Approval")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Approval Entries";
                //     ToolTip = 'Specifies the value of the Requests Sent for Approval field.';
                // }
                // field("Requests to Approve"; "Requests to Approve")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Requests to Approve";
                //     ToolTip = 'Specifies the value of the Requests to Approve field.';
                // }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetFilter("Due Date Filter", '<=%1', WorkDate);
        Rec.SetFilter("Overdue Date Filter", '<%1', WorkDate);
        // SetFilter("User ID Filter", UserId);
    end;
}

#pragma implicitwith restore

