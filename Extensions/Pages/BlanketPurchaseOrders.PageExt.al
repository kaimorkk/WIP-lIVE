PageExtension 52193679 pageextension52193679 extends "Blanket Purchase Orders" 
{
    actions
    {

        //Unsupported feature: Code Modification on "Statistics(Action 1102601015).OnAction".

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

