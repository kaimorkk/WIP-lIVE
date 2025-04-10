PageExtension 52193465 pageextension52193465 extends Budget 
{
    actions
    {

        //Unsupported feature: Code Modification on ""Export to Excel"(Action 1102601005).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            GLBudgetEntry.SETFILTER("Budget Name",BudgetName);
            GLBudgetEntry.SETFILTER("Business Unit Code",BusUnitFilter);
            GLBudgetEntry.SETFILTER("G/L Account No.",GLAccFilter);
            #4..6
            GLBudgetEntry.SETFILTER("Budget Dimension 2 Code",BudgetDim2Filter);
            GLBudgetEntry.SETFILTER("Budget Dimension 3 Code",BudgetDim3Filter);
            GLBudgetEntry.SETFILTER("Budget Dimension 4 Code",BudgetDim4Filter);
            ExportBudgetToExcel.SetParameters(RoundingFactor);
            ExportBudgetToExcel.SETTABLEVIEW(GLBudgetEntry);
            ExportBudgetToExcel.RUN;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..9
            REPORT.RUN(REPORT::"Export Budget to Excel",TRUE,FALSE,GLBudgetEntry);
            */
        //end;
    }
}

