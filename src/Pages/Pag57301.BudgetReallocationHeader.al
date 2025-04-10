#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 57301 "Budget Reallocation Header"
{
    PageType = Card;
    SourceTable = "Budget Reallocation Header";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approval Actions';

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
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                }
                field("Consolidation Template"; Rec."Consolidation Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Consolidation Template field.', Comment = '%';
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
                    Caption='Source Amount';
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
                field("Destination Amount"; Rec."Destination Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Destination Amount field.', Comment = '%';
                }
            }
            part(Control11; "Budget Reallocation Lines")
            {
                Caption = 'Reallocations';
                SubPageLink = "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
            part(Control12; "Budget Reallocation Req. Lines")
            {
                Caption = 'Reallocation Requests';
                Visible = false;
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
                //visible = Rec."Approval Status" = Rec."Approval Status"::Approved;
                visible=false;
                trigger OnAction()
                var
                    BudgetMgt: Codeunit "Budget Management";
                begin
                    if not Confirm('Do you want to Post?') then
                        exit;

                    BudgetMgt.PostBudgetModifications(Rec);
                    CurrPage.Close();
                end;
            }
            action("Generate AIE")
            {
                Image = PrepaymentInvoice;
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Process;
                Visible = (Rec."Approval Status" = Rec."Approval Status"::Approved) and (not Rec."AIE Posted");
                trigger OnAction()
                var
                    WorkplanMgt: Codeunit "Workplan Management";
                    AIENo: Code[20];
                    AuthIncExp: Record "Auth. Inc. Expend. Header";
                begin
                    if Confirm('Are you sure to Generate AIE?', false) then begin
                        AIENo := WorkplanMgt.GenerateReAllocationAIE(Rec);
                        if AIENo <> '' then begin
                            if Confirm('AIE %1 has been generated. Proceed and Open?', false, AIENo) then begin
                                AuthIncExp.Get(AIENo);
                                Page.Run(Page::"Special AIE Card", AuthIncExp);
                            end;
                        end;
                    end;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                    BudgetMgt: Codeunit "Budget Management";
                begin
                    BudgetMgt.ValidateBudgetReAllocationLines(Rec);
                    VarVariant := Rec;
                    ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant);
                    ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                    CurrPage.Close();
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
                    //ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant);
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
                    DocType := DocType::Budget;
                    DMSManagement.GetDocument(DocType, Rec."Document No", Rec.RecordID, 'FNC', 57100, 'Budget Realocation Header');
                end;
            }
            action("View Attach Documents")
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

                    attachLink.setRange(attachLink.Document_No, Rec."Document No");
                    if attachLink.FindSet then
                        Page.Run(Page::Attachments, attachLink)
                    else
                        Error('No attached links found');

                end;
            }



        }
    }
    trigger OnOpenPage()
    begin
        Currpage.Control11.Page.SetApplicationsVisible(true);
        Currpage.Control12.Page.SetApplicationsVisible(true);
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Entry Type" := Rec."Entry Type"::"Re-Allocation";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Entry Type" := Rec."Entry Type"::"Re-Allocation";
    end;

    trigger OnAfterGetRecord()
    var
        ApprovalMgts: Codeunit "Approvals Mgmt.";
    begin
        CanCancel := ApprovalMgts.CanCancelApprovalForRecord(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalMgts.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;

    var
        CanCancel, OpenApprovalEntriesExistForCurrUser : Boolean;
        KasnebFunctions: Codeunit KasnebFunctions;
}

#pragma implicitwith restore

