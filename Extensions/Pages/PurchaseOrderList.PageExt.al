PageExtension 52193677 pageextension52193677 extends "Purchase Order List" 
{
    actions
    {

        //Unsupported feature: Code Modification on "Statistics(Action 1102601028).OnAction".

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

