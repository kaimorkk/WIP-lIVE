page 50359 "Supplementary Budget Card"
{
    Caption = 'Supplementary Budget';
    PageType = Card;
    SourceTable = "Budget Reallocation Header";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Quarter; Rec.Quarter)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Quarter Start Date"; Rec."Quarter Start Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Quarter End Date"; Rec."Quarter End Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
            }
            part(Control11; "Budget Reallocation Lines")
            {
                SubPageLink = "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';
                visible = Rec."Approval Status" = Rec."Approval Status"::Approved;
                trigger OnAction()
                var
                    BudgetMgt: Codeunit "Budget Management";
                begin
                    if not Confirm('Do you want to Post?') then
                        exit;

                    BudgetMgt.PostBudgetModifications(Rec);
                    Currpage.Close();
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                visible = (Rec."Approval Status" = Rec."Approval Status"::Open) and (not Rec.Posted);
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    VarVariant := Rec;
                    ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant);
                    ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = CanCancel;
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    VarVariant := Rec;
                    ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant);
                    ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic, Suite;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(Approve)
            {
                ApplicationArea = Suite;
                Caption = 'Approve';
                Image = Approve;
                ToolTip = 'Approve the requested changes.';
                Visible = OpenApprovalEntriesExistForCurrUser;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    CurrPage.Close();
                end;
            }
            action(Reject)
            {
                ApplicationArea = Suite;
                Caption = 'Reject';
                Image = Reject;
                ToolTip = 'Reject the requested changes.';
                Visible = OpenApprovalEntriesExistForCurrUser;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    CurrPage.Close();
                end;
            }
            action(Delegate)
            {
                ApplicationArea = Suite;
                Caption = 'Delegate';
                Image = Delegate;
                ToolTip = 'Delegate the requested changes to the substitute approver.';
                Visible = OpenApprovalEntriesExistForCurrUser;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    CurrPage.Update();
                end;
            }

        }
    }
    trigger OnOpenPage()
    begin
        Currpage.Control11.Page.SetApplicationsVisible(false);
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Entry Type" := Rec."Entry Type"::"Supplementary";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Entry Type" := Rec."Entry Type"::"Supplementary";
    end;

    trigger OnAfterGetRecord()
    var
        ApprovalMgts: Codeunit "Approvals Mgmt.";
    begin
        CanCancel := ApprovalMgts.CanCancelApprovalForRecord(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalMgts.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;

    var
        KasnebFunctions: Codeunit KasnebFunctions;
        CanCancel, OpenApprovalEntriesExistForCurrUser : Boolean;
}
