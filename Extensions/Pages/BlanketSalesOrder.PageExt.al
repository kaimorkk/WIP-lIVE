PageExtension 52193512 pageextension52193512 extends "Blanket Sales Order" 
{
    layout
    {
        modify("External Document No.")
        {
            Visible = false;
        }
    }
    actions
    {

        //Unsupported feature: Code Modification on "Statistics(Action 61).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            OpenSalesOrderStatistics;
            SalesCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CalcInvDiscForHeader;
            COMMIT;
            PAGE.RUNMODAL(PAGE::"Sales Order Statistics",Rec);
            SalesCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
            */
        //end;
    }
}

