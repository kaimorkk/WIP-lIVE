PageExtension 52193629 pageextension52193629 extends "Purchase Analysis Report" 
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

            CLEAR(PurchAnalysisMatrix);
            PurchAnalysisMatrix.Load(AnalysisColumn,MatrixColumnCaptions,FirstLineNo,LastLineNo);
            PurchAnalysisMatrix.SETTABLEVIEW(AnalysisLine);
            PurchAnalysisMatrix.RUNMODAL;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..7
            PurchAnalysisMatrix.Load(AnalysisColumn,MatrixColumnCaptions,ShowError,FirstLineNo,LastLineNo);
            PurchAnalysisMatrix.SETTABLEVIEW(AnalysisLine);
            PurchAnalysisMatrix.RUNMODAL;
            */
        //end;
    }

    var
        ShowError: Option "None","Division by Zero","Period Error","Invalid Formula","Cyclic Formula",All;


    //Unsupported feature: Code Modification on "SetPointsAnalysisColumn(PROCEDURE 22)".

    //procedure SetPointsAnalysisColumn();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        AnalysisColumn2.SETRANGE("Analysis Area",AnalysisColumn2."Analysis Area"::Purchase);
        AnalysisColumn2.SETRANGE("Analysis Column Template",CurrentColumnTemplate);

        IF (Direction = Direction::Forward) OR
           (FirstColumn = '')
        THEN BEGIN
          IF LastColumn = '' THEN BEGIN
            IF AnalysisColumn2.FIND('-') THEN;
            tmpFirstColumn := AnalysisColumn2."Column Header";
            tmpFirstLineNo := AnalysisColumn2."Line No.";
            AnalysisColumn2.NEXT(NoOfColumns - 1);
            tmpLastColumn := AnalysisColumn2."Column Header";
            tmpLastLineNo := AnalysisColumn2."Line No.";
          END ELSE BEGIN
            IF AnalysisColumn2.GET(AnalysisColumn2."Analysis Area"::Purchase,CurrentColumnTemplate,LastLineNo) THEN;
            AnalysisColumn2.NEXT(1);
            tmpFirstColumn := AnalysisColumn2."Column Header";
            tmpFirstLineNo := AnalysisColumn2."Line No.";
            AnalysisColumn2.NEXT(NoOfColumns - 1);
            tmpLastColumn := AnalysisColumn2."Column Header";
            tmpLastLineNo := AnalysisColumn2."Line No.";
          END;
        END ELSE BEGIN
          IF AnalysisColumn2.GET(AnalysisColumn2."Analysis Area"::Purchase,CurrentColumnTemplate,FirstLineNo) THEN;
          AnalysisColumn2.NEXT(-1);
          tmpLastColumn := AnalysisColumn2."Column Header";
          tmpLastLineNo := AnalysisColumn2."Line No.";
          AnalysisColumn2.NEXT(-NoOfColumns + 1);
          tmpFirstColumn := AnalysisColumn2."Column Header";
          tmpFirstLineNo := AnalysisColumn2."Line No.";
        END;

        #33..38
        LastColumn := tmpLastColumn;
        FirstLineNo := tmpFirstLineNo;
        LastLineNo := tmpLastLineNo;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
            tmpFirstColumn := AnalysisColumn2."Column No.";
            tmpFirstLineNo := AnalysisColumn2."Line No.";
            AnalysisColumn2.NEXT(NoOfColumns - 1);
            tmpLastColumn := AnalysisColumn2."Column No.";
        #13..16
            tmpFirstColumn := AnalysisColumn2."Column No.";
            tmpFirstLineNo := AnalysisColumn2."Line No.";
            AnalysisColumn2.NEXT(NoOfColumns - 1);
            tmpLastColumn := AnalysisColumn2."Column No.";
        #21..25
          tmpLastColumn := AnalysisColumn2."Column No.";
          tmpLastLineNo := AnalysisColumn2."Line No.";
          AnalysisColumn2.NEXT(-NoOfColumns + 1);
          tmpFirstColumn := AnalysisColumn2."Column No.";
        #30..41
        */
    //end;
}

