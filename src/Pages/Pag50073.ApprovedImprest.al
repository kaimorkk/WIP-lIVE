namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Security.User;


page 50073 "Approved Standing Imprests"
{
    CardPageID = "Standing Imprest Requsition";
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Standing Imprest"),
                            Posted = const(false),
                            Status = filter(Released),
                            Selected = const(false),
                            "Archive Document" = const(false),
                            banked = const(false));
    InsertAllowed = false;
    DeleteAllowed = false;
    Caption = 'Approved Standing Imprest Warranties';


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selected field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Amount LCY field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Post Batch")
            {
                ApplicationArea = Basic, Suite;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Window: Dialog;
                    ProgressTxt: Label 'Processing Lines \ ##1## of ##2##';
                    Payments: Record Payments;
                    // PaymentsPost: Codeunit "Payments-Post";
                    TotalCounter, Counter : Integer;
                begin
                    Payments.Reset();
                    Payments.SetRange("Payment Type", Payments."Payment Type"::"Standing Imprest");
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
                            // PaymentsPost."Post Payment Voucher"(Payments, true, UserId);
                            Commit();
                        until Payments.Next() = 0;
                        Window.Close();
                    end;
                end;
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Print action.';
                trigger OnAction()
                begin
                    //DocPrint.PrintPurchHeader(Rec);
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(59098, true, true, Rec)
                end;
            }
            action("Banked Standing Imprest")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Banked Standing Imprest action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Select, true);
                    if Rec.Find('-') then begin
                        Rec.banked := true;
                        Rec.Modify;
                    end;
                    Message('Banked Successfully');
                end;
            }
            action("Archive Document")
            {
                ApplicationArea = Basic;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Archive Document action.';
                trigger OnAction()
                begin
                    Usersetup.Reset;
                    // Usersetup.SetRange("User ID", UserId);
                    Usersetup.SetRange("Archive Document", true);
                    if Usersetup.Find('-') then begin
                        Rec.SetRange("No.", Rec."No.");
                        Rec."Archive Document" := true;
                        Rec.Modify;
                    end else
                        Error('You don''t have rights to archive finance documents,Contact System administrator');
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        Payments: Record Payments;
    begin
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
        Payments.Reset();
        Payments.SetRange("Payment Type", Payments."Payment Type"::"Standing Imprest");
        Payments.SetRange(Select, true);
        Payments.Setrange(Posted, false);
        if Payments.FindSet() then
            Payments.ModifyAll(Select, false);
        Commit();
    end;

    var
        Payments: Record Payments;
        Usersetup: Record "User Setup";
}

#pragma implicitwith restore

