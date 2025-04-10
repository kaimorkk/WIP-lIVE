#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50355 "Budget RevConsolidation Header"
{
    Caption = 'Budget Revision Consolidation Header';
    PageType = Card;
    SourceTable = "Budget Consolidation Header";

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
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                    Caption = 'Financial Year';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Procurement Plan"; Rec."Proposed Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Current Job"; Rec."Current Job")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Financial Year';
                }
                field("Current Financial Budget"; Rec."Current Financial Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Financial Year';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control11; "Budget RevConsolidation Lines")
            {
                SubPageLink = "Consolidation Header No" = field(Code);
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Consolidation Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;

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
                                    ProcurementPlanEntry."Budget Control Job Task No." := WorkplanCostElements."Vote id";
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
                PromotedCategory = Category9;
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
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to post this document ?', true) then begin
                        Rec.TestField(Posted, false);
                        Rec.TestField("Document Status", Rec."document status"::Draft);
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Document Status" := Rec."document status"::Posted;
                        Rec."Posted On" := CurrentDatetime;
                        Message('Posted successfully');
                    end;
                    CurrPage.Close;
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
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
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
                Promoted = true;
                PromotedCategory = Category6;
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

    trigger OnOpenPage()
    begin
        if Rec."Document Status" = Rec."document status"::Posted then begin
            CurrPage.Editable := false;
        end;
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

#pragma implicitwith restore

