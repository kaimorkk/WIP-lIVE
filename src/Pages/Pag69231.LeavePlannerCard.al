

page 52194334 "Leave Planner Card"
{
    PageType = Card;
    SourceTable = "HR Leave Planner Header";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Leave Calendar"; Rec."Leave Calendar")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implementing Unit field.';
                }
                field("Implementing Unit Name"; Rec."Implementing Unit Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implementing Unit Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Tittle field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control1000000002; "Leave Planner Lines")
            {
                SubPageLink = "Application Code" = field("Application Code");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
            }
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Visible = false;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                begin

                    DocumentType := Documenttype::"Leave Planner";
                    ApprovalEntries.SetRecordfilters(DATABASE::"HR Leave Planner Header", DocumentType, Rec."Application Code");
                    ApprovalEntries.Run;
                end;
            }
            action("&Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                ToolTip = 'Executes the &Send Approval Request action.';
                trigger OnAction()
                var
                    Lines: Record "HR Leave Planner Lines";
                    Header: Record "HR Leave Planner Header";

                begin

                    if Confirm('Send this Leave schedule for Approval?', true) = false then exit;
                    Rec."User ID" := UserId;
                    VarVariant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                end;
            }
            action("&Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                ToolTip = 'Executes the &Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    VarVariant := Rec;
                    ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = PrintForm;
                ToolTip = 'Executes the Print action.';
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("&Approvals_Promoted"; "&Approvals")
                {
                }
                actionref("&Send Approval Request_Promoted"; "&Send Approval Request")
                {
                }
                actionref("&Cancel Approval Request_Promoted"; "&Cancel Approval Request")
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    var
        DocumentType: Enum "Approval Document Type";
        //Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Disciplinary Approvals","Activity Approval","Exit Approval","Medical Claim Approval",Jv,"BackToOffice ","Training Needs",EmpTransfer,LeavePlanner;
        ApprovalEntries: Page "Approval Entries";
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
}

#pragma implicitwith restore

