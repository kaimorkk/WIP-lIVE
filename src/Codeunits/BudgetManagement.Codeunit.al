 
codeunit 52193479 "Budget Management"
{
    procedure PostBudgetModifications(var BudgetModHeader: Record "Budget Reallocation Header")
    var
        GLBudgetEntry: Record "G/L Budget Entry";
        BudgetLines: Record "Budget Modification Lines";
        BudgetReAllocationLines: Record "Budget Reallocation Line";
        EntryNo: Integer;
        Updated: Boolean;
    begin
        if BudgetModHeader.Posted then
            exit;
        case
            BudgetModHeader."Entry Type" of
            BudgetModHeader."Entry Type"::"Re-Allocation":
                begin
                    ValidateBudgetReAllocationLines(BudgetModHeader);
                    GLBudgetEntry.LockTable();
                    GLBudgetEntry.Reset();
                    if GLBudgetEntry.FindLast() then
                        EntryNo := GLBudgetEntry."Entry No.";

                    BudgetLines.Reset();
                    BudgetLines.SetRange(BudgetLines."Consolidation No", BudgetModHeader."Document No");
                    BudgetLines.SetRange("Posted", false);
                    if BudgetLines.FindSet() then begin
                        repeat
                            Updated := false;
                            if BudgetLines.Amount <> 0 then begin
                                EntryNo += 1;
                                GLBudgetEntry.Init();
                                GLBudgetEntry."Entry No." := EntryNo;
                                GLBudgetEntry."Budget Name" := BudgetLines."Budget Code";
                                GLBudgetEntry."Budget Type" := GLBudgetEntry."Budget Type"::Revised;
                                if BudgetLines."ReAllocation Request" then
                                    GLBudgetEntry.Amount := BudgetLines.Amount
                                else
                                    GLBudgetEntry.Amount := -BudgetLines.Amount;
                                GLBudgetEntry."G/L Account No." := BudgetLines."G/L Account No";
                                GLBudgetEntry.Description := BudgetLines."G/L Account Name";
                                GLBudgetEntry.Date := BudgetLines."Posting Date";
                                if GLBudgetEntry.Date = 0D then
                                    GLBudgetEntry.Date := BudgetLines."Quarter Start Date";
                                GLBudgetEntry."Global Dimension 1 Code" := BudgetLines."Global Dimension 1 Code";
                                GLBudgetEntry."Global Dimension 2 Code" := BudgetLines."Global Dimension 2 Code";
                                GLBudgetEntry."Shortcut Dimension 3 Code" := BudgetLines."Shortcut Dimension 3 Code";
                                GLBudgetEntry."Shortcut Dimension 4 Code" := BudgetLines."Shortcut Dimension 4 Code";
                                GLBudgetEntry."Shortcut Dimension 5 Code" := BudgetLines."Shortcut Dimension 5 Code";
                                GLBudgetEntry."Shortcut Dimension 6 Code" := BudgetLines."Shortcut Dimension 6 Code";
                                GLBudgetEntry."Shortcut Dimension 7 Code" := BudgetLines."Shortcut Dimension 7 Code";
                                GLBudgetEntry."Shortcut Dimension 8 Code" := BudgetLines."Shortcut Dimension 8 Code";
                                GLBudgetEntry."Dimension Set Id" := BudgetLines."Dimension Set Id";
                                GLBudgetEntry."Source Document" := BudgetLines."Document No";
                                GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::ReAllocation;
                                GLBudgetEntry.Insert();


                                //Post to Destination Accounts
                                BudgetReAllocationLines.Reset;
                                BudgetReAllocationLines.SetRange(BudgetReAllocationLines."Consolidation No", BudgetModHeader."Document No");
                                BudgetReAllocationLines.SetRange("Source Line No", BudgetLines."Line No");
                                if BudgetReAllocationLines.FindSet() then begin
                                    repeat
                                        EntryNo += 1;
                                        GLBudgetEntry.Init();
                                        GLBudgetEntry."Entry No." := EntryNo;
                                        GLBudgetEntry."Budget Name" := BudgetReAllocationLines."Budget Code";
                                        GLBudgetEntry."Budget Type" := GLBudgetEntry."Budget Type"::Revised;
                                        if BudgetReAllocationLines."ReAllocation Request" then
                                            GLBudgetEntry.Amount := -BudgetReAllocationLines.Amount
                                        else
                                            GLBudgetEntry.Amount := BudgetReAllocationLines.Amount;
                                        GLBudgetEntry."G/L Account No." := BudgetReAllocationLines."G/L Account No";
                                        GLBudgetEntry.Description := BudgetReAllocationLines."G/L Account Name";
                                        GLBudgetEntry.Date := BudgetReAllocationLines."Posting Date";
                                        if GLBudgetEntry.Date = 0D then
                                            GLBudgetEntry.Date := BudgetReAllocationLines."Quarter Start Date";
                                        GLBudgetEntry."Global Dimension 1 Code" := BudgetReAllocationLines."Global Dimension 1 Code";
                                        GLBudgetEntry."Global Dimension 2 Code" := BudgetReAllocationLines."Global Dimension 2 Code";
                                        GLBudgetEntry."Shortcut Dimension 3 Code" := BudgetReAllocationLines."Shortcut Dimension 3 Code";
                                        GLBudgetEntry."Shortcut Dimension 4 Code" := BudgetReAllocationLines."Shortcut Dimension 4 Code";
                                        GLBudgetEntry."Shortcut Dimension 5 Code" := BudgetReAllocationLines."Shortcut Dimension 5 Code";
                                        GLBudgetEntry."Shortcut Dimension 6 Code" := BudgetReAllocationLines."Shortcut Dimension 6 Code";
                                        GLBudgetEntry."Shortcut Dimension 7 Code" := BudgetReAllocationLines."Shortcut Dimension 7 Code";
                                        GLBudgetEntry."Shortcut Dimension 8 Code" := BudgetReAllocationLines."Shortcut Dimension 8 Code";
                                        GLBudgetEntry."Dimension Set Id" := BudgetReAllocationLines."Dimension Set Id";
                                        GLBudgetEntry."Source Document" := BudgetModHeader."Document No";
                                        GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::ReAllocation;
                                        GLBudgetEntry.Insert();
                                        ModifyWorkplanReallocation(BudgetReAllocationLines.RecordId);
                                        Updated := true;
                                    until BudgetReAllocationLines.Next() = 0;
                                end;
                            end;
                            ModifyWorkplanReallocation(BudgetLines.RecordId);
                            if Updated then
                                BudgetLines.Validate(Posted, true);
                            BudgetLines.Modify();

                        until BudgetLines.Next() = 0;
                    end;
                    BudgetLines.Reset();
                    BudgetLines.SetRange(BudgetLines."Consolidation No", BudgetModHeader."Document No");
                    BudgetLines.SetRange("Posted", false);
                    if BudgetLines.IsEmpty() then begin
                        BudgetModHeader.Validate(Posted, true);
                        BudgetModHeader.Modify();
                    end;
                end;
            BudgetModHeader."Entry Type"::Supplementary:
                begin
                    GLBudgetEntry.LockTable();
                    GLBudgetEntry.Reset();
                    if GLBudgetEntry.FindLast() then
                        EntryNo := GLBudgetEntry."Entry No.";

                    BudgetLines.Reset();
                    BudgetLines.SetRange("Document No", BudgetModHeader."Document No");
                    BudgetLines.SetRange("Posted", false);
                    if BudgetLines.FindSet() then begin
                        repeat
                            Updated := false;
                            if BudgetLines.Amount <> 0 then begin
                                EntryNo += 1;
                                GLBudgetEntry.Init();
                                GLBudgetEntry."Entry No." := EntryNo;
                                GLBudgetEntry."Budget Name" := BudgetLines."Budget Code";
                                GLBudgetEntry."Budget Type" := GLBudgetEntry."Budget Type"::Suplimentary;
                                GLBudgetEntry.Amount := BudgetLines.Amount;
                                GLBudgetEntry."G/L Account No." := BudgetLines."G/L Account No";
                                GLBudgetEntry.Description := BudgetModHeader.Description;
                                GLBudgetEntry.Date := BudgetLines."Posting Date";
                                if GLBudgetEntry.Date = 0D then
                                    GLBudgetEntry.Date := BudgetLines."Quarter Start Date";
                                GLBudgetEntry."Global Dimension 1 Code" := BudgetLines."Global Dimension 1 Code";
                                GLBudgetEntry."Global Dimension 2 Code" := BudgetLines."Global Dimension 2 Code";
                                GLBudgetEntry."Shortcut Dimension 3 Code" := BudgetLines."Shortcut Dimension 3 Code";
                                GLBudgetEntry."Shortcut Dimension 4 Code" := BudgetLines."Shortcut Dimension 4 Code";
                                GLBudgetEntry."Shortcut Dimension 5 Code" := BudgetLines."Shortcut Dimension 5 Code";
                                GLBudgetEntry."Shortcut Dimension 6 Code" := BudgetLines."Shortcut Dimension 6 Code";
                                GLBudgetEntry."Shortcut Dimension 7 Code" := BudgetLines."Shortcut Dimension 7 Code";
                                GLBudgetEntry."Shortcut Dimension 8 Code" := BudgetLines."Shortcut Dimension 8 Code";
                                GLBudgetEntry."Dimension Set Id" := BudgetLines."Dimension Set Id";
                                GLBudgetEntry."Source Document" := BudgetModHeader."Document No";
                                GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::Supplimentary;
                                GLBudgetEntry.Insert();
                                Updated := true;
                            end;
                            if Updated then
                                BudgetLines.Validate(Posted, true);
                            BudgetLines.Modify();
                        until BudgetLines.Next() = 0;
                    end;
                    BudgetLines.Reset();
                    BudgetLines.SetRange("Document No", BudgetModHeader."Document No");
                    BudgetLines.SetRange("Posted", false);
                    if BudgetLines.IsEmpty() then begin
                        BudgetModHeader.Validate(Posted, true);
                        BudgetModHeader.Modify();
                    end;
                end;
        end;
    end;

    procedure ModifyWorkplanReallocation(RecId: RecordId)
    var
        RecRef: RecordRef;
        BudgetLines: Record "Budget Modification Lines";
        BudgetReAllocationLines: Record "Budget Reallocation Line";
        WorkplanBudgetLine: Record "Workplan Budget Line";
    begin
        if RecRef.Get(RecID) then;
        case
                    RecRef.Number of
            Database::"Budget Modification Lines":
                begin
                    RecRef.SetTable(BudgetLines);
                    WorkplanBudgetLine.Reset();
                    WorkplanBudgetLine.SetRange("Strategy Plan ID", BudgetLines.Workplan);
                    WorkplanBudgetLine.SetRange("Activity ID", BudgetLines.Activity);
                    WorkplanBudgetLine.SetRange("Budget Item", BudgetLines."G/L Account No");
                    if WorkplanBudgetLine.FindFirst() then begin
                        case BudgetLines.Quarter of
                            BudgetLines.Quarter::"Quarter 1":
                                begin
                                    WorkplanBudgetLine."Q1 Amount" -= BudgetLines.Amount;
                                end;
                            BudgetLines.Quarter::"Quarter 2":
                                begin
                                    WorkplanBudgetLine."Q2 Amount" -= BudgetLines.Amount;
                                end;
                            BudgetLines.Quarter::"Quarter 3":
                                begin
                                    WorkplanBudgetLine."Q3 Amount" -= BudgetLines.Amount;
                                end;
                            BudgetLines.Quarter::"Quarter 4":
                                begin
                                    WorkplanBudgetLine."Q4 Amount" -= BudgetLines.Amount;
                                end;
                        end;
                        WorkplanBudgetLine.Validate("Total Amount");
                        WorkplanBudgetLine.Modify();
                    end;
                end;
            Database::"Budget Reallocation Line":
                begin
                    RecRef.SetTable(BudgetReAllocationLines);
                    WorkplanBudgetLine.Reset();
                    WorkplanBudgetLine.SetRange("Strategy Plan ID", BudgetReAllocationLines.Workplan);
                    WorkplanBudgetLine.SetRange("Activity ID", BudgetReAllocationLines.Activity);
                    WorkplanBudgetLine.SetRange("Budget Item", BudgetReAllocationLines."G/L Account No");
                    if WorkplanBudgetLine.FindFirst() then begin
                        case BudgetReAllocationLines.Quarter of
                            BudgetReAllocationLines.Quarter::"Quarter 1":
                                begin
                                    WorkplanBudgetLine."Q1 Amount" += BudgetReAllocationLines.Amount;
                                end;
                            BudgetReAllocationLines.Quarter::"Quarter 2":
                                begin
                                    WorkplanBudgetLine."Q2 Amount" += BudgetReAllocationLines.Amount;
                                end;
                            BudgetReAllocationLines.Quarter::"Quarter 3":
                                begin
                                    WorkplanBudgetLine."Q3 Amount" += BudgetReAllocationLines.Amount;
                                end;
                            BudgetReAllocationLines.Quarter::"Quarter 4":
                                begin
                                    WorkplanBudgetLine."Q4 Amount" += BudgetReAllocationLines.Amount;
                                end;
                        end;
                        WorkplanBudgetLine.Validate("Total Amount");
                        WorkplanBudgetLine.Modify();
                    end;
                end;

        end;
    end;

    procedure GetBudgetAmount(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date; EntryTypeFilter: Integer) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.Reset;
        GLBudgetEntry.SetRange("G/L Account No.", GLAccount);
        GLBudgetEntry.SetRange("Budget Name", BudgetCode);
        GLBudgetEntry.SetRange(Date, StartDate, EndDate);
        GLBudgetEntry.Setrange("Entry Type", EntryTypeFilter);
        GLBudgetEntry.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        GLBudgetEntry.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", DimensionCode[3]);
        GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", DimensionCode[4]);
        GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", DimensionCode[5]);
        GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", DimensionCode[6]);
        GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", DimensionCode[7]);
        GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", DimensionCode[8]);
        if GLBudgetEntry.FindSet() then begin
            GLBudgetEntry.CalcSums(Amount);
            Balance := GLBudgetEntry.Amount;
        end;
    end;

    procedure GetBudgetAmount2(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date; EntryTypeFilter: Integer) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.Reset;
        GLBudgetEntry.SetFilter("G/L Account No.", GLAccount);
        GLBudgetEntry.SetRange("Budget Name", BudgetCode);
        GLBudgetEntry.SetRange(Date, StartDate, EndDate);
        GLBudgetEntry.Setrange("Entry Type", EntryTypeFilter);
        if DimensionCode[1] <> '' then
            GLBudgetEntry.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        if DimensionCode[2] <> '' then
            GLBudgetEntry.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        if DimensionCode[3] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", DimensionCode[3]);
        if DimensionCode[4] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", DimensionCode[4]);
        if DimensionCode[5] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", DimensionCode[5]);
        if DimensionCode[6] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", DimensionCode[6]);
        if DimensionCode[7] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", DimensionCode[7]);
        if DimensionCode[8] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", DimensionCode[8]);
        if GLBudgetEntry.FindSet() then begin
            GLBudgetEntry.CalcSums(Amount);
            Balance := GLBudgetEntry.Amount;
        end;
    end;

    procedure GetBudgetAllocated(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.Reset;
        GLBudgetEntry.SetFilter("G/L Account No.", GLAccount);
        GLBudgetEntry.SetRange("Budget Name", BudgetCode);
        GLBudgetEntry.SetRange(Date, StartDate, EndDate);
        GLBudgetEntry.SetFilter("Entry Type", '<>%1', GLBudgetEntry."Entry Type"::Utilization);
        if DimensionCode[1] <> '' then
            GLBudgetEntry.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        if DimensionCode[2] <> '' then
            GLBudgetEntry.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        if DimensionCode[3] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", DimensionCode[3]);
        if DimensionCode[4] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", DimensionCode[4]);
        if DimensionCode[5] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", DimensionCode[5]);
        if DimensionCode[6] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", DimensionCode[6]);
        if DimensionCode[7] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", DimensionCode[7]);
        if DimensionCode[8] <> '' then
            GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", DimensionCode[8]);
        if GLBudgetEntry.FindSet() then begin
            GLBudgetEntry.CalcSums(Amount);
            Balance := GLBudgetEntry.Amount;
        end;
    end;

    procedure GetBudgetAllocated2(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[50]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.Reset;
        if GLAccount <> '' then
            GLBudgetEntry.SetFilter("G/L Account No.", GLAccount);
        GLBudgetEntry.SetRange("Budget Name", BudgetCode);
        GLBudgetEntry.SetRange(Date, StartDate, EndDate);
        GLBudgetEntry.SetFilter("Entry Type", '<>%1', GLBudgetEntry."Entry Type"::Utilization);
        if DimensionCode[1] <> '' then
            GLBudgetEntry.SetFilter("Global Dimension 1 Code", DimensionCode[1]);
        if DimensionCode[2] <> '' then
            GLBudgetEntry.SetFilter("Global Dimension 2 Code", DimensionCode[2]);
        if DimensionCode[3] <> '' then
            GLBudgetEntry.SetFilter("Shortcut Dimension 3 Code", DimensionCode[3]);
        if DimensionCode[4] <> '' then
            GLBudgetEntry.SetFilter("Shortcut Dimension 4 Code", DimensionCode[4]);
        if DimensionCode[5] <> '' then
            GLBudgetEntry.SetFilter("Shortcut Dimension 5 Code", DimensionCode[5]);
        if DimensionCode[6] <> '' then
            GLBudgetEntry.SetFilter("Shortcut Dimension 6 Code", DimensionCode[6]);
        if DimensionCode[7] <> '' then
            GLBudgetEntry.SetFilter("Shortcut Dimension 7 Code", DimensionCode[7]);
        if DimensionCode[8] <> '' then
            GLBudgetEntry.SetFilter("Shortcut Dimension 8 Code", DimensionCode[8]);
        if GLBudgetEntry.FindSet() then begin
            GLBudgetEntry.CalcSums(Amount);
            Balance := GLBudgetEntry.Amount;
        end;
    end;

    procedure GetBudgetAmount(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.Reset;
        GLBudgetEntry.SetRange("G/L Account No.", GLAccount);
        GLBudgetEntry.SetRange("Budget Name", BudgetCode);
        GLBudgetEntry.SetRange(Date, StartDate, EndDate);
        GLBudgetEntry.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        GLBudgetEntry.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        if DimensionCode[3]<>'' then
        GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", DimensionCode[3]);
        if DimensionCode[4]<>'' then
        GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", DimensionCode[4]);
        if DimensionCode[5]<>'' then
        GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", DimensionCode[5]);
        if DimensionCode[6]<>'' then
        GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", DimensionCode[6]);
        GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", DimensionCode[7]);
        GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", DimensionCode[8]);
        if GLBudgetEntry.FindSet() then begin
            GLBudgetEntry.CalcSums(Amount);
            Balance := GLBudgetEntry.Amount;
        end;
    end;

    procedure GetBudgetAllocationAmount(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.Reset;
        GLBudgetEntry.SetRange("G/L Account No.", GLAccount);
        GLBudgetEntry.SetRange("Budget Name", BudgetCode);
        GLBudgetEntry.SetRange(Date, StartDate, EndDate);
        GLBudgetEntry.SetRange("Entry Type", GLBudgetEntry."Entry Type"::Allocation);
        GLBudgetEntry.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        GLBudgetEntry.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", DimensionCode[3]);
        GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", DimensionCode[4]);
        GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", DimensionCode[5]);
        GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", DimensionCode[6]);
        GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", DimensionCode[7]);
        GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", DimensionCode[8]);
        if GLBudgetEntry.FindSet() then begin
            GLBudgetEntry.CalcSums(Amount);
            Balance := GLBudgetEntry.Amount;
        end;
    end;

    procedure GetBudgetSupplimentaryAmount(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.Reset;
        GLBudgetEntry.SetRange("G/L Account No.", GLAccount);
        GLBudgetEntry.SetRange("Budget Name", BudgetCode);
        GLBudgetEntry.SetRange(Date, StartDate, EndDate);
        GLBudgetEntry.SetRange("Entry Type", GLBudgetEntry."Entry Type"::Supplimentary);
        GLBudgetEntry.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        GLBudgetEntry.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", DimensionCode[3]);
        GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", DimensionCode[4]);
        GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", DimensionCode[5]);
        GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", DimensionCode[6]);
        GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", DimensionCode[7]);
        GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", DimensionCode[8]);
        if GLBudgetEntry.FindSet() then begin
            GLBudgetEntry.CalcSums(Amount);
            Balance := GLBudgetEntry.Amount;
        end;
    end;

    procedure GetBudgetReallocationAmount(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.Reset;
        GLBudgetEntry.SetRange("G/L Account No.", GLAccount);
        GLBudgetEntry.SetRange("Budget Name", BudgetCode);
        GLBudgetEntry.SetRange(Date, StartDate, EndDate);
        GLBudgetEntry.SetRange("Entry Type", GLBudgetEntry."Entry Type"::ReAllocation);
        GLBudgetEntry.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        GLBudgetEntry.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", DimensionCode[3]);
        GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", DimensionCode[4]);
        GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", DimensionCode[5]);
        GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", DimensionCode[6]);
        GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", DimensionCode[7]);
        GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", DimensionCode[8]);
        if GLBudgetEntry.FindSet() then begin
            GLBudgetEntry.CalcSums(Amount);
            Balance := GLBudgetEntry.Amount;
        end;
    end;

    procedure GetAIEAmount(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]) Balance: Decimal
    var
        AIE: Record AIE;
        AIELine: Record "Auth. Inc Expend. Line";
        HeaderAIE: Record "Auth. Inc. Expend. Header";
    begin
        HeaderAIE.Reset();
        HeaderAIE.SetRange("Budget Code", BudgetCode);
        HeaderAIE.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        HeaderAIE.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        HeaderAIE.SetRange(Posted, true);
        HeaderAIE.SetRange(Type, HeaderAIE.Type::Default);
        if HeaderAIE.FindSet() then
            repeat
                AIELine.Reset();
                AIELine.SetRange("Document No.", HeaderAIE."No.");
                AIELine.SetRange("G/L Account", GLAccount);
                if AIELine.FindFirst() then
                    Balance += AIELine."Amount to Authorize";
            until HeaderAIE.Next() = 0;
    end;

    procedure GetAIEAmount(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        AIE: Record AIE;
        AIELine: Record "Auth. Inc Expend. Line";
        HeaderAIE: Record "Auth. Inc. Expend. Header";
    begin
        HeaderAIE.Reset();
        HeaderAIE.SetRange("Budget Code", BudgetCode);
        HeaderAIE.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        HeaderAIE.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        HeaderAIE.SetRange("Quarter Start Date", StartDate, EndDate);
        HeaderAIE.SetRange(Posted, true);
        if HeaderAIE.FindSet() then
            repeat
                AIELine.Reset();
                AIELine.SetRange("Document No.", HeaderAIE."No.");
                AIELine.SetRange("G/L Account", GLAccount);
                if AIELine.FindFirst() then
                    Balance += AIELine."Amount to Authorize";
            until HeaderAIE.Next() = 0;
    end;

    procedure GetAIEAmount2(AIECode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]) Balance: Decimal
    var
        AIELine: Record "Auth. Inc Expend. Line";
        HeaderAIE: Record "Auth. Inc. Expend. Header";
    begin

        AIELine.Reset();
        AIELine.SetRange("Document No.", AIECode);
        AIELine.SetRange("G/L Account", GLAccount);
        if AIELine.FindFirst() then
            Balance += AIELine."Amount to Authorize";
    end;

    procedure GetBudgetBalance(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
        LastBudgetAIEDate: Date;
        AllowedDates: array[3] of Date;
        ExpenseAmt, Committments, BudgetAmount : Decimal;
    begin
        GetLastBudgetAllowedDates(BudgetCode, DimensionCode[1], DimensionCode[2], AllowedDates);
        ExpenseAmt := GetGlExpenses(BudgetCode, GLAccount, DimensionCode, AllowedDates[1], AllowedDates[2]);
        Committments := GetGLCommittments(BudgetCode, GLAccount, DimensionCode, AllowedDates[1], AllowedDates[2]);
        BudgetAmount := GetBudgetAmount(BudgetCode, GLAccount, DimensionCode, AllowedDates[1], AllowedDates[2]);

        Balance := BudgetAmount - (Committments) - abs(ExpenseAmt);
    end;

    procedure GetBudgetBalance2(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
        LastBudgetAIEDate: Date;
        ExpenseAmt, Committments, BudgetAmount : Decimal;
    begin
        ExpenseAmt := GetGlExpenses(BudgetCode, GLAccount, DimensionCode, StartDate, EndDate);
        Committments := GetGLCommittments(BudgetCode, GLAccount, DimensionCode, StartDate, StartDate);
        BudgetAmount := GetBudgetAmount(BudgetCode, GLAccount, DimensionCode, StartDate, StartDate);
        Balance := BudgetAmount - (Committments) - abs(ExpenseAmt);
    end;

    procedure GetBudgetBalance(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date; var BudgetAmounts: array[3] of Decimal) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
        LastBudgetAIEDate: Date;
        AllowedDates: array[3] of Date;
        ExpenseAmt, Committments, BudgetAmount : Decimal;
    begin
        GetLastBudgetAllowedDates(BudgetCode, DimensionCode[1], DimensionCode[2], AllowedDates);
        BudgetAmounts[2] := GetGlExpenses(BudgetCode, GLAccount, DimensionCode, AllowedDates[1], EndDate);
        BudgetAmounts[3] := GetGLCommittments(BudgetCode, GLAccount, DimensionCode, AllowedDates[1], EndDate);
        BudgetAmounts[1] := GetBudgetAmount(BudgetCode, GLAccount, DimensionCode, AllowedDates[1], AllowedDates[2]);

        Balance := BudgetAmounts[1] - (BudgetAmounts[3]) - abs(BudgetAmounts[2]);
    end;

    procedure GetBudgetBalanceDevprojects(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date; var BudgetAmounts: array[3] of Decimal) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
        LastBudgetAIEDate: Date;
        AllowedDates: array[3] of Date;
        ExpenseAmt, Committments, BudgetAmount : Decimal;
    begin
        //GetLastBudgetAllowedDates(BudgetCode, DimensionCode[1], DimensionCode[2], AllowedDates);
        BudgetAmounts[2] := GetGlExpenses(BudgetCode, GLAccount, DimensionCode, StartDate, EndDate);
        BudgetAmounts[3] := GetGLCommittments(BudgetCode, GLAccount, DimensionCode, StartDate, EndDate);
        BudgetAmounts[1] := GetBudgetAmount(BudgetCode, GLAccount, DimensionCode, StartDate, EndDate);

        Balance := BudgetAmounts[1] - (BudgetAmounts[3]) - abs(BudgetAmounts[2]);
    end;

    procedure GetAIEBudgetBalance(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date; var BudgetAmounts: array[3] of Decimal; AIECode: Code[20]) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
        LastBudgetAIEDate: Date;
        AllowedDates: array[3] of Date;
        ExpenseAmt, Committments, BudgetAmount : Decimal;
    begin
        GetLastBudgetAllowedDates(BudgetCode, DimensionCode[1], DimensionCode[2], AllowedDates);
        BudgetAmounts[2] := GetGlExpenses(BudgetCode, GLAccount, DimensionCode, AllowedDates[1], EndDate);
        BudgetAmounts[3] := GetGLCommittments(BudgetCode, GLAccount, DimensionCode, AllowedDates[1], EndDate);
        BudgetAmounts[1] := GetBudgetAmount(BudgetCode, GLAccount, DimensionCode, AllowedDates[1], AllowedDates[2]);

        Balance := getAIEAmount2(AIECode, GLAccount) - (BudgetAmounts[3]) - abs(BudgetAmounts[2]);
    end;

    procedure getAIEAmount2(AIECode: Code[20]; GLAccount: Code[20]) Balance: Decimal
    var
        AIE: Record AIE;
        AIELine: Record "Auth. Inc Expend. Line";
        Dates: array[3] of Date;
        BudgetCode: Code[20];
        GlobalDimension2Code: Code[20];
    begin
        Balance := 0;
        AIE.Reset();
        AIE.SetRange("Source Document No.", AIECode);
        if AIECode <> '' then
            if not AIE.FindFirst() then
                Error('The selected AIE %1 does not exist.', AIECode);
        BudgetCode := AIE."Budget Code";
        GlobalDimension2Code := AIE."Global Dimension 2 Code";
        //GetLastBudgetAllowedDates(AIE."Budget Code", AIE."Global Dimension 1 Code", AIE."Global Dimension 2 Code", Dates);
        AIE.Reset();
        AIE.SetRange("Global Dimension 2 Code", GlobalDimension2Code);
        AIE.SetRange("Budget Code", BudgetCode);
        if AIE.FindSet() then
            repeat
                AIELine.Reset();
                AIELine.SetRange("Document No.", AIE."Source Document No.");
                AIELine.SetRange("G/L Account", GLAccount);
                if AIELine.FindFirst() then
                    Balance += AIELine."Amount to Authorize";
            until AIE.Next() = 0;
    end;

    procedure getAIEUnallocatedAmount(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        BudgtMgt: Codeunit "Budget Management";

    begin
        //Balance := BudgtMgt.GetBudgetBalance2(BudgetCode, GLAccount, DimensionCode, StartDate, EndDate);
        Balance := BudgtMgt.GetAIEAllocatedAmount(BudgetCode, GLAccount, DimensionCode, StartDate, EndDate);
    end;

    procedure getAIEAllocatedAmount(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        AIELine: Record "Auth. Inc Expend. Line";
        Header: Record "Auth. Inc. Expend. Header";

    begin
        Balance := 0;
        Header.Reset();
        Header.SetRange("Budget Code", BudgetCode);
        Header.SetRange("Quarter Start Date", StartDate);
        Header.SetRange("Quarter End Date", EndDate);
        Header.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        Header.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        if Header.FindSet() then
            repeat
                AIELine.Reset();
                AIELine.SetRange("Document No.", Header."No.");
                AIELine.SetRange("G/L Account", GLAccount);
                AIELine.SetRange("Global Dimension 1 Code", DimensionCode[1]);
                AIELine.SetRange("Global Dimension 2 Code", DimensionCode[2]);
                AIELine.SetRange("Shortcut Dimension 3 Code", DimensionCode[3]);
                AIELine.SetRange("Shortcut Dimension 4 Code", DimensionCode[4]);
                AIELine.SetRange("Shortcut Dimension 5 Code", DimensionCode[5]);
                AIELine.SetRange("Shortcut Dimension 6 Code", DimensionCode[6]);
                if AIELine.FindFirst() then
                    //AIELine.CalcSums("Amount to Authorize");
                Balance += AIELine."Amount to Authorize";
            until Header.Next() = 0;

    end;

    procedure GetGlExpenses(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCodes: array[8] of Code[20]; StartDate: Date; EndDate: Date) ExpenseAmt: Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.Reset;
        GLEntry.SetLoadFields("G/L Account No Ext", "Budget Code", "PDate Ext", "Global Dimension 1 Code Ext", "Global Dimension 2 Code Ext", "Shortcut Dimension 3 Code Ext", "Shortcut Dimension 4 Code Ext", "Shortcut Dimension 5 Code Ext", "Shortcut Dimension 6 Code Ext", "Shortcut Dimension 7 Code Ext", "Shortcut Dimension 8 Code Ext", "Amount Ext");
        GLEntry.Setrange("G/L Account No Ext", GLAccount);
        GLEntry.Setrange("Budget Code", BudgetCode);
        GLEntry.SetRange("PDate Ext", StartDate, EndDate);
        GLEntry.SetRange("Global Dimension 1 Code Ext", DimensionCodes[1]);
        GLEntry.SetRange("Global Dimension 2 Code Ext", DimensionCodes[2]);
        GLEntry.Setrange("Shortcut Dimension 3 Code Ext", DimensionCodes[3]);
        GLEntry.Setrange("Shortcut Dimension 4 Code Ext", DimensionCodes[4]);
        GLEntry.Setrange("Shortcut Dimension 5 Code Ext", DimensionCodes[5]);
        GLEntry.Setrange("Shortcut Dimension 6 Code Ext", DimensionCodes[6]);
        GLEntry.Setrange("Shortcut Dimension 7 Code Ext", DimensionCodes[7]);
        GLEntry.Setrange("Shortcut Dimension 8 Code Ext", DimensionCodes[8]);
        if GLEntry.FindSet() then begin
            GLEntry.CalcSums("Amount Ext");
            ExpenseAmt := GLEntry."Amount Ext";
        end;
    end;

    procedure GetGlExpenses2(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCodes: array[8] of Code[20]; StartDate: Date; EndDate: Date) ExpenseAmt: Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.CalcFields("Shortcut Dimension 3 Code", "Shortcut Dimension 4 Code", "Shortcut Dimension 5 Code", "Shortcut Dimension 6 Code");
        GLEntry.Reset;
        //GLEntry.SetLoadFields("G/L Account No Ext", "Budget Code", "PDate Ext", "Global Dimension 1 Code Ext", "Global Dimension 2 Code Ext", "Shortcut Dimension 3 Code Ext", "Shortcut Dimension 4 Code Ext", "Shortcut Dimension 5 Code Ext", "Shortcut Dimension 6 Code Ext", "Shortcut Dimension 7 Code Ext", "Shortcut Dimension 8 Code Ext", "Amount Ext");
        GLEntry.SetFilter(GLEntry."G/L Account No.", GLAccount);
        //GLEntry.Setrange("Budget Code", BudgetCode);
        GLEntry.SetRange(GLEntry."Posting Date", StartDate, EndDate);
        if DimensionCodes[1] <> '' then
            GLEntry.SetRange("Global Dimension 1 Code", DimensionCodes[1]);
        if DimensionCodes[2] <> '' then
            GLEntry.SetRange("Global Dimension 2 Code", DimensionCodes[2]);
        if DimensionCodes[3] <> '' then
            GLEntry.Setrange("Shortcut Dimension 3 Code", DimensionCodes[3]);
        if DimensionCodes[4] <> '' then
            GLEntry.Setrange("Shortcut Dimension 4 Code", DimensionCodes[4]);
        if DimensionCodes[5] <> '' then
            GLEntry.Setrange("Shortcut Dimension 5 Code", DimensionCodes[5]);
        if DimensionCodes[6] <> '' then
            GLEntry.Setrange("Shortcut Dimension 6 Code", DimensionCodes[6]);
        if DimensionCodes[7] <> '' then
            GLEntry.Setrange("Shortcut Dimension 7 Code Ext", DimensionCodes[7]);
        if DimensionCodes[8] <> '' then
            GLEntry.Setrange("Shortcut Dimension 8 Code Ext", DimensionCodes[8]);
        if GLEntry.FindSet() then begin
            GLEntry.CalcSums("Amount Ext");
            ExpenseAmt := GLEntry."Amount Ext";
        end;
    end;

    procedure GetGLCommittments(BudgetCode: Code[20]; GLAccount: Code[30]; DimensionCodes: array[8] of Code[20]; StartDate: Date; EndDate: Date) CommitmentAmt: Decimal
    var
        Commitments: Record "Commitment Entries";
    begin
        Commitments.Reset();
        Commitments.SetRange("Budget Code", BudgetCode);
        Commitments.SetRange("Account No.", GLAccount);
        Commitments.Setrange("Commitment Date", StartDate, EndDate);
        Commitments.SetRange("Global Dimension 1 Code", DimensionCodes[1]);
        Commitments.SetRange("Global Dimension 2 Code", DimensionCodes[2]);
        if DimensionCodes[3]<>'' then
        Commitments.Setrange("Shortcut Dimension 3 Code", DimensionCodes[3]);
        if DimensionCodes[4]<>'' then
        Commitments.Setrange("Shortcut Dimension 4 Code", DimensionCodes[4]);
        if DimensionCodes[5]<>'' then
        Commitments.Setrange("Shortcut Dimension 5 Code", DimensionCodes[5]);
        if DimensionCodes[6]<>'' then
        Commitments.Setrange("Shortcut Dimension 6 Code", DimensionCodes[6]);
        Commitments.Setrange("Shortcut Dimension 7 Code", DimensionCodes[7]);
        Commitments.Setrange("Shortcut Dimension 8 Code", DimensionCodes[8]);
        if Commitments.FindSet() then begin
            Commitments.CalcSums(Amount);
            CommitmentAmt := Commitments.Amount;
        end;
    end;

    procedure GetGLCommittments2(BudgetCode: Code[20]; GLAccount: Code[30]; DimensionCodes: array[8] of Code[20]; StartDate: Date; EndDate: Date) CommitmentAmt: Decimal
    var
        Commitments: Record "Commitment Entries";
    begin
        Commitments.Reset();
        Commitments.SetRange("Budget Code", BudgetCode);
        Commitments.SetFilter("Account No.", GLAccount);
        Commitments.Setrange("Commitment Date", StartDate, EndDate);
        if DimensionCodes[1] <> '' then
            Commitments.SetRange("Global Dimension 1 Code", DimensionCodes[1]);
        if DimensionCodes[2] <> '' then
            Commitments.SetRange("Global Dimension 2 Code", DimensionCodes[2]);
        if DimensionCodes[3] <> '' then
            Commitments.Setrange("Shortcut Dimension 3 Code", DimensionCodes[3]);
        if DimensionCodes[4] <> '' then
            Commitments.Setrange("Shortcut Dimension 4 Code", DimensionCodes[4]);
        if DimensionCodes[5] <> '' then
            Commitments.Setrange("Shortcut Dimension 5 Code", DimensionCodes[5]);
        if DimensionCodes[6] <> '' then
            Commitments.Setrange("Shortcut Dimension 6 Code", DimensionCodes[6]);
        if DimensionCodes[7] <> '' then
            Commitments.Setrange("Shortcut Dimension 7 Code", DimensionCodes[7]);
        if DimensionCodes[8] <> '' then
            Commitments.Setrange("Shortcut Dimension 8 Code", DimensionCodes[8]);
        if Commitments.FindSet() then begin
            Commitments.CalcSums(Amount);
            CommitmentAmt := Commitments.Amount;
        end;
    end;

    procedure GetBudgetAllocation(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.Reset;
        GLBudgetEntry.SetRange("G/L Account No.", GLAccount);
        GLBudgetEntry.SetRange("Budget Name", BudgetCode);
        GLBudgetEntry.SetRange(Date, StartDate, EndDate);
        GLBudgetEntry.SetFilter("Entry Type", '<>%1', GLBudgetEntry."Entry Type"::Utilization);
        GLBudgetEntry.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        GLBudgetEntry.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", DimensionCode[3]);
        GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", DimensionCode[4]);
        GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", DimensionCode[5]);
        GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", DimensionCode[6]);
        GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", DimensionCode[7]);
        GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", DimensionCode[8]);
        if GLBudgetEntry.FindSet() then begin
            GLBudgetEntry.CalcSums(Amount);
            Balance := GLBudgetEntry.Amount;
        end;
    end;

    procedure GetSimpleBudgetAllocation(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.Reset;
        GLBudgetEntry.SetRange("G/L Account No.", GLAccount);
        GLBudgetEntry.SetRange("Budget Name", BudgetCode);
        GLBudgetEntry.SetRange(Date, StartDate, EndDate);
        GLBudgetEntry.SetFilter("Entry Type", '<>%1', GLBudgetEntry."Entry Type"::Utilization);
        GLBudgetEntry.SetRange("Global Dimension 1 Code", DimensionCode[1]);
        GLBudgetEntry.SetRange("Global Dimension 2 Code", DimensionCode[2]);
        if GLBudgetEntry.FindSet() then begin
            GLBudgetEntry.CalcSums(Amount);
            Balance := GLBudgetEntry.Amount;
        end;
    end;

    procedure ValidateBudgetReAllocationLines(var BudgetReAllocation: Record "Budget Reallocation Header")
    var
        BudgetLines: Record "Budget Modification Lines";
    begin
        BudgetLines.Reset();
        if BudgetReAllocation."Document Type" = BudgetReAllocation."Document Type"::Individual then
            BudgetReAllocation.TestField("Consolidation Template");
        BudgetLines.Setrange(BudgetLines."Document No", BudgetReAllocation."Document No");
        if BudgetLines.FindSet() then begin

            BudgetLines.ModifyAll("Error", false);
            BudgetLines.ModifyAll("Error Message", '');
        end;
        Commit();

        //Check for under Or over Allocations
        BudgetLines.Reset();
        BudgetLines.Setrange("Document No", BudgetReAllocation."Document No");
        BudgetLines.SetAutoCalcfields("Allocated Amounts");
        if BudgetLines.FindSet() then begin
            repeat
                if BudgetLines."Allocated Amounts" <> BudgetLines.Amount then begin
                    BudgetLines."Error" := true;
                    BudgetLines."Error Message" := 'The Allocated amounts must be equal to the requested amount or amount to allocated';
                    BudgetLines.Modify();
                end;
            until BudgetLines.Next = 0;
        end;
        Commit();

        BudgetLines.Reset();
        BudgetLines.Setrange("Document No", BudgetReAllocation."Document No");
        BudgetLines.Setrange(Error, true);
        if BudgetLines.FindFirst() then
            Error('There are lines with errors, Please check to proceed!');
    end;

    //Post Default AIE
    procedure PostDefaultAIE(var AuthIncExp: Record "Auth. Inc. Expend. Header")
    var
        GenJnlLine: Record "Gen. Journal Line";
        JnlBatch: Record "Gen. Journal Batch";
        SPMSetUp: Record "SPM General Setup";
        BatchCode: Code[10];
        LineNo: Integer;
        SourceCode, DestinationCode : Code[20];
        BankAcc, SRCBankCode : Record "Bank Account";
        PostingDate: Date;
        BatchAuthToIncurExp: Record "Batch. Auth to Incur Expend";
    begin
        SPMSetUp.Get();
        SPMSetUp.TestField("AIE Journal Template");

        if AuthIncExp."Batch No." <> '' then begin
            if StrLen(AuthIncExp."Batch No.") > 10 then
                BatchCode := CopyStr(AuthIncExp."Batch No.", StrLen(AuthIncExp."Batch No.") - 9, 10)
            else
                BatchCode := AuthIncExp."Batch No.";
            BatchAuthToIncurExp.Get(AuthIncExp."Batch No.");
            PostingDate := BatchAuthToIncurExp."Posting Date";
        end
        else begin
            if StrLen(AuthIncExp."No.") > 10 then
                BatchCode := CopyStr(AuthIncExp."No.", StrLen(AuthIncExp."No.") - 9, 10)
            else
                BatchCode := AuthIncExp."No.";
            PostingDate := AuthIncExp."Posting Date";
        end;

        JnlBatch.Init();
        if StrLen(SPMSetUp."AIE Journal Template") > 10 then
            JnlBatch."Journal Template Name" := CopyStr(SPMSetUp."AIE Journal Template", StrLen(SPMSetUp."AIE Journal Template") - 9, 10)
        else
            JnlBatch."Journal Template Name" := SPMSetUp."AIE Journal Template";
        JnlBatch.Name := BatchCode;
        if not JnlBatch.Get(JnlBatch."Journal Template Name", JnlBatch.Name) then
            JnlBatch.Insert();

        GenJnlLine.Reset();
        GenJnlLine.SetRange("Journal Template Name", JnlBatch."Journal Template Name");
        GenJnlLine.SetRange("Journal Batch Name", JnlBatch.Name);
        if GenJnlLine.FindLast() then
            LineNo := GenJnlLine."Line No.";

        LineNo += 1000;
        DestinationCode := AuthIncExp."Bank Account";
        DestinationCode := BankAcc.GetBankCode(BankAcc.Type::Recurrent, AuthIncExp."Global Dimension 1 Code", AuthIncExp."Global Dimension 2 Code");
        SourceCode := BankAcc.GetHQBankAccount(BankAcc.Type::Recurrent);

        SRCBankCode.Get(SourceCode);
        BankAcc.Get(DestinationCode);

        AuthIncExp.CalcFields("Amount to Authorize");

        //Post GenjnlLine
        GenJnlLine.Init();
        GenJnlLine."Journal Template Name" := JnlBatch."Journal Template Name";
        GenJnlLine."Journal Batch Name" := JnlBatch.Name;
        GenJnlLine."Document No." := BatchCode;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Posting Date" := PostingDate;
        GenJnlLine.Description := CopyStr(StrSubstNo('AIE for Budget %1 Quarter %2 for %3 %4 %5 %6', AuthIncExp."Budget Code", AuthIncExp.Quarter), 1, MaxStrLen(GenJnlLine.Description));
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
        GenJnlLine.Validate("Account No.", SourceCode);
        GenJnlLine."Shortcut Dimension 1 Code" := SRCBankCode."Global Dimension 1 Code";
        GenJnlLine."Shortcut Dimension 2 Code" := SRCBankCode."Global Dimension 2 Code";
        GenJnlLine.Validate("Shortcut Dimension 1 Code");
        GenJnlLine.Validate("Shortcut Dimension 2 Code");
        GenJnlLine.Amount := -(AuthIncExp."Amount to Authorize");
        GenJnlLine.Validate(Amount);
        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert();

        //Post to Destination Account
        LineNo += 1000;
        GenJnlLine.Init();
        GenJnlLine."Journal Template Name" := JnlBatch."Journal Template Name";
        GenJnlLine."Journal Batch Name" := JnlBatch.Name;
        GenJnlLine."Document No." := BatchCode;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Posting Date" := PostingDate;
        GenJnlLine.Description := CopyStr(StrSubstNo('AIE for Budget %1 Quarter %2 for %3 %4 %5 %6', AuthIncExp."Budget Code", AuthIncExp.Quarter), 1, MaxStrLen(GenJnlLine.Description));
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
        GenJnlLine.Validate("Account No.", BankAcc."No.");
        GenJnlLine."Shortcut Dimension 1 Code" := BankAcc."Global Dimension 1 Code";
        GenJnlLine."Shortcut Dimension 2 Code" := BankAcc."Global Dimension 2 Code";
        GenJnlLine.Validate("Shortcut Dimension 1 Code");
        GenJnlLine.Validate("Shortcut Dimension 2 Code");
        GenJnlLine.Amount := (AuthIncExp."Amount to Authorize");
        GenJnlLine.Validate(Amount);
        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert();
    end;


    //Post Custom AIE
    procedure PostCustomAIE(var AuthIncExp: Record "Auth. Inc. Expend. Header")
    var
        GenJnlLine: Record "Gen. Journal Line";
        JnlBatch: Record "Gen. Journal Batch";
        SPMSetUp: Record "SPM General Setup";
        BatchCode: Code[20];
        LineNo: Integer;
        SourceCode, DestinationCode : Code[20];
        BankAcc, SRCBankCode : Record "Bank Account";
        PostingDate: Date;
        AuthIncExpLine: Record "Auth. Inc Expend. Line";
    begin
        SPMSetUp.Get();
        SPMSetUp.TestField("AIE Journal Template");

        BatchCode := AuthIncExp."No.";
        PostingDate := AuthIncExp."Posting Date";

        JnlBatch.Init();
        JnlBatch."Journal Template Name" := SPMSetUp."AIE Journal Template";
        JnlBatch.Name := BatchCode;
        if not JnlBatch.Get(JnlBatch."Journal Template Name", JnlBatch.Name) then
            JnlBatch.Insert();

        GenJnlLine.Reset();
        GenJnlLine.SetRange("Journal Template Name", JnlBatch."Journal Template Name");
        GenJnlLine.SetRange("Journal Batch Name", JnlBatch.Name);
        if GenJnlLine.FindLast() then
            LineNo := GenJnlLine."Line No.";

        AuthIncExpLine.Reset();
        AuthIncExpLine.SetRange("Document No.", AuthIncExp."No.");
        if AuthIncExpLine.FindSet() then begin
            repeat
                //SRCBankCode.Get(AuthIncExpLine."Source Bank Code");
                //BankAcc.Get(AuthIncExpLine."Receiving Bank Code");
                LineNo += 1000;

                //Post GenjnlLine
                GenJnlLine.Init();
                GenJnlLine."Journal Template Name" := JnlBatch."Journal Template Name";
                GenJnlLine."Journal Batch Name" := JnlBatch.Name;
                GenJnlLine."Document No." := BatchCode;
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := PostingDate;
                GenJnlLine.Description := CopyStr(StrSubstNo('Special AIE for Budget ReAllocation from %1 %2 to %3 %4', SRCBankCode.FieldCaption("Global Dimension 1 Code"), SRCBankCode."Global Dimension 1 Code",
                                                            SRCBankCode.FieldCaption("Global Dimension 2 Code"), SRCBankCode."Global Dimension 2 Code"), 1, MaxStrLen(GenJnlLine.Description));
                GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
                GenJnlLine.Validate("Account No.", SourceCode);
                GenJnlLine."Shortcut Dimension 1 Code" := SRCBankCode."Global Dimension 1 Code";
                GenJnlLine."Shortcut Dimension 2 Code" := SRCBankCode."Global Dimension 2 Code";
                GenJnlLine.Validate("Shortcut Dimension 1 Code");
                GenJnlLine.Validate("Shortcut Dimension 2 Code");
                GenJnlLine.Amount := -(AuthIncExpLine."Amount to Authorize");
                GenJnlLine.Validate(Amount);
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert();

                //Post to Destination Account
                GenJnlLine.Init();
                GenJnlLine."Journal Template Name" := JnlBatch."Journal Template Name";
                GenJnlLine."Journal Batch Name" := JnlBatch.Name;
                GenJnlLine."Document No." := BatchCode;
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := PostingDate;
                GenJnlLine.Description := CopyStr(StrSubstNo('Special AIE for Budget ReAllocation from %1 %2 to %3 %4', SRCBankCode.FieldCaption("Global Dimension 1 Code"), SRCBankCode."Global Dimension 1 Code",
                                                           SRCBankCode.FieldCaption("Global Dimension 2 Code"), SRCBankCode."Global Dimension 2 Code"), 1, MaxStrLen(GenJnlLine.Description));
                GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
                GenJnlLine.Validate("Account No.", BankAcc."No.");
                GenJnlLine."Shortcut Dimension 1 Code" := BankAcc."Global Dimension 1 Code";
                GenJnlLine."Shortcut Dimension 2 Code" := BankAcc."Global Dimension 2 Code";
                GenJnlLine.Validate("Shortcut Dimension 1 Code");
                GenJnlLine.Validate("Shortcut Dimension 2 Code");
                GenJnlLine.Amount := (AuthIncExpLine."Amount to Authorize");
                GenJnlLine.Validate(Amount);
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert();
            until AuthIncExpLine.Next() = 0;
        end;
    end;

    procedure GetLastBudgetAllowedDates(BudgetCode: Code[20]; GlobalDimension1Code: Code[20]; GlobalDimension2Code: Code[20]; var Dates: array[3] of Date)
    var
        AIE: Record AIE;

    begin
        //Get Allowed Budget Consumption to Date for the budget per spending unit and geographical location
        AIE.Reset();
        AIE.SetCurrentKey("Start Date");
        AIE.SetRange("Budget Code", BudgetCode);
        AIE.SetRange("Global Dimension 1 Code", GlobalDimension1Code);
        AIE.Setrange("Global Dimension 2 Code", GlobalDimension2Code);
        if AIE.FindFirst() then
            Dates[1] := AIE."Start Date"
        else
            Error('There is no AIE for budget %1 for %2 %3 and %4 %5.Please contact finance', BudgetCode, AIE.FieldCaption("Global Dimension 1 Code"), GlobalDimension1Code,
                    AIE.FieldCaption("Global Dimension 2 Code"), GlobalDimension2Code);

        //End Dates
        AIE.Reset();
        AIE.SetCurrentKey("End Date");
        AIE.SetRange("Budget Code", BudgetCode);
        AIE.SetRange("Global Dimension 1 Code", GlobalDimension1Code);
        AIE.Setrange("Global Dimension 2 Code", GlobalDimension2Code);
        if AIE.FindLast() then
            Dates[2] := AIE."End Date";
    end;

    procedure CheckBudgetControl(GLAccount: Code[20])
    var
        BudgetHeader: Record "Budget Control Header";
        Lines: Record "Budget Control Lines";
    begin

    end;






}
