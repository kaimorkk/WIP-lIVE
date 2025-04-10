PageExtension 52193680 pageextension52193680 extends "Purchase Return Order List" 
{
    actions
    {

        //Unsupported feature: Code Modification on "Statistics(Action 1102601027).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            OpenPurchaseOrderStatistics;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CalcInvDiscForHeader;
            COMMIT;
            PAGE.RUNMODAL(PAGE::"Purchase Order Statistics",Rec);
            */
        //end;
    }
}

