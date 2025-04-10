PageExtension 52193447 pageextension52193447 extends "Sales Order Subform" 
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
            SetLocationCodeMandatory;

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
            #4..7
            */
        //end;
        modify("Requested Delivery Date")
        {
            Visible = false;
        }
        modify("Promised Delivery Date")
        {
            Visible = false;
        }
        modify("Planned Delivery Date")
        {
            Visible = false;
        }
        modify("Planned Shipment Date")
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on ""Invoice Discount Amount"(Control 43).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SalesHeader.GET("Document Type","Document No.");
            IF SalesHeader.InvoicedLineExists THEN
              IF NOT CONFIRM(UpdateInvDiscountQst,FALSE) THEN
                EXIT;

            SalesCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalSalesLine."Inv. Discount Amount",SalesHeader);
            CurrPage.UPDATE(FALSE);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            SalesHeader.GET("Document Type","Document No.");
            SalesCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalSalesLine."Inv. Discount Amount",SalesHeader);
            CurrPage.UPDATE(FALSE);
            */
        //end;

        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Invoice Discount Amount"(Control 43)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Excl. VAT"(Control 27)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total VAT Amount"(Control 25)".


        //Unsupported feature: Property Deletion (AutoFormatExpr) on ""Total Amount Incl. VAT"(Control 23)".



        //Unsupported feature: Code Modification on "RefreshTotals(Control 61).OnDrillDown".

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
        SetLocationCodeMandatory;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        TypeChosen := Type <> Type::" ";
        SetLocationCodeMandatory;
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


    //Unsupported feature: Code Modification on "NoOnAfterValidate(PROCEDURE 19066594)".

    //procedure NoOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
           (xRec."No." <> '')
        THEN
          CurrPage.SAVERECORD;

        SaveAndAutoAsmToOrder;

        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          IF ("Outstanding Qty. (Base)" <> 0) AND ("No." <> xRec."No.") THEN BEGIN
            AutoReserve;
            CurrPage.UPDATE(FALSE);
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("No." <> xRec."No.")
        THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "ShipmentDateOnAfterValidate(PROCEDURE 19068710)".

    //procedure ShipmentDateOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("Shipment Date" <> xRec."Shipment Date")
        THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END ELSE
          CurrPage.UPDATE(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
        END;
        */
    //end;
}

