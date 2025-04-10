PageExtension 52193604 pageextension52193604 extends "Get Post.Doc - S.InvLn Subform" 
{

    //Unsupported feature: Code Modification on "IsShowRec(PROCEDURE 3)".

    //procedure IsShowRec();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH SalesInvLine2 DO BEGIN
          QtyNotReturned := 0;
          IF "Document No." <> SalesInvHeader."No." THEN
            SalesInvHeader.GET("Document No.");
          IF SalesInvHeader."Prepayment Invoice" THEN
            EXIT(FALSE);
          IF RevQtyFilter THEN BEGIN
            IF SalesInvHeader."Currency Code" <> ToSalesHeader."Currency Code" THEN
              EXIT(FALSE);
        #10..16
            EXIT(TRUE);
          EXIT(QtyNotReturned > 0);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        #7..19
        */
    //end;
}

