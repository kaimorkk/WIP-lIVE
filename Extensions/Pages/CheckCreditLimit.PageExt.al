PageExtension 52193486 pageextension52193486 extends "Check Credit Limit" 
{
    layout
    {

        //Unsupported feature: Property Modification (Name) on ""Balance Due (LCY)"(Control 21)".


        //Unsupported feature: Property Modification (SourceExpr) on ""Balance Due (LCY)"(Control 21)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Balance Due (LCY)"(Control 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Balance Due (LCY)"(Control 21)".


        //Unsupported feature: Property Deletion (Editable) on ""Balance Due (LCY)"(Control 21)".

    }

    //Unsupported feature: Code Modification on "SalesLineShowWarning(PROCEDURE 4)".

    //procedure SalesLineShowWarning();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SalesSetup.GET;
        IF SalesSetup."Credit Warnings" =
           SalesSetup."Credit Warnings"::"No Warning"
        #4..13
        ELSE
          OldOrderAmountLCY := 0;

        DeltaAmount := NewOrderAmountLCY - OldOrderAmountLCY;
        NewOrderAmountLCY :=
          DeltaAmount + SalesLineAmount(SalesLine."Document Type",SalesLine."Document No.");

        EXIT(ShowWarning(SalesHeader."Bill-to Customer No.",NewOrderAmountLCY,OldOrderAmountLCY,FALSE))
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..16
        IF SalesLine."Document Type" <> SalesLine."Document Type"::Order THEN
          DeltaAmount := NewOrderAmountLCY - OldOrderAmountLCY;
        #18..21
        */
    //end;


    //Unsupported feature: Code Modification on "ServiceLineShowWarning(PROCEDURE 10)".

    //procedure ServiceLineShowWarning();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SalesSetup.GET;
        IF SalesSetup."Credit Warnings" =
           SalesSetup."Credit Warnings"::"No Warning"
        #4..13
        ELSE
          OldOrderAmountLCY := 0;

        DeltaAmount := NewOrderAmountLCY - OldOrderAmountLCY;
        NewOrderAmountLCY :=
          DeltaAmount + ServLineAmount(ServLine."Document Type",ServLine."Document No.",ServLine);

        EXIT(ShowWarning(ServHeader."Bill-to Customer No.",NewOrderAmountLCY,OldOrderAmountLCY,FALSE))
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..16
        IF ServLine."Document Type" <> ServLine."Document Type"::Order THEN
          DeltaAmount := NewOrderAmountLCY - OldOrderAmountLCY;
        #18..21
        */
    //end;


    //Unsupported feature: Code Modification on "CalcCreditLimitLCY(PROCEDURE 6)".

    //procedure CalcCreditLimitLCY();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF GETFILTER("Date Filter") = '' THEN
          SETFILTER("Date Filter",'..%1',WORKDATE);
        CALCFIELDS("Balance (LCY)","Shipped Not Invoiced (LCY)","Serv Shipped Not Invoiced(LCY)");
        CalcReturnAmounts(OutstandingRetOrdersLCY,RcdNotInvdRetOrdersLCY);

        OrderAmountTotalLCY := CalcTotalOutstandingAmt - OutstandingRetOrdersLCY + DeltaAmount;
        ShippedRetRcdNotIndLCY := "Shipped Not Invoiced (LCY)" + "Serv Shipped Not Invoiced(LCY)" - RcdNotInvdRetOrdersLCY;
        IF "No." = CustNo THEN
          OrderAmountThisOrderLCY := NewOrderAmountLCY
        ELSE
          OrderAmountThisOrderLCY := 0;

        CustCreditAmountLCY :=
          "Balance (LCY)" + "Shipped Not Invoiced (LCY)" + "Serv Shipped Not Invoiced(LCY)" - RcdNotInvdRetOrdersLCY +
          OrderAmountTotalLCY - GetInvoicedPrepmtAmountLCY;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        OrderAmountTotalLCY := CalcTotalOutstandingAmt - OutstandingRetOrdersLCY;
        #7..14
          OrderAmountTotalLCY + DeltaAmount;
        */
    //end;
}

