PageExtension 52193459 pageextension52193459 extends "Sales Cr. Memo Subform" 
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

        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Invoice Discount Amount"(Control 33)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Excl. VAT"(Control 15)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total VAT Amount"(Control 13)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Incl. VAT"(Control 11)".



        //Unsupported feature: Code Modification on "RefreshTotals(Control 9).OnDrillDown".

        //trigger OnDrillDown()
        //>>>> ORIGINAL CODE:
        //begin
            /*
            DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalSalesLine);
            DocumentTotals.SalesUpdateTotalsControls(Rec,TotalSalesHeader,TotalSalesLine,RefreshMessageEnabled,
              TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalSalesLine);
            CurrPage.UPDATE(FALSE);
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF SalesHeader.GET("Document Type","Document No.") THEN;

        DocumentTotals.SalesUpdateTotalsControls(Rec,TotalSalesHeader,TotalSalesLine,RefreshMessageEnabled,
          TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);

        TypeChosen := HasTypeToFillMandatotyFields;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        TypeChosen := Type <> Type::" ";
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

