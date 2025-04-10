PageExtension 52193609 pageextension52193609 extends "BOM Structure" 
{

    //Unsupported feature: Code Modification on "RefreshPage(PROCEDURE 2)".

    //procedure RefreshPage();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Item.SETFILTER("No.",ItemFilter);
        CalcBOMTree.SetItemFilter(Item);
        CASE ShowBy OF
          ShowBy::Item:
            BEGIN
              Item.FINDFIRST;
              IF (NOT Item.HasBOM) AND (Item."Routing No." = '') THEN
                ERROR(Text000);
        #9..14
        END;

        CurrPage.UPDATE(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #3..5
              Item.SETFILTER("No.",ItemFilter);
        #6..17
        */
    //end;
}

