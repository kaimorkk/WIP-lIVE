PageExtension 52193607 pageextension52193607 extends "Get Post.Doc - P.InvLn Subform" 
{

    //Unsupported feature: Code Modification on "IsShowRec(PROCEDURE 3)".

    //procedure IsShowRec();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH PurchInvLine2 DO BEGIN
          RemainingQty := 0;
          IF "Document No." <> PurchInvHeader."No." THEN
            PurchInvHeader.GET("Document No.");
          IF PurchInvHeader."Prepayment Invoice" THEN
            EXIT(FALSE);
          IF RevQtyFilter THEN BEGIN
            IF PurchInvHeader."Currency Code" <> ToPurchHeader."Currency Code" THEN
              EXIT(FALSE);
        #10..18
            EXIT(TRUE);
          EXIT(RemainingQty > 0);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        #7..21
        */
    //end;
}

