PageExtension 52193474 pageextension52193474 extends "Sales Statistics" 
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
        #9..48
        SalesLine.CalcVATAmountLines(0,Rec,TempSalesLine,TempVATAmountLine);
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
        #6..51
        */
    //end;
}

