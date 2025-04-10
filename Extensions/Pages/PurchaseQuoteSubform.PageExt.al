PageExtension 52193460 pageextension52193460 extends "Purchase Quote Subform" 
{
    layout
    {

        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Invoice Discount Amount"(Control 33)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Excl. VAT"(Control 11)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total VAT Amount"(Control 13)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Incl. VAT"(Control 7)".


        //Unsupported feature: Code Modification on "RefreshTotals(Control 9).OnDrillDown".

        //trigger OnDrillDown()
        //>>>> ORIGINAL CODE:
        //begin
            /*
            DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalPurchaseLine);
            DocumentTotals.PurchaseUpdateTotalsControls(Rec,TotalPurchaseHeader,TotalPurchaseLine,RefreshMessageEnabled,
              TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalPurchaseLine);
            CurrPage.UPDATE(FALSE);
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ShowShortcutDimCode(ShortcutDimCode);
        CLEAR(DocumentTotals);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ShowShortcutDimCode(ShortcutDimCode);
        */
    //end;
}

