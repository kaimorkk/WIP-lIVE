PageExtension 52193649 pageextension52193649 extends "Service Hist. Bill-to FactBox" 
{

    //Unsupported feature: Code Modification on "OnFindRecord".

    //trigger OnFindRecord()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        NoOfQuotes := 0;
        NoOfOrders := 0;
        NoOfInvoices := 0;
        NoOfCreditMemos := 0;
        NoOfPostedShipments := 0;
        NoOfPostedInvoices := 0;
        NoOfPostedCreditMemos := 0;

        IF FIND(Which) THEN BEGIN
          FILTERGROUP(4);
          SETFILTER("No.",GetBillToCustomerNo);
          FILTERGROUP(0);
        END;

        EXIT(FIND(Which));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
        EXIT(FIND(Which));
        */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
        /*
        CalcNoOfBillRecords;
        */
    //end;
}

