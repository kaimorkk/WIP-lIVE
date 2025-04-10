report 70036 "Program Perfomance Report PPR"
{
    ApplicationArea = All;
    Caption = 'Program Perfomance Report PPR';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Program Perfomance Report.rdlc';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {

        dataitem(AnnualStrategyWorkplan; "Annual Strategy Workplan")
        {
            RequestFilterFields = No;
            DataItemTableView = where(Archived = const(false));
            column(EndDate_AnnualStrategyWorkplan; "End Date")
            {
            }
            column(StartDate_AnnualStrategyWorkplan; "Start Date")
            {
            }
            column(YearReportingCode_AnnualStrategyWorkplan; "Year Reporting Code")
            {
            }
            dataitem(StrategyWorkplanLines; "Strategy Workplan Lines")
            {
                DataItemLink = No = field(No), "Strategy Plan ID" = field("Strategy Plan ID");
                DataItemLinkReference = AnnualStrategyWorkplan;


                column(TotalSubactivitybudget_StrategyWorkplanLines; "Total Subactivity budget")
                {
                }
                column(AnnualTarget_WorkplanActivity; "Annual Target2")
                {
                }
                column(Outputs_WorkplanActivity; Outputs)
                {
                }
                column(PerformanceMeasures_WorkplanActivity; "Perfomance Indicator")
                {
                }
                column(Descriptions_WorkplanActivity; Descriptions)
                {
                }

                column(Subprog; Subprog)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    WActivity.Reset();
                    WActivity.SetRange(Code, "Activity ID");
                    if WActivity.FindFirst() then begin
                        Outputs := WActivity.Outputs;
                    end;


                    WorkplanBudgets.Reset();
                    WorkplanBudgets.SetRange("Strategy Plan ID", No);
                    WorkplanBudgets.SetRange("Activity ID", "Activity ID");
                    if WorkplanBudgets.FindFirst() then begin
                        DimVal.Reset();
                        DimVal.SetRange(Code, WorkplanBudgets."Shortcut Dimension 4 Code");
                        if DimVal.FindFirst() then
                            Subprog := DimVal.Name;
                    end;
                end;
            }
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
    var
        WorkplanBudgets: Record "Workplan Budget Line";
        BudgetItem: Code[20];
        TotalAmt, Q1, Q2, Q3, Q4 : Decimal;
        Outputs, Descriptions : Text[1080];
        WActivity: Record "Workplan Activity";
        KRA: Record "Strategic Theme";
        Objective: Record "Strategic Objective";
        Strat: Record Strategy;
        DimVal: Record "Dimension Value";
        OutcomeName, ObjectiveName, StrategyName, Subprog : Text;
}
