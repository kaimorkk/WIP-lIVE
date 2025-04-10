PageExtension 52193546 pageextension52193546 extends "Copy Job" 
{

    //Unsupported feature: Code Modification on "ValidateUserInput(PROCEDURE 1)".

    //procedure ValidateUserInput();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF (SourceJobNo = '') OR NOT SourceJob.GET(SourceJob."No.") THEN
          ERROR(Text004,SourceJob.TABLECAPTION);

        JobsSetup.GET;
        JobsSetup.TESTFIELD("Job Nos.");
        IF TargetJobNo = '' THEN BEGIN
          TargetJobNo := NoSeriesManagement.GetNextNo(JobsSetup."Job Nos.",0D,TRUE);
          IF NOT CONFIRM(Text002,TRUE,TargetJobNo) THEN BEGIN
            TargetJobNo := '';
            ERROR('');
          END;
        END ELSE
          NoSeriesManagement.TestManual(JobsSetup."Job Nos.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        IF TargetJobNo = '' THEN BEGIN
          JobsSetup.GET;
          JobsSetup.TESTFIELD("Job Nos.");
        #7..11
        END;
        */
    //end;
}

