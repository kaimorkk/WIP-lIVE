TableExtension 52193477 tableextension52193477 extends "Acc. Sched. KPI Web Srv. Setup" 
{
    fields
    {
        modify(Period)
        {
            OptionCaption = 'Fiscal Year - Last Locked Period,Current Fiscal Year,Current Calendar Year,Current Calendar Quarter,Current Month,Today,Current Period,Last Locked Period';

            //Unsupported feature: Property Modification (OptionString) on "Period(Field 4)".

        }
    }

    //Unsupported feature: Code Modification on "GetPeriodLength(PROCEDURE 7)".

    //procedure GetPeriodLength();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE Period OF
          Period::"Fiscal Year - Last Locked Period":
            GetFiscalYear(GetLastClosedAccDate,StartDate,EndDate);
          Period::"Current Fiscal Year":
            GetFiscalYear(WORKDATE,StartDate,EndDate);
          Period::"Current Period":
            BEGIN
              AccountingPeriod.SETFILTER("Starting Date",'<=%1',WORKDATE);
              AccountingPeriod.FINDLAST;
              StartDate := AccountingPeriod."Starting Date";
              AccountingPeriod.SETRANGE("Starting Date");
              IF AccountingPeriod.FIND('>') THEN
                EndDate := AccountingPeriod."Starting Date" - 1
              ELSE
                EndDate := CALCDATE('<CM>',StartDate);
            END;
          Period::"Last Locked Period":
            BEGIN
              AccountingPeriod.SETFILTER("Starting Date",'<=%1',GetLastClosedAccDate);
              AccountingPeriod.FINDLAST;
              StartDate := AccountingPeriod."Starting Date";
              AccountingPeriod.SETRANGE("Starting Date");
              IF AccountingPeriod.FIND('>') THEN
                EndDate := AccountingPeriod."Starting Date" - 1
              ELSE
                EndDate := CALCDATE('<CM>',StartDate);
            END;
          Period::"Current Calendar Year":
            BEGIN
              StartDate := CALCDATE('<-CY>',WORKDATE);
              EndDate := CALCDATE('<CY>',StartDate);
            END;
          Period::"Current Calendar Quarter":
            BEGIN
              StartDate := CALCDATE('<-CQ>',WORKDATE);
              EndDate := CALCDATE('<CQ>',StartDate);
            END;
          Period::"Current Month":
            BEGIN
              StartDate := CALCDATE('<-CM>',WORKDATE);
              EndDate := CALCDATE('<CM>',StartDate);
            END;
          Period::Today:
            BEGIN
              StartDate := WORKDATE;
              EndDate := WORKDATE;
            END;
          Period::"Current Fiscal Year + 3 Previous Years":
            BEGIN
              GetFiscalYear(WORKDATE,StartDate,EndDate);
              StartDate := CALCDATE('<-3Y>',StartDate);
              AccountingPeriod.SETRANGE("New Fiscal Year",TRUE);
              AccountingPeriod.FINDFIRST; // Get oldest accounting year
              IF AccountingPeriod."Starting Date" > StartDate THEN
                StartDate := AccountingPeriod."Starting Date";
            END;
        END;
        TotalNoOfDays := EndDate - StartDate + 1;

        CASE "View By" OF
          "View By"::Period:
            NoOfDaysPerLine := TotalNoOfDays;
          "View By"::Year:
            NoOfDaysPerLine := TotalNoOfDays;
          "View By"::Quarter:
            NoOfDaysPerLine := 90;
          "View By"::Month:
            NoOfDaysPerLine := 30;
          "View By"::Week:
            NoOfDaysPerLine := 7;
          "View By"::Day:
            NoOfDaysPerLine := 1;
        END;

        NoOfLines := TotalNoOfDays DIV NoOfDaysPerLine;
        IF NoOfLines = 0 THEN
          NoOfLines := 1;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..47
        #57..77
        */
    //end;


    //Unsupported feature: Code Modification on "GetFiscalYear(PROCEDURE 13)".

    //procedure GetFiscalYear();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        StartDate := Date;
        AccountingPeriod.SETFILTER("Starting Date",'<=%1',Date);
        AccountingPeriod.SETRANGE("New Fiscal Year",TRUE);
        IF AccountingPeriod.FINDLAST THEN
          StartDate := AccountingPeriod."Starting Date";
        AccountingPeriod.SETRANGE("Starting Date");
        IF AccountingPeriod.FIND('>') THEN
          EndDate := AccountingPeriod."Starting Date" - 1
        ELSE
          EndDate := CALCDATE('<1Y-1D>',StartDate);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        AccountingPeriod.SETFILTER("Starting Date",'<=%1',Date);
        AccountingPeriod.SETRANGE("New Fiscal Year",TRUE);
        AccountingPeriod.FINDLAST;
        StartDate := AccountingPeriod."Starting Date";
        #6..9
          EndDate := CALCDATE('<CY>',StartDate);
        */
    //end;


    //Unsupported feature: Code Modification on "PublishWebService(PROCEDURE 8)".

    //procedure PublishWebService();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TESTFIELD("Web Service Name");
        DeleteWebService;
        WebServiceManagement.CreateWebService(WebService."Object Type"::Page,
          PAGE::"Acc. Sched. KPI Web Service","Web Service Name",TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        TESTFIELD("Web Service Name");
        DeleteWebService;
        WebService.INIT;
        WebService."Object Type" := WebService."Object Type"::Page;
        WebService."Object ID" := PAGE::"Acc. Sched. KPI Web Service";
        WebService."Service Name" := "Web Service Name";
        WebService.Published := TRUE;
        WebService.INSERT;
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "PublishWebService(PROCEDURE 8).WebServiceManagement(Variable 1001)".

}

