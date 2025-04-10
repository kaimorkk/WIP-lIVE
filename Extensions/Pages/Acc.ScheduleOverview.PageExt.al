PageExtension 52193509 pageextension52193509 extends "Acc. Schedule Overview" 
{
    layout
    {

        //Unsupported feature: Property Deletion (Visible) on "UseAmtsInAddCurr(Control 44)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues1(Control 53)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues1(Control 53)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues1(Control 53)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues2(Control 59)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues2(Control 59)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues2(Control 59)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues3(Control 61)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues3(Control 61)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues3(Control 61)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues4(Control 63)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues4(Control 63)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues4(Control 63)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues5(Control 65)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues5(Control 65)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues5(Control 65)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues6(Control 81)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues6(Control 81)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues6(Control 81)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues7(Control 79)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues7(Control 79)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues7(Control 79)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues8(Control 77)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues8(Control 77)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues8(Control 77)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues9(Control 75)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues9(Control 75)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues9(Control 75)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues10(Control 73)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues10(Control 73)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues10(Control 73)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues11(Control 71)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues11(Control 71)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues11(Control 71)".


        //Unsupported feature: Property Deletion (AutoFormatType) on "ColumnValues12(Control 69)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on "ColumnValues12(Control 69)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ColumnValues12(Control 69)".


        //Unsupported feature: Code Modification on "Dim1Filter(Control 37).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SetDimFilters(1,Dim1Filter);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF Dim1Filter = '' THEN
              SETRANGE("Dimension 1 Filter")
            ELSE
              SETFILTER("Dimension 1 Filter",Dim1Filter);
            CurrPage.UPDATE;
            */
        //end;


        //Unsupported feature: Code Modification on "Dim2Filter(Control 36).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SetDimFilters(2,Dim2Filter);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF Dim2Filter = '' THEN
              SETRANGE("Dimension 2 Filter")
            ELSE
              SETFILTER("Dimension 2 Filter",Dim2Filter);
            CurrPage.UPDATE;
            */
        //end;


        //Unsupported feature: Code Modification on "Dim3Filter(Control 39).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SetDimFilters(3,Dim3Filter);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF Dim3Filter = '' THEN
              SETRANGE("Dimension 3 Filter")
            ELSE
              SETFILTER("Dimension 3 Filter",Dim3Filter);
            CurrPage.UPDATE;
            */
        //end;


        //Unsupported feature: Code Modification on "Dim4Filter(Control 38).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SetDimFilters(4,Dim4Filter);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF Dim4Filter = '' THEN
              SETRANGE("Dimension 4 Filter")
            ELSE
              SETFILTER("Dimension 4 Filter",Dim4Filter);
            CurrPage.UPDATE;
            */
        //end;
    }
    actions
    {
        modify(Recalculate)
        {
            Visible = false;
        }
    }


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CLEAR(ColumnValues);

        IF (Totaling = '') OR (NOT TempColumnLayout.FINDSET) THEN
          EXIT;

        REPEAT
          ColumnNo := ColumnNo + 1;
          IF (ColumnNo > ColumnOffset) AND (ColumnNo - ColumnOffset <= ARRAYLEN(ColumnValues)) THEN BEGIN
            ColumnValues[ColumnNo - ColumnOffset] :=
              RoundNone(
                MatrixMgt.RoundValue(
                  AccSchedManagement.CalcCell(Rec,TempColumnLayout,UseAmtsInAddCurr),
                  TempColumnLayout."Rounding Factor"),
                TempColumnLayout."Rounding Factor");
            ColumnLayoutArr[ColumnNo - ColumnOffset] := TempColumnLayout;
            GetStyle(ColumnNo - ColumnOffset,"Line No.",TempColumnLayout."Line No.");
          END;
        UNTIL TempColumnLayout.NEXT = 0;
        AccSchedManagement.ForceRecalculate(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..9
              AccSchedManagement.RoundValue(
                AccSchedManagement.CalcCell(Rec,TempColumnLayout,UseAmtsInAddCurr),
                TempColumnLayout);
            ColumnLayoutArr[ColumnNo - ColumnOffset] := TempColumnLayout;
          END;
        UNTIL TempColumnLayout.NEXT = 0;
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        UseAmtsInAddCurr := FALSE;
        GLSetup.GET;
        UseAmtsInAddCurrVisible := GLSetup."Additional Reporting Currency" <> '';
        IF NewCurrentSchedName <> '' THEN
          CurrentSchedName := NewCurrentSchedName;
        IF CurrentSchedName = '' THEN
        #7..38
        SETRANGE("G/L Budget Filter");
        UpdateDimFilterControls;
        DateFilter := GETFILTER("Date Filter");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        GLSetup.GET;
        #4..41
        */
    //end;


    //Unsupported feature: Code Modification on "DrillDown(PROCEDURE 5)".

    //procedure DrillDown();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TempColumnLayout := ColumnLayoutArr[ColumnNo];
        AccSchedManagement.DrillDownFromOverviewPage(TempColumnLayout,Rec,PeriodType);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        TempColumnLayout := ColumnLayoutArr[ColumnNo];
        AccSchedManagement.DrillDown(TempColumnLayout,Rec,PeriodType);
        */
    //end;
}

