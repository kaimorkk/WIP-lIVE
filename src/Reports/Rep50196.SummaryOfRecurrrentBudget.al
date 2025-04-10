report 50196 SummaryOfRecurrrentBudget
{
    ApplicationArea = All;
    Caption = 'Summary of Recurrent Budget by Head Total (FORM A)';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './src/report/Rep50196.SummaryOfRecurrrentBudget.rdlc';

    dataset
    {
        dataitem(Budgetname; "G/L Budget Name")
        {
            column(Name; Name)
            {
            }
            column(NextFinancialYear1; NextFinancialYear1)
            {
            }
            column(NextFinancialYear2; NextFinancialYear2)
            {
            }
            column(NextFinancialYear3; NextFinancialYear3)
            {
            }
            column(PreviousFinancialYear1; PreviousFinancialYear1)
            {
            }
            Dataitem(AnnualStrategyWorkplan; "Annual Strategy Workplan")
            {
                DataItemLinkReference = Budgetname;
                DataItemLink = "Year Reporting Code" = field(Name);
                DataItemTableView = where("Approval Status" = const(Released), Consolidated = const(true), "Planning Budget Type" = const(Original));

                column(CeilingAmount; CeilingAmount)
                {
                }
                column(EndDate; "End Date")
                {
                }
                column(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code; GlobalDimension2Code)
                {
                }
                column(PlanningBudgetType; "Planning Budget Type")
                {
                }
                column(StartDate; "Start Date")
                {
                }
                column(YearReportingCode; "Year Reporting Code")
                {
                }
                column(StationName; StationName)
                {
                }

                column(NextFinancialYear2Est; NextFinancialYear2Est)
                {
                }
                column(NextFinancialYear3Est; NextFinancialYear3Est)
                {
                }
                column(PreviousCeilingAmount; PreviousCeilingAmount)
                {
                }

                trigger OnPreDataItem()
                begin
                    if AdminUnit <> '' then
                        SetRange("Global Dimension 2 Code", AdminUnit);
                    if BudgetCode <> '' then
                        SetRange("Year Reporting Code", BudgetCode);
                end;

                trigger OnAfterGetRecord()
                var
                    PrevYearCode: Text;
                    StartYear: Integer;
                    EndYear: Integer;
                    TempText: Text;
                    AnnualStrategyWorkplanPrev: Record "Annual Strategy Workplan";
                    AnnualStrategyWorkplanTemp: Record "Annual Strategy Workplan";
                begin
                    if "Global Dimension 2 Code" = PrevGlobalDim2Code then
                        CurrReport.Skip();
                    PrevGlobalDim2Code := "Global Dimension 2 Code";
                    CeilingAmount := 0;
                    AnnualStrategyWorkplanTemp.Reset();
                    AnnualStrategyWorkplanTemp.CopyFilters(AnnualStrategyWorkplan);
                    AnnualStrategyWorkplanTemp.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
                    if AnnualStrategyWorkplanTemp.FindSet() then begin
                        repeat
                            Clear(QuarterAmount);
                            AnnualStrategyWorkplanTemp.GetBudgetAmount(QuarterAmount);
                            CeilingAmount += QuarterAmount[5];
                        until AnnualStrategyWorkplanTemp.Next() = 0;

                    end;
                    DimValue.Reset();
                    DimValue.SetRange(Code, "Global Dimension 2 Code");
                    if DimValue.FindFirst() then begin
                        StationName := DimValue.Name;
                        GlobalDimension2Code := DimValue.Code;
                    end;

                    if factor1 > 0 then begin
                        NextFinancialYear2Est := factor1 * CeilingAmount;
                        if factor2 > 0 then
                            NextFinancialYear3Est := factor2 * NextFinancialYear2Est
                        else
                            NextFinancialYear3Est := 1.2 * NextFinancialYear2Est;
                    end else begin
                        NextFinancialYear2Est := 1.1 * CeilingAmount;
                        NextFinancialYear3Est := 1.2 * NextFinancialYear2Est;
                    end;

                    if StrLen("Year Reporting Code") >= 9 then begin
                        TempText := CopyStr("Year Reporting Code", 3, 4);
                        Evaluate(StartYear, TempText);
                        TempText := CopyStr("Year Reporting Code", 8, 4);
                        Evaluate(EndYear, TempText);

                        PrevYearCode := 'FY' + Format(StartYear - 1) + '/' + Format(EndYear - 1);

                        AnnualStrategyWorkplanPrev.Reset();
                        AnnualStrategyWorkplanPrev.SetRange("Year Reporting Code", PrevYearCode);
                        AnnualStrategyWorkplanPrev.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
                        AnnualStrategyWorkplanPrev.SetRange("Approval Status", AnnualStrategyWorkplan."Approval Status"::Released);
                        AnnualStrategyWorkplanPrev.SetRange(Consolidated, true);
                        AnnualStrategyWorkplanPrev.SetRange("Planning Budget Type", AnnualStrategyWorkplan."Planning Budget Type"::Original);

                        PreviousCeilingAmount := 0;
                        if AnnualStrategyWorkplanPrev.FindSet() then begin
                            repeat
                                Clear(prevQuarterAmount);
                                AnnualStrategyWorkplanPrev.GetBudgetAmount(prevQuarterAmount);
                                PreviousCeilingAmount += prevQuarterAmount[5];
                            until AnnualStrategyWorkplanPrev.Next() = 0;
                        end;
                    end else begin
                        PreviousCeilingAmount := 0;
                    end;
                end;
            }
            trigger OnPreDataItem()
            begin
                PrevGlobalDim2Code := '';
                if BudgetCode <> '' then
                    SetRange(Name, BudgetCode);
            end;

            trigger OnAfterGetRecord()
            var
                StartYear: Integer;
                EndYear: Integer;
                TempText: Text;
            begin
                // factor1 := "Total Budget(Expectation 1)";
                // factor2 := "Total Budget(Expectation 2)";
                if StrLen(Name) >= 9 then begin
                    TempText := CopyStr(Name, 3, 4);
                    Evaluate(StartYear, TempText);
                    TempText := CopyStr(Name, 8, 4);
                    Evaluate(EndYear, TempText);

                    PreviousFinancialYear1 := 'FY' + Format(StartYear - 1) + '/' + Format(EndYear - 1);
                    NextFinancialYear1 := 'FY' + Format(StartYear + 1) + '/' + Format(EndYear + 1);
                    NextFinancialYear2 := 'FY' + Format(StartYear + 2) + '/' + Format(EndYear + 2);
                    NextFinancialYear3 := 'FY' + Format(StartYear + 3) + '/' + Format(EndYear + 3);
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(BudgetCode; BudgetCode)
                    {
                        ApplicationArea = Basic, Suite;
                        TableRelation = "G/L Budget Name".Name;
                        Caption = 'Budget Code';
                    }
                    field(AdminUnit; AdminUnit)
                    {
                        ApplicationArea = Basic, Suite;
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), "Dimension Value Type" = const(Standard), Blocked = const(false));
                        Caption = 'Admin Unit';
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        if BudgetCode = '' then
            Error('Please provide the budget code');
    end;

    var
        DimValue: Record "Dimension Value";
        GlobalDimension2Code, StationName : Text;
        PreviousYearReportingCode, PreviousFinancialYear1, NextFinancialYear1 : Text;
        NextFinancialYear3, NextFinancialYear2 : Text;
        BudgetCode: Code[20];
        AdminUnit: Code[20];
        CeilingAmount, PreviousCeilingAmount, factor1, factor2, NextFinancialYear2Est, NextFinancialYear3Est : Decimal;
        prevQuarterAmount, QuarterAmount : array[5] of Decimal;
        PrevGlobalDim2Code: Code[20];
}
