PageExtension 52193475 pageextension52193475 extends "Purchase Statistics" 
{

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.CAPTION(STRSUBSTNO(Text000,"Document Type"));
        IF PrevNo = "No." THEN BEGIN
          GetVATSpecification;
          EXIT;
        END;
        PrevNo := "No.";
        FILTERGROUP(2);
        SETRANGE("No.",PrevNo);
        #9..33
        PurchLine.CalcVATAmountLines(0,Rec,TempPurchLine,TempVATAmountLine);
        TempVATAmountLine.MODIFYALL(Modified,FALSE);
        SetVATSpecification;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CurrPage.CAPTION(STRSUBSTNO(Text000,"Document Type"));
        IF PrevNo = "No." THEN
          EXIT;
        #6..36
        */
    //end;
}

