PageExtension 52193545 pageextension52193545 extends "Job Invoices" 
{

    //Unsupported feature: Code Modification on "SetPrJob(PROCEDURE 1)".

    //procedure SetPrJob();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DetailLevel := DetailLevel::"Per Job";
        JobNo := Job."No.";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        DetailLevel := DetailLevel::"Per Job";
        JobNo := Job."No.";
        ShowDetails := FALSE;
        */
    //end;


    //Unsupported feature: Code Modification on "SetPrJobTask(PROCEDURE 2)".

    //procedure SetPrJobTask();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DetailLevel := DetailLevel::"Per Job Task";
        JobNo := JobTask."Job No.";
        JobTaskNo := JobTask."Job Task No.";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        ShowDetails := FALSE;
        */
    //end;


    //Unsupported feature: Code Modification on "SetPrJobPlanningLine(PROCEDURE 3)".

    //procedure SetPrJobPlanningLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DetailLevel := DetailLevel::"Per Job Planning Line";
        JobNo := JobPlanningLine."Job No.";
        JobTaskNo := JobPlanningLine."Job Task No.";
        JobPlanningLineNo := JobPlanningLine."Line No.";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        ShowDetails := FALSE;
        */
    //end;
}

