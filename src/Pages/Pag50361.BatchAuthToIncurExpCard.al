page 50361 "Batch Auth To Incur Exp Card"
{
    Caption = 'Batch AIE Card';
    PageType = Card;
    SourceTable = "Batch. Auth to Incur Expend";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                }
                field("Corporate Strategy"; "Corporate Strategy")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Reporting Period"; "Reporting Period")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Budget Code"; "Budget Code")
                {
                    ApplicationArea = Basic, Suite;
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
                field("Amount to Authorize"; Rec."Amount to Authorize")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Posted"; "Posted")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Posted On"; Rec."Posted On")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            part(AuthLines; "Batch Auth To Incur Exp Lines")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Batch No." = field("No.");
            }
        }
        area(factboxes)
        {
            part(Attachment; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50108),
                              "No." = field("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Suggest AIE Lines")
            {
                Image = SuggestLines;
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Process;
                visible = (Rec."Approval Status" = Rec."Approval Status"::Open) and (not Rec.Posted);
                trigger OnAction()
                var
                    WorkplanMgt: Codeunit "Workplan Management";
                begin
                    if Confirm('Are you sure to Generate?', false) then
                        WorkPlanMgt.SuggestBatchAIE(Rec);
                end;
            }
            action(Post)
            {
                Image = Post;
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Process;
                visible = (Rec."Approval Status" = Rec."Approval Status"::Released) and (not Rec.Posted);
                trigger OnAction()
                var
                    WorkplanMgt: Codeunit "Workplan Management";
                begin
                    if Confirm('Are you sure to Post?', false) then
                        WorkPlanMgt.PostBatchAIE(Rec);
                end;
            }
            action("Print")
            {
                ApplicationArea = Basic, Suite;
                Image = PrintChecklistReport;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    AIE: Record "Auth. Inc. Expend. Header";
                begin
                    AIE.Reset();
                    AIE.SetRange("Batch No.", Rec."No.");
                    Report.Run(Report::"Auth To Incur Expenditure", true, true, AIE);
                end;
            }
            group(Approvals1)
            {
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    visible = (Rec."Approval Status" = Rec."Approval Status"::Open) and (not Rec.Posted);
                    trigger OnAction()
                    var
                        ApprovalMgt: codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        Rec.TestField("Posting Date");
                        ApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant);
                        ApprovalMgt.RunWorkflowOnSendApprovalRequest(VarVariant);
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
                        ApprovalMgt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        ApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant);
                        ApprovalMgt.RunWorkflowOnCancelApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approvals';
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

            group(Attachments)
            {
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
                        DocType := DocType::BAIE;
                        DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'FNC', 50108, 'BAIE');
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

                        attachLink.setRange(attachLink.Document_No, Rec."No.");
                        if attachLink.FindSet then
                            Page.Run(Page::Attachments, attachLink)
                        else
                            Error('No attached links found');

                    end;
                }

            }
        }
    }
    trigger OnOpenPage()
    begin
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false;
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
}
