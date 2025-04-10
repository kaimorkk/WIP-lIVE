PageExtension 52193630 pageextension52193630 extends "Inventory Analysis Report" 
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

            CLEAR(InvtAnalysisMatrix);
            InvtAnalysisMatrix.Load(AnalysisColumn,MatrixColumnCaptions,FirstLineNo,LastLineNo);
            InvtAnalysisMatrix.SETTABLEVIEW(AnalysisLine);
            InvtAnalysisMatrix.RUNMODAL;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..7
            InvtAnalysisMatrix.Load(AnalysisColumn,MatrixColumnCaptions,ShowError,FirstLineNo,LastLineNo);
            InvtAnalysisMatrix.SETTABLEVIEW(AnalysisLine);
            InvtAnalysisMatrix.RUNMODAL;
            */
        //end;
    }

    var
        ShowError: Option "None","Division by Zero","Period Error","Invalid Formula","Cyclic Formula",All;
}

