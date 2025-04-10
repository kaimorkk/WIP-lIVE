PageExtension 52193628 pageextension52193628 extends "Sales Analysis Report" 
{
    layout
    {
        addafter(Filters)
        {
            group(Options)
            {
                Caption = 'Options';
                field(ShowError;ShowError)
                {
                    ApplicationArea = Basic;
                    Caption = 'Show Error';
                    OptionCaption = 'None,Division by Zero,Period Error,Invalid Formula,Cyclic Formula,All';
                }
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "ShowMatrix(Action 1).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SetFilters;
            CLEAR(MatrixColumnCaptions);
            FillMatrixColumns;
            CLEAR(SalesAnalysisMatrix);
            SalesAnalysisMatrix.Load(AnalysisColumn,MatrixColumnCaptions,FirstLineNo,LastLineNo);
            SalesAnalysisMatrix.SETTABLEVIEW(AnalysisLine);
            SalesAnalysisMatrix.RUNMODAL;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
            SalesAnalysisMatrix.Load(AnalysisColumn,MatrixColumnCaptions,ShowError,FirstLineNo,LastLineNo);
            SalesAnalysisMatrix.SETTABLEVIEW(AnalysisLine);
            SalesAnalysisMatrix.RUNMODAL;
            */
        //end;
    }

    var
        ShowError: Option "None","Division by Zero","Period Error","Invalid Formula","Cyclic Formula",All;


    //Unsupported feature: Code Modification on "FillMatrixColumns(PROCEDURE 8)".

    //procedure FillMatrixColumns();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        AnalysisColumn2.SETRANGE("Analysis Area",AnalysisColumn2."Analysis Area"::Sales);
        AnalysisColumn2.SETRANGE("Analysis Column Template",CurrentColumnTemplate);
        AnalysisColumn2.SETRANGE("Line No.",FirstLineNo,LastLineNo);
        AnalysisColumn2.SETFILTER(Show,'<>%1',AnalysisColumn2.Show::Never);
        i := 1;

        IF AnalysisColumn2.FINDSET THEN
          REPEAT
            MatrixColumnCaptions[i] := AnalysisColumn2."Column Header";
            i := i + 1;
          UNTIL (AnalysisColumn2.NEXT = 0) OR (i > ARRAYLEN(MatrixColumnCaptions));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        #5..11
        */
    //end;
}

