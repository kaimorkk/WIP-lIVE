table 50127 "Budget Control Header"
{
    Caption = 'Budget Control Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
            Editable = false;
        }
        field(2; "Financial Year"; Code[20])
        {
            Caption = 'Reporting Year';
            DataClassification = ToBeClassified;
            TableRelation = "CSP Planned Years"."Annual Year Code" where("CSP Code" = field("Corporate Strategy"));
        }
        field(3; "Approval Status"; Option)
        {
            Caption = 'Approval Status';
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
        }
        field(4; "No. Series"; Code[20])
        {
        }
        field(5; Quarter; Enum "Financial Quarters")
        {
            DataClassification = ToBeClassified;
        }
        field(6; Budget; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(7; "Corporate Strategy"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;

        }
        field(8; "Approved WorkPlan"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Budget Consolidation Header".Code where("Approval Status" = const(Released), Stage = const("Fully Approved"));
            trigger OnValidate()
            var
                BudgetConsolidationHeader: Record "Budget Consolidation Header";
            begin
                if "Approved WorkPlan" <> '' then begin
                    if BudgetConsolidationHeader.Get("Approved WorkPlan") then begin
                        "Corporate Strategy" := BudgetConsolidationHeader."Corporate Strategy";
                        "Financial Year" := BudgetConsolidationHeader."Financial Year";
                    end;
                end;
            end;
        }
        field(9; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Budget,Supplementary Budget';
            OptionMembers = Budget,"Supplementary Budget";
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SPMGenSetup: Record "SPM General Setup";
        UserSetup: Record "User Setup";
    begin
        if No = '' then begin
            SPMGenSetup.Get();
            SPMGenSetup.TestField("Budget Control Nos");
            NoSeriesMgt.InitSeries(SPMGenSetup."Budget Control Nos", XRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    trigger OnDelete()
    var
        Lines: Record "Budget Control Lines";
        SLines: Record "Supplementary Lines";
    begin
        case "Document Type" of
            "Document Type"::Budget:
                begin
                    Lines.Reset();
                    Lines.SetRange("Header No", No);
                    Lines.DeleteAll();
                end;
            "Document Type"::"Supplementary Budget":
                begin
                    SLines.Reset();
                    SLines.SetRange(No, No);
                    SLines.DeleteAll();
                end;
        end;

    end;

    var
        WorkPlanRevisionLines: Record "Workplan Revision Lines";
        Workplan, Workplan2, FunctionalPlans : Record "Annual Strategy Workplan";
        CurrBudget, NewBudget : Record "Budget Consolidation Header";
        StrategyWorkplanLines2, StrategyWorkplanLines : Record "Strategy Workplan Lines";
        Inputs2, Inputs : Record "SubWorkPlan Activity Inputs";
        BudgetLine2, BudgetLine : Record "Workplan Budget Line";
        Suffix: Code[3];
        JObject: JsonObject;

    procedure InitializeLines()
    var
        GLAccount: Record "G/L Account";
        WorkplanMgt: Codeunit "Workplan Management";
        BudgetLine: Record "G/L Budget Entry";
        Dates: array[4, 2] of Date;
        Lines: Record "Budget Control Lines";
    begin
        Lines.Reset();
        Lines.SetRange("Header No", No);
        if Lines.FindFirst() then
            Error('The Lines have already been initialized');
        WorkplanMgt.GetQuarterDates("Financial Year", "Corporate Strategy", Dates);
        GLAccount.Reset();
        GLAccount.SetRange("Account Type", GLAccount."Account Type"::Posting);
        GLAccount.SetRange("Income/Balance", GLAccount."Income/Balance"::"Income Statement");
        if GLAccount.FindSet() then
            repeat
                Lines.Init();
                Lines."Header No" := No;
                Lines."Line No" := GLAccount."No.";
                Lines.Name := GLAccount.Name;
                BudgetLine.Reset();
                BudgetLine.SetRange("G/L Account No.", GLAccount."No.");
                BudgetLine.SetRange("Budget Name", Rec.Budget);
                if BudgetLine.FindSet() then begin
                    BudgetLine.CalcSums(Amount);
                    Lines."Current Budget" := BudgetLine.Amount;
                    Lines."Current Balance" := BudgetLine.Amount;
                end;
                BudgetLine.Reset();
                BudgetLine.SetFilter("G/L Account No.", GLAccount."No.");
                BudgetLine.SetRange("Budget Name", Rec.Budget);
                BudgetLine.SetRange(Date, Dates[1] [1]);
                if BudgetLine.FindSet() then begin
                    BudgetLine.CalcSums(Amount);
                    Lines."Quarter budget" := BudgetLine.Amount;
                end;

                if Lines."Current Budget" <> 0 then
                    Lines.Insert();
            until GLAccount.Next() = 0;

    end;

    procedure InitializeSupplementaryLines()
    var
        GLAccount: Record "G/L Account";
        WorkplanMgt: Codeunit "Workplan Management";

        Dates: array[4, 2] of Date;
        Lines: Record "Supplementary Lines";
        BudgetConsolidationHeader: Record "Budget Consolidation Header";
        BudgetLines: Record "Workplan Budget Line";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
    begin
        Lines.Reset();
        Lines.SetRange(No, No);
        if Lines.FindFirst() then
            Error('The Lines have already been initialized');
        AnnualStrategyWorkplan.Reset();
        AnnualStrategyWorkplan.SetRange("Annual Workplan", Rec."Approved WorkPlan");
        if AnnualStrategyWorkplan.FindSet() then
            repeat
                GLAccount.Reset();
                GLAccount.SetRange("Account Type", GLAccount."Account Type"::Posting);
                GLAccount.SetRange("Income/Balance", GLAccount."Income/Balance"::"Income Statement");
                if GLAccount.FindSet() then
                    repeat
                        BudgetLines.Reset();
                        BudgetLines.SetRange("Strategy Plan ID", AnnualStrategyWorkplan.No);
                        BudgetLines.SetRange("Budget Item", GLAccount."No.");
                        if BudgetLines.FindSet() then begin
                            BudgetLines.CalcSums("Total Amount");
                            Lines.Reset();
                            Lines.SetRange(No, No);
                            Lines.SetRange("Line No", GLAccount."No.");
                            if Lines.FindFirst() then begin
                                Lines."Approved Amount" += BudgetLines."Total Amount";
                                Lines."New Supplementary Ceiling" += BudgetLines."Total Amount";
                                Lines.Modify();
                            end else begin
                                Lines.Init();
                                Lines.No := No;
                                Lines."Line No" := GLAccount."No.";
                                Lines.Name := GLAccount.Name;
                                Lines."Adjustment Percentage" := 1;
                                Lines."Applies To All" := true;
                                Lines."Approved Amount" := BudgetLines."Total Amount";
                                Lines."New Supplementary Ceiling" := BudgetLines."Total Amount";
                                if Lines."Approved Amount" <> 0 then
                                    Lines.Insert();
                            end;
                        end;
                    until GLAccount.Next() = 0;
            until AnnualStrategyWorkplan.Next() = 0;
    end;

    procedure GenerateSupplementaryLines()
    var
        WorkPlanRevisionLines: Record "Workplan Revision Lines";
        Lines: Record "Supplementary Lines";
        FunctionalPlans: Record "Annual Strategy Workplan";
        BudgetLine: Record "Workplan Budget Line";
        SpecificControls: Record "Unit Specific Controls";

    begin
        if not Confirm('This action will generate the supplementary lines for the affected workplans and overwrite any existing lines. Do you want to continue?') then
            exit;
        WorkPlanRevisionLines.Reset();
        WorkPlanRevisionLines.SetRange(No, No);
        WorkPlanRevisionLines.DeleteAll();
        Lines.Reset();
        Lines.SetRange(No, No);
        Lines.Setfilter("Adjustment Percentage", '<>%1', 1);
        Lines.SetRange("Applies To All", true);
        if Lines.FindSet() then
            repeat
                FunctionalPlans.Reset();
                FunctionalPlans.SetRange("Annual Workplan", Rec."Approved WorkPlan");
                if FunctionalPlans.FindSet() then
                    repeat
                        BudgetLine.Reset();
                        BudgetLine.SetRange("Strategy Plan ID", FunctionalPlans.No);
                        BudgetLine.SetRange("Budget Item", Lines."Line No");
                        if BudgetLine.FindSet() then begin
                            BudgetLine.CalcSums("Total Amount");


                            WorkPlanRevisionLines.Init();
                            WorkPlanRevisionLines.No := No;
                            WorkPlanRevisionLines."Workplan No" := BudgetLine."Strategy Plan ID";
                            WorkPlanRevisionLines."Budget Item" := Lines."Line No";
                            WorkPlanRevisionLines.Description := FunctionalPlans.Description;
                            WorkPlanRevisionLines."Approved Amount" := BudgetLine."Total Amount";
                            WorkPlanRevisionLines."Supplementary Ceiling" := Round(BudgetLine."Total Amount" * Lines."Adjustment Percentage", 1);
                            WorkPlanRevisionLines.Insert();
                        end;
                    until FunctionalPlans.Next() = 0;
            until Lines.Next() = 0;

        Lines.Reset();
        Lines.SetRange(No, No);
        //Lines.Setfilter("New Supplementary Ceiling", '<>%1', Lines."Approved Amount");
        Lines.SetRange("Applies To All", false);
        if Lines.FindSet() then
            repeat
                SpecificControls.Reset();
                SpecificControls.SetRange(No, No);
                SpecificControls.SetRange("Line No", Lines."Line No");
                if SpecificControls.FindSet() then
                    repeat
                        WorkPlanRevisionLines.Init();
                        WorkPlanRevisionLines.No := No;
                        WorkPlanRevisionLines."Workplan No" := SpecificControls."Workplan No";
                        WorkPlanRevisionLines."Budget Item" := Lines."Line No";
                        WorkPlanRevisionLines."Approved Amount" := SpecificControls."Approved Amount";
                        WorkPlanRevisionLines."Supplementary Ceiling" := SpecificControls."Supplementary Ceiling";
                        WorkPlanRevisionLines.Insert();
                    until SpecificControls.Next() = 0;
            until Lines.Next() = 0;
    end;

    procedure SubmitForRevision()
    var
        Strat: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NewCode: Code[20];
    begin
        ///Get the current global workplan
        CurrBudget.Get(Rec."Approved WorkPlan");
        Clear(JObject);
        ///Insert the new consolidation template
        Strat.Get();
        Strat.TestField("Supplementary Nos");

        NewBudget.Init();
        NewBudget.TransferFields(CurrBudget, true);
        NewBudget."Planning Budget Type" := NewBudget."Planning Budget Type"::"Supplementary 2";
        NewBudget.Archived := false;
        NewBudget.Posted := false;
        NewBudget.Stage := NewBudget.Stage::Finance;
        NewBudget.Code := '';
        NewBudget."Approval Status" := NewBudget."Approval Status"::Open;
        NewBudget.Insert(true);
        ///Begin creation of supplementary workplans
        Suffix := 'S' + CopyStr(No, StrLen(No) - 1, 2);
        WorkPlanRevisionLines.Reset();
        WorkPlanRevisionLines.SetRange(No, No);
        if WorkPlanRevisionLines.FindSet() then
            repeat
                NewCode := NoSeriesMgt.GetNextNo(Strat."Supplementary Nos", 0D, true);
                CopyWorkplan(WorkPlanRevisionLines."Workplan No", NewCode);
                ModifyAffectedLines(WorkPlanRevisionLines."Budget Item", NewCode);
            until WorkPlanRevisionLines.Next() = 0;

        Message('Revision Workplans have been created');
    end;

    local procedure CopyWorkplan(Existing: Code[30]; New: Code[30])
    var
        Workings, Workings2 : Record "Workplan Workings";
    begin
        FunctionalPlans.Reset();
        FunctionalPlans.SetRange(No, New);
        if FunctionalPlans.FindFirst() then begin
            exit;
        end;

        Workplan.Get(Existing);
        Workplan2.Init();
        Workplan2.Copy(Workplan);
        Workplan2."Planning Budget Type" := Workplan2."Planning Budget Type"::"Supplementary 2";
        Workplan2."Approval Status" := Workplan2."Approval Status"::Open;
        Workplan2."Budget Posted to G/L" := false;
        Workplan2.Consolidated := false;
        Workplan2.Archived := false;
        Workplan2."Annual Workplan" := NewBudget.Code;
        Workplan2.No := New;
        if Workplan2.Insert() then begin
            Inputs.Reset();
            Inputs.SetRange("Workplan No.", Workplan.No);
            if Inputs.FindSet() then
                repeat
                    Inputs2.Init();
                    Inputs2.Copy(Inputs);
                    Inputs2."Workplan No." := Workplan2.No;
                    Inputs2.Insert();
                until Inputs.Next() = 0;

            StrategyWorkplanLines.Reset();
            StrategyWorkplanLines.SetRange(No, Workplan.No);
            if StrategyWorkplanLines.FindSet() then
                repeat
                    StrategyWorkplanLines2.Init();
                    StrategyWorkplanLines2.Copy(StrategyWorkplanLines);
                    StrategyWorkplanLines2.No := Workplan2.No;
                    StrategyWorkplanLines2.Insert();
                until StrategyWorkplanLines.Next() = 0;
            BudgetLine2.Reset();
            BudgetLine2.SetRange("Strategy Plan ID", Workplan.No);
            if BudgetLine2.FindSet() then
                repeat
                    BudgetLine.Init();
                    BudgetLine.Copy(BudgetLine2);
                    BudgetLine."Strategy Plan ID" := Workplan2.No;
                    BudgetLine.Insert();
                until BudgetLine2.Next() = 0;
            Workings.Reset();
            Workings.SetRange("Strategy Plan ID", Workplan.No);
            if Workings.FindSet() then
                repeat
                    Workings2.Init();
                    Workings2.Copy(Workings);
                    Workings2."Strategy Plan ID" := Workplan2.No;
                    Workings2.Insert();
                until Workings.Next() = 0;
        end;
    end;

    local procedure ModifyAffectedLines(BudgetCode: Code[20]; New: Code[30])
    begin
        BudgetLine.Reset();
        BudgetLine.SetRange("Strategy Plan ID", New);
        BudgetLine.SetRange("Budget Item", BudgetCode);
        if BudgetLine.FindSet() then
            repeat
                BudgetLine."G/L Updated" := false;
                BudgetLine."Total Ceiling" := WorkPlanRevisionLines."Supplementary Ceiling";
                BudgetLine.Modify();
            until BudgetLine.Next() = 0;
    end;
}