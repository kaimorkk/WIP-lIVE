TableExtension 52193565 tableextension52193565 extends "IC Inbox Transaction" 
{

    //Unsupported feature: Code Modification on "InboxCheckAccept(PROCEDURE 40)".

    //procedure InboxCheckAccept();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        HandledICInboxTrans.SETRANGE("IC Partner Code","IC Partner Code");
        HandledICInboxTrans.SETRANGE("Document Type","Document Type");
        HandledICInboxTrans.SETRANGE("Source Type","Source Type");
        #4..21
        THEN BEGIN
          ICInboxPurchHeader.GET("Transaction No.","IC Partner Code","Transaction Source");
          IF ICInboxPurchHeader."Your Reference" <> '' THEN BEGIN
            PurchHeader.SETRANGE("Your Reference",ICInboxPurchHeader."Your Reference");
            IF PurchHeader.FINDFIRST THEN
              MESSAGE(Text003,ICInboxPurchHeader."IC Transaction No.",ICInboxPurchHeader."Your Reference")
            ELSE BEGIN
              PurchInvHeader.SETRANGE("Your Reference",ICInboxPurchHeader."Your Reference");
              IF PurchInvHeader.FINDFIRST THEN
                IF NOT CONFIRM(Text004,TRUE,ICInboxPurchHeader."Your Reference",ICInboxPurchHeader."IC Transaction No.") THEN
                  "Line Action" := xRec."Line Action";
            END;
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..24
            PurchHeader.SETRANGE("No.",ICInboxPurchHeader."Your Reference");
        #26..28
              PurchInvHeader.SETCURRENTKEY("Order No.");
              PurchInvHeader.SETRANGE("Order No.",ICInboxPurchHeader."Your Reference");
        #30..35
        */
    //end;
}

