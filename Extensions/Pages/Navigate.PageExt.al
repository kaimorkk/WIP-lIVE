PageExtension 52193487 pageextension52193487 extends Navigate 
{

    //Unsupported feature: Code Modification on "FindUnpostedSalesDocs(PROCEDURE 14)".

    //procedure FindUnpostedSalesDocs();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SalesHeader."SECURITYFILTERING"(SECURITYFILTER::Filtered);
        IF SalesHeader.READPERMISSION THEN BEGIN
          SalesHeader.RESET;
          SalesHeader.SETCURRENTKEY("Sell-to Customer No.","External Document No.");
          SalesHeader.SETFILTER("Sell-to Customer No.",ContactNo);
          SalesHeader.SETFILTER("External Document No.",ExtDocNo);
          SalesHeader.SETRANGE("Document Type",DocType);
          InsertIntoDocEntry(DATABASE::"Sales Header",DocType,DocTableName,SalesHeader.COUNT);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #2..9
        */
    //end;


    //Unsupported feature: Code Modification on "FindUnpostedServDocs(PROCEDURE 16)".

    //procedure FindUnpostedServDocs();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ServHeader."SECURITYFILTERING"(SECURITYFILTER::Filtered);
        IF ServHeader.READPERMISSION THEN BEGIN
          IF ExtDocNo = '' THEN BEGIN
            ServHeader.RESET;
        #5..7
            InsertIntoDocEntry(DATABASE::"Service Header",DocType,DocTableName,ServHeader.COUNT);
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #2..10
        */
    //end;

    //Unsupported feature: Property Deletion (SecurityFiltering) on "FindExtRecords(PROCEDURE 8).VendLedgEntry2(Variable 1000)".


    //Unsupported feature: Property Deletion (SecurityFiltering) on "GetPageId(PROCEDURE 29).MiniPagesMapping(Variable 1001)".

}

