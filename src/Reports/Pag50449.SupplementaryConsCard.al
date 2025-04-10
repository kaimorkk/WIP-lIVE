page 50449 "Supplementary Cons Card"
{
    Caption = 'Supplementary Cons Card';
    PageType = Card;
    SourceTable = "Budget Consolidation Header";
    DeleteAllowed = false;
    PromotedActionCategories = 'New,Process,Reports,Request Approval,Approve';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategy"; "Corporate Strategy")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                    Caption = 'Financial Year';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic, Suite;
                }
                group("ApprovedAmts")
                {
                    Editable = false;
                    Caption = 'Consolidation Amounts';
                    field(Q1Amt; ApprovedBudgetTotals[1])
                    {
                        Caption = 'Quarter One Amount';

                        ApplicationArea = Basic, Suite;
                    }
                    field(Q2Amt; ApprovedBudgetTotals[2])
                    {
                        Caption = 'Quarter Two Amount';
                        ApplicationArea = Basic, Suite;
                    }
                    field(Q3Amt; ApprovedBudgetTotals[3])
                    {
                        Caption = 'Quarter Three Amount';
                        ApplicationArea = Basic, Suite;
                    }
                    field(Q4Amt; ApprovedBudgetTotals[4])
                    {
                        Caption = 'Quarter Four Amount';
                        ApplicationArea = Basic, Suite;
                    }
                    field(ApprovedTotal; ApprovedBudgetTotals[5])
                    {
                        Caption = 'Total Amount';
                        ApplicationArea = Basic, Suite;
                    }
                    field(CeilingAmount; ApprovedBudgetTotals[6])
                    {
                        Caption = 'Ceiling Amount';
                        ApplicationArea = Basic, Suite;
                    }
                }
                group("UnderReviewAmts")
                {
                    Editable = false;
                    Caption = 'Amounts Under Review';
                    Visible = HasPlansUnderReviewsVar;
                    field(Q1Amt2; BudgetTotalsUnderReview[1])
                    {
                        Caption = 'Quarter One Amount';
                        ApplicationArea = Basic, Suite;
                    }
                    field(Q2Amt2; BudgetTotalsUnderReview[2])
                    {
                        Caption = 'Quarter Two Amount';
                        ApplicationArea = Basic, Suite;
                    }
                    field(Q3Amt2; BudgetTotalsUnderReview[3])
                    {
                        Caption = 'Quarter Three Amount';
                        ApplicationArea = Basic, Suite;
                    }
                    field(Q4Amt2; BudgetTotalsUnderReview[4])
                    {
                        Caption = 'Quarter Four Amount';
                        ApplicationArea = Basic, Suite;
                    }
                    field(UnderReviewTotal; BudgetTotalsUnderReview[5])
                    {
                        Caption = 'Total Amount';
                        ApplicationArea = Basic, Suite;
                    }
                    field(CeilingAmountUnderReview; BudgetTotalsUnderReview[6])
                    {
                        Caption = 'Ceiling Amount';
                        ApplicationArea = Basic, Suite;
                    }
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control11; "Draft Workplan Cons Lines")
            {
                Caption = 'Consolidation Lines';
                SubPageLink = "Annual Workplan" = field(Code), Consolidated = const(true), "Under Review" = const(false);
                ApplicationArea = Basic, Suite;
            }
            part(Control13; "Draft Workplan Cons Lines")
            {
                Caption = 'Draft Workplans Under Review';
                SubPageLink = "Annual Workplan" = field(Code), "Under Review" = const(true);
                ApplicationArea = Basic, Suite;
            }
        }
        area(factboxes)
        {
            part(Attachment; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(80265),
                              "No." = field(Code);
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action26)
            {
            }
            action("Update Annual Workplan")
            {
                ApplicationArea = Basic;
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                trigger OnAction()
                begin
                    ConsolidatedBugdetEntry.Reset;
                    ConsolidatedBugdetEntry.SetRange("Consolidation Header No", Rec.Code);
                    ConsolidatedBugdetEntry.SetRange("Workplan No", Rec."Annual Workplan");
                    if ConsolidatedBugdetEntry.Find('-') then begin
                        repeat
                            WorkplanCostElements.Reset;
                            WorkplanCostElements.SetRange("Workplan No.", ConsolidatedBugdetEntry."Workplan No");
                            WorkplanCostElements.SetRange("Activity Id", ConsolidatedBugdetEntry."Activity Id");
                            WorkplanCostElements.SetRange("Sub Activity No", ConsolidatedBugdetEntry."Sub Initiative No.");
                            if not WorkplanCostElements.Find('-') then begin
                                WorkplanCostElements.Init;
                                WorkplanCostElements."Workplan No." := Rec."Annual Workplan";
                                WorkplanCostElements."Job No" := ConsolidatedBugdetEntry."Job No";
                                WorkplanCostElements."Vote id" := ConsolidatedBugdetEntry."Vote id";
                                WorkplanCostElements.Validate("Vote id");
                                WorkplanCostElements."Initiative No." := ConsolidatedBugdetEntry."Initiative No.";
                                WorkplanCostElements.Amount := ConsolidatedBugdetEntry.Amount;
                                WorkplanCostElements."Activity Id" := ConsolidatedBugdetEntry."Activity Id";
                                WorkplanCostElements."Cost Elements" := ConsolidatedBugdetEntry.Description;
                                WorkplanCostElements."Activity Description" := ConsolidatedBugdetEntry."Activity Description";
                                WorkplanCostElements.Insert;
                            end else begin
                                WorkplanCostElements.Amount := ConsolidatedBugdetEntry.Amount;
                                WorkplanCostElements.Modify;
                            end;
                        until ConsolidatedBugdetEntry.Next = 0;
                    end;
                    Message('Annual Workplan updated successfully');
                end;
            }
            action(SendToJSC)
            {
                Caption = 'Send for JSC Review';
                ApplicationArea = Basic, Suite;
                //Visible = (Rec."Approval Status" = Rec."Approval Status"::Released) and (Rec.Stage = Rec.Stage::Finance);
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;
                Image = SendTo;
                trigger OnAction()
                var
                    WorkplanMgt: Codeunit "Workplan Management";
                begin
                    if Confirm('Are you sure to send %1 to JSC for processing', false, Rec.Code) then
                        WorkplanMgt.SendDraftWorkplanConsilidationToNAJSCOrMarkApproved(Rec, 0);
                    Currpage.Close();
                end;
            }
            action(SendToNA)
            {
                Caption = 'Send for National Assembly Review';
                ApplicationArea = Basic, Suite;
                Visible = (Rec."Approval Status" = Rec."Approval Status"::Released) and (Rec.Stage = Rec.Stage::Finance);
                //Visible = (Rec.Stage = Rec.Stage::JSC);
                Promoted = true;
                PromotedCategory = Process;
                Image = SendTo;
                trigger OnAction()
                var
                    WorkplanMgt: Codeunit "Workplan Management";
                begin
                    if Confirm('Are you sure you want to send %1 to National Assembly for processing', false, Rec.Code) then
                        WorkplanMgt.SendDraftWorkplanConsilidationToNAJSCOrMarkApproved(Rec, 1);
                    WorkplanMgt.PostConsolidatedWorkplan(Rec);
                    Currpage.Close();
                end;
            }
            action(MarkAsApproved)
            {
                Caption = 'Marked As Approved Plan';
                ApplicationArea = Basic, Suite;
                Image = Approve;
                Visible = (Rec.Stage = Rec.Stage::NA);
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    WorkplanMgt: Codeunit "Workplan Management";
                begin
                    if Confirm('Are you sure to mark %1 as Fully Approved?', false, Rec.Code) then
                        WorkplanMgt.SendDraftWorkplanConsilidationToNAJSCOrMarkApproved(Rec, 2);
                    Currpage.Close();
                end;
            }
            action(PostToGL)
            {
                Caption = 'Post G/L Budgets';
                ApplicationArea = Basic, Suite;
                Image = Approve;
                Visible = (Rec.Stage = Rec.Stage::"Fully Approved") and (not Rec.Posted);
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    WorkplanMgt: Codeunit "Workplan Management";
                begin
                    if Confirm('Are you sure you want to Post %1 to G/L Budgets?', false, Rec.Code) then
                        WorkplanMgt.PostConsolidatedWorkplan(Rec);
                    Currpage.Close();
                end;
            }
            action(Supplementary)
            {
                Caption = 'Initiate Supplementary Budget';
                ApplicationArea = Basic, Suite;
                Image = Approve;
                Visible = (Rec.Stage = Rec.Stage::"Fully Approved") and (Rec.Posted);
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    WorkplanMgt: Codeunit "Workplan Management";
                begin
                    if Confirm('Are you sure you want to initiate a supplementary budget?', false) then
                        WorkplanMgt.InitiateSupplementaryBudget(Rec);
                    //Currpage.Close();
                end;
            }
            action("Workplan Ceilings")
            {
                ApplicationArea = Basic, Suite;
                Image = Report2;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    AWP: Record "Annual Strategy Workplan";
                begin
                    AWP.Reset();
                    AWP.SetRange(Consolidated, true);
                    AWP.SetRange("Annual Workplan", Rec.Code);
                    Report.Run(Report::"Workplan Ceilings", true, true, AWP);
                end;
            }
            action("Budget Per Item")
            {
                ApplicationArea = Basic, Suite;
                Image = Report;
                Promoted = true;
                Visible = false;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    AWP: Record "Annual Strategy Workplan";
                begin
                    AWP.Reset();
                    AWP.SetRange("Annual Workplan", Rec."Code");
                    Report.Run(Report::"Workplan Budget Per Item", true, true, AWP);
                end;
            }
            action("Itemized Budget")
            {
                ApplicationArea = Basic, Suite;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                //AWP: Record "Annual Strategy Workplan";

                begin
                    //AWP.Reset();
                    //AWP.SetRange("Annual Workplan", Rec."Code");
                    //Report.Run(Report::"Workplan Budget Per Item", true, true, AWP);

                    Report.Run(Report::"Itemized Budget Summary", true, true);
                end;
            }

            group(Attachments)
            {
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    trigger OnAction()
                    var
                        DMSManagement: Codeunit "Sharepoint Integration";
                        DocType: Enum SharepointDocumentType;
                    begin
                        DocType := DocType::"Supplementary Budget";
                        DMSManagement.GetDocument(DocType, Rec."Code", Rec.RecordID, 'FNC', 80265, 'Supplementary Budget by Workplan');

                    end;
                }
                action("View EDMS Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        attachLink: Record Attachments;
                    begin

                        attachLink.setRange(attachLink.Document_No, Rec."Code");
                        if attachLink.FindSet then
                            Page.Run(Page::Attachments, attachLink)
                        else
                            Error('No attached links found');
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    visible = (Rec."Approval Status" = Rec."Approval Status"::Open);
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
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
                        ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant);
                        ApprovalsMgmt.RunWorkflowOnCancelApprovalRequest(VarVariant);
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
            separator(Action18)
            {
            }
            action("Print Budget Analysis")
            {
                ApplicationArea = Basic;
                Image = Print;
                Visible = false;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    ConsolidatedBugdetEntry.Reset;
                    ConsolidatedBugdetEntry.SetRange("Consolidation Header No", Rec.Code);
                    if ConsolidatedBugdetEntry.Find('-') then begin
                        Report.Run(80039, true, true, ConsolidatedBugdetEntry);
                    end;
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Planning Budget Type" := Rec."planning budget type"::Supplementary;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Planning Budget Type" := Rec."planning budget type"::Supplementary;
    end;

    trigger OnOpenPage()
    var
        CanSendLinesForReview: Boolean;
    begin
        CanSendLinesForReview := Rec.Stage in [Rec.Stage::Finance, Rec.Stage::JSC, Rec.Stage::NA];
        CurrPage.Control11.Page.SetSendForReview(CanSendLinesForReview);
        HasPlansUnderReviewsVar := Rec.HasPlansUnderReviews();

        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false;
    end;

    trigger OnAfterGetRecord()
    var
        ApprovalMgts: Codeunit "Approvals Mgmt.";
    begin
        Rec.GetSummaryTotals(ApprovedBudgetTotals, 0);
        Rec.GetSummaryTotals(BudgetTotalsUnderReview, 1);
        CanCancel := ApprovalMgts.CanCancelApprovalForRecord(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalMgts.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;

    var
        WorkplanCostElements: Record "Workplan Cost Elements";
        ConsolidatedBugdetEntry: Record "Consolidated Bugdet Entry";
        BudgetConsolidationLines: Record "Budget Consolidation Lines";
        ConsolidatedBugdetEntryN: Record "Consolidated Bugdet Entry";
        VoteIdHolder: Code[10];
        BudgetConsolidationL: Record "Budget Consolidation Lines";
        JobTask: Record "Job Task";
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        ProcurementPlanEntryN: Record "Procurement Plan Entry";
        ProcEntryNo: Integer;
        BudgetConsolidationHeader: Record "Procurement Classes";
        ProcurementPlanLinesN: Record "Procurement Plan Lines";
        ProcLineNo: Integer;
        ProcurementPlanEntryOriginal: Record "Procurement Plan Entry";
        DetailedPPPlanEntry: Record "Detailed PP Plan Entry";
        DetailedPPPlanEntryN: Record "Detailed PP Plan Entry";
        ConsolidatedBugdetEntry3: Record "Consolidated Bugdet Entry";
        ApprovedBudgetTotals, BudgetTotalsUnderReview : Array[6] of Decimal;
        HasPlansUnderReviewsVar: boolean;
        CanCancel, OpenApprovalEntriesExistForCurrUser : Boolean;
}