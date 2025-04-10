PageExtension 52193631 pageextension52193631 extends "Purchase Budget Overview" 
{
    actions
    {

        //Unsupported feature: Code Modification on ""Create New Document"(Action 42).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ExportItemBudgetToExcel.SetOptions(
              CurrentAnalysisArea,
              CurrentBudgetName,
            #4..7
              SourceTypeFilter,SourceNoFilter,
              ItemFilter,
              InternalDateFilter,PeriodInitialized,PeriodType,
              LineDimOption,ColumnDimOption,LineDimCode,ColumnDimCode,RoundingFactor);
            ExportItemBudgetToExcel.RUN;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..10
              LineDimOption,ColumnDimOption,LineDimCode,ColumnDimCode);
            ExportItemBudgetToExcel.RUN;
            */
        //end;


        //Unsupported feature: Code Modification on ""Update Existing Document"(Action 6).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ExportItemBudgetToExcel.SetOptions(
              CurrentAnalysisArea,
              CurrentBudgetName,
            #4..7
              SourceTypeFilter,SourceNoFilter,
              ItemFilter,
              InternalDateFilter,PeriodInitialized,PeriodType,
              LineDimOption,ColumnDimOption,LineDimCode,ColumnDimCode,RoundingFactor);
            ExportItemBudgetToExcel.SetUpdateExistingWorksheet(TRUE);
            ExportItemBudgetToExcel.RUN;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..10
              LineDimOption,ColumnDimOption,LineDimCode,ColumnDimCode);
            ExportItemBudgetToExcel.SetUpdateExistingWorksheet(TRUE);
            ExportItemBudgetToExcel.RUN;
            */
        //end;
    }

    //Unsupported feature: Property Deletion (SaveValues).

}

