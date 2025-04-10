Codeunit 52193479 "Budget Management"
{

    trigger OnRun()
    begin
    end;

    var
        EntryNo: Integer;

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

    procedure getAIEUnallocatedAmount(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        BudgtMgt: Codeunit "Budget Management";

    begin
        //Balance := BudgtMgt.GetBudgetBalance2(BudgetCode, GLAccount, DimensionCode, StartDate, EndDate);
        Balance := BudgtMgt.GetAIEAllocatedAmount(BudgetCode, GLAccount, DimensionCode, StartDate, EndDate);
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
        Commitments.Setrange("Shortcut Dimension 3 Code", DimensionCodes[3]);
        Commitments.Setrange("Shortcut Dimension 4 Code", DimensionCodes[4]);
        Commitments.Setrange("Shortcut Dimension 5 Code", DimensionCodes[5]);
        Commitments.Setrange("Shortcut Dimension 6 Code", DimensionCodes[6]);
        Commitments.Setrange("Shortcut Dimension 7 Code", DimensionCodes[7]);
        Commitments.Setrange("Shortcut Dimension 8 Code", DimensionCodes[8]);
        if Commitments.FindSet() then begin
            Commitments.CalcSums(Amount);
            CommitmentAmt := Commitments.Amount;
        end;
    end;

    procedure GetBudgetBalance2(BudgetCode: Code[20]; GLAccount: Code[20]; DimensionCode: array[8] of Code[20]; StartDate: Date; EndDate: Date) Balance: Decimal
    var
        GLBudgetEntry: Record "G/L Budget Entry";
        LastBudgetAIEDate: Date;
        ExpenseAmt, Committments, BudgetAmount : Decimal;
    begin
        ExpenseAmt := GetGlExpenses(BudgetCode, GLAccount, DimensionCode, StartDate, EndDate);
        Committments := GetGLCommittments(BudgetCode, GLAccount, DimensionCode, StartDate, StartDate);
        //  BudgetAmount := GetBudgetAmount(BudgetCode, GLAccount, DimensionCode, StartDate, StartDate);
        Balance := BudgetAmount - (Committments) - abs(ExpenseAmt);
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
                        WorkplanBudgetLine.Modify();
                    end;
                end;

        end;
    end;

    procedure BudgetVirement(var GenJnlLine: Record "Gen. Journal Line")
    var
        GLBudgetEntry: Record "G/L Budget Entry";
        GenJnlLineCopy: Record "Gen. Journal Line";
    begin
        with GenJnlLine do begin
            if Find then
                repeat
                    GenJnlLineCopy.Copy(GenJnlLine);
                    //Find last Entry Number;

                    if GLBudgetEntry.Find('+') then
                        EntryNo := GLBudgetEntry."Entry No." + 1;
                    GLBudgetEntry.Init;

                    GLBudgetEntry."Entry No." := EntryNo;
                    GLBudgetEntry."Budget Name" := "Budget Name";
                    GLBudgetEntry."G/L Account No." := "Account No.";
                    GLBudgetEntry.Date := "Posting Date";
                    GLBudgetEntry."Global Dimension 1 Code" := "Shortcut Dimension 1 Code";
                    GLBudgetEntry."Global Dimension 2 Code" := "Shortcut Dimension 1 Code";
                    GLBudgetEntry.Amount := Amount;
                    GLBudgetEntry.Description := Description;
                    GLBudgetEntry."Business Unit Code" := '';
                    GLBudgetEntry."User ID" := UserId;
                    GLBudgetEntry."Budget Dimension 1 Code" := '';
                    GLBudgetEntry."Budget Dimension 2 Code" := '';
                    GLBudgetEntry."Budget Dimension 3 Code" := '';
                    GLBudgetEntry."Budget Dimension 4 Code" := '';
                    GLBudgetEntry.Insert;

                    EntryNo := GLBudgetEntry."Entry No." + 1;
                    GLBudgetEntry.Init;
                    GLBudgetEntry."Entry No." := EntryNo;
                    GLBudgetEntry."Budget Name" := GenJnlLineCopy."Budget Name";
                    GLBudgetEntry."G/L Account No." := GenJnlLineCopy."Bal. Account No.";
                    GLBudgetEntry.Date := GenJnlLineCopy."Posting Date";
                    GLBudgetEntry."Global Dimension 1 Code" := GenJnlLineCopy."Shortcut Dimension 1 Code";
                    GLBudgetEntry."Global Dimension 2 Code" := GenJnlLineCopy."Shortcut Dimension 1 Code";
                    GLBudgetEntry.Amount := -GenJnlLineCopy.Amount;
                    GLBudgetEntry.Description := GenJnlLineCopy.Description;
                    GLBudgetEntry."Business Unit Code" := '';
                    GLBudgetEntry."User ID" := UserId;
                    GLBudgetEntry."Budget Dimension 1 Code" := '';
                    GLBudgetEntry."Budget Dimension 2 Code" := '';
                    GLBudgetEntry."Budget Dimension 3 Code" := '';
                    GLBudgetEntry."Budget Dimension 4 Code" := '';
                    GLBudgetEntry.Insert;
                    //DELETE FROM GenJnlLine
                    GenJnlLine.Delete;

                until Next = 0;
        end;
    end;
}

