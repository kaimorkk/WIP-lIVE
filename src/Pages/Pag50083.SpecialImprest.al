 
    page 50083 "Special Imprests"
{
    Caption = 'Special Imprests Warranties';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Special Imprest"), "Document Type" = filter(<> "Bounced Payment Voucher"));
    CardPageId = "Special Interest Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Select; Select)
                {
                    ApplicationArea = Basic, Suite;
                    Visible = SelectVisible;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                    Visible = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Post Batch")
            {
                ApplicationArea = Basic, Suite;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                visible = SelectVisible;
                trigger OnAction()
                var
                    Window: Dialog;
                    ProgressTxt: Label 'Processing Lines\ ##1## of ##2##';
                    Payments: Record Payments;
                    PaymentsPost: Codeunit "Payments-Post";
                    TotalCounter, Counter : Integer;
                begin
                    Payments.Reset();
                    Payments.SetRange("Payment Type", Payments."Payment Type"::"Special Imprest");
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
                            PaymentsPost."Post Payment Voucher"(Payments, true, UserId);
                            Commit();
                        until Payments.Next() = 0;
                        Window.Close();
                    end;
                end;
            }

        }
    }

    trigger OnOpenPage()
    var
        Payments: Record Payments;
        UserSetup: Record "User Setup";
    begin
        SelectVisible := (Rec.GetFilter(Status) = 'Released') and (Rec.GetFilter(Posted) = 'No');

        Payments.Reset();
        Payments.SetRange("Payment Type", Payments."Payment Type"::"Special Imprest");
        Payments.SetRange(Select, true);
        Payments.Setrange(Posted, false);
        if Payments.FindSet() then
            Payments.ModifyAll(Select, false);

        Commit();
        if UserSetup.Get(UserId) then begin
            // if UserSetup."Station Accountant" = true then begin
            //     Rec.FilterGroup(2);
            //     Rec.SetRange(rec."Shortcut Dimension 1 Code", UserSetup."Global Dimension 1 Code");
            //     Rec.FilterGroup(0)
            // end;
            // if (UserSetup."Station Accountant" = false) and (UserSetup."HQ Accountant" = false) then begin
            //     Rec.FilterGroup(2);
            //     Rec.SetRange(rec."Created By", UserSetup."User ID");
            //     Rec.FilterGroup(0)
            // end;
        end;
    end;

    var
        SelectVisible: Boolean;
}