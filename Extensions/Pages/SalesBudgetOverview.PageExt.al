PageExtension 52193632 pageextension52193632 extends "Sales Budget Overview" 
{
    actions
    {

        //Unsupported feature: Code Modification on ""Create New Document"(Action 38).OnAction".

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


        //Unsupported feature: Code Modification on ""Update Existing Document"(Action 4).OnAction".

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

