namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Security.User;

page 50035 "Payments Vouchers"
{
    CardPageID = "Payment Voucher";
    Editable = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            "PV Type" = const(Normal), "Document Type" = filter(<> "Bounced Payment Voucher"));

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
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount LCY field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount Paid field.';
                }
                field("PV Remaining Amount"; Rec."PV Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remaining Amount';
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Payment Type field.';
                }
                field("PV Type"; Rec."PV Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the PV Type field.', Comment = '%';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }

            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Accounts User" = false then
                Error('You do not have permision to view Payment Vouchers');
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

