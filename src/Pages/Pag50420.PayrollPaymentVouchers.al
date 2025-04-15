page 50420 "Payroll Payment Vouchers"
{
    Caption = 'Payroll Payment Vouchers';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Payments;
    // CardPageId = "Payroll Payment Voucher Card";
    SourceTableView = where("Payment Type" = const("Payment Voucher"), "PV Type" = const(Payroll));
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
                    Payments.SetRange("PV Type", Payments."PV Type"::Payroll);
                    Payments.SetRange(Posted, false);
                    Payments.SetRange(Select, true);
                    if Payments.FindSet() then begin
                        if not Confirm('Are you sure you want to Post the Selected Lines?', false) then
                            exit;
                        TotalCounter := Payments.Count;
                        Window.Open(ProgressTxt);
                        Window.Update(2, TotalCounter);
                        repeat
                            Counter += 1;
                            Window.Update(1, Counter);
                            // PaymentsPost."Post Payment Voucher"(Rec, false, UserId);
                            Commit();
                        until Payments.Next() = 0;
                        Window.Close();
                    end;
                end;
            }

            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    DMSManagement: Codeunit "Sharepoint Integration";
                    DocType: Enum SharepointDocumentType;
                begin
                    DocType := DocType::Payments;
                    DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'BMA', 57000, 'Payrol Payment Voucher');

                end;
            }
            action("View Attached Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;


                trigger OnAction()
                var
                    attachLink: Record Attachments;
                begin

                    attachLink.setRange(attachLink.Document_No, Rec."No.");
                    if attachLink.FindSet then
                        Page.Run(Page::Attachments, attachLink)
                    else
                        Error('No attached links found');

                end;
            }

        }
    }
    trigger OnOpenPage()
    var
        Payments: Record Payments;
    begin
        SelectVisible := (Rec.GetFilter(Status) = 'Released') and (Rec.GetFilter(Posted) = 'No');

        Payments.Reset();
        Payments.SetRange("Payment Type", Payments."Payment Type"::"Payment Voucher");
        Payments.SetRange("PV Type", Payments."PV Type"::Payroll);
        Payments.SetRange(Select, true);
        if Payments.FindSet() then
            Payments.ModifyAll(Select, false);
    end;

    var
        SelectVisible: Boolean;
}