PageExtension 52193458 pageextension52193458 extends "Sales Quote Subform" 
{
    layout
    {

        //Unsupported feature: Code Modification on "Type(Control 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TypeOnAfterValidate;
            NoOnAfterValidate;
            TypeChosen := HasTypeToFillMandatotyFields;

            IF xRec."No." <> '' THEN
              RedistributeTotalsOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            TypeOnAfterValidate;
            NoOnAfterValidate;
            TypeChosen := Type <> Type::" ";
            #4..6
            */
        //end;

        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Invoice Discount Amount"(Control 47)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Excl. VAT"(Control 33)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total VAT Amount"(Control 31)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Incl. VAT"(Control 29)".



        //Unsupported feature: Code Modification on "RefreshTotals(Control 27).OnDrillDown".

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
    actions
    {

        //Unsupported feature: Property Modification (Name) on ""Insert Ext. Text"(Action 17)".

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

