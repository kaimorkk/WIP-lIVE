PageExtension 52193467 pageextension52193467 extends "User Setup"
{
    Caption = 'User Setup';
    layout
    {
        addafter("Register Time")
        {
            field("Employee No."; "Employee No.")
            {
                ApplicationArea = Basic;
            }
            field("Customer A\C"; "Customer A\C")
            {
                ApplicationArea = Basic;
            }
            field("Resource No"; Rec."Resource No")
            {
                ApplicationArea = Basic;
            }
            field("Imprest Account"; Rec."Imprest Account")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Purchase Resp. Ctr. Filter")
        {
            field("Approver ID"; "Approver ID")
            {
                ApplicationArea = Basic;
            }
            field(Substitute; Substitute)
            {
                ApplicationArea = Basic;
            }
            field("Immediate Supervisor"; "Immediate Supervisor")
            {
                ApplicationArea = Basic;
            }
            field(HOD; HOD)
            {
                ApplicationArea = Basic;
                TableRelation = "User Setup";
            }
            field("Can Edit HR"; Rec."Can Edit HR")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Can Edit HR field.', Comment = '%';
            }
            field("Can View HR"; Rec."Can View HR")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Can View HR field.', Comment = '%';
            }
            field("Payroll View"; Rec."Payroll View")
            {
                ApplicationArea = basic;
            }
            field("Approval Administrator"; Rec."Approval Administrator")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the user who has rights to unblock approval workflows, for example, by delegating approval requests to new substitute approvers and deleting overdue approval requests.';
            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
            }
            field(Leave; Rec.Leave)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Time Sheet Admin.")
        {
            field("E-Mail"; "E-Mail")
            {
                ApplicationArea = Basic;
            }
            field("Portal User"; Rec."Portal User")
            {
                ApplicationArea = Basic;
            }
            field("HOD Finance"; Rec."HOD Finance")
            {
                ApplicationArea = Basic;
            }
            field("Unlimited Member Approval"; "Unlimited Member Approval")
            {
                ApplicationArea = Basic;
            }
            field("Post Memo"; Rec."Post Memo")
            {
                ApplicationArea = Basic;
            }
            field("Post Requisition"; Rec."Post Requisition")
            {
                ApplicationArea = Basic;
            }
            field("Procurement officer"; Rec."Procurement officer")
            {
                ApplicationArea = Basic;
            }
            field("Procurement Manager"; Rec."Procurement Manager")
            {
                ApplicationArea = Basic;
            }
            field("post surrender"; Rec."post surrender")
            {
                ApplicationArea = Basic;
            }
            field("Can Manage Workflow"; Rec."Can Manage Workflow")
            {
                ApplicationArea = Basic;
            }
            field("Can Change Profile"; Rec."Can Change Profile")
            {
                ApplicationArea = Basic;
            }
            field("Direct Edit Employee Records"; Rec."Direct Edit Employee Records")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Direct Edit Employee Records field.';
            }
        }
        addafter("User ID")
        {
            field(CIDO; Rec.CIDO)
            {
                ApplicationArea = Basic;
            }
            field("ICT Administrator"; Rec."ICT Administrator")
            {
                ApplicationArea = Basic;
            }
            field(Receiptionist; Rec.Receiptionist)
            {
                ApplicationArea = Basic;
            }
            field("Authorize IFS Creator"; Rec."Authorize IFS Creator")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action("User Signature")
            {
                Caption = 'User Signature';
                Image = Picture;
                RunObject = Page "User Signature";
                RunPageLink = "User ID" = FIELD("User ID");
            }
            action("Reset Password")
            {
                Caption = 'Reset Password';
                Image = ResetStatus;

                trigger OnAction()
                begin
                    Rec.Password := '';
                    if Rec.Modify() then
                        Message('Password was reset successfully.');
                end;
            }
        }
        addfirst(Category_New)
        {
            actionref("User Signature_Promoted"; "User Signature")
            {
            }
            actionref("Reset Password_Promoted"; "Reset Password")
            {
            }
        }
    }
}

