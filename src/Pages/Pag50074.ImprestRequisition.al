namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Security.User;

page 50074 "Imprest Requisitions"
{
    CardPageID = "Imprest Requisition";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    Caption = 'Safari Imprest Warranties';
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(Imprest), "Document Type" = filter(<> "Bounced Payment Voucher"));
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll No.';
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Surrendered; Rec.Surrendered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrendered field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
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
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                Visible = false;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57002, true, true);
                    Rec.Reset;
                end;
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
        Rec."Payment Type" := Rec."payment type"::Imprest;
        Rec."Document Type" := Rec."document type"::Imprest;
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Post Requisition" = false then
                Rec.SetRange("Created By", UserId);
        end;
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
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
}
