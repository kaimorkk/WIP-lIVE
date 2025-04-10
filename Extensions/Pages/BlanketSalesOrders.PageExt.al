PageExtension 52193674 pageextension52193674 extends "Blanket Sales Orders" 
{
    actions
    {

        //Unsupported feature: Code Modification on "Statistics(Action 1102601017).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            OpenSalesOrderStatistics;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CalcInvDiscForHeader;
            COMMIT;
            PAGE.RUNMODAL(PAGE::"Sales Order Statistics",Rec);
            */
        //end;
    }
}

