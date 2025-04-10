PageExtension 52193626 pageextension52193626 extends "Purchase Prices" 
{

    //Unsupported feature: Code Modification on "SetRecFilters(PROCEDURE 1)".

    //procedure SetRecFilters();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF VendNoFilter <> '' THEN
          SETFILTER("Vendor No.",VendNoFilter)
        ELSE
        #4..12
        END ELSE
          SETRANGE("Item No.");

        CheckFilters(DATABASE::Vendor,VendNoFilter);
        CheckFilters(DATABASE::Item,ItemNoFilter);

        CurrPage.UPDATE(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..15
        CurrPage.UPDATE(FALSE);
        */
    //end;


    //Unsupported feature: Code Modification on "VendNoFilterOnAfterValidate(PROCEDURE 19075608)".

    //procedure VendNoFilterOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Item.GET("Item No.") THEN
          CurrPage.SAVERECORD;
        SetRecFilters;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CurrPage.SAVERECORD;
        SetRecFilters;
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "VendNoFilterOnAfterValidate(PROCEDURE 19075608).Item(Variable 1000)".

}

