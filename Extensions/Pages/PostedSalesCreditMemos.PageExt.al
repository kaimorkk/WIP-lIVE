PageExtension 52193472 pageextension52193472 extends "Posted Sales Credit Memos" 
{
    actions
    {

        //Unsupported feature: Code Modification on ""&Email"(Action 3).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SalesCrMemoHeader := Rec;
            CurrPage.SETSELECTIONFILTER(SalesCrMemoHeader);
            SalesCrMemoHeader.EmailRecords;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            SalesCrMemoHeader := Rec;
            CurrPage.SETSELECTIONFILTER(SalesCrMemoHeader);
            SalesCrMemoHeader.EmailRecords(TRUE);
            */
        //end;
    }
}

