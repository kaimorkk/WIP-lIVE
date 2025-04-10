report 50200 RecurrentSubChapterAnalysiMTEF
{
    Caption = 'Recurrent Sub Chapter Analysis MTEF';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './src/Report/Rep50200.RecurrentSubChapterAnalysisMTEF.rdlc';
    dataset
    {
        dataitem(GLGrouping; "G/L Account")
        {
            DataItemTableView = where("Account Type" = filter("End-Total"), Totaling = filter(<> ''));
            column(Name_GLGrouping; Name)
            {
            }
            column(No_GLGrouping; "No.")
            {
            }
            column(BudgetCode; BudgetCode)
            {
            }

            column(PreviousFinancialYear1; PreviousFinancialYear1)
            {
            }
            column(NextFinancialYear1; NextFinancialYear1)
            {
            }
            column(NextFinancialYear2; NextFinancialYear2)
            {
            }
            column(PreviousYearBudget; PreviousYearBudget)
            {
            }
            // column(Ordering_Sequence; "Ordering Sequence")
            // {
            // }

            dataitem(GroupAccounts; "G/L Account")
            {
                column(AccountNo; "No.")
                {
                }

                column(AccountName; Name)
                {
                }
                column(FinancialYearEst; FinancialYearEst)
                {
                }
                column(NextFinancialYear1Est; NextFinancialYear1Est)
                {
                }
                column(NextFinancialYear2Est; NextFinancialYear2Est)
                {
                }

                trigger OnPreDataItem()
                var
                    GLAcc: Record "G/L Account";
                begin
                    GLAcc.SetFilter("No.", GLGrouping.Totaling);
                    SetFilter("No.", GLAcc.GetFilter("No."));
                    SetFilter("No.", GetFilter("No.") + '&<>%1', GLGrouping."No.");
                    SetFilter("Account Type", 'Posting');
                end;

                trigger OnAfterGetRecord()
                var
                    StartYear: Integer;
                    EndYear: Integer;
                    TempText: Text;
                    BudgetEntry: Record "G/L Budget Entry";
                    AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
                    BudgetLine: Record "Workplan Budget Line";
                begin
                    if PrintedAccounts.ContainsKey("No.") then
                        CurrReport.Skip();
                    PrintedAccounts.Add("No.", true);

                    BudgetEntry.Reset();
                    BudgetEntry.SetRange("Budget Name", PreviousFinancialYear1);
                    BudgetEntry.SetRange("G/L Account No.", "No.");
                    if BudgetEntry.FindSet() then begin
                        BudgetEntry.CalcSums(Amount);
                        PreviousYearBudget := BudgetEntry.Amount;
                    end;

                    AnnualStrategyWorkplan.Reset();
                    AnnualStrategyWorkplan.SetRange("Year Reporting Code", BudgetCode);
                    AnnualStrategyWorkplan.SetRange("Approval Status", AnnualStrategyWorkplan."Approval Status"::Released);
                    AnnualStrategyWorkplan.SetRange(Consolidated, true);
                    AnnualStrategyWorkplan.SetRange("Planning Budget Type", AnnualStrategyWorkplan."Planning Budget Type"::Original);

                    FinancialYearEst := 0;
                    if AnnualStrategyWorkplan.FindSet(true) then begin
                        repeat
                            BudgetLine.Reset();
                            BudgetLine.SetRange("Reporting Year Code", BudgetCode);
                            BudgetLine.SetRange("Budget Item", GroupAccounts."No.");
                            BudgetLine.SetRange("Strategy Plan ID", AnnualStrategyWorkplan.No);
                            if BudgetLine.FindSet() then begin
                                BudgetLine.CalcSums("Total Amount");
                                FinancialYearEst += BudgetLine."Total Amount";

                            end;
                        until AnnualStrategyWorkplan.Next() = 0;

                        if factor1 > 0 then begin
                            NextFinancialYear1Est := factor1 * FinancialYearEst;
                            if factor2 > 0 then
                                NextFinancialYear2Est := factor2 * NextFinancialYear1Est
                            else
                                NextFinancialYear2Est := 1.2 * NextFinancialYear1Est;
                        end else begin
                            NextFinancialYear1Est := 1.1 * FinancialYearEst;
                            NextFinancialYear2Est := 1.2 * NextFinancialYear1Est;
                        end;
                    end;
                    if (PreviousYearBudget = 0) and (FinancialYearEst = 0) then
                        CurrReport.Skip();
                end;


            }
            trigger OnPreDataItem()
            var
                budgetName: Record "G/L Budget Name";
            begin
                budgetName.Reset();
                budgetName.SetRange(Name, BudgetCode);
                if budgetName.FindFirst() then begin
                    // factor1 := budgetName."Total Budget(Expectation 1)";
                    // factor2 := budgetName."Total Budget(Expectation 2)";
                end;
            end;

            trigger OnAfterGetRecord()
            var
                StartYear: Integer;
                EndYear: Integer;
                TempText: Text;
                Gl: Record "G/L Account";
                LowerBound: Code[20];
                UpperBound: Code[20];
                ParentLowerBound: Code[20];
                ParentUpperBound: Code[20];
                RangeText: Text;
                ParentRangeText: Text;
                DelimiterPos: Integer;
            begin
                if StrLen(BudgetCode) >= 9 then begin
                    TempText := CopyStr(BudgetCode, 3, 4);
                    Evaluate(StartYear, TempText);
                    TempText := CopyStr(BudgetCode, 8, 4);
                    Evaluate(EndYear, TempText);

                    PreviousFinancialYear1 := 'FY' + Format(StartYear - 1) + '/' + Format(EndYear - 1);
                    NextFinancialYear1 := 'FY' + Format(StartYear + 1) + '/' + Format(EndYear + 1);
                    NextFinancialYear2 := 'FY' + Format(StartYear + 2) + '/' + Format(EndYear + 2);

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
        BudgetCode: Code[20];
        NextFinancialYear2, PreviousYearReportingCode, PreviousFinancialYear1, NextFinancialYear1 : Text;
        PreviousYearBudget: Decimal;
        TotalAmount, factor1, factor2, FinancialYearEst, NextFinancialYear1Est, NextFinancialYear2Est : Decimal;
        PrintedAccounts: Dictionary of [Code[20], Boolean];

}
