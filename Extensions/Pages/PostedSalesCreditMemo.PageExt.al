PageExtension 52193470 pageextension52193470 extends "Posted Sales Credit Memo" 
{
    actions
    {

        //Unsupported feature: Code Modification on ""&Email"(Action 11).OnAction".

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

