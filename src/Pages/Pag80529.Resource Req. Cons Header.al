Page 80529 "Resource Req. Cons Header"
{
    Caption = 'Consolidation Header';
    PageType = Card;
    SourceTable = "Budget Consolidation Header";
    PromotedActionCategories = 'New,Process,Reports,Request Approval,Approval Options';

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
                    Editable = not HasLines;
                }
                field("Corporate Strategy"; "Corporate Strategy")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = not HasLines;
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                    Caption = 'Financial Year';
                    Editable = not HasLines;
                }
                field("Draft Workplan Consolidation"; "Draft Workplan Consolidation")
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
                    field("Total Submitted"; Rec."Total Submitted")
                    {
                        ApplicationArea = All;
                        Caption = 'Submitted Workplans';
                        ToolTip = 'Specifies the value of the Total Submitted field.', Comment = '%';
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
            part(Control11; "Resource Req Cons Lines")
            {
                Caption = 'Consolidation Lines';
                SubPageLink = "Annual Workplan" = field(Code), Consolidated = const(true), "Under Review" = const(false);
                ApplicationArea = Basic, Suite;
            }
            part(Control12; "Resource Req Cons Lines")
            {
                Caption = 'Consolidations Under Review';
                SubPageLink = "Annual Workplan" = field(Code), Consolidated = const(false), "Under Review" = const(true);
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Download Template")
            {
                ApplicationArea = Basic, Suite;
                Image = ExportToExcel;
                Promoted = true;
                PromotedCategory = Process;
                Visible = Rec."Approval Status" = Rec."Approval Status"::Open;
                trigger OnAction()
                var
                    ExportCeilings: XmlPort "Export Workplan Ceilings";
                begin
                    Clear(ExportCeilings);
                    ExportCeilings.GetBatchHeader(Rec.Code);
                    ExportCeilings.Run();
                end;
            }
            action("Import Ceilings")
            {
                ApplicationArea = Basic, Suite;
                Image = ExportToExcel;
                Promoted = true;
                PromotedCategory = Process;
                Visible = Rec."Approval Status" = Rec."Approval Status"::Open;
                trigger OnAction()
                var
                    ImportCeilings: XmlPort "Import Workplan Ceilings";
                begin
                    Clear(ImportCeilings);
                    ImportCeilings.GetBatchHeader(Rec.Code);
                    ImportCeilings.Run();
                end;
            }
            action("Suggest Consolidation Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                trigger OnAction()
                var
                    NumCount: Integer;
                    EntryNo: Integer;
                    TotalAmount: Decimal;
                begin
                    //TESTFIELD("Proposed Procurement Plan");
                    Rec.TestField("Annual Workplan");
                    Rec.TestField("Current Job");
                    Rec.TestField("Current Financial Budget");
                    EntryNo := 0;
                    ProcEntryNo := 0;

                    //clear Procurement Lines
                    ProcurementPlanLinesN.Reset;
                    ProcurementPlanLinesN.SetRange("AWP No", Rec."Annual Workplan");
                    ProcurementPlanLinesN.DeleteAll;

                    //Clear Procurement Entry Line Items
                    ProcurementPlanEntryN.Reset;
                    ProcurementPlanEntryN.SetRange("AWP No", Rec."Annual Workplan");
                    ProcurementPlanEntryN.DeleteAll;

                    //clear Detailed PP Plan Entries
                    DetailedPPPlanEntryN.Reset;
                    DetailedPPPlanEntryN.SetRange("Workplan No.", Rec."Annual Workplan");
                    DetailedPPPlanEntryN.DeleteAll;
                    //
                    ConsolidatedBugdetEntry3.Reset;
                    ConsolidatedBugdetEntry3.SetRange("Consolidation Header No", Rec.Code);
                    ConsolidatedBugdetEntry3.DeleteAll;
                    //

                    WorkplanCostElements.Reset;
                    WorkplanCostElements.SetRange("Workplan No.", Rec."Annual Workplan");
                    WorkplanCostElements.SetRange("Job No", Rec."Current Job");
                    if WorkplanCostElements.FindSet then begin
                        repeat

                            if WorkplanCostElements."Plan Item No" <> '' then begin
                                //Procurement Lines
                                FnUpdateProcurementLines(WorkplanCostElements."Functional Procurment Plan No", WorkplanCostElements."Plan Category", WorkplanCostElements."Workplan No.");
                                //Procurement Plan Entries
                                ProcurementPlanEntryOriginal.Reset;
                                ProcurementPlanEntryOriginal.SetRange("Procurement Plan ID", WorkplanCostElements."Functional Procurment Plan No");
                                ProcurementPlanEntryOriginal.SetRange("Planning Category", WorkplanCostElements."Plan Category");
                                ProcurementPlanEntryOriginal.SetRange("Plan Item No", WorkplanCostElements."Plan Item No");
                                ProcurementPlanEntryOriginal.SetRange("AWP No", WorkplanCostElements."Workplan No.");
                                ProcurementPlanEntryOriginal.SetRange(Directorate, FnGetDirectorate(Rec."Annual Workplan", WorkplanCostElements."Activity Id"));
                                ProcurementPlanEntryOriginal.SetRange(Department, FnGetDepartment(Rec."Annual Workplan", WorkplanCostElements."Activity Id"));

                                if not ProcurementPlanEntryOriginal.FindSet then begin

                                    ProcEntryNo := FngetLastProcEntryNo;
                                    if ProcEntryNo = 0 then
                                        ProcEntryNo := 1
                                    else
                                        ProcEntryNo := ProcEntryNo + 1;

                                    ProcurementPlanEntry.Init;
                                    ProcurementPlanEntry."Procurement Plan ID" := WorkplanCostElements."Functional Procurment Plan No";
                                    ProcurementPlanEntry."Planning Category" := WorkplanCostElements."Plan Category";
                                    ProcurementPlanEntry."Entry No." := ProcEntryNo;
                                    ProcurementPlanEntry."Document Type" := ProcurementPlanEntry."document type"::"Procurement Plan";
                                    ProcurementPlanEntry.Description := WorkplanCostElements."Plan Item Description";
                                    ProcurementPlanEntry."Planning Category" := WorkplanCostElements."Plan Category";
                                    ProcurementPlanEntry."Plan Item Type" := ProcurementPlanEntry."plan item type"::Item;
                                    ProcurementPlanEntry."Plan Item No" := WorkplanCostElements."Plan Item No";
                                    ProcurementPlanEntry.Quantity := 1;
                                    ProcurementPlanEntry."Unit Cost" := CalculateTotalAmount(WorkplanCostElements);
                                    // ProcurementPlanEntry."Line Budget Cost":=WorkplanCostElements.Amount;
                                    ProcurementPlanEntry."Line Budget Cost" := CalculateTotalAmount(WorkplanCostElements);
                                    ProcurementPlanEntry."Budget Control Job No" := WorkplanCostElements."Job No";
                                    ProcurementPlanEntry."Budget Account" := WorkplanCostElements."Vote id";
                                    StrategyWorkplanLines.SetRange(No, Rec."Annual Workplan");
                                    StrategyWorkplanLines.SetRange("Activity ID", WorkplanCostElements."Activity Id");
                                    if StrategyWorkplanLines.FindFirst then begin
                                        ProcurementPlanEntry.Directorate := StrategyWorkplanLines."Primary Directorate";
                                        ProcurementPlanEntry.Department := StrategyWorkplanLines."Primary Department";
                                    end;
                                    ProcurementPlanEntry."AWP No" := WorkplanCostElements."Workplan No.";
                                    ProcurementPlanEntry."Activity No" := WorkplanCostElements."Activity Id";
                                    ProcurementPlanEntry."Sub Activity No" := WorkplanCostElements."Sub Activity No";
                                    ProcurementPlanEntry.Insert(true);
                                    //         END ELSE BEGIN
                                    //           ProcurementPlanEntryOriginal."Unit Cost":=ProcurementPlanEntryOriginal."Unit Cost"+CalculateTotalAmount(WorkplanCostElements);
                                    //           ProcurementPlanEntryOriginal."Line Budget Cost":=ProcurementPlanEntryOriginal."Unit Cost"+CalculateTotalAmount(WorkplanCostElements);
                                    //           ProcurementPlanEntryOriginal.MODIFY(TRUE);
                                end;
                            end; /*ELSE BEGIN
                                   ProcurementPlanEntryOriginal.Quantity:=1;
                                   TotalAmount:=TotalAmount+WorkplanCostElements.Amount;
                                   ProcurementPlanEntryOriginal.VALIDATE("Unit Cost",TotalAmount);
                                   ProcurementPlanEntryOriginal.MODIFY;
                             END;*/

                            //Consolidation Entries
                            EntryNo := FngetLastEntryNo;
                            if EntryNo = 0 then
                                EntryNo := 1
                            else
                                EntryNo := EntryNo + 1;
                            VoteIdHolder := '';
                            ConsolidatedBugdetEntry.Init;
                            ConsolidatedBugdetEntry."Consolidation Header No" := Rec.Code;
                            ConsolidatedBugdetEntry."Entry No" := EntryNo;
                            ConsolidatedBugdetEntry."Job No" := WorkplanCostElements."Job No";
                            ConsolidatedBugdetEntry."Vote id" := WorkplanCostElements."Vote id";
                            ConsolidatedBugdetEntry.Validate("Vote id");
                            ConsolidatedBugdetEntry.Amount := WorkplanCostElements.Amount;
                            ConsolidatedBugdetEntry."Activity Id" := WorkplanCostElements."Activity Id";
                            ConsolidatedBugdetEntry.Description := WorkplanCostElements."Cost Elements";
                            ConsolidatedBugdetEntry."Activity Description" := WorkplanCostElements."Activity Description";
                            ConsolidatedBugdetEntry."Workplan No" := Rec."Annual Workplan";
                            ConsolidatedBugdetEntry."Initiative No." := WorkplanCostElements."Initiative No.";
                            ConsolidatedBugdetEntry."Planned Item No" := WorkplanCostElements."Plan Item No";
                            StrategyWorkplanLines.Reset;
                            StrategyWorkplanLines.SetRange(No, Rec."Annual Workplan");
                            StrategyWorkplanLines.SetRange("Activity ID", WorkplanCostElements."Activity Id");
                            if StrategyWorkplanLines.FindFirst then begin
                                ConsolidatedBugdetEntry."Primary Directorate" := StrategyWorkplanLines."Primary Directorate";
                                ConsolidatedBugdetEntry."Primary Department" := StrategyWorkplanLines."Primary Department";
                            end;
                            ConsolidatedBugdetEntry."Sub Initiative No." := WorkplanCostElements."Sub Activity No";
                            if (ConsolidatedBugdetEntry.Insert = true) then begin

                                VoteIdHolder := ConsolidatedBugdetEntry."Vote id";
                                BudgetConsolidationLines.Reset;
                                BudgetConsolidationLines.SetRange("Consolidation Header No", Rec.Code);
                                BudgetConsolidationLines.SetRange("Job No", Rec."Current Job");
                                BudgetConsolidationLines.SetRange("Vote id", VoteIdHolder);
                                if not BudgetConsolidationLines.FindSet then begin
                                    BudgetConsolidationL.Init;
                                    BudgetConsolidationL."Consolidation Header No" := Rec.Code;
                                    BudgetConsolidationL."Job No" := Rec."Current Job";
                                    BudgetConsolidationL."Vote id" := VoteIdHolder;
                                    BudgetConsolidationL."Workplan No" := Rec."Annual Workplan";
                                    BudgetConsolidationL.Validate("Vote id");
                                    JobTask.Reset;
                                    JobTask.SetRange("Job No.", Rec."Current Job");
                                    JobTask.SetRange("Job Task No.", BudgetConsolidationL."Vote id");
                                    if JobTask.FindFirst then
                                        JobTask.CalcFields("Schedule (Total Cost)");
                                    BudgetConsolidationL."GL Budgeted Amount" := JobTask."Schedule (Total Cost)";
                                    BudgetConsolidationL.Insert;
                                end;
                            end;
                            DetailedPPPlanEntry.Init;
                            DetailedPPPlanEntry.TransferFields(WorkplanCostElements);
                            DetailedPPPlanEntry."Plan Type" := DetailedPPPlanEntry."plan type"::Functional;
                            DetailedPPPlanEntry.Insert;
                        until WorkplanCostElements.Next = 0;
                    end;
                end;
            }
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
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Caption = 'Generate Draft Workplans';
                Visible = (not Rec.Posted) and (Rec."Approval Status" = Rec."Approval Status"::Released);
                trigger OnAction()
                var
                    
                begin
                    /* if Confirm('Are you sure you want to post this document ?', true) then begin
                         Rec.TestField(Posted, false);
                         Rec.TestField("Document Status", Rec."document status"::Draft);
                         Rec.Posted := true;
                         Rec."Posted By" := UserId;
                         Rec."Document Status" := Rec."document status"::Posted;
                         Rec."Posted On" := CurrentDatetime;
                         Message('Posted successfully');
                     end;*/
                    if confirm('Are you sure to generate draft workplans for the selected lines?', false) then
                        WorkplanMgt.CreateWorkplanFromResourceConsolidation(Rec);
                    CurrPage.Close;
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
            action("Workplan Submission Analysis")
            {
                ApplicationArea = Basic, Suite;
                Image = AnalysisView;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    AWP: Record "Annual Strategy Workplan";
                begin
                    AWP.Reset();
                    AWP.SetRange(Consolidated, true);
                    AWP.SetRange("Annual Workplan", Rec.Code);
                    Report.Run(Report::"Workplan Submission Analysis", true, true, AWP);
                end;
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
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.Testfield("Draft Workplan Consolidation");
                        WorkplanMgt.ValidateCeilings(Rec);
                        VarVariant := Rec;
                        ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant);
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                        CurrPage.Close;
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
            }
            separator(Action18)
            {
            }
            action("Print Budget Analysis")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                Visible = false;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ConsolidatedBugdetEntry.Reset;
                    ConsolidatedBugdetEntry.SetRange("Consolidation Header No", Rec.Code);
                    if ConsolidatedBugdetEntry.Find('-') then begin
                        Report.Run(80039, true, true, ConsolidatedBugdetEntry);
                    end;
                end;
            }
            action("Unsubmitted Plans")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Unsbmitted: Report "Units Not Submitted";
                begin
                    Unsbmitted.setFilters(Rec."Planning Budget Type", Rec."Financial Year");
                    Unsbmitted.Run;
                end;
            }

        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Planning Budget Type" := Rec."planning budget type"::Original;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Planning Budget Type" := Rec."planning budget type"::Original;
    end;

    trigger OnOpenPage()
    begin
        HasPlansUnderReviewsVar := Rec.HasPlansUnderReviews();
        HasLines := Rec.HasPlans();
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            Currpage.Editable := false;
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
        HasPlansUnderReviewsVar, HasLines : Boolean;
        CanCancel, OpenApprovalEntriesExistForCurrUser : Boolean;
        WorkplanMgt: Codeunit "Workplan Management";

    local procedure FngetLastEntryNo() EntryN: Integer
    var
        ConsolidatedBugdetEntry: Record "Consolidated Bugdet Entry";
    begin
        ConsolidatedBugdetEntry.SetCurrentkey("Entry No");
        ConsolidatedBugdetEntry.FindLast;
        EntryN := ConsolidatedBugdetEntry."Entry No";
    end;

    local procedure FngetLastProcEntryNo() EntryProcN: Integer
    var
        ProcurementPlanEntry: Record "Procurement Plan Entry";
    begin
        ProcurementPlanEntry.SetCurrentkey("Entry No.");
        ProcurementPlanEntry.FindLast;
        EntryProcN := ProcurementPlanEntry."Entry No.";
    end;

    procedure FnUpdateProcurementLines(FunctionalProcurementPlanId: Code[30]; ProcurementCategory: Code[30]; AnnualWorkplan: Code[30])
    var
        ProcurementPlanLines: Record "Procurement Plan Lines";
        ProcurementPlanLinesNew: Record "Procurement Plan Lines";
    begin
        ProcurementPlanLines.Reset;
        ProcurementPlanLines.SetRange("Procurement Plan ID", FunctionalProcurementPlanId);
        ProcurementPlanLines.SetRange("Planning Category", ProcurementCategory);
        if not ProcurementPlanLines.Find('-') then begin
            ProcLineNo := FngetLastProcLineNo;
            if ProcLineNo = 0 then
                ProcLineNo := 1
            else
                ProcLineNo := ProcLineNo + 1;
            ProcurementPlanLinesNew.Init;
            ProcurementPlanLinesNew."Procurement Plan ID" := FunctionalProcurementPlanId;
            ProcurementPlanLinesNew."PP Line No" := ProcLineNo;
            ProcurementPlanLinesNew."Document Type" := ProcurementPlanLinesNew."document type"::"Procurement Plan";
            ProcurementPlanLinesNew."Planning Category" := ProcurementCategory;
            ProcurementPlanLinesNew.Validate("Planning Category");
            ProcurementPlanLinesNew."AWP No" := AnnualWorkplan;
            ProcurementPlanLinesNew.Insert;

        end;
    end;

    local procedure FngetLastProcLineNo() PPLineNo: Integer
    var
        ProcurementPlanLines: Record "Procurement Plan Lines";
    begin
        ProcurementPlanLines.Reset;
        ProcurementPlanLines.FindLast;
        PPLineNo := ProcurementPlanLines."PP Line No";
    end;


    procedure FnGetDirectorate(AnnualWorkplan: Code[30]; ActivityId: Code[30]) Directorate: Code[30]
    var
        SWLines: Record "Strategy Workplan Lines";
    begin
        SWLines.Reset;
        SWLines.SetRange(No, AnnualWorkplan);
        SWLines.SetRange("Activity ID", ActivityId);
        if SWLines.FindFirst then begin
            Directorate := SWLines."Primary Directorate";
        end;
        exit(Directorate);
    end;


    procedure FnGetDepartment(AnnualWorkplan: Code[30]; ActivityId: Code[30]) Department: Code[30]
    var
        SWLines: Record "Strategy Workplan Lines";
    begin
        SWLines.Reset;
        SWLines.SetRange(No, AnnualWorkplan);
        SWLines.SetRange("Activity ID", ActivityId);
        if SWLines.FindFirst then begin
            Department := SWLines."Primary Department";
        end;
        exit(Department);
    end;


    procedure CalculateTotalAmount(WPCostElements: Record "Workplan Cost Elements") TAmount: Decimal
    var
        WorkplanCostElements: Record "Workplan Cost Elements";
    begin
        TAmount := 0;
        WorkplanCostElements.Reset;
        WorkplanCostElements.SetRange("Workplan No.", WPCostElements."Workplan No.");
        WorkplanCostElements.SetRange("Primary Directorate", WPCostElements."Primary Directorate");
        WorkplanCostElements.SetRange("Primary Department", WPCostElements."Primary Department");
        WorkplanCostElements.SetRange("Plan Item No", WPCostElements."Plan Item No");
        WorkplanCostElements.CalcSums(Amount);
        TAmount := WorkplanCostElements.Amount;
        exit(TAmount);
    end;
}

