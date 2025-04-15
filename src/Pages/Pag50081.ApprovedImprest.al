namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Security.User;
using System.Email;
using Microsoft.Foundation.Company;



page 50081 "Approved Imprest Requisitions"
{
    CardPageID = "Approved Imprest Requisition";
    InsertAllowed = false;
    DeleteAllowed = false;
    PageType = List;
    caption = 'Approved Safari Imprest Warranties';
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Released),
                            Posted = const(false),
                            "Send for Posting" = const(false),
                            banked = const(false),
                            "Archive Document" = const(false), "Document Type" = filter(<> "Bounced Payment Voucher"));
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
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll No.';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
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
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(reporting)
        {
        }
        area(navigation)
        {
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;

                action("Post")
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
                        PaymentsPost: Codeunit "Payments-Post";
                        TotalCounter, Counter : Integer;
                    begin
                        Payments.Reset();
                        Payments.SetRange("Payment Type", Payments."Payment Type"::Imprest);
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
                                PaymentsPost."Post Imprest"(Rec);
                                Commit();
                            until Payments.Next() = 0;
                            Window.Close();
                        end;
                    end;
                }
                action("Banked Imprest Requisition")
                {
                    ApplicationArea = Basic;
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Banked Imprest Requisition action.';
                    trigger OnAction()
                    begin
                        Payments.Reset;
                        Payments.SetRange(Select, true);
                        Payments.SetRange("Payment Type", Payments."payment type"::Imprest);
                        Payments.SetRange(banked, false);
                        if Payments.Find('-') then begin
                            repeat
                                Payments.banked := true;
                                //SendEmail
                                SendEmail(Payments);
                                Payments.Modify(true);
                            until Payments.Next = 0;
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
                        UserSetup.Reset;
                        UserSetup.SetRange("User ID", UserId);
                        UserSetup.SetRange("Archive Document", true);
                        if UserSetup.Find('-') then begin
                            Payments.Reset;
                            Payments.SetRange("Document Type", Rec."document type"::Imprest);
                            Payments.SetRange("No.", Rec."No.");
                            if Payments.FindFirst then begin
                                repeat
                                    Payments."Archive Document" := true;
                                    Payments.Modify;
                                until Payments.Next = 0;
                            end;
                        end else
                            Error('You don''t have rights to archive finance documents,Contact System administrator');
                    end;
                }
                action(EFT)
                {
                    ApplicationArea = Basic;
                    Image = ElectronicDoc;
                    Promoted = true;
                    // RunObject = Report "EFT Imprest";
                    ToolTip = 'Executes the EFT action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Post Requisition" = false then
                Rec.SetRange("Created By", UserId);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Post Requisition" = false then
                Rec.SetRange("Created By", UserId);
        end;

        Payments.Reset();
        Payments.SetRange("Payment Type", Payments."Payment Type"::Imprest);
        Payments.SetRange(Select, true);
        Payments.Setrange(Posted, false);
        if Payments.FindSet() then
            Payments.ModifyAll(Select, false);
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
        UserSetup: Record "User Setup";
        Payments: Record Payments;


    procedure SendEmail(Payments: Record Payments)
    var
        ImprestMemo: Record "Imprest Memo";
        UserSetup: Record "User Setup";
        Email: Text;
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        ImprestOther: Decimal;
        CashMgt: Record "Cash Management Setup";
        Payments1: Record Payments;
    begin
        UserSetup.Reset;
        UserSetup.SetRange("Employee No.", Payments."Account No.");
        if UserSetup.FindSet then
            Email := UserSetup."E-Mail";
        //send notification email
        CashMgt.Get;
        Email2 := CashMgt."Imprest Email";
    end;
}
