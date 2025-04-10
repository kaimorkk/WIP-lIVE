PageExtension 52193600 pageextension52193600 extends "Item Charge Assignment (Sales)" 
{

    //Unsupported feature: Code Modification on "QtytoAssignOnAfterValidate(PROCEDURE 19000177)".

    //procedure QtytoAssignOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.UPDATE(FALSE);
        UpdateQtyAssgnt;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CurrPage.UPDATE(TRUE);
        UpdateQtyAssgnt;
        */
    //end;
}

