page 50500 "Integration Logs"
{
    ApplicationArea = All;
    Caption = 'Integration Logs';
    PageType = List;
    SourceTable = "Integration logs";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.', Comment = '%';
                }
                field(PRN; Rec.PRN)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PRN field.', Comment = '%';
                }
                field("Status Message"; Rec."Status Message")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status Message field.', Comment = '%';
                }
                field(Fetched; Rec.Fetched)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fetched field.', Comment = '%';
                }
                field(Replay; Rec.Replay)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Replay field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Refresh)
            {
                Promoted = true;
                PromotedCategory = New;
                Caption = 'Replay';

                trigger OnAction()
                var
                    Logs: Record "Integration logs";
                    Receipt: Record "Receipts Header1";
                // Payment: Record "Deposit Refund Buffer";
                // NotifyCts: Codeunit "NotifyCtsReceipt";
                // RefundVoucher: Codeunit "Create Refund Voucher";
                begin
                    Logs.reset;
                    Logs.SetRange(Replay, true);
                    if Logs.FindSet() then
                        repeat
                            Receipt.Reset();
                            Receipt.SetRange("No.", Logs."Document No");
                            // if Receipt.findfirst() then
                            //     RefundVoucher.ReturnReceiptNo(Receipt);
                            // Payment.Reset();
                            // Payment.SetRange("PV No/", Logs."Document No");
                            // if Payment.findfirst() then
                            //     RefundVoucher.ReturnPVNo(Payment);
                            Logs.Replay := false;
                            Logs.Modify();
                        until Logs.Next() = 0;
                end;

            }
        }
    }
}
