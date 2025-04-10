PageExtension 52193675 pageextension52193675 extends "Sales Return Order List" 
{
    actions
    {

        //Unsupported feature: Code Modification on "Statistics(Action 1102601028).OnAction".

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

