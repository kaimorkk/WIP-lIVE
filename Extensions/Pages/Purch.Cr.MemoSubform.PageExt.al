PageExtension 52193461 pageextension52193461 extends "Purch. Cr. Memo Subform" 
{
    layout
    {

        //Unsupported feature: Code Modification on "Type(Control 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            NoOnAfterValidate;
            TypeChosen := HasTypeToFillMandatotyFields;

            IF xRec."No." <> '' THEN
              RedistributeTotalsOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            NoOnAfterValidate;
            TypeChosen := Type <> Type::" ";
            #3..5
            */
        //end;

        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Invoice Discount Amount"(Control 39)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Excl. VAT"(Control 21)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total VAT Amount"(Control 19)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Incl. VAT"(Control 17)".



        //Unsupported feature: Code Modification on "RefreshTotals(Control 15).OnDrillDown".

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


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TypeChosen := HasTypeToFillMandatotyFields;
        IF PurchHeader.GET("Document Type","Document No.") THEN;

        DocumentTotals.PurchaseUpdateTotalsControls(Rec,TotalPurchaseHeader,TotalPurchaseLine,RefreshMessageEnabled,
          TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        TypeChosen := Type <> Type::" ";
        #2..5
        */
    //end;


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

