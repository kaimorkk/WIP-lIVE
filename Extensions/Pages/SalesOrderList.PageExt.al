PageExtension 52193676 pageextension52193676 extends "Sales Order List" 
{
    actions
    {

        //Unsupported feature: Code Modification on "Statistics(Action 1102601006).OnAction".

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

