PageExtension 52193618 pageextension52193618 extends "Service Statistics" 
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
        #10..65
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
        #7..68
        */
    //end;
}

