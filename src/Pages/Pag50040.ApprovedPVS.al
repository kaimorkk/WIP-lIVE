namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Security.User;
using Microsoft.Bank.Ledger;


page 50040 "Approved Payment Vouchers"
{
    CardPageID = "Approved Payment Voucher";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Status = const(Released),
                            Posted = const(false),
                            banked = const(false),
                            "Archive Document" = const(false),
                            "PV Type" = const(Normal), "Document Type" = filter(<> "Bounced Payment Voucher"));
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Select field.';
                    Editable = true;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("File No."; Rec."File No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File No. field.';
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
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
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Amount LCY field.';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total VAT Amount field.';
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Witholding Tax Amount field.';
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the VAT Wthheld six % field.';
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Retention Amount field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Petty Cash Amount"; Rec."Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Petty Cash Amount field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Banked Payment Voucher")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Banked Payment Voucher action.';
                trigger OnAction()
                begin
                    Payments.Reset;
                    Payments.SetRange(Select, true);
                    Payments.SetRange("Payment Type", Payments."payment type"::"Payment Voucher");
                    if Payments.Find('-') then begin
                        repeat
                            Payments.banked := true;
                            Payments.Modify;
                        until Payments.Next = 0;
                    end;
                    Message('Banked Successfully');
                end;
            }
            action("Post")
            {
                ApplicationArea = Basic, Suite;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
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
                    Payments.SetRange("PV Type", Payments."PV Type"::Normal);
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
                            // PaymentsPost."Post Payment Voucher"(Payments, true, UserId);
                            Commit();
                        until Payments.Next() = 0;
                        Window.Close();
                    end;
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
                    UserSetup.Reset;
                    UserSetup.SetRange("User ID", UserId);
                    UserSetup.SetRange("Archive Document", true);
                    if UserSetup.Find('-') then begin
                        Rec.SetRange("No.", Rec."No.");
                        Rec."Archive Document" := true;
                        Rec.Modify;
                    end else
                        Error('You don''t have rights to archive finance documents,Contact System administrator');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        BankAccountLedgerEntry.Reset;
        BankAccountLedgerEntry.SetRange("Document No.", Rec."No.");
        BankAccountLedgerEntry.SetRange(Reversed, false);
        if BankAccountLedgerEntry.FindFirst then begin
            Rec.Posted := true;
            Rec."Posted By" := BankAccountLedgerEntry."User ID";
            Rec.Modify(true);
        end;
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Accounts User" = false then
                Error('You do not have permision to view Payment Vouchers');
        end;

        Payments.Reset();
        Payments.SetRange("Payment Type", Payments."Payment Type"::"Payment Voucher");
        Payments.SetRange("PV Type", Payments."PV Type"::Normal);
        Payments.SetRange(Select, true);
        if Payments.FindSet() then
            Payments.ModifyAll(Select, false);
    end;

    var
        UserSetup: Record "User Setup";
        Payments: Record Payments;
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
}
