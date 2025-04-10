PageExtension 52193547 pageextension52193547 extends "Cost Budget per Period" 
{
    actions
    {

        //Unsupported feature: Code Modification on "ExportToExcel(Action 22).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CostBudgetEntry.SETFILTER("Budget Name",BudgetFilter);
            CostBudgetEntry.SETFILTER("Cost Center Code",CostCenterFilter);
            CostBudgetEntry.SETFILTER("Cost Object Code",CostObjectFilter);
            ExportCostBudgetToExcel.SetParameters(RoundingFactor);
            ExportCostBudgetToExcel.SETTABLEVIEW(CostBudgetEntry);
            ExportCostBudgetToExcel.RUN;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..3
            REPORT.RUN(REPORT::"Export Cost Budget to Excel",TRUE,FALSE,CostBudgetEntry);
            */
        //end;
    }
}

