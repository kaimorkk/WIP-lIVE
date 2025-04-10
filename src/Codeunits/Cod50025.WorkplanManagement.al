codeunit 50030 "Workplan Management"
{
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Recipients: List of [Text];
        Subject: Text[100];
        Body: Text;

    procedure ValidateCeilings(ConsolidationHeader: Record "Budget Consolidation Header")
    var
        ResourceReqLines, DraftWorkplan : Record "Annual Strategy Workplan";
    begin
        ResourceReqLines.reset;
        ResourceReqLines.Setrange(Consolidated, true);
        ResourceReqLines.Setrange("Draft Workplan Generated", false);
        ResourceReqLines.SetRange("Ceiling Amount", 0);
        ResourceReqLines.Setrange("Annual Workplan", ConsolidationHeader.Code);
        if not ResourceReqLines.IsEmpty() then
            Error('Please ensure ceiling amounts have been captured for all the consolidation lines selected to proceed!');
    end;

    procedure GenerateReAllocationAIE(var BudgetReAllocHeader: Record "Budget Reallocation Header"): Code[20]
    var
        BudgetModificationLine: Record "Budget Modification Lines";
        BudgetReAllocationLine: Record "Budget Reallocation Line";
        AuthIncExpHeader: Record "Auth. Inc. Expend. Header";
        AuthIncExpLine: Record "Auth. Inc Expend. Line";
        AuthIncExpLineDict: Dictionary of [Text, Integer];
        LineNo, AllLineNos : Integer;
        AIENo: Code[20];
        SPMSetUp: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BankAcc: Record "Bank Account";
        SRCBankCode, DestBankCode : Code[20];
        KeyTxt: Text;
    begin
        if AuthIncExpHeader.Get(BudgetReAllocHeader."AIE No.") then begin
            AIENo := AuthIncExpHeader."No.";
            if AuthIncExpHeader.Posted then
                exit
            else
                AuthIncExpHeader.ClearLines();
        end
        else begin
            SPMSetUp.Get();
            SPMSetUp.TestField("AIE Nos");
            AuthIncExpHeader.Init();
            AuthIncExpHeader.Type := AuthIncExpHeader.Type::Custom;
            AuthIncExpHeader."Corporate Strategy" := GetCurrentCorporateStrategy();
            AuthIncExpHeader."Reporting Period" := GetCurrentStrategyImplementationYear(AuthIncExpHeader."Corporate Strategy");
            AuthIncExpHeader."Budget Code" := BudgetReAllocHeader."Budget Code";
            AuthIncExpHeader.Quarter := BudgetReAllocHeader.Quarter;
            AuthIncExpHeader."No." := NoSeriesMgt.GetNextNo(SPMSetUp."AIE Nos", Today, true);
            AuthIncExpHeader.Insert();
            AIENo := AuthIncExpHeader."No.";
        end;
        BudgetReAllocHeader."AIE No." := AIENo;
        BudgetReAllocHeader.Modify();

        //Generate Lines
        BudgetModificationLine.Reset();
        BudgetModificationLine.SetRange("Document No", BudgetReAllocHeader."Document No");
        if BudgetModificationLine.FindSet() then begin
            repeat
                if BudgetModificationLine."ReAllocation Request" then begin
                    BudgetReAllocationLine.Reset();
                    BudgetReAllocationLine.SetRange("Document No.", BudgetReAllocHeader."Document No");
                    BudgetReAllocationLine.SetRange("Source Line No", BudgetModificationLine."Line No");
                    if BudgetReAllocationLine.FindSet() then begin
                        repeat
                            SRCBankCode := BankAcc.GetBankCode(BankAcc.Type::Recurrent, BudgetModificationLine."Global Dimension 1 Code", BudgetReAllocationLine."Global Dimension 2 Code");
                            if (BudgetModificationLine.Quarter <> BudgetReAllocationLine.Quarter) or (BudgetModificationLine."Global Dimension 1 Code" <> BudgetReAllocationLine."Global Dimension 1 Code")
                                                       or (BudgetModificationLine."Global Dimension 2 Code" <> BudgetReAllocationLine."Global Dimension 2 Code") then begin
                                KeyTxt := StrSubstNo('%1_%2_%3_%4_%5_%6_%7_%8_%9_%10', BudgetModificationLine."G/L Account No", BudgetModificationLine."Global Dimension 1 Code", BudgetModificationLine."Global Dimension 2 Code",
                                                    BudgetModificationLine."Shortcut Dimension 3 Code", BudgetModificationLine."Shortcut Dimension 4 Code", BudgetModificationLine."Shortcut Dimension 5 Code",
                                                    BudgetModificationLine."Shortcut Dimension 6 Code", BudgetModificationLine."Shortcut Dimension 7 Code", BudgetModificationLine."Shortcut Dimension 8 Code", SRCBankCode);
                                if AuthIncExpLineDict.ContainsKey(KeyTxt) then begin
                                    AuthIncExpLineDict.Get(KeyTxt, LineNo);
                                    if AuthIncExpLine.Get(AIENo, LineNo) then begin
                                        AuthIncExpLine."Amount to Authorize" += BudgetReAllocationLine.Amount;
                                        AuthIncExpLine.Modify();
                                    end;
                                end
                                else begin
                                    AllLineNos += 1000;
                                    AuthIncExpLineDict.Add(KeyTxt, LineNo);
                                    AuthIncExpLine.Init();
                                    AuthIncExpLine."Document No." := AuthIncExpHeader."No.";
                                    AuthIncExpLine."Line No." := AllLineNos;
                                    AuthIncExpLine."G/L Account" := BudgetModificationLine."G/L Account No";
                                    AuthIncExpLine."G/L Account Name" := BudgetModificationLine."G/L Account Name";
                                    AuthIncExpLine."Global Dimension 1 Code" := BudgetModificationLine."Global Dimension 1 Code";
                                    AuthIncExpLine."Global Dimension 2 Code" := BudgetModificationLine."Global Dimension 2 Code";
                                    AuthIncExpLine."Shortcut Dimension 3 Code" := BudgetModificationLine."Shortcut Dimension 3 Code";
                                    AuthIncExpLine."Shortcut Dimension 4 Code" := BudgetModificationLine."Shortcut Dimension 4 Code";
                                    AuthIncExpLine."Shortcut Dimension 5 Code" := BudgetModificationLine."Shortcut Dimension 5 Code";
                                    AuthIncExpLine."Shortcut Dimension 6 Code" := BudgetModificationLine."Shortcut Dimension 6 Code";
                                    AuthIncExpLine."Shortcut Dimension 7 Code" := BudgetModificationLine."Shortcut Dimension 7 Code";
                                    AuthIncExpLine."Shortcut Dimension 8 Code" := BudgetModificationLine."Shortcut Dimension 8 Code";
                                    AuthIncExpLine."Source Bank Code" := SRCBankCode;
                                    AuthincExpLine."Amount to Authorize" := BudgetReAllocationLine.Amount;
                                    AuthIncExpLine."Receiving Bank Code" := BankAcc.GetBankCode(BankAcc.Type::Recurrent, BudgetModificationLine."Global Dimension 1 Code", BudgetModificationLine."Global Dimension 2 Code");
                                    AuthIncExpLine.Insert();
                                end;
                            end;
                        until BudgetReAllocationLine.Next() = 0
                    end;
                end else begin
                    SRCBankCode := BankAcc.GetBankCode(BankAcc.Type::Recurrent, BudgetModificationLine."Global Dimension 1 Code", BudgetModificationLine."Global Dimension 2 Code");
                    BudgetReAllocationLine.Reset();
                    BudgetReAllocationLine.SetRange("Document No.", BudgetReAllocHeader."Document No");
                    BudgetReAllocationLine.SetRange("Source Line No", BudgetModificationLine."Line No");
                    if BudgetReAllocationLine.FindSet() then begin
                        repeat
                            if (BudgetModificationLine.Quarter <> BudgetReAllocationLine.Quarter) or (BudgetModificationLine."Global Dimension 1 Code" <> BudgetReAllocationLine."Global Dimension 1 Code")
                            or (BudgetModificationLine."Global Dimension 2 Code" <> BudgetReAllocationLine."Global Dimension 2 Code") then begin
                                KeyTxt := StrSubstNo('%1_%2_%3_%4_%5_%6_%7_%8_%9_%10', BudgetReAllocationLine."G/L Account No", BudgetReAllocationLine."Global Dimension 1 Code", BudgetReAllocationLine."Global Dimension 2 Code",
                                                    BudgetReAllocationLine."Shortcut Dimension 3 Code", BudgetReAllocationLine."Shortcut Dimension 4 Code", BudgetReAllocationLine."Shortcut Dimension 5 Code",
                                                    BudgetReAllocationLine."Shortcut Dimension 6 Code", BudgetReAllocationLine."Shortcut Dimension 7 Code", BudgetReAllocationLine."Shortcut Dimension 8 Code", SRCBankCode);
                                if AuthIncExpLineDict.ContainsKey(KeyTxt) then begin
                                    AuthIncExpLineDict.Get(KeyTxt, LineNo);
                                    if AuthIncExpLine.Get(AIENo, LineNo) then begin
                                        AuthIncExpLine."Amount to Authorize" += BudgetReAllocationLine.Amount;
                                        AuthIncExpLine.Modify();
                                    end;
                                end
                                else begin
                                    AllLineNos += 1000;
                                    AuthIncExpLineDict.Add(KeyTxt, LineNo);
                                    AuthIncExpLine.Init();
                                    AuthIncExpLine."Document No." := AuthIncExpHeader."No.";
                                    AuthIncExpLine."Line No." := AllLineNos;
                                    AuthIncExpLine."G/L Account" := BudgetReAllocationLine."G/L Account No";
                                    AuthIncExpLine."G/L Account Name" := BudgetReAllocationLine."G/L Account Name";
                                    AuthIncExpLine."Global Dimension 1 Code" := BudgetReAllocationLine."Global Dimension 1 Code";
                                    AuthIncExpLine."Global Dimension 2 Code" := BudgetReAllocationLine."Global Dimension 2 Code";
                                    AuthIncExpLine."Shortcut Dimension 3 Code" := BudgetReAllocationLine."Shortcut Dimension 3 Code";
                                    AuthIncExpLine."Shortcut Dimension 4 Code" := BudgetReAllocationLine."Shortcut Dimension 4 Code";
                                    AuthIncExpLine."Shortcut Dimension 5 Code" := BudgetReAllocationLine."Shortcut Dimension 5 Code";
                                    AuthIncExpLine."Shortcut Dimension 6 Code" := BudgetReAllocationLine."Shortcut Dimension 6 Code";
                                    AuthIncExpLine."Shortcut Dimension 7 Code" := BudgetReAllocationLine."Shortcut Dimension 7 Code";
                                    AuthIncExpLine."Shortcut Dimension 8 Code" := BudgetReAllocationLine."Shortcut Dimension 8 Code";
                                    AuthincExpLine."Amount to Authorize" := BudgetReAllocationLine.Amount;
                                    AuthIncExpLine."Source Bank Code" := SRCBankCode;
                                    AuthIncExpLine."Receiving Bank Code" := BankAcc.GetBankCode(BankAcc.Type::Recurrent, BudgetReAllocationLine."Global Dimension 1 Code", BudgetModificationLine."Global Dimension 2 Code");
                                    AuthIncExpLine.Insert();
                                end;
                            end;
                        until BudgetReAllocationLine.Next() = 0;
                    end;
                end;
            until BudgetModificationLine.Next() = 0;
        end;
        exit(AIENo);
    end;

    procedure CreateWorkplanFromResourceConsolidation(var ConsolidationHeader: Record "Budget Consolidation Header")
    var
        ResourceReqLines, DraftWorkplan : Record "Annual Strategy Workplan";
        WorkplanBudget, WorkplanBudget2 : Record "Workplan Budget Line";
        WorkPlanStrategyLine, WorkplanStrategyLine2 : Record "Strategy Workplan Lines";
        SPMSetUp: record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        No: Code[20];
        WorkplanInputs, WorkplanInputs2 : record "SubWorkPlan Activity Inputs";
        WorkplanBudgetLine, WorkplanBudgetLine2 : record "Workplan Budget Line";
        Workings, Workings2 : Record "Workplan Workings";
    begin
        if ConsolidationHeader.Posted then
            exit;

        SPMSetUp.Get();
        SPMSetUp.TestField("Workplan Revision No");

        ResourceReqLines.reset;
        ResourceReqLines.Setrange(Consolidated, true);
        ResourceReqLines.Setrange("Draft Workplan Generated", false);
        //ResourceReqlines.Setrange(Select, true);
        ResourceReqLines.SetRange("Ceiling Amount", 0);
        ResourceReqLines.Setrange("Annual Workplan", ConsolidationHeader.Code);
        if not ResourceReqLines.IsEmpty() then
            Error('Please ensure ceiling amounts have been captured for all the consolidation lines selected to proceed!');

        ResourceReqLines.reset;
        ResourceReqLines.Setrange(Consolidated, true);
        ResourceReqLines.Setrange("Draft Workplan Generated", false);
        //ResourceReqlines.Setrange(Select, true);
        ResourceReqLines.Setrange("Annual Workplan", ConsolidationHeader.Code);
        if ResourceReqLines.FindSet() then begin
            repeat
                //Create Document
                No := NoSeriesMgt.GetNextNo(SPMSetUp."Workplan Revision No", Today, true);
                DraftWorkplan.Init();
                DraftWorkplan.TransferFields(ResourceReqLines);
                DraftWorkplan.No := No;
                DraftWorkplan."Planning Budget Type" := DraftWorkPlan."Planning Budget Type"::Supplementary;
                DraftWorkplan.Consolidated := false;
                DraftWorkplan."Date Consolidated" := 0DT;
                DraftWorkplan."Consolidated By" := '';
                DraftWorkplan."Approval Status" := DraftWorkplan."Approval Status"::Open;
                DraftWorkplan."Annual Workplan" := ConsolidationHeader."Draft Workplan Consolidation";
                DraftWorkplan."Functional Procurment Plan No" := ConsolidationHeader."Proposed Procurement Plan";
                DraftWorkplan."Resource Req. No" := ResourceReqLines.No;
                DraftWorkplan.Select := false;
                DraftWorkplan.Insert(true);

                //Copy Workplan Lines
                WorkPlanStrategyLine.Reset;
                WorkPlanStrategyLine.Setrange(No, ResourceReqlines.No);
                if WorkPlanStrategyLine.FindSet() then begin
                    repeat
                        WorkplanStrategyLine2.init();
                        WorkplanStrategyLine2.TransferFields(WorkPlanStrategyLine);
                        WorkplanStrategyLine2.No := DraftWorkplan.No;
                        WorkplanStrategyLine2."Resource Req. No" := ResourceReqLines.No;
                        WorkplanStrategyLine2.Insert();
                    until WorkPlanStrategyLine.next() = 0;
                end;

                //Copy Workplan Inputs
                WorkplanInputs.reset;
                WorkplanInputs.SetRange("Workplan No.", ResourceReqlines.No);
                if WorkplanInputs.FindSet() then begin
                    repeat
                        WorkplanInputs2.Init();
                        WorkplanInputs2.TransferFields(WorkplanInputs);
                        WorkplanInputs2."Workplan No." := DraftWorkplan.No;
                        WorkplanInputs2.Insert();
                    until WorkplanInputs.Next() = 0;
                end;

                //Copy Workplan Budgets
                WorkplanBudgetLine.reset;
                WorkplanBudgetLine.Setrange("Strategy Plan ID", ResourceReqlines.No);
                if WorkplanBudgetLine.FindSet() then begin
                    repeat
                        WorkplanBudgetLine2.Init();
                        WorkplanBudgetLine2.TransferFields(WorkplanBudgetLine);
                        WorkplanBudgetLine2."Strategy Plan ID" := DraftWorkplan.No;
                        WorkplanBudgetLine2.insert();
                    until WorkplanBudgetLine.Next() = 0;
                end;
                //Copy Workings
                Workings.Reset();
                Workings.SetRange("Strategy Plan ID", ResourceReqlines.No);
                if Workings.FindSet() then begin
                    repeat
                        Workings2.Init();
                        Workings2.TransferFields(Workings);
                        Workings2."Strategy Plan ID" := DraftWorkplan.No;
                        Workings2.Insert();
                    until Workings.Next() = 0;
                end;

                if DraftWorkplan.Get(No) then begin
                    ResourceReqLines."Draft Workplan Generated" := true;
                    ResourceReqLines."Draft Workplan Generated By" := UserId;
                    ResourceReqLines."Draft Workplan No." := No;
                    ResourceReqLines."Date Draft Workplan Generated" := CurrentDateTime;
                    ResourceReqLines.Modify();
                end;
            until ResourceReqLines.Next() = 0;
        end;

        ResourceReqLines.reset;
        ResourceReqLines.Setrange("Annual Workplan", ConsolidationHeader.Code);
        ResourceReqLines.Setrange(Consolidated, true);
        ResourceReqLines.Setrange(select, true);
        ResourceReqLines.Setrange("Draft Workplan Generated", true);
        if ResourceReqLines.FindSet() then
            ResourceReqLines.ModifyAll(Select, false);

        //Mark Document as posted
        ResourceReqLines.reset;
        ResourceReqLines.Setrange(Consolidated, true);
        ResourceReqLines.Setrange("Draft Workplan Generated", false);
        ResourceReqLines.Setrange("Annual Workplan", ConsolidationHeader.Code);
        if ResourceReqLines.IsEmpty() then begin
            ConsolidationHeader.Posted := true;
            ConsolidationHeader."Posted By" := UserId;
            ConsolidationHeader."Posted On" := CurrentDateTime;
            ConsolidationHeader.Modify();
        end;
    end;

    procedure SendDraftWorkPlanForReview(var Workplan: Record "Annual Strategy Workplan")

    var
        Employee: Record Employee;
    begin
        WorkPlan.Consolidated := false;
        WorkPlan."Consolidated By" := '';
        Workplan."Date Consolidated" := 0DT;
        Workplan."Approval Status" := Workplan."Approval Status"::Open;
        Workplan."Under Review" := true;
        Workplan.Select := false;
        Workplan.Modify();

        Clear(Recipients);
        if Employee.Get(Workplan."Created By") then begin
            if Employee."Company E-Mail" <> '' then begin
                Recipients.Add(Employee."Company E-Mail");
                Subject := 'Annual Strategy Workplan Review';
                Body := 'Dear ' + Employee."First Name" + ',<br>' + 'Your annual strategy workplan has been returned for review. Please log into the system and review in accordance with the comments provided under the comments tab.';
                EmailMessage.Create(Recipients, Subject, Body, true);
                Email.Send(EmailMessage);
            end;
        end;
        //Send Email Communications
    end;

    procedure SendDraftWorkplanConsilidationToNAJSCOrMarkApproved(var DraftWorkPlanConsolidations: Record "Budget Consolidation Header"; Stage: Option JSC,NA,Approved)
    var
        DraftWorkPlan: record "Annual Strategy Workplan";
    begin
        //Check for Under Review Lines
        DraftWorkPlan.Reset;
        DraftWorkPlan.Setrange("Under Review", true);
        DraftWorkPlan.SetRange("Annual Workplan", DraftWorkPlanConsolidations.Code);
        if DraftWorkPlan.FindSet() then
            Error('There are %1 workplans under review for consolidation document %2,Please ensure all the changes have been consolidated before proceeding!', DraftWorkPlan.Count, DraftWorkPlanConsolidations.Code);
        case
            Stage of
            Stage::NA:
                DraftWorkPlanConsolidations.Stage := DraftWorkPlanConsolidations.Stage::NA;
            Stage::JSC:
                DraftWorkPlanConsolidations.Stage := DraftWorkPlanConsolidations.Stage::JSC;
            Stage::Approved:
                DraftWorkPlanConsolidations.Stage := DraftWorkPlanConsolidations.Stage::"Fully Approved";
        end;
        DraftWorkPlanConsolidations.Modify();
    end;

    procedure PostConsolidatedWorkplan(var DraftWorkplanConsolidation: record "Budget Consolidation Header")
    var
        DraftWorkplans, DraftWorkplans2 : Record "Annual Strategy Workplan";
        BudgetLines: Record "Workplan Budget Line";
        QuarterDates: array[4, 2] of Date;
        GLBudgetEntry, GLBudgetEntry2 : record "G/L Budget Entry";
        BudgetCode: Code[50];
        EntryNo: Integer;
        Updated, BudgetLinesExists, DraftWorkPlandPosted : Boolean;
    begin
        //Post Changes to the GLBudget Entry
        if DraftWorkplanConsolidation.Posted then
            exit;

        BudgetCode := GetQuarterDates(DraftWorkplanConsolidation."Financial Year", DraftWorkplanConsolidation."Corporate Strategy", QuarterDates);
        GLBudgetEntry.Reset();

        if GLBudgetEntry.FindLast() then
            EntryNo := GLBudgetEntry."Entry No.";

        GLBudgetEntry.LockTable();

        DraftWorkplans.Reset;
        DraftWorkplans.Setrange("Under Review", true);
        DraftWorkplans.SetRange("Annual Workplan", DraftWorkplanConsolidation.Code);
        if DraftWorkplans.FindSet() then
            Error('There are %1 workplans under review for consolidation document %2,Please ensure all the changes have been consolidated before proceeding!', DraftWorkplans.Count, DraftWorkplanConsolidation.Code);

        DraftWorkplans.reset;
        //DraftWorkplans.Setrange("Planning Budget Type", DraftWorkplans."Planning Budget Type"::Supplementary);
        DraftWorkplans.SetRange("Annual Workplan", DraftWorkplanConsolidation.Code);
        DraftWorkplans.SetRange(Consolidated, true);
        DraftWorkplans.SetRange("Under Review", false);
        DraftWorkplans.SetRange("Budget Posted to G/L", false);
        if DraftWorkplans.FindSet() then begin
            repeat
                BudgetLinesExists := false;
                BudgetLines.Reset();
                BudgetLines.SetRange("Strategy Plan ID", DraftWorkplans.No);
                BudgetLines.SetRange("G/L Updated", false);
                BudgetLines.SetFilter("Total Amount", '>%1', 0);
                if BudgetLines.FindSet() then begin
                    BudgetLinesExists := true;
                    repeat
                        Updated := false;
                        if BudgetLines."Q1 Amount" <> 0 then begin
                            EntryNo += 1;

                            GLBudgetEntry.Reset();
                            GLBudgetEntry.SetRange("Budget Name", BudgetCode);
                            GLBudgetEntry.SetRange("Budget Type", GLBudgetEntry."Budget Type"::Approved);
                            GLBudgetEntry.SetRange("G/L Account No.", BudgetLines."Budget Item");
                            GLBudgetEntry.SetRange("Date", QuarterDates[1] [1]);
                            GLBudgetEntry.SetRange("Global Dimension 1 Code", DraftWorkplans."Global Dimension 1 Code");
                            GLBudgetEntry.SetRange("Global Dimension 2 Code", DraftWorkplans."Global Dimension 2 Code");
                            GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", BudgetLines."Shortcut Dimension 3 Code");
                            GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", BudgetLines."Shortcut Dimension 4 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", BudgetLines."Shortcut Dimension 5 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", BudgetLines."Shortcut Dimension 6 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", BudgetLines."Shortcut Dimension 7 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", BudgetLines."Shortcut Dimension 8 Code");
                            // GLBudgetEntry.SetFilter("Source Document", '<>%1', DraftWorkplans."No");
                            if GLBudgetEntry.FindSet() then begin
                                GLBudgetEntry.CalcSums("Amount");
                                GLBudgetEntry2.Init();
                                GLBudgetEntry2.TransferFields(GLBudgetEntry);
                                GLBudgetEntry2."Entry No." := EntryNo;
                                EntryNo += 1;
                                GLBudgetEntry2.Amount := -GLBudgetEntry.Amount;
                                GLBudgetEntry2.Insert();
                            end;
                            GLBudgetEntry.Init();
                            GLBudgetEntry."Entry No." := EntryNo;
                            GLBudgetEntry."Budget Name" := BudgetCode;
                            GLBudgetEntry."Budget Type" := GLBudgetEntry."Budget Type"::Approved;
                            GLBudgetEntry.Amount := BudgetLines."Q1 Amount";
                            GLBudgetEntry."G/L Account No." := BudgetLines."Budget Item";
                            GLBudgetEntry.Description := BudgetLines."Budget Item Description";
                            GLBudgetEntry.Date := QuarterDates[1] [1];
                            GLBudgetEntry."Global Dimension 1 Code" := DraftWorkplans."Global Dimension 1 Code";
                            GLBudgetEntry."Global Dimension 2 Code" := DraftWorkplans."Global Dimension 2 Code";
                            GLBudgetEntry."Shortcut Dimension 3 Code" := BudgetLines."Shortcut Dimension 3 Code";
                            GLBudgetEntry."Shortcut Dimension 4 Code" := BudgetLines."Shortcut Dimension 4 Code";
                            // GLBudgetEntry."Shortcut Dimension 5 Code" := BudgetLines."Shortcut Dimension 5 Code";
                            // GLBudgetEntry."Shortcut Dimension 6 Code" := BudgetLines."Shortcut Dimension 6 Code";
                            // GLBudgetEntry."Shortcut Dimension 7 Code" := BudgetLines."Shortcut Dimension 7 Code";
                            // GLBudgetEntry."Shortcut Dimension 8 Code" := BudgetLines."Shortcut Dimension 8 Code";
                            GLBudgetEntry."Dimension Set Id" := BudgetLines."Dimension Set Id";
                            // GLBudgetEntry."Source Document" := DraftWorkplans."No";
                            // Case DraftWorkplans."Planning Budget Type" of
                            //     DraftWorkplans."Planning Budget Type"::Supplementary:
                            //         GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::Allocation;
                            //     DraftWorkplans."Planning Budget Type"::"Supplementary 2":
                            //         GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::Supplimentary;
                            // End;
                            GLBudgetEntry.Insert();
                            BudgetLines."Q1 Budget Entry" := GlBudgetEntry."Entry No.";
                            Updated := true;
                        end;

                        if BudgetLines."Q2 Amount" <> 0 then begin
                            EntryNo += 1;
                            GLBudgetEntry.Reset();
                            GLBudgetEntry.SetRange("Budget Name", BudgetCode);
                            GLBudgetEntry.SetRange("Budget Type", GLBudgetEntry."Budget Type"::Approved);
                            GLBudgetEntry.SetRange("G/L Account No.", BudgetLines."Budget Item");
                            GLBudgetEntry.SetRange("Date", QuarterDates[2] [1]);
                            GLBudgetEntry.SetRange("Global Dimension 1 Code", DraftWorkplans."Global Dimension 1 Code");
                            GLBudgetEntry.SetRange("Global Dimension 2 Code", DraftWorkplans."Global Dimension 2 Code");
                            GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", BudgetLines."Shortcut Dimension 3 Code");
                            GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", BudgetLines."Shortcut Dimension 4 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", BudgetLines."Shortcut Dimension 5 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", BudgetLines."Shortcut Dimension 6 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", BudgetLines."Shortcut Dimension 7 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", BudgetLines."Shortcut Dimension 8 Code");
                            // GLBudgetEntry.SetFilter("Source Document", '<>%1', DraftWorkplans."No");
                            if GLBudgetEntry.FindSet() then begin
                                GLBudgetEntry.CalcSums("Amount");
                                GLBudgetEntry2.Init();
                                GLBudgetEntry2.TransferFields(GLBudgetEntry);
                                GLBudgetEntry2."Entry No." := EntryNo;
                                EntryNo += 1;
                                GLBudgetEntry2.Amount := -GLBudgetEntry.Amount;
                                GLBudgetEntry2.Insert();
                            end;
                            GLBudgetEntry.Init();
                            GLBudgetEntry."Entry No." := EntryNo;
                            GLBudgetEntry."Budget Name" := BudgetCode;
                            GLBudgetEntry."Budget Type" := GLBudgetEntry."Budget Type"::Approved;
                            GLBudgetEntry.Amount := BudgetLines."Q2 Amount";
                            GLBudgetEntry."G/L Account No." := BudgetLines."Budget Item";
                            GLBudgetEntry.Description := BudgetLines."Budget Item Description";
                            GLBudgetEntry.Date := QuarterDates[2] [1];
                            GLBudgetEntry."Global Dimension 1 Code" := DraftWorkplans."Global Dimension 1 Code";
                            GLBudgetEntry."Global Dimension 2 Code" := DraftWorkplans."Global Dimension 2 Code";
                            GLBudgetEntry."Shortcut Dimension 3 Code" := BudgetLines."Shortcut Dimension 3 Code";
                            GLBudgetEntry."Shortcut Dimension 4 Code" := BudgetLines."Shortcut Dimension 4 Code";
                            // GLBudgetEntry."Shortcut Dimension 5 Code" := BudgetLines."Shortcut Dimension 5 Code";
                            // GLBudgetEntry."Shortcut Dimension 6 Code" := BudgetLines."Shortcut Dimension 6 Code";
                            // GLBudgetEntry."Shortcut Dimension 7 Code" := BudgetLines."Shortcut Dimension 7 Code";
                            // GLBudgetEntry."Shortcut Dimension 8 Code" := BudgetLines."Shortcut Dimension 8 Code";
                            GLBudgetEntry."Dimension Set Id" := BudgetLines."Dimension Set Id";
                            // GLBudgetEntry."Source Document" := DraftWorkplans."No";
                            // Case DraftWorkplans."Planning Budget Type" of
                            //     DraftWorkplans."Planning Budget Type"::Supplementary:
                            //         GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::Allocation;
                            //     DraftWorkplans."Planning Budget Type"::"Supplementary 2":
                            //         GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::Supplimentary;
                            // End;
                            GLBudgetEntry.Insert();
                            BudgetLines."Q2 Budget Entry" := GlBudgetEntry."Entry No.";
                            Updated := true;
                        end;

                        if BudgetLines."Q3 Amount" <> 0 then begin
                            EntryNo += 1;
                            GLBudgetEntry.Reset();
                            GLBudgetEntry.SetRange("Budget Name", BudgetCode);
                            GLBudgetEntry.SetRange("Budget Type", GLBudgetEntry."Budget Type"::Approved);
                            GLBudgetEntry.SetRange("G/L Account No.", BudgetLines."Budget Item");
                            GLBudgetEntry.SetRange("Date", QuarterDates[3] [1]);
                            GLBudgetEntry.SetRange("Global Dimension 1 Code", DraftWorkplans."Global Dimension 1 Code");
                            GLBudgetEntry.SetRange("Global Dimension 2 Code", DraftWorkplans."Global Dimension 2 Code");
                            GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", BudgetLines."Shortcut Dimension 3 Code");
                            GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", BudgetLines."Shortcut Dimension 4 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", BudgetLines."Shortcut Dimension 5 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", BudgetLines."Shortcut Dimension 6 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", BudgetLines."Shortcut Dimension 7 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", BudgetLines."Shortcut Dimension 8 Code");
                            // GLBudgetEntry.SetFilter("Source Document", '<>%1', DraftWorkplans."No");
                            if GLBudgetEntry.FindSet() then begin
                                GLBudgetEntry.CalcSums("Amount");
                                GLBudgetEntry2.Init();
                                GLBudgetEntry2.TransferFields(GLBudgetEntry);
                                GLBudgetEntry2."Entry No." := EntryNo;
                                EntryNo += 1;
                                GLBudgetEntry2.Amount := -GLBudgetEntry.Amount;
                                GLBudgetEntry2.Insert();
                            end;
                            GLBudgetEntry.Init();
                            GLBudgetEntry."Entry No." := EntryNo;
                            GLBudgetEntry."Budget Name" := BudgetCode;
                            GLBudgetEntry."Budget Type" := GLBudgetEntry."Budget Type"::Approved;
                            GLBudgetEntry.Amount := BudgetLines."Q3 Amount";
                            GLBudgetEntry."G/L Account No." := BudgetLines."Budget Item";
                            GLBudgetEntry.Description := BudgetLines."Budget Item Description";
                            GLBudgetEntry.Date := QuarterDates[3] [1];
                            GLBudgetEntry."Global Dimension 1 Code" := DraftWorkplans."Global Dimension 1 Code";
                            GLBudgetEntry."Global Dimension 2 Code" := DraftWorkplans."Global Dimension 2 Code";
                            GLBudgetEntry."Shortcut Dimension 3 Code" := BudgetLines."Shortcut Dimension 3 Code";
                            GLBudgetEntry."Shortcut Dimension 4 Code" := BudgetLines."Shortcut Dimension 4 Code";
                            // GLBudgetEntry."Shortcut Dimension 5 Code" := BudgetLines."Shortcut Dimension 5 Code";
                            // GLBudgetEntry."Shortcut Dimension 6 Code" := BudgetLines."Shortcut Dimension 6 Code";
                            // GLBudgetEntry."Shortcut Dimension 7 Code" := BudgetLines."Shortcut Dimension 7 Code";
                            // GLBudgetEntry."Shortcut Dimension 8 Code" := BudgetLines."Shortcut Dimension 8 Code";
                            GLBudgetEntry."Dimension Set Id" := BudgetLines."Dimension Set Id";
                            // GLBudgetEntry."Source Document" := DraftWorkplans."No";
                            // Case DraftWorkplans."Planning Budget Type" of
                            //     DraftWorkplans."Planning Budget Type"::Supplementary:
                            //         GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::Allocation;
                            //     DraftWorkplans."Planning Budget Type"::"Supplementary 2":
                            //         GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::Supplimentary;
                            // End;
                            GLBudgetEntry.Insert();
                            BudgetLines."Q3 Budget Entry" := GlBudgetEntry."Entry No.";
                            Updated := true;
                        end;

                        if BudgetLines."Q4 Amount" <> 0 then begin
                            EntryNo += 1;
                            GLBudgetEntry.Reset();
                            GLBudgetEntry.SetRange("Budget Name", BudgetCode);
                            GLBudgetEntry.SetRange("Budget Type", GLBudgetEntry."Budget Type"::Approved);
                            GLBudgetEntry.SetRange("G/L Account No.", BudgetLines."Budget Item");
                            GLBudgetEntry.SetRange("Date", QuarterDates[4] [1]);
                            GLBudgetEntry.SetRange("Global Dimension 1 Code", DraftWorkplans."Global Dimension 1 Code");
                            GLBudgetEntry.SetRange("Global Dimension 2 Code", DraftWorkplans."Global Dimension 2 Code");
                            GLBudgetEntry.SetRange("Shortcut Dimension 3 Code", BudgetLines."Shortcut Dimension 3 Code");
                            GLBudgetEntry.SetRange("Shortcut Dimension 4 Code", BudgetLines."Shortcut Dimension 4 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 5 Code", BudgetLines."Shortcut Dimension 5 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 6 Code", BudgetLines."Shortcut Dimension 6 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 7 Code", BudgetLines."Shortcut Dimension 7 Code");
                            // GLBudgetEntry.SetRange("Shortcut Dimension 8 Code", BudgetLines."Shortcut Dimension 8 Code");
                            // GLBudgetEntry.SetFilter("Source Document", '<>%1', DraftWorkplans."No");
                            if GLBudgetEntry.FindSet() then begin
                                GLBudgetEntry.CalcSums("Amount");
                                GLBudgetEntry2.Init();
                                GLBudgetEntry2.TransferFields(GLBudgetEntry);
                                GLBudgetEntry2."Entry No." := EntryNo;
                                EntryNo += 1;
                                GLBudgetEntry2.Amount := -GLBudgetEntry.Amount;
                                GLBudgetEntry2.Insert();
                            end;
                            GLBudgetEntry.Init();
                            GLBudgetEntry."Entry No." := EntryNo;
                            GLBudgetEntry."Budget Name" := BudgetCode;
                            GLBudgetEntry."Budget Type" := GLBudgetEntry."Budget Type"::Approved;
                            GLBudgetEntry.Amount := BudgetLines."Q4 Amount";
                            GLBudgetEntry."G/L Account No." := BudgetLines."Budget Item";
                            GLBudgetEntry.Description := BudgetLines."Budget Item Description";
                            GLBudgetEntry.Date := QuarterDates[4] [1];
                            GLBudgetEntry."Global Dimension 1 Code" := DraftWorkplans."Global Dimension 1 Code";
                            GLBudgetEntry."Global Dimension 2 Code" := DraftWorkplans."Global Dimension 2 Code";
                            GLBudgetEntry."Shortcut Dimension 3 Code" := BudgetLines."Shortcut Dimension 3 Code";
                            GLBudgetEntry."Shortcut Dimension 4 Code" := BudgetLines."Shortcut Dimension 4 Code";
                            // GLBudgetEntry."Shortcut Dimension 5 Code" := BudgetLines."Shortcut Dimension 5 Code";
                            // GLBudgetEntry."Shortcut Dimension 6 Code" := BudgetLines."Shortcut Dimension 6 Code";
                            // GLBudgetEntry."Shortcut Dimension 7 Code" := BudgetLines."Shortcut Dimension 7 Code";
                            // GLBudgetEntry."Shortcut Dimension 8 Code" := BudgetLines."Shortcut Dimension 8 Code";
                            GLBudgetEntry."Dimension Set Id" := BudgetLines."Dimension Set Id";
                            // GLBudgetEntry."Source Document" := DraftWorkplans."No";
                            // Case DraftWorkplans."Planning Budget Type" of
                            //     DraftWorkplans."Planning Budget Type"::Supplementary:
                            //         GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::Allocation;
                            //     DraftWorkplans."Planning Budget Type"::"Supplementary 2":
                            //         GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::Supplimentary;
                            // End;
                            GLBudgetEntry.Insert();
                            BudgetLines."Q4 Budget Entry" := GlBudgetEntry."Entry No.";
                            Updated := true;
                        end;
                        if Updated then begin
                            BudgetLines."G/L Updated" := true;
                            BudgetLines.Modify();
                        end;

                    until BudgetLines.Next() = 0;



                end;

                BudgetLines.Reset();
                BudgetLines.SetRange("Strategy Plan ID", DraftWorkplans.No);
                BudgetLines.SetRange("G/L Updated", false);
                BudgetLines.SetFilter("Total Amount", '>%1', 0);
                if Budgetlines.IsEmpty() then begin
                    if BudgetLinesExists then begin
                        DraftWorkplans."Budget Posted to G/L" := true;
                        DraftWorkplans.Posted := true;
                        DraftWorkplans.Modify();
                        DraftWorkplans2.reset;
                        DraftWorkplans2.Setrange("Year Reporting Code", DraftWorkplans."Year Reporting Code");
                        DraftWorkplans2.Setrange("Global Dimension 2 Code", DraftWorkplans."Global Dimension 2 Code");
                        DraftWorkplans2.SetFilter(No, '<>%1', DraftWorkplans.No);
                        if DraftWorkplans2.FindSet() then
                            DraftWorkplans2.ModifyAll(Archived, true);
                        DraftWorkPlandPosted := true;
                    end;
                end;
            until DraftWorkplans.Next() = 0;
        end;

        DraftWorkplans.reset;
        //DraftWorkplans.Setrange("Planning Budget Type", DraftWorkplans."Planning Budget Type"::Supplementary);
        DraftWorkplans.SetRange("Annual Workplan", DraftWorkplanConsolidation.Code);
        DraftWorkplans.SetRange(Consolidated, true);
        DraftWorkplans.SetRange("Under Review", false);
        DraftWorkplans.SetRange("Budget Posted to G/L", false);
        if DraftWorkplans.IsEmpty() then begin
            if DraftWorkPlandPosted then begin
                DraftWorkplanConsolidation.Posted := true;
                DraftWorkplanConsolidation."Posted By" := UserId;
                DraftWorkplanConsolidation."Posted On" := CurrentDateTime;
                DraftWorkplanConsolidation.Modify();
            end;
        end;
    end;

    procedure GetQuarterDates(ReportingYearCode: Code[20]; CSPCode: Code[20]; Var Dates: array[4, 2] of Date) BudgetCode: Code[50]
    var
        CSPYears: Record "CSP Planned Years";
    begin
        if CSPYears.Get(CSPCode, ReportingYearCode) then begin
            CSPYears.TestField("Start Date");
            CSPYears.TestField("End Date");
            CSPYears.Testfield("Budget Code");
            BudgetCode := CSPYears."Budget Code";
            Dates[1] [1] := CSPYears."Start Date";
            Dates[1] [2] := CalcDate('1Q-1D', CSPYears."Start Date");

            Dates[2] [1] := CalcDate('1Q', CSPYears."Start Date");
            Dates[2] [2] := CalcDate('2Q-1D', CSPYears."Start Date");

            Dates[3] [1] := CalcDate('2Q', CSPYears."Start Date");
            Dates[3] [2] := CalcDate('3Q-1D', CSPYears."Start Date");

            Dates[4] [1] := CalcDate('3Q', CSPYears."Start Date");
            Dates[4] [2] := CalcDate('4Q-1D', CSPYears."Start Date");
        end
        else
            Error('There is no reporting period %1 for corporate strategy %2', ReportingYearCode, CSPCode)
    end;

    procedure GetBudgetAmount(var QuarterAmount: array[5] of Decimal; NoFilter: Text)
    var
        WorkplanBudgetLine: Record "Workplan Budget Line";
    begin
        clear(QuarterAmount);
        WorkplanBudgetLine.Reset;
        WorkplanBudgetLine.SetFilter("Strategy Plan ID", NoFilter);
        if WorkplanBudgetLine.Findset() then begin
            WorkplanBudgetLine.Calcsums("Q1 Amount", "Q2 Amount", "Q3 Amount", "Q4 Amount", "Total Amount");
            QuarterAmount[1] := WorkplanBudgetLine."Q1 Amount";
            QuarterAmount[2] := WorkplanBudgetLine."Q2 Amount";
            QuarterAmount[3] := WorkplanBudgetLine."Q3 Amount";
            QuarterAmount[4] := WorkplanBudgetLine."Q4 Amount";
            QuarterAmount[5] := WorkplanBudgetLine."Total Amount";
        end;
    end;

    procedure GetCeilingAmounts(NoFilter: Text) CeilingAmount: Decimal
    var
        AnnualWorkplan: Record "Annual Strategy Workplan";
    begin
        AnnualWorkplan.Reset;
        AnnualWorkplan.SetFilter(No, NoFilter);
        if AnnualWorkplan.FindSet() then begin
            AnnualWorkplan.CalcSums("Ceiling Amount");
            CeilingAmount := AnnualWorkplan."Ceiling Amount";
        end;
    end;

    procedure GetBudgetDates(BudgetCode: Code[20]; Frequency: option Monthly,Quarterly,SemiAnnually,Annually; var BudgetDates: array[12, 2] of Date)
    var
        GLBudgets: Record "G/L Budget Name";
        I: Integer;
        DFormula: Text;
        SDate: Date;
    begin
        case
            Frequency of
            Frequency::Monthly:
                DFormula := '1M';
            Frequency::Quarterly:
                DFormula := '1Q';
            Frequency::SemiAnnually:
                DFormula := '6M';
            Frequency::Annually:
                DFormula := '1Y';
        end;
        if GLBudgets.Get(BudgetCode) then begin
            GLBudgets.Testfield("Start Date");
            GLBudgets.Testfield("End Date");
            SDate := GLBudgets."Start Date";
            while SDate <= GLBudgets."End Date" do begin
                I += 1;
                BudgetDates[I] [1] := SDate;
                BudgetDates[I] [2] := CalcDate(DFormula, SDate) - 1;
                SDate := CalcDate(DFormula, SDate);
            end;
        end;
    end;

    Procedure GetCurrentCorporateStrategy(): Code[20]
    var
        CSP: Record "Corporate Strategic Plans";
    begin
        CSP.Reset();
        CSP.SetRange("Implementation Status", CSP."Implementation Status"::Ongoing);
        if CSP.FindFirst() then
            exit(CSP.Code)
        else
            Error('There is no corporate strategy currently under implementation.');

    end;

    procedure GetCurrentStrategyImplementationYear(CorporateStrategyCode: Code[20]): Code[20]
    var
        CSPYears: Record "CSP Planned Years";
    begin
        CSPYears.Reset();
        CSPYears.SetRange(Current, true);
        CSPYears.SetRange("CSP Code", CorporateStrategyCode);
        if CSPYears.FindFirst() then
            exit(CSPYears."Annual Year Code")
        else
            Error('There is no current reporting year code defined for corporate strategy %1', CorporateStrategyCode);
    end;

    procedure CheckExistingAIE(CSP: Code[20]; ReportingYear: Code[20]; WorkPlanCode: Code[20]; Quarter: Integer): Boolean
    var
        AIE: Record AIE;
    begin
        AIE.Reset();
        AIE.Setrange("Corporate Strategy", CSP);
        AIE.SetRange("Reporting Year Code", ReportingYear);
        AIE.SetRange("Workplan Code", WorkPlanCode);
        AIE.Setrange(Quarter, Quarter);
        if AIE.FindFirst() then
            exit(true)
        else
            exit(false);
    end;

    procedure SuggestAIELines(var AIE: Record "Auth. Inc. Expend. Header")
    var
        AuthIncExp: Record "Auth. Inc. Expend. Header";
        WorkPlanBudgetLinesQ: Query "Workplan Budget Lines";
        AuthIncDict: Dictionary of [Code[20], Code[20]];
        LineNoDict: Dictionary of [Code[20], Integer];
        LineNo: Integer;
        HeaderNo: Code[20];
        AuthExpLines: Record "Auth. Inc Expend. Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SPMSetUp: Record "SPM General Setup";
        DimensionCodes: array[8] of Code[20];
        BudgetDates: array[12, 2] of Date;
        BudgetMgt: Codeunit "Budget Management";
        TentativeAmt: Decimal;
        QBalance: Decimal;
        AdjustedBalance: Decimal;
        BCHeader: Record "Budget Control Header";
        BCLines: Record "Budget Control Lines";
        Controled: Boolean;
        GLAccount: Record "G/L Account";
    begin
        if AIE.Posted then
            exit;
        AIE.Validate(Quarter);
        if not CheckExistingAIE(AIE."Corporate Strategy", AIE."Reporting Period", AIE.Workplan, AIE.Quarter) then begin
            AIE.TestField("Corporate Strategy");
            AIE.TestField("Reporting Period");
            AIE.TestField("Budget Code");
            AIE.TestField(Workplan);

            GetBudgetDates(AIE."Budget Code", 1, BudgetDates);
            clear(WorkPlanBudgetLinesQ);
            WorkPlanBudgetLinesQ.SetRange(WorkPlanBudgetLinesQ.CorporateStrategy, AIE."Corporate Strategy");
            WorkPlanBudgetLinesQ.SetRange(WorkPlanBudgetLinesQ.ReportingYearCode, AIE."Reporting Period");
            WorkPlanBudgetLinesQ.SetRange(WorkPlanBudgetLinesQ.StrategyPlanID, AIE.Workplan);
            //WorkPlanBudgetLinesQ.SetFilter(WorkPlanBudgetLinesQ.Planning_Budget_Type,'=%1|%2', WorkPlanBudgetLinesQ.Planning_Budget_Type::Supplementary,WorkPlanBudgetLinesQ.Planning_Budget_Type::"Supplementary 2");
            case
                AIE.Quarter of
                AIE.Quarter::"Quarter 1":
                    begin
                        WorkPlanBudgetLinesQ.SetFilter(WorkPlanBudgetLinesQ.Q1Amount, '>%1', 0);
                    end;
                AIE.Quarter::"Quarter 2":
                    begin
                        WorkPlanBudgetLinesQ.SetFilter(WorkPlanBudgetLinesQ.Q2Amount, '>%1', 0);
                    end;
                AIE.Quarter::"Quarter 3":
                    begin
                        WorkPlanBudgetLinesQ.SetFilter(WorkPlanBudgetLinesQ.Q3Amount, '>%1', 0);
                    end;
                AIE.Quarter::"Quarter 4":
                    begin
                        WorkPlanBudgetLinesQ.SetFilter(WorkPlanBudgetLinesQ.Q4Amount, '>%1', 0);
                    end;
            end;
            ///////
            BCHeader.Reset();
            BCHeader.SetRange(Budget, AIE."Budget Code");
            BCHeader.SetRange("Corporate Strategy", AIE."Corporate Strategy");
            BCHeader.SetRange("Financial Year", AIE."Reporting Period");
            BCHeader.SetRange(Quarter, AIE.Quarter);
            if BCHeader.FindFirst() then
                Controled := true
            else
                Controled := false;

            WorkPlanBudgetLinesQ.Open();
            while WorkPlanBudgetLinesQ.Read() do begin
                //Generate Auth to Exp Headers
                HeaderNo := AIE."No.";
                LineNo += 10000;
                AuthExpLines.Init();
                AuthExpLines."Document No." := HeaderNo;
                AuthExpLines."Line No." := LineNo;
                AuthExpLines."Batch No." := AIE."Consolidation Template";
                AuthExpLines."G/L Account" := WorkPlanBudgetLinesQ.BudgetItem;
                AuthExpLines."G/L Account Name" := WorkPlanBudgetLinesQ.BudgetItemDescription;
                AuthExpLines."Dimension Set Id" := WorkPlanBudgetLinesQ.DimensionSetId;
                AuthExpLines."Global Dimension 1 Code" := WorkPlanBudgetLinesQ.GlobalDimension1Code;
                AuthExpLines."Global Dimension 2 Code" := WorkPlanBudgetLinesQ.GlobalDimension2Code;
                AuthExpLines."Shortcut Dimension 3 Code" := WorkPlanBudgetLinesQ.ShortcutDimension3Code;
                AuthExpLines."Shortcut Dimension 4 Code" := WorkPlanBudgetLinesQ.ShortcutDimension4Code;
                AuthExpLines."Shortcut Dimension 5 Code" := WorkPlanBudgetLinesQ.ShortcutDimension5Code;
                AuthExpLines."Shortcut Dimension 6 Code" := WorkPlanBudgetLinesQ.ShortcutDimension6Code;
                AuthExpLines."Shortcut Dimension 7 Code" := WorkPlanBudgetLinesQ.ShortcutDimension7Code;
                AuthExpLines."Shortcut Dimension 8 Code" := WorkPlanBudgetLinesQ.ShortcutDimension8Code;
                DimensionCodes[1] := WorkPlanBudgetLinesQ.GlobalDimension1Code;
                DimensionCodes[2] := WorkPlanBudgetLinesQ.GlobalDimension2Code;
                DimensionCodes[3] := WorkPlanBudgetLinesQ.ShortcutDimension3Code;
                DimensionCodes[4] := WorkPlanBudgetLinesQ.ShortcutDimension4Code;
                DimensionCodes[5] := WorkPlanBudgetLinesQ.ShortcutDimension5Code;
                DimensionCodes[6] := WorkPlanBudgetLinesQ.ShortcutDimension6Code;
                DimensionCodes[7] := WorkPlanBudgetLinesQ.ShortcutDimension7Code;
                DimensionCodes[8] := WorkPlanBudgetLinesQ.ShortcutDimension8Code;
                case
                    AIE.Quarter of
                    AIE.Quarter::"Quarter 1":
                        begin
                            AuthExpLines."Planned Amount" := WorkPlanBudgetLinesQ.Q1Amount;

                            if Controled then begin
                                BCLines.Reset();
                                BCLines.SetRange("Header No", BCHeader.No);
                                BCLines.SetRange("Line No", GLAccount.GetGrouping(AuthExpLines."G/L Account"));
                                if BCLines.FindFirst() then
                                    TentativeAmt := (BudgetMgt.GetBudgetBalance2(AIE."Budget Code", AuthExpLines."G/L Account", DimensionCodes, BudgetDates[1] [1], BudgetDates[4] [2])) * (BCLines."Quarter Access Percent" / 100) * (1 - BCLines."Cut Percentage" / 100);
                            end;
                            Qbalance := BudgetMgt.GetBudgetBalance2(AIE."Budget Code", AuthExpLines."G/L Account", DimensionCodes, BudgetDates[1] [1], BudgetDates[1] [2]);
                            if Controled then begin
                                if TentativeAmt > Qbalance then
                                    AdjustedBalance := Qbalance
                                else
                                    AdjustedBalance := TentativeAmt;
                            end
                            else
                                AdjustedBalance := Qbalance;
                            AuthExpLines."Amount to Authorize" := AdjustedBalance;
                        end;
                    AIE.Quarter::"Quarter 2":
                        begin
                            AuthExpLines."Planned Amount" := WorkPlanBudgetLinesQ.Q2Amount;
                            AuthExpLines."Amount to Authorize" := BudgetMgt.GetBudgetBalance2(AIE."Budget Code", AuthExpLines."G/L Account", DimensionCodes, BudgetDates[2] [1], BudgetDates[2] [2]);
                        end;
                    AIE.Quarter::"Quarter 3":
                        begin
                            AuthExpLines."Planned Amount" := WorkPlanBudgetLinesQ.Q3Amount;
                            AuthExpLines."Amount to Authorize" := BudgetMgt.GetBudgetBalance2(AIE."Budget Code", AuthExpLines."G/L Account", DimensionCodes, BudgetDates[3] [1], BudgetDates[3] [2]);
                        end;
                    AIE.Quarter::"Quarter 4":
                        begin
                            AuthExpLines."Planned Amount" := WorkPlanBudgetLinesQ.Q4Amount;
                            AuthExpLines."Amount to Authorize" := BudgetMgt.GetBudgetBalance2(AIE."Budget Code", AuthExpLines."G/L Account", DimensionCodes, BudgetDates[4] [1], BudgetDates[4] [2]);
                        end;
                end;
                AuthExpLines."Utilized Amounts" := AuthExpLines."Planned Amount" - AuthExpLines."Amount to Authorize";
                if AuthExpLines."Utilized Amounts" < 0 then
                    AuthExpLines."Utilized Amounts" := 0;
                AuthExpLines.Insert();
            end;
            WorkPlanBudgetLinesQ.Close()
        end;
    end;

    procedure SuggestBatchAIE(var BatchAIE: Record "Batch. Auth to Incur Expend")
    var
        AuthIncExp: Record "Auth. Inc. Expend. Header";
        WorkPlanBudgetLinesQ: Query "Workplan Budget Lines";
        AuthIncDict: Dictionary of [Code[20], Code[20]];
        LineNoDict: Dictionary of [Code[20], Integer];
        LineNo: Integer;
        HeaderNo: Code[20];
        AuthExpLines: Record "Auth. Inc Expend. Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SPMSetUp: Record "SPM General Setup";
        DimensionCodes: array[8] of Code[20];
        BudgetDates: array[12, 2] of Date;
        BudgetMgt: Codeunit "Budget Management";
        BankAcc: Record "Bank Account";
    begin
        if BatchAIE.Posted then
            exit;

        SPMSetUp.Get();
        SPMSetUp.TestField("AIE Nos");

        BatchAIE.TestField("Corporate Strategy");
        BatchAIE.TestField("Reporting Period");
        BatchAIE.TestField("Budget Code");
        BatchAIE.TestField("Posting Date");

        GetBudgetDates(BatchAIE."Budget Code", 1, BudgetDates);
        //Loop through Query (//Get Workplan and check in the AIE) 
        clear(WorkPlanBudgetLinesQ);
        WorkPlanBudgetLinesQ.SetRange(WorkPlanBudgetLinesQ.CorporateStrategy, BatchAIE."Corporate Strategy");
        WorkPlanBudgetLinesQ.SetRange(WorkPlanBudgetLinesQ.ReportingYearCode, BatchAIE."Reporting Period");
        WorkPlanBudgetLinesQ.SetFilter(WorkPlanBudgetLinesQ.Planning_Budget_Type, '%1|%2', WorkPlanBudgetLinesQ.Planning_Budget_Type::Supplementary, WorkPlanBudgetLinesQ.Planning_Budget_Type::"Supplementary 2");
        case
            BatchAIE.Quarter of
            BatchAIE.Quarter::"Quarter 1":
                begin
                    WorkPlanBudgetLinesQ.SetFilter(WorkPlanBudgetLinesQ.Q1Amount, '>%1', 0);
                end;
            BatchAIE.Quarter::"Quarter 2":
                begin
                    WorkPlanBudgetLinesQ.SetFilter(WorkPlanBudgetLinesQ.Q2Amount, '>%1', 0);
                end;
            BatchAIE.Quarter::"Quarter 3":
                begin
                    WorkPlanBudgetLinesQ.SetFilter(WorkPlanBudgetLinesQ.Q3Amount, '>%1', 0);
                end;
            BatchAIE.Quarter::"Quarter 4":
                begin
                    WorkPlanBudgetLinesQ.SetFilter(WorkPlanBudgetLinesQ.Q4Amount, '>%1', 0);
                end;
        end;
        WorkPlanBudgetLinesQ.Open();
        while WorkPlanBudgetLinesQ.Read() do begin
            //Check if there is an AIE Already
            if not CheckExistingAIE(BatchAIE."Corporate Strategy", BatchAIE."Reporting Period", WorkPlanBudgetLinesQ.StrategyPlanID, BatchAIE.Quarter) then begin
                //Generate Auth to Exp Headers
                if not AuthIncDict.ContainsKey(WorkPlanBudgetLinesQ.StrategyPlanID) then begin
                    AuthIncExp.Reset();
                    AuthIncExp.SetRange("Batch No.", BatchAIE."No.");
                    AuthIncExp.SetRange(Workplan, WorkPlanBudgetLinesQ.StrategyPlanID);
                    if AuthIncExp.FindFirst() then begin
                        AuthIncExp.ClearLines();
                        AuthIncDict.Add(WorkPlanBudgetLinesQ.StrategyPlanID, AuthIncExp."No.");
                        HeaderNo := AuthIncExp."No.";
                    end else begin
                        AuthIncExp.Init();
                        AuthIncExp.Type := AuthIncExp.Type::Default;
                        AuthIncExp."Batch No." := BatchAIE."No.";
                        AuthIncExp."Posting Date" := BatchAIE."Posting Date";
                        AuthIncExp.Description := CopyStr(StrSubstNo('AIE For %1 %2 %3 %4 %5 %6 %7 %8', BatchAIE."Budget Code", BatchAIE.Quarter, AuthIncExp.FieldCaption("Global Dimension 1 Code"), WorkPlanBudgetLinesQ.GlobalDimension1Code, AuthIncExp."Global Dimension 2 Code", WorkPlanBudgetLinesQ.GlobalDimension2Code), 1, MaxStrLen(AuthIncExp.Description));
                        AuthIncExp."Corporate Strategy" := BatchAIE."Corporate Strategy";
                        AuthIncExp."Reporting Period" := BatchAIE."Reporting Period";
                        AuthIncExp."Budget Code" := BatchAIE."Budget Code";
                        AuthIncExp.Quarter := BatchAIE.Quarter;
                        AuthIncExp.Validate(Quarter);
                        AuthIncExp.Workplan := WorkPlanBudgetLinesQ.StrategyPlanID;
                        AuthIncExp."Global Dimension 1 Code" := WorkPlanBudgetLinesQ.GlobalDimension1Code;
                        AuthIncExp."Global Dimension 2 Code" := WorkPlanBudgetLinesQ.GlobalDimension2Code;
                        AuthIncExp."No." := NoSeriesMgt.GetNextNo(SPMSetUp."AIE Nos", Today, true);
                        AuthIncExp."Bank Account" := BankAcc.GetBankCode(BankAcc.Type::Recurrent, AuthIncExp."Global Dimension 1 Code", AuthIncExp."Global Dimension 2 Code");
                        AuthIncExp.Insert(true);
                        AuthIncDict.Add(WorkPlanBudgetLinesQ.StrategyPlanID, AuthIncExp."No.");
                        HeaderNo := AuthIncExp."No.";
                    end;
                end
                else begin
                    AuthIncDict.Get(WorkPlanBudgetLinesQ.StrategyPlanID, HeaderNo);
                    LineNoDict.Get(HeaderNo, LineNo);
                end;
                LineNo += 10000;
                if LineNoDict.ContainsKey(HeaderNo) then
                    LineNoDict.Set(HeaderNo, LineNo)
                else
                    LineNoDict.Add(HeaderNo, LineNo);
                AuthExpLines.Init();
                AuthExpLines."Document No." := HeaderNo;
                AuthExpLines."Line No." := LineNo;
                AuthExpLines."G/L Account" := WorkPlanBudgetLinesQ.BudgetItem;
                AuthExpLines."G/L Account Name" := WorkPlanBudgetLinesQ.BudgetItemDescription;
                AuthExpLines."Dimension Set Id" := WorkPlanBudgetLinesQ.DimensionSetId;
                AuthExpLines."Global Dimension 1 Code" := WorkPlanBudgetLinesQ.GlobalDimension1Code;
                AuthExpLines."Global Dimension 2 Code" := WorkPlanBudgetLinesQ.GlobalDimension2Code;
                AuthExpLines."Shortcut Dimension 3 Code" := WorkPlanBudgetLinesQ.ShortcutDimension3Code;
                AuthExpLines."Shortcut Dimension 4 Code" := WorkPlanBudgetLinesQ.ShortcutDimension4Code;
                AuthExpLines."Shortcut Dimension 5 Code" := WorkPlanBudgetLinesQ.ShortcutDimension5Code;
                AuthExpLines."Shortcut Dimension 6 Code" := WorkPlanBudgetLinesQ.ShortcutDimension6Code;
                AuthExpLines."Shortcut Dimension 7 Code" := WorkPlanBudgetLinesQ.ShortcutDimension7Code;
                AuthExpLines."Shortcut Dimension 8 Code" := WorkPlanBudgetLinesQ.ShortcutDimension8Code;
                AuthExpLines."Batch No." := BatchAIE."No.";
                DimensionCodes[1] := WorkPlanBudgetLinesQ.GlobalDimension1Code;
                DimensionCodes[2] := WorkPlanBudgetLinesQ.GlobalDimension2Code;
                DimensionCodes[3] := WorkPlanBudgetLinesQ.ShortcutDimension3Code;
                DimensionCodes[4] := WorkPlanBudgetLinesQ.ShortcutDimension4Code;
                DimensionCodes[5] := WorkPlanBudgetLinesQ.ShortcutDimension5Code;
                DimensionCodes[6] := WorkPlanBudgetLinesQ.ShortcutDimension6Code;
                DimensionCodes[7] := WorkPlanBudgetLinesQ.ShortcutDimension7Code;
                DimensionCodes[8] := WorkPlanBudgetLinesQ.ShortcutDimension8Code;
                case
                    BatchAIE.Quarter of
                    BatchAIE.Quarter::"Quarter 1":
                        begin
                            AuthExpLines."Planned Amount" := WorkPlanBudgetLinesQ.Q1Amount;
                            AuthExpLines."Amount to Authorize" := BudgetMgt.GetBudgetBalance2(BatchAIE."Budget Code", AuthExpLines."G/L Account", DimensionCodes, BudgetDates[1] [1], BudgetDates[1] [2]);
                        end;
                    BatchAIE.Quarter::"Quarter 2":
                        begin
                            AuthExpLines."Planned Amount" := WorkPlanBudgetLinesQ.Q2Amount;
                            AuthExpLines."Amount to Authorize" := BudgetMgt.GetBudgetBalance2(BatchAIE."Budget Code", AuthExpLines."G/L Account", DimensionCodes, BudgetDates[2] [1], BudgetDates[2] [2]);
                        end;
                    BatchAIE.Quarter::"Quarter 3":
                        begin
                            AuthExpLines."Planned Amount" := WorkPlanBudgetLinesQ.Q3Amount;
                            AuthExpLines."Amount to Authorize" := BudgetMgt.GetBudgetBalance2(BatchAIE."Budget Code", AuthExpLines."G/L Account", DimensionCodes, BudgetDates[3] [1], BudgetDates[3] [2]);
                        end;
                    BatchAIE.Quarter::"Quarter 4":
                        begin
                            AuthExpLines."Planned Amount" := WorkPlanBudgetLinesQ.Q4Amount;
                            AuthExpLines."Amount to Authorize" := BudgetMgt.GetBudgetBalance2(BatchAIE."Budget Code", AuthExpLines."G/L Account", DimensionCodes, BudgetDates[4] [1], BudgetDates[4] [2]);
                        end;
                end;
                AuthExpLines."Utilized Amounts" := AuthExpLines."Planned Amount" - AuthExpLines."Amount to Authorize";
                if AuthExpLines."Utilized Amounts" < 0 then
                    AuthExpLines."Utilized Amounts" := 0;
                AuthExpLines.Insert();
            end;
        end;
        WorkPlanBudgetLinesQ.Close()
    end;

    procedure PostAIE(var AuthToIncurExp: Record "Auth. Inc. Expend. Header")
    var
        AIE: Record AIE;
        BudgetMgt: Codeunit "Budget Management";
        GenJnlLine: Record "Gen. Journal Line";
        SPMSetUp: Record "SPM General Setup";
        Dates: array[12, 2] of Date;
        BatchNo: Code[10];
    begin
        if AuthToIncurExp.Posted then
            exit;

        if AuthToIncurExp."Batch No." = '' then begin
            //Clear Journal Lines
            SPMSetUp.Get();
            SPMSetUp.TestField("AIE Journal Template");
            if StrLen(AuthToIncurExp."No.") > 10 then
                BatchNo := CopyStr(AuthToIncurExp."No.", StrLen(AuthToIncurExp."No.") - 9, 10)
            else
                BatchNo := AuthToIncurExp."No.";
            GenJnlLine.ClearGenJnlLines(SPMSetUp."AIE Journal Template", BatchNo);
        end;

        AuthToIncurExp.CalcFields("Amount to Authorize");
        AIE.Init();
        AIE."Corporate Strategy" := AuthToIncurExp."Corporate Strategy";
        AIE."Reporting Year Code" := AuthToIncurExp."Reporting Period";
        AIE."Workplan Code" := AuthToIncurExp.Workplan;
        AIE."Budget Code" := AuthToIncurExp."Budget Code";
        AIE.Quarter := AuthToIncurExp.Quarter;
        AIE."Global Dimension 1 Code" := AuthToIncurExp."Global Dimension 1 Code";
        AIE."Global Dimension 2 Code" := AuthToIncurExp."Global Dimension 2 Code";
        AIE."AIE Amount" := AuthToIncurExp."Amount to Authorize";
        AIE."Source Document No." := AuthToIncurExp."No.";
        GetBudgetDates(AuthToIncurExp."Budget Code", 1, Dates);
        case
            AuthToIncurExp.Quarter of
            AuthToIncurExp.Quarter::"Quarter 1":
                begin
                    AIE."Start Date" := Dates[1] [1];
                    AIE."End Date" := Dates[1] [2];
                end;
            AuthToIncurExp.Quarter::"Quarter 2":
                begin
                    AIE."Start Date" := Dates[2] [1];
                    AIE."End Date" := Dates[2] [2];
                end;
            AuthToIncurExp.Quarter::"Quarter 3":
                begin
                    AIE."Start Date" := Dates[3] [1];
                    AIE."End Date" := Dates[3] [2];
                end;
            AuthToIncurExp.Quarter::"Quarter 4":
                begin
                    AIE."Start Date" := Dates[4] [1];
                    AIE."End Date" := Dates[4] [2];
                end;
        end;
        if AIE.Insert() then begin
            AuthToIncurExp.Validate(Posted, true);
            AuthToIncurExp.Modify();
            AIE."Date Issued" := Today;
            AIE."Issued By" := UserId;
            AIE.Modify();
        end;
        //Post InterBank Transfer
        // case
        //     AuthToIncurExp.Type of
        //     AuthToIncurExp.Type::Default: // Transfer from HQ to Department
        //         begin
        //             BudgetMgt.PostDefaultAIE(AuthToIncurExp);
        //         end;
        //     AuthToIncurExp.Type::Custom: // Post Transfer from Source to Destination
        //         begin
        //             BudgetMgt.PostCustomAIE(AuthToIncurExp);
        //         end;
        // end;

        // if AuthToIncurExp."Batch No." = '' then
        //     FinalizePosting(AuthToIncurExp);
    end;

    // procedure FinalizePosting(var AIE: Record "Auth. Inc. Expend. Header")
    // var
    //     GenJnlLine: Record "Gen. Journal Line";
    //     SPMSetUp: Record "SPM General Setup";
    //     BatchNo, TempNo : Code[10];
    // begin
    //     SPMSetUp.Get();
    //     SPMSetUp.TestField("AIE Journal Template");
    //     if StrLen(AIE."No.") > 10 then
    //         BatchNo := CopyStr(AIE."No.", StrLen(AIE."No.") - 9, 10)
    //     else
    //         BatchNo := AIE."No.";

    //     GenJnlLine.Reset();
    //     GenJnlLine.SetRange("Journal Template Name", SPMSetUp."AIE Journal Template");
    //     GenJnlLine.SetRange("Journal Batch Name", BatchNo);
    //     if GenJnlLine.FindSet() then
    //         Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);
    // end;

    // procedure FinalizePosting(var BatchAIE: Record "Batch. Auth to Incur Expend")
    // var
    //     GenJnlLine: Record "Gen. Journal Line";
    //     SPMSetUp: Record "SPM General Setup";
    //     BatchNo: Code[10];
    // begin
    //     SPMSetUp.Get();
    //     SPMSetUp.TestField("AIE Journal Template");
    //     GenJnlLine.Reset();
    //     if StrLen(BatchAIE."No.") > 10 then
    //         BatchNo := CopyStr(BatchAIE."No.", StrLen(BatchAIE."No.") - 9, 10)
    //     else
    //         BatchNo := BatchAIE."No.";
    //     GenJnlLine.SetRange("Journal Template Name", SPMSetUp."AIE Journal Template");
    //     GenJnlLine.SetRange("Journal Batch Name", BatchNo);
    //     if GenJnlLine.FindSet() then
    //         Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);
    // end;

    procedure PostBatchAIE(var BatchAIE: Record "Batch. Auth to Incur Expend")
    var
        AuthIncExp: Record "Auth. Inc. Expend. Header";
        GenJnlLine: Record "Gen. Journal Line";
        SPMSetUp: Record "SPM General Setup";
    begin
        if BatchAIE.Posted then
            exit;
        //Clear Lines
        SPMSetUp.Get();
        SPMSetUp.TestField("AIE Journal Template");
        GenJnlLine.ClearGenJnlLines(SPMSetUp."AIE Journal Template", CopyStr(BatchAIE."No.", StrLen(BatchAIE."No.") - 9, 10));

        AuthIncExp.Reset();
        AuthIncExp.SetRange("Batch No.", BatchAIE."No.");
        if AuthIncExp.FindSet() then begin
            Repeat
                PostAIE(AuthIncExp);
            Until AuthIncExp.Next() = 0;
        end;

        //Finalize Posting
        //FinalizePosting(BatchAIE);

        AuthIncExp.Reset();
        AuthIncExp.SetRange("Batch No.", BatchAIE."No.");
        AuthIncExp.SetRange(Posted, false);
        if AuthIncExp.IsEmpty() then begin
            BatchAIE.Validate(Posted, true);
            BatchAIE.Modify();
        end
    end;

    // procedure GenerateReAllocationAIE(var BudgetReAllocHeader: Record "Budget Reallocation Header"): Code[20]
    // var
    //     BudgetModificationLine: Record "Budget Modification Lines";
    //     BudgetReAllocationLine: Record "Budget Reallocation Line";
    //     AuthIncExpHeader: Record "Auth. Inc. Expend. Header";
    //     AuthIncExpLine: Record "Auth. Inc Expend. Line";
    //     AuthIncExpLineDict: Dictionary of [Text, Integer];
    //     LineNo, AllLineNos : Integer;
    //     AIENo: Code[20];
    //     SPMSetUp: Record "SPM General Setup";
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    //     BankAcc: Record "Bank Account";
    //     SRCBankCode, DestBankCode : Code[20];
    //     KeyTxt: Text;
    // begin
    //     if AuthIncExpHeader.Get(BudgetReAllocHeader."AIE No.") then begin
    //         AIENo := AuthIncExpHeader."No.";
    //         if AuthIncExpHeader.Posted then
    //             exit
    //         else
    //             AuthIncExpHeader.ClearLines();
    //     end
    //     else begin
    //         SPMSetUp.Get();
    //         SPMSetUp.TestField("AIE Nos");
    //         AuthIncExpHeader.Init();
    //         AuthIncExpHeader.Type := AuthIncExpHeader.Type::Custom;
    //         AuthIncExpHeader."Corporate Strategy" := GetCurrentCorporateStrategy();
    //         AuthIncExpHeader."Reporting Period" := GetCurrentStrategyImplementationYear(AuthIncExpHeader."Corporate Strategy");
    //         AuthIncExpHeader."Budget Code" := BudgetReAllocHeader."Budget Code";
    //         AuthIncExpHeader.Quarter := BudgetReAllocHeader.Quarter;
    //         AuthIncExpHeader."No." := NoSeriesMgt.GetNextNo(SPMSetUp."AIE Nos", Today, true);
    //         AuthIncExpHeader.Insert();
    //         AIENo := AuthIncExpHeader."No.";
    //     end;
    //     BudgetReAllocHeader."AIE No." := AIENo;
    //     BudgetReAllocHeader.Modify();

    //     //Generate Lines
    //     BudgetModificationLine.Reset();
    //     BudgetModificationLine.SetRange("Document No", BudgetReAllocHeader."Document No");
    //     if BudgetModificationLine.FindSet() then begin
    //         repeat
    //             if BudgetModificationLine."ReAllocation Request" then begin
    //                 BudgetReAllocationLine.Reset();
    //                 BudgetReAllocationLine.SetRange("Document No.", BudgetReAllocHeader."Document No");
    //                 BudgetReAllocationLine.SetRange("Source Line No", BudgetModificationLine."Line No");
    //                 if BudgetReAllocationLine.FindSet() then begin
    //                     repeat
    //                         SRCBankCode := BankAcc.GetBankCode(BankAcc.Type::Recurrent, BudgetModificationLine."Global Dimension 1 Code", BudgetReAllocationLine."Global Dimension 2 Code");
    //                         if (BudgetModificationLine.Quarter <> BudgetReAllocationLine.Quarter) or (BudgetModificationLine."Global Dimension 1 Code" <> BudgetReAllocationLine."Global Dimension 1 Code")
    //                                                    or (BudgetModificationLine."Global Dimension 2 Code" <> BudgetReAllocationLine."Global Dimension 2 Code") then begin
    //                             KeyTxt := StrSubstNo('%1_%2_%3_%4_%5_%6_%7_%8_%9_%10', BudgetModificationLine."G/L Account No", BudgetModificationLine."Global Dimension 1 Code", BudgetModificationLine."Global Dimension 2 Code",
    //                                                 BudgetModificationLine."Shortcut Dimension 3 Code", BudgetModificationLine."Shortcut Dimension 4 Code", BudgetModificationLine."Shortcut Dimension 5 Code",
    //                                                 BudgetModificationLine."Shortcut Dimension 6 Code", BudgetModificationLine."Shortcut Dimension 7 Code", BudgetModificationLine."Shortcut Dimension 8 Code", SRCBankCode);
    //                             if AuthIncExpLineDict.ContainsKey(KeyTxt) then begin
    //                                 AuthIncExpLineDict.Get(KeyTxt, LineNo);
    //                                 if AuthIncExpLine.Get(AIENo, LineNo) then begin
    //                                     AuthIncExpLine."Amount to Authorize" += BudgetReAllocationLine.Amount;
    //                                     AuthIncExpLine.Modify();
    //                                 end;
    //                             end
    //                             else begin
    //                                 AllLineNos += 1000;
    //                                 AuthIncExpLineDict.Add(KeyTxt, LineNo);
    //                                 AuthIncExpLine.Init();
    //                                 AuthIncExpLine."Document No." := AuthIncExpHeader."No.";
    //                                 AuthIncExpLine."Line No." := AllLineNos;
    //                                 AuthIncExpLine."G/L Account" := BudgetModificationLine."G/L Account No";
    //                                 AuthIncExpLine."G/L Account Name" := BudgetModificationLine."G/L Account Name";
    //                                 AuthIncExpLine."Global Dimension 1 Code" := BudgetModificationLine."Global Dimension 1 Code";
    //                                 AuthIncExpLine."Global Dimension 2 Code" := BudgetModificationLine."Global Dimension 2 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 3 Code" := BudgetModificationLine."Shortcut Dimension 3 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 4 Code" := BudgetModificationLine."Shortcut Dimension 4 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 5 Code" := BudgetModificationLine."Shortcut Dimension 5 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 6 Code" := BudgetModificationLine."Shortcut Dimension 6 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 7 Code" := BudgetModificationLine."Shortcut Dimension 7 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 8 Code" := BudgetModificationLine."Shortcut Dimension 8 Code";
    //                                 AuthIncExpLine."Source Bank Code" := SRCBankCode;
    //                                 AuthincExpLine."Amount to Authorize" := BudgetReAllocationLine.Amount;
    //                                 AuthIncExpLine."Receiving Bank Code" := BankAcc.GetBankCode(BankAcc.Type::Recurrent, BudgetModificationLine."Global Dimension 1 Code", BudgetModificationLine."Global Dimension 2 Code");
    //                                 AuthIncExpLine.Insert();
    //                             end;
    //                         end;
    //                     until BudgetReAllocationLine.Next() = 0
    //                 end;
    //             end else begin
    //                 SRCBankCode := BankAcc.GetBankCode(BankAcc.Type::Recurrent, BudgetModificationLine."Global Dimension 1 Code", BudgetModificationLine."Global Dimension 2 Code");
    //                 BudgetReAllocationLine.Reset();
    //                 BudgetReAllocationLine.SetRange("Document No.", BudgetReAllocHeader."Document No");
    //                 BudgetReAllocationLine.SetRange("Source Line No", BudgetModificationLine."Line No");
    //                 if BudgetReAllocationLine.FindSet() then begin
    //                     repeat
    //                         if (BudgetModificationLine.Quarter <> BudgetReAllocationLine.Quarter) or (BudgetModificationLine."Global Dimension 1 Code" <> BudgetReAllocationLine."Global Dimension 1 Code")
    //                         or (BudgetModificationLine."Global Dimension 2 Code" <> BudgetReAllocationLine."Global Dimension 2 Code") then begin
    //                             KeyTxt := StrSubstNo('%1_%2_%3_%4_%5_%6_%7_%8_%9_%10', BudgetReAllocationLine."G/L Account No", BudgetReAllocationLine."Global Dimension 1 Code", BudgetReAllocationLine."Global Dimension 2 Code",
    //                                                 BudgetReAllocationLine."Shortcut Dimension 3 Code", BudgetReAllocationLine."Shortcut Dimension 4 Code", BudgetReAllocationLine."Shortcut Dimension 5 Code",
    //                                                 BudgetReAllocationLine."Shortcut Dimension 6 Code", BudgetReAllocationLine."Shortcut Dimension 7 Code", BudgetReAllocationLine."Shortcut Dimension 8 Code", SRCBankCode);
    //                             if AuthIncExpLineDict.ContainsKey(KeyTxt) then begin
    //                                 AuthIncExpLineDict.Get(KeyTxt, LineNo);
    //                                 if AuthIncExpLine.Get(AIENo, LineNo) then begin
    //                                     AuthIncExpLine."Amount to Authorize" += BudgetReAllocationLine.Amount;
    //                                     AuthIncExpLine.Modify();
    //                                 end;
    //                             end
    //                             else begin
    //                                 AllLineNos += 1000;
    //                                 AuthIncExpLineDict.Add(KeyTxt, LineNo);
    //                                 AuthIncExpLine.Init();
    //                                 AuthIncExpLine."Document No." := AuthIncExpHeader."No.";
    //                                 AuthIncExpLine."Line No." := AllLineNos;
    //                                 AuthIncExpLine."G/L Account" := BudgetReAllocationLine."G/L Account No";
    //                                 AuthIncExpLine."G/L Account Name" := BudgetReAllocationLine."G/L Account Name";
    //                                 AuthIncExpLine."Global Dimension 1 Code" := BudgetReAllocationLine."Global Dimension 1 Code";
    //                                 AuthIncExpLine."Global Dimension 2 Code" := BudgetReAllocationLine."Global Dimension 2 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 3 Code" := BudgetReAllocationLine."Shortcut Dimension 3 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 4 Code" := BudgetReAllocationLine."Shortcut Dimension 4 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 5 Code" := BudgetReAllocationLine."Shortcut Dimension 5 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 6 Code" := BudgetReAllocationLine."Shortcut Dimension 6 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 7 Code" := BudgetReAllocationLine."Shortcut Dimension 7 Code";
    //                                 AuthIncExpLine."Shortcut Dimension 8 Code" := BudgetReAllocationLine."Shortcut Dimension 8 Code";
    //                                 AuthincExpLine."Amount to Authorize" := BudgetReAllocationLine.Amount;
    //                                 AuthIncExpLine."Source Bank Code" := SRCBankCode;
    //                                 AuthIncExpLine."Receiving Bank Code" := BankAcc.GetBankCode(BankAcc.Type::Recurrent, BudgetReAllocationLine."Global Dimension 1 Code", BudgetModificationLine."Global Dimension 2 Code");
    //                                 AuthIncExpLine.Insert();
    //                             end;
    //                         end;
    //                     until BudgetReAllocationLine.Next() = 0;
    //                 end;
    //             end;
    //         until BudgetModificationLine.Next() = 0;
    //     end;
    //     exit(AIENo);
    // end;

    procedure GetCurrentWorkplan(CSPCode: Code[20]; ReportingYear: code[20]; GlobalDimension1Code: Code[20]; GlobalDimension2Code: Code[20]): Code[20]
    var
        AnnualWorkPlan: Record "Annual Strategy Workplan";
    begin
        AnnualWorkPlan.Reset();
        AnnualWorkPlan.SetRange("Planning Budget Type", AnnualWorkPlan."Planning Budget Type"::Supplementary);
        AnnualWorkPlan.SetRange("Strategy Plan ID", CSPCode);
        AnnualWorkPlan.SetRange("Year Reporting Code", ReportingYear);
        AnnualWorkPlan.SetRange("Global Dimension 1 Code", GlobalDimension1Code);
        AnnualWorkPlan.SetRange("Global Dimension 2 Code", GlobalDimension2Code);
        AnnualWorkPlan.SetRange("Budget Posted to G/L", true);
        if AnnualWorkPlan.FindFirst() then
            exit(AnnualWorkPlan.No);
    end;

    procedure InitiateSupplementaryBudget(CurrBudget: Record "Budget Consolidation Header")
    var
        NewBudget: Record "Budget Consolidation Header";
        Workplan2, Workplan : Record "Annual Strategy Workplan";
        StrategyWorkplanLines2, StrategyWorkplanLines : Record "Strategy Workplan Lines";
        Inputs2, Inputs : Record "SubWorkPlan Activity Inputs";
        BudgetLine2, BudgetLine : Record "Workplan Budget Line";
    //Activity: Record "Workplan Activity";
    Begin
        NewBudget.Init();
        NewBudget.TransferFields(CurrBudget, true);
        NewBudget."Planning Budget Type" := NewBudget."Planning Budget Type"::"Supplementary 2";
        NewBudget.Code := '';
        NewBudget."Approval Status" := NewBudget."Approval Status"::Open;
        NewBudget.Insert(true);
        Workplan.Reset();
        Workplan.SetRange("Annual Workplan", CurrBudget.Code);
        Workplan.SetRange(Select, true);
        Workplan.SetFilter("Supplementary Ceiling", '<>%1', 0);
        if Workplan.FindSet() then
            repeat
                Workplan2.Init();
                Workplan2.Copy(Workplan);
                Workplan2."Planning Budget Type" := Workplan2."Planning Budget Type"::"Supplementary 2";
                Workplan2."Annual Workplan" := NewBudget.Code;
                Workplan2.No := '';
                Workplan2.Insert(true);
                StrategyWorkplanLines.Reset();
                StrategyWorkplanLines.SetRange(No, Workplan.No);
                if StrategyWorkplanLines.FindSet() then
                    repeat
                        StrategyWorkplanLines2.Init();
                        StrategyWorkplanLines2.Copy(StrategyWorkplanLines);
                        StrategyWorkplanLines2.No := Workplan2.No;
                        StrategyWorkplanLines2."Strategy Plan ID" := Workplan2."Annual Workplan";
                        StrategyWorkplanLines2.Insert(true);

                    until StrategyWorkplanLines.Next() = 0;
                Inputs.Reset();
                Inputs.SetRange("Workplan No.", Workplan.No);
                if Inputs.FindSet() then
                    repeat
                        Inputs2.Init();
                        Inputs2.Copy(Inputs);
                        Inputs2."Workplan No." := Workplan2.No;
                        Inputs2.Insert(true);
                    until Inputs.Next() = 0;
                BudgetLine.Reset();
                BudgetLine.SetRange("Strategy Plan ID", Workplan.No);
                if BudgetLine.FindSet() then
                    repeat
                        BudgetLine2.Init();
                        BudgetLine2.Copy(BudgetLine);
                        BudgetLine2."Strategy Plan ID" := Workplan2.No;
                        BudgetLine2.Insert(true);
                    until BudgetLine.Next() = 0;

            until Workplan.Next() = 0;
        Message('An open supplementary budget %1 has been created for the selected budget', NewBudget.Code);
    End;

    procedure GenerateProcurementPlan(CurrBudget: Record "Budget Consolidation Header")
    var
        Workplan: Record "Annual Strategy Workplan";
        ProcurementPlan: Record "Procurement Plan";
        ProcPlanLines: Record "Procurement Plan Lines";
        EntryNo, LineNo : Integer;
        Workings: Record "Workplan Workings";
        PlanEntry: Record "Procurement Plan Entry";
        BudgetLine: Record "Workplan Budget Line";
    begin
        Workplan.Reset();
        Workplan.SetRange("Annual Workplan", CurrBudget.Code);
        Workplan.SetRange(Consolidated, true);
        Workplan.SetRange("Under Review", false);
        if Workplan.FindSet() then
            repeat
                GenerateFunctionalPlan(Workplan);
            until Workplan.Next() = 0;
    end;

    procedure GenerateFunctionalPlan(var Workplan: Record "Annual Strategy Workplan")
    var
        ProcurementPlan: Record "Procurement Plan";
        ProcPlanLines: Record "Procurement Plan Lines";
        EntryNo, LineNo : Integer;
        Workings: Record "Workplan Workings";
        PlanEntry: Record "Procurement Plan Entry";
        BudgetLine: Record "Workplan Budget Line";
    begin


        ProcurementPlan.Init();
        ProcurementPlan.Code := '';
        ProcurementPlan."Annual Workplan Plan ID" := Workplan.No;
        procurementPlan."Corporate Strategic Plan ID" := Workplan."Strategy Plan ID";
        ProcurementPlan.Description := Workplan.Description;
        //ProcurementPlan.Validate("Financial Year Code", Workplan."Year Reporting Code");
        ProcurementPlan."Global Dimension 1 Code" := Workplan."Global Dimension 1 Code";
        ProcurementPlan."Global Dimension 2 Code" := Workplan."Global Dimension 2 Code";
        ProcurementPlan."Plan Type" := ProcurementPlan."Plan Type"::Functional;
        ProcurementPlan."Document Type" := ProcurementPlan."Document Type"::"Procurement Plan";
        ProcurementPlan."Document Status" := ProcurementPlan."Document Status"::Draft;
        //ProcurementPlan."Consolidated Procurement Plan" := CurrBudget."Proposed Procurement Plan";
        if ProcurementPlan.Insert(true) then begin
            PlanEntry.Reset();
            PlanEntry.SetCurrentKey("Entry No.");
            PlanEntry.FindLast();
            LineNo := PlanEntry."Entry No." + 1;
            ProcPlanLines.Reset();
            ProcPlanLines.FindLast();
            EntryNo := ProcPlanLines."PP Line No" + 1;
            Workings.Reset();
            Workings.SetRange("Strategy Plan ID", Workplan.No);
            Workings.SetRange(Type, Workings.Type::Procurable);
            if Workings.FindSet() then
                repeat
                    ProcPlanLines.Reset();
                    ProcPlanLines.SetRange("Procurement Plan ID", ProcurementPlan.Code);
                    ProcPlanLines.SetRange("Planning Category", Workings."Budget Item");
                    ProcPlanLines.SetRange("Document Type", ProcurementPlan."Document Type"::"Procurement Plan");
                    if not ProcPlanLines.FindFirst() then begin
                        ProcPlanLines.Init();
                        ProcPlanLines."Procurement Plan ID" := ProcurementPlan.Code;
                        ProcPlanLines."Document Type" := ProcurementPlan."Document Type"::"Procurement Plan";
                        ProcPlanLines."PP Line No" := EntryNo;
                        ProcPlanLines.Validate("Planning Category", Workings."Budget Item");
                        ProcPlanLines.Insert(true);
                        EntryNo += 1;
                    end;
                    BudgetLine.Reset();
                    BudgetLine.SetRange("Strategy ID", Workings."Strategy ID");
                    BudgetLine.SetRange("Strategy Plan ID", Workings."Strategy Plan ID");
                    BudgetLine.SetRange("Budget Item", Workings."Budget Item");
                    BudgetLine.SetRange("KRA ID", Workings."KRA ID");
                    BudgetLine.SetRange("Core Strategy ID", Workings."Core Strategy ID");
                    BudgetLine.SetRange("Input Line No.", Workings."Input Line No.");
                    BudgetLine.SetRange("Activity ID", Workings."Activity ID");
                    BudgetLine.SetRange("Line No.", Workings."Line No.");
                    if BudgetLine.FindFirst() then begin
                        PlanEntry.Init();
                        PlanEntry."Entry No." := LineNo;
                        PlanEntry."Global Dimension 1 Code" := BudgetLine."Global Dimension 1 Code";
                        PlanEntry."Global Dimension 2 Code" := BudgetLine."Global Dimension 2 Code";
                        PlanEntry."Shortcut Dimension 3 Code" := BudgetLine."Shortcut Dimension 3 Code";
                        PlanEntry."Shortcut Dimension 4 Code" := BudgetLine."Shortcut Dimension 4 Code";
                        PlanEntry."Shortcut Dimension 5 Code" := BudgetLine."Shortcut Dimension 5 Code";
                        PlanEntry."Shortcut Dimension 6 Code" := BudgetLine."Shortcut Dimension 6 Code";
                        PlanEntry."Shortcut Dimension 7 Code" := BudgetLine."Shortcut Dimension 7 Code";
                        PlanEntry."Shortcut Dimension 8 Code" := BudgetLine."Shortcut Dimension 8 Code";
                        PlanEntry."Procurement Plan ID" := ProcurementPlan.Code;
                        PlanEntry."Planning Category" := Workings."Budget Item";
                        PlanEntry."Plan Item Type" := Workings."Item Type";
                        PlanEntry."Unit Cost" := Workings."Unit Cost";
                        PlanEntry.Quantity := Workings.Unit;
                        PlanEntry."Line Budget Cost" := Workings."Total Amount";
                        PlanEntry.Validate("Plan Item No", Workings."Item No");
                        PlanEntry.Validate("Q1 Quantity", Workings."Q1 Quantity");
                        PlanEntry.Validate("Q2 Quantity", Workings."Q2 Quantity");
                        PlanEntry.Validate("Q3 Quantity", Workings."Q3 Quantity");
                        PlanEntry.Validate("Q4 Quantity", Workings."Q4 Quantity");
                        PlanEntry."Q1 Budget" := PlanEntry."Q1 Amount";
                        PlanEntry."Q2 Budget" := PlanEntry."Q2 Amount";
                        PlanEntry."Q3 Budget" := PlanEntry."Q3 Amount";
                        PlanEntry."Q4 Budget" := PlanEntry."Q4 Amount";
                        PlanEntry."Q1 Amount" := Workings."Q1 Amount";
                        PlanEntry."Q2 Amount" := Workings."Q2 Amount";
                        PlanEntry."Q3 Amount" := Workings."Q3 Amount";
                        PlanEntry."Q4 Amount" := Workings."Q4 Amount";

                        PlanEntry.Insert(true);
                        LineNo += 1;

                    end;
                until Workings.Next() = 0;
        end;
    end;

    procedure GetDestinationWorkplanCode(var WorkplanCode: Code[20]; Lines: Record "Auth. Inc Expend. Line"): Code[20]
    var
        ConsolHeader: Record "Budget Consolidation Header";
        AWP, AWP2 : Record "Annual Strategy Workplan";
    begin
        AWP2.Get(WorkplanCode);
        //ConsolHeader.Get(AWP."Annual Workplan");
        AWP.Reset;
        //AWP.SetRange(AWP."Annual Workplan", ConsolHeader.Code);
        AWP.SetRange(Consolidated, true);
        AWP.SetRange("Under Review", false);
        AWP.SetRange(Archived, false);
        AWP.SetRange("Year Reporting Code", AWP2."Year Reporting Code");
        AWP.SetRange("Global Dimension 1 Code", Lines."Global Dimension 1 Code");
        AWP.SetRange("Global Dimension 2 Code", Lines."Global Dimension 2 Code");
        AWP.SetFilter("Planning Budget Type", '<>%1', AWP."Planning Budget Type"::Original);
        if AWP.FindFirst() then
            exit(AWP.No)
        else
            Error(StrSubstNo('There is no approved workplan for station %1', Lines."Global Dimension 2 Code"));

    end;

    procedure postSpecialAIE(var AIE: Record "Auth. Inc. Expend. Header")
    var
        BudgetMgt: Codeunit "Budget Management";
        WorkplanManagement: Codeunit "Workplan Management";
        Workplan, Workplan2, FunctionalPlans : Record "Annual Strategy Workplan";
        CurrBudget, NewBudget : Record "Budget Consolidation Header";
        StrategyWorkplanLines2, StrategyWorkplanLines : Record "Strategy Workplan Lines";
        Inputs2, Inputs : Record "SubWorkPlan Activity Inputs";
        BudgetLine2, BudgetLine : Record "Workplan Budget Line";
        AIELine: Record "Auth. Inc Expend. Line";
        GLBudgetEntry: record "G/L Budget Entry";
        EntryNo, LineNo : Integer;
        BudgetCode: Code[50];
        QuarterDates: array[4, 2] of Date;
    begin
        if AIE.Posted then
            Error('AIE has already been posted');
        ///Transfer activity
        Workplan.Get(AIE.Workplan);
        AIELine.Reset;
        AIELine.SetRange("Document No.", AIE."No.");
        if AIELine.FindSet() then
            repeat
                Workplan2.Reset();
                Workplan2.SetRange("Global Dimension 2 Code", AIELine."Global Dimension 2 Code");
                Workplan2.SetRange("Global Dimension 1 Code", AIELine."Global Dimension 1 Code");
                Workplan2.SetRange("Year Reporting Code", Workplan."Year Reporting Code");
                //Workplan2.SetRange("Annual Workplan", Workplan."Annual Workplan");
                Workplan2.SetRange(Consolidated, TRUE);
                Workplan2.SetRange(Archived, false);
                if Workplan2.FindFirst() then begin
                    StrategyWorkplanLines.Reset();
                    StrategyWorkplanLines.SetRange("Activity Id", AIELine."Activity Id");
                    StrategyWorkplanLines.SetRange(No, Workplan.No);
                    if StrategyWorkplanLines.FindFirst() then begin
                        StrategyWorkplanLines2.Reset();
                        StrategyWorkplanLines2.Copy(StrategyWorkplanLines);
                        StrategyWorkplanLines2.Source := Workplan.No;
                        StrategyWorkplanLines2."Source Process" := StrategyWorkplanLines2."Source Process"::"Special AIE";
                        StrategyWorkplanLines2.No := Workplan2.No;
                        if not StrategyWorkplanLines2.Insert() then StrategyWorkplanLines2.Modify();
                        Inputs.Reset();
                        Inputs.SetRange("Activity Id", AIELine."Activity Id");
                        Inputs.SetRange("Workplan No.", Workplan.No);
                        if Inputs.FindFirst() then begin
                            Inputs2.Reset();
                            Inputs2.Copy(Inputs);
                            Inputs2.Source := Workplan.No;
                            Inputs2."Source Process" := Inputs2."Source Process"::"Special AIE";
                            Inputs2."Workplan No." := Workplan2.No;
                            if not Inputs2.Insert() then Inputs2.Modify();
                        end;
                        BudgetLine.Reset();
                        BudgetLine.SetRange("Activity Id", AIELine."Activity Id");
                        BudgetLine.SetRange("Strategy Plan ID", Workplan.No);
                        if BudgetLine.FindFirst() then begin
                            BudgetLine2.Reset();
                            BudgetLine2.SetCurrentKey("Line No.");
                            BudgetLine2.SetRange("Strategy Plan ID", BudgetLine."Strategy Plan ID");
                            if BudgetLine2.FindLast() then
                                if BudgetLine2."Line No." <> '' then
                                    Evaluate(LineNo, IncStr(Budgetline2."Line No."))
                                else
                                    LineNo := 1;
                            BudgetLine2.Reset();
                            BudgetLine2.Copy(BudgetLine);
                            BudgetLine2.Source := Workplan.No;
                            BudgetLine2."Source Process" := BudgetLine2."Source Process"::"Special AIE";
                            BudgetLine2."Strategy Plan ID" := Workplan2.No;
                            BudgetLine2."Line No." := Format(LineNo);
                            BudgetLine2."Q1 Amount" := 0;
                            BudgetLine2."Q2 Amount" := 0;
                            BudgetLine2."Q3 Amount" := 0;
                            BudgetLine2."Q4 Amount" := 0;
                            BudgetLine2."Q1 Quantity" := 0;
                            BudgetLine2."Q2 Quantity" := 0;
                            BudgetLine2."Q3 Quantity" := 0;
                            BudgetLine2."Q4 Quantity" := 0;
                            BudgetLine2."Q1 Unit Amount" := 0;
                            BudgetLine2."Q2 Unit Amount" := 0;
                            BudgetLine2."Q3 Unit Amount" := 0;
                            BudgetLine2."Q4 Unit Amount" := 0;
                            BudgetLine2."Total Amount" := 0;
                            BudgetLine2."Total Ceiling" := 0;
                            case AIE.Quarter of
                                AIE.Quarter::"Quarter 1":
                                    begin
                                        BudgetLine2."Q1 Quantity" := 1;
                                        BudgetLine2."Q1 Unit Amount" := AIELine."Amount to Authorize";
                                        BudgetLine2."Q1 Amount" := AIELine."Amount to Authorize";
                                    end;
                                AIE.Quarter::"Quarter 2":
                                    begin
                                        BudgetLine2."Q2 Quantity" := 1;
                                        BudgetLine2."Q2 Unit Amount" := AIELine."Amount to Authorize";
                                        BudgetLine2."Q2 Amount" := AIELine."Amount to Authorize";
                                    end;
                                AIE.Quarter::"Quarter 3":

                                    begin
                                        BudgetLine2."Q3 Quantity" := 1;
                                        BudgetLine2."Q3 Unit Amount" := AIELine."Amount to Authorize";
                                        BudgetLine2."Q3 Amount" := AIELine."Amount to Authorize";
                                    end;
                                AIE.Quarter::"Quarter 4":
                                    begin
                                        BudgetLine2."Q4 Quantity" := 1;
                                        BudgetLine2."Q4 Unit Amount" := AIELine."Amount to Authorize";
                                        BudgetLine2."Q4 Amount" := AIELine."Amount to Authorize";
                                    end;
                            end;
                            BudgetLine2.Validate("Total Amount");
                            BudgetLine2.Insert();
                        end;
                    end;
                end else
                    Error('Workplan not found');


                ///Transfer Budget
                GLBudgetEntry.Reset();
                if GLBudgetEntry.FindLast() then
                    EntryNo := GLBudgetEntry."Entry No.";
                BudgetCode := WorkplanManagement.GetQuarterDates(Workplan."Year Reporting Code", Workplan."Strategy Plan ID", QuarterDates);
                GLBudgetEntry.LockTable();
                //Reduce budget from donor
                EntryNo += 1;
                GLBudgetEntry.Init();
                GLBudgetEntry."Entry No." := EntryNo;
                GLBudgetEntry."Budget Name" := BudgetCode;
                GLBudgetEntry."Budget Type" := GLBudgetEntry."Budget Type"::Approved;
                GLBudgetEntry.Amount := -AIE."Amount to Authorize";
                GLBudgetEntry."G/L Account No." := AIE."Budget Code";
                GLBudgetEntry.Description := AIE.Description;
                GLBudgetEntry.Date := AIE."Quarter Start Date";
                GLBudgetEntry."Global Dimension 1 Code" := AIE."Global Dimension 1 Code";
                GLBudgetEntry."Global Dimension 2 Code" := AIE."Global Dimension 2 Code";
                GLBudgetEntry."Shortcut Dimension 3 Code" := AIELine."Shortcut Dimension 3 Code";
                GLBudgetEntry."Shortcut Dimension 4 Code" := AIELine."Shortcut Dimension 4 Code";
                GLBudgetEntry."Shortcut Dimension 5 Code" := AIELine."Shortcut Dimension 5 Code";
                GLBudgetEntry."Shortcut Dimension 6 Code" := AIELine."Shortcut Dimension 6 Code";
                GLBudgetEntry."Shortcut Dimension 7 Code" := AIELine."Shortcut Dimension 7 Code";
                GLBudgetEntry."Shortcut Dimension 8 Code" := AIELine."Shortcut Dimension 8 Code";
                GLBudgetEntry."Dimension Set Id" := AIELine."Dimension Set Id";
                GLBudgetEntry."Source Document" := Workplan."No";
                GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::ReAllocation;
                GLBudgetEntry.Insert();
                //Add to Recepient
                EntryNo += 1;
                GLBudgetEntry.Init();
                GLBudgetEntry."Entry No." := EntryNo;
                GLBudgetEntry."Budget Name" := BudgetCode;
                GLBudgetEntry."Budget Type" := GLBudgetEntry."Budget Type"::Approved;
                GLBudgetEntry.Amount := AIE."Amount to Authorize";
                GLBudgetEntry."G/L Account No." := AIE."Budget Code";
                GLBudgetEntry.Description := AIE.Description;
                GLBudgetEntry.Date := AIE."Quarter Start Date";
                GLBudgetEntry."Global Dimension 1 Code" := AIELine."Global Dimension 1 Code";
                GLBudgetEntry."Global Dimension 2 Code" := AIELine."Global Dimension 2 Code";
                GLBudgetEntry."Shortcut Dimension 3 Code" := AIELine."Shortcut Dimension 3 Code";
                GLBudgetEntry."Shortcut Dimension 4 Code" := AIELine."Shortcut Dimension 4 Code";
                GLBudgetEntry."Shortcut Dimension 5 Code" := AIELine."Shortcut Dimension 5 Code";
                GLBudgetEntry."Shortcut Dimension 6 Code" := AIELine."Shortcut Dimension 6 Code";
                GLBudgetEntry."Shortcut Dimension 7 Code" := AIELine."Shortcut Dimension 7 Code";
                GLBudgetEntry."Shortcut Dimension 8 Code" := AIELine."Shortcut Dimension 8 Code";
                GLBudgetEntry."Dimension Set Id" := AIELine."Dimension Set Id";
                GLBudgetEntry."Source Document" := Workplan."No";
                GLBudgetEntry."Entry Type" := GLBudgetEntry."Entry Type"::ReAllocation;
                GLBudgetEntry.Insert();
            until AIELine.Next() = 0;
        AIE.Validate(Posted, true);
        AIE.Modify();
    end;
}



