page 50413 "Retention Payment Vouchers"
{
    Caption = 'Retention Payment Vouchers';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Payments;
    DeleteAllowed = false;
    // CardPageId = "Retention Payment Card";
    SourceTableView = where("Payment Type" = const("Payment Voucher"), "PV Type" = const("Retention Payment"));
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';

    layout
    {
        area(Content)
        {
            Repeater(General)
            {
                field(Select; Select)
                {
                    ApplicationArea = Basic, Suite;
                    Visible = SelectVisible;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("On behalf of"; "On behalf of")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Source PV No."; "Source PV No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Total Amount"; "Total Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Total Amount LCY"; "Total Amount LCY")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Post")
            {
                ApplicationArea = Basic, Suite;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                visible = SelectVisible;
                trigger OnAction()
                var
                    Window: Dialog;
                    ProgressTxt: Label 'Processing ##1## of ##2##';
                    Payments: Record Payments;
                    // PaymentsPost: Codeunit "Payments-Post";
                    TotalCounter, Counter : Integer;
                begin
                    Payments.Reset();
                    Payments.SetRange("Payment Type", Payments."Payment Type"::"Payment Voucher");
                    Payments.SetRange("PV Type", Payments."PV Type"::"Retention Payment");
                    Payments.SetRange(Posted, false);
                    Payments.SetRange(Select, true);
                    if Payments.FindSet() then begin
                        if not Confirm('Are you sure to Post Selected Lines', false) then
                            exit;
                        TotalCounter := Payments.Count;
                        Window.Open(ProgressTxt);
                        Window.Update(2, TotalCounter);
                        repeat
                            Counter += 1;
                            Window.Update(1, Counter);
                            // PaymentsPost.PostPV2(Payments);
                            Commit();
                        until Payments.Next() = 0;
                        Window.Close();
                    end;
                end;
            }

        }
    }

    var
        SelectVisible: Boolean;

    trigger OnOpenPage()
    var
        Payments: Record Payments;
    begin
        SelectVisible := (Rec.GetFilter(Status) = 'Released') and (Rec.GetFilter(Posted) = 'No');

        Payments.Reset();
        Payments.SetRange("Payment Type", Payments."Payment Type"::"Payment Voucher");
        Payments.SetRange("PV Type", Payments."PV Type"::"Retention Payment");
        Payments.SetRange(Select, true);
        if Payments.FindSet() then
            Payments.ModifyAll(Select, false);
    end;

}