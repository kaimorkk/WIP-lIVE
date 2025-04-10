PageExtension 52193492 pageextension52193492 extends "Sales Order Statistics" 
{
    layout
    {

        //Unsupported feature: Property Modification (Name) on "VATAmount(Control 16)".

    }

    //Unsupported feature: Property Modification (TextConstString) on "UpdateInvDiscountQst(Variable 1056)".

    //var
        //>>>> ORIGINAL VALUE:
        //UpdateInvDiscountQst : ENU=One or more lines have been invoiced. The discount distributed to invoiced lines will not be taken into account.\\Do you want to update the invoice discount?;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //UpdateInvDiscountQst : ENU=There are one or more invoiced lines.\Do you want to update the invoice discount?;
        //Variable type has not been exported.


    //Unsupported feature: Code Modification on "RefreshOnAfterGetRecord(PROCEDURE 10)".

    //procedure RefreshOnAfterGetRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.CAPTION(STRSUBSTNO(Text000,"Document Type"));

        IF PrevNo = "No." THEN
        #4..82
        TempVATAmountLine4.MODIFYALL(Modified,FALSE);

        PrevTab := -1;

        UpdateHeaderInfo(2,TempVATAmountLine2);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..85
        */
    //end;
}

