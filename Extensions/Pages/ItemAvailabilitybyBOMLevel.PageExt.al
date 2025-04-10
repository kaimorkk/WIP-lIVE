PageExtension 52193610 pageextension52193610 extends "Item Availability by BOM Level" 
{

    //Unsupported feature: Code Modification on "RefreshPage(PROCEDURE 2)".

    //procedure RefreshPage();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Item.SETRANGE("Date Filter",0D,DemandDate);
        Item.SETFILTER("Location Filter",LocationFilter);
        Item.SETFILTER("Variant Filter",VariantFilter);
        Item.SETFILTER("No.",ItemFilter);
        CalcBOMTree.SetItemFilter(Item);

        CalcBOMTree.SetShowTotalAvailability(ShowTotalAvailability);
        CASE ShowBy OF
          ShowBy::Item:
            BEGIN
              Item.FINDFIRST;
              IF NOT Item.HasBOM THEN
                ERROR(Text000);
        #14..26

        CurrPage.UPDATE(FALSE);
        IsCalculated := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #7..10
              Item.SETRANGE("Date Filter",0D,DemandDate);
              Item.SETFILTER("Location Filter",LocationFilter);
              Item.SETFILTER("Variant Filter",VariantFilter);
              Item.SETFILTER("No.",ItemFilter);
        #11..29
        */
    //end;
}

