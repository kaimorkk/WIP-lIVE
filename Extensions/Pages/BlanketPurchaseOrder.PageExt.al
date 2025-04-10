PageExtension 52193514 pageextension52193514 extends "Blanket Purchase Order" 
{
    layout
    {

        //Unsupported feature: Property Modification (SubPageLink) on "Control1904651607(Control 1904651607)".

    }
    actions
    {

        //Unsupported feature: Code Modification on "Statistics(Action 63).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            OpenPurchaseOrderStatistics;
            PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CalcInvDiscForHeader;
            COMMIT;
            PAGE.RUNMODAL(PAGE::"Purchase Order Statistics",Rec);
            PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
            */
        //end;
    }
}

