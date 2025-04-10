PageExtension 52193622 pageextension52193622 extends "Sales Return Order Subform" 
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

        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Invoice Discount Amount"(Control 31)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Excl. VAT"(Control 13)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total VAT Amount"(Control 11)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Incl. VAT"(Control 9)".

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
}

