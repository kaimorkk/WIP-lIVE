PageExtension 52193476 pageextension52193476 extends "Acc. Sched. KPI Web Service" 
{

    //Unsupported feature: Code Modification on "InitSetupData(PROCEDURE 1)".

    //procedure InitSetupData();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NOT GUIALLOWED THEN
          WORKDATE := LogInManagement.GetDefaultWorkDate;
        AccSchedKPIWebSrvSetup.GET;
        AccSchedKPIWebSrvSetup.TestValues;
        AccSchedKPIWebSrvLine.FINDSET;
        #6..37
        AccSchedKPIWebSrvSetup.GetPeriodLength(NoOfLines,StartDate,EndDate);
        NoOfLines *= NoOfActiveAccSchedLines;
        LastClosedDate := AccSchedKPIWebSrvSetup.GetLastClosedAccDate;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #3..40
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "InitSetupData(PROCEDURE 1).LogInManagement(Variable 1002)".

}

