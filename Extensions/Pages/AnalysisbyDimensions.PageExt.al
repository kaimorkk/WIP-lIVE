PageExtension 52193520 pageextension52193520 extends "Analysis by Dimensions" 
{
    actions
    {

        //Unsupported feature: Code Modification on "ShowMatrix(Action 19).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CLEAR(MatrixForm);

            IF GLAccountSource THEN
              CashFlowFilter := '';

            MatrixForm.Load(
              LineDimOption,ColumnDimOption,LineDimCode,ColumnDimCode,PeriodType,DateFilter,AccFilter,
            #8..11
              ColumnCaptions,PrimaryKeyFirstColInSet);

            MatrixForm.RUNMODAL;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CLEAR(MatrixForm);

            IF GLAccountSource THEN BEGIN
              CashFlowFilter := '';
              ShowInAddCurr := FALSE;
            END;
            #5..14
            */
        //end;
    }


    //Unsupported feature: Code Modification on "FindRec(PROCEDURE 59)".

    //procedure FindRec();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE DimOption OF
          DimOption::"G/L Account":
            BEGIN
        #4..25
              IF DateFilter <> '' THEN
                Period.SETFILTER("Period Start",DateFilter)
              ELSE
                IF InternalDateFilter <> '' THEN
                  Period.SETFILTER("Period Start",InternalDateFilter);
              Found := PeriodFormMgt.FindDate(Which,Period,PeriodType);
              IF Found THEN
        #33..95
            END;
        END;
        EXIT(Found);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..28
                IF NOT PeriodInitialized AND (InternalDateFilter <> '') THEN
        #30..98
        */
    //end;


    //Unsupported feature: Code Modification on "ValidateLineDimCode(PROCEDURE 19)".

    //procedure ValidateLineDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetAccountCaption(AccountCaption,UnitCaption);

        IF (UPPERCASE(LineDimCode) <> UPPERCASE(AccountCaption)) AND
        #4..17
          DateFilter := InternalDateFilter;
          IF STRPOS(DateFilter,'&') > 1 THEN
            DateFilter := COPYSTR(DateFilter,1,STRPOS(DateFilter,'&') - 1);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..20
        END ELSE
          PeriodInitialized := FALSE;
        */
    //end;
}

