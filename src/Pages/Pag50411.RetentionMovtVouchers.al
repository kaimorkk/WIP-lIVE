page 50427 "Retention Movt Vouchers"
{
    Caption = 'Retention Vouchers';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Payments;
    // CardPageId = "Retention Movt Card";
    SourceTableView = where("Payment Type" = const("Payment Voucher"), "PV Type" = const(Retention));
    InsertAllowed = false;
    DeleteAllowed = false;
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';

    layout
    {
        area(Content)
        {
            Repeater(General)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic, Suite;
                    Visible = SelectVisible;
                }
                field("No."; "No.")
                {
                    Editable = false;
                    ApplicationArea = All;
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
                    PaymentsPost: Codeunit "Payment- Post-PV";
                    TotalCounter, Counter : Integer;
                begin
                    Payments.Reset();
                    Payments.SetRange("Payment Type", Payments."Payment Type"::"Payment Voucher");
                    Payments.SetRange("PV Type", Payments."PV Type"::Retention);
                    Payments.SetRange(Posted, false);
                    Payments.SetRange(Select, true);
                    Payments.SetRange(Status, Payments.Status::Released);
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
        SelectVisible := true;

        Payments.Reset();
        Payments.SetRange("Payment Type", Payments."Payment Type"::"Payment Voucher");
        Payments.SetRange("PV Type", Payments."PV Type"::Retention);
        Payments.SetRange(Select, true);
        if Payments.FindSet() then
            Payments.ModifyAll(Select, false);
    end;
}