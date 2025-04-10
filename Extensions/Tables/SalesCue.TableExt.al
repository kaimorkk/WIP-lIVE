TableExtension 52193808 tableextension52193808 extends "Sales Cue" 
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Partially Shipped"(Field 8)".

    }

    //Unsupported feature: Code Modification on "CountOrders(PROCEDURE 9)".

    //procedure CountOrders();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CountSalesOrders.SETRANGE(Status,CountSalesOrders.Status::Released);
        CountSalesOrders.SETRANGE(Completely_Shipped,FALSE);
        FILTERGROUP(2);
        CountSalesOrders.SETFILTER(Responsibility_Center,GETFILTER("Responsibility Center Filter"));
        FILTERGROUP(0);

        CASE FieldNumber OF
          FIELDNO("Ready to Ship"):
            BEGIN
              CountSalesOrders.SETRANGE(Ship);
              CountSalesOrders.SETFILTER(Shipment_Date,GETFILTER("Date Filter2"));
            END;
          FIELDNO("Partially Shipped"):
            BEGIN
              CountSalesOrders.SETRANGE(Shipped,TRUE);
              CountSalesOrders.SETFILTER(Shipment_Date,GETFILTER("Date Filter2"));
            END;
          FIELDNO(Delayed):
            BEGIN
              CountSalesOrders.SETRANGE(Ship);
              CountSalesOrders.SETRANGE(Shipment_Date,0D);
              CountSalesOrders.OPEN;
              CountSalesOrders.READ;
              SalesOrderWithBlankShipmentDateCount := CountSalesOrders.Count_Orders;
              CountSalesOrders.SETFILTER(Shipment_Date,GETFILTER("Date Filter"));
            END;
        END;
        CountSalesOrders.OPEN;
        CountSalesOrders.READ;
        EXIT(CountSalesOrders.Count_Orders - SalesOrderWithBlankShipmentDateCount);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #7..14
              CountSalesOrders.SETRANGE(Ship,TRUE);
        #16..20
        #25..27
        #1..5
        CountSalesOrders.OPEN;
        CountSalesOrders.READ;
        EXIT(CountSalesOrders.Count_Orders);
        */
    //end;


    //Unsupported feature: Code Modification on "FilterOrders(PROCEDURE 11)".

    //procedure FilterOrders();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SalesHeader.SETRANGE("Document Type",SalesHeader."Document Type"::Order);
        SalesHeader.SETRANGE(Status,SalesHeader.Status::Released);
        SalesHeader.SETRANGE("Completely Shipped",FALSE);
        #4..8
            END;
          FIELDNO("Partially Shipped"):
            BEGIN
              SalesHeader.SETRANGE(Shipped,TRUE);
              SalesHeader.SETFILTER("Shipment Date",GETFILTER("Date Filter2"));
            END;
          FIELDNO(Delayed):
            BEGIN
              SalesHeader.SETRANGE(Ship);
              SalesHeader.SETFILTER("Shipment Date",GETFILTER("Date Filter"));
              SalesHeader.FILTERGROUP(2);
              SalesHeader.SETFILTER("Shipment Date",'<>%1',0D);
              SalesHeader.FILTERGROUP(0);
            END;
        END;
        FILTERGROUP(2);
        SalesHeader.SETFILTER("Responsibility Center",GETFILTER("Responsibility Center Filter"));
        FILTERGROUP(0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..11
              SalesHeader.SETRANGE(Ship,TRUE);
        #13..18
        #22..26
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "CountOrders(PROCEDURE 9).SalesOrderWithBlankShipmentDateCount(Variable 1002)".

}

