PageExtension 52193611 pageextension52193611 extends "BOM Cost Shares" 
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
              Item.FINDSET;
              REPEAT
                HasBOM := Item.HasBOM OR (Item."Routing No." <> '')
              UNTIL HasBOM OR (Item.NEXT = 0);
              IF NOT HasBOM THEN
                ERROR(Text000);
              CalcBOMTree.GenerateTreeForItems(Item,Rec,2);
            END;
        #15..18
        END;

        CurrPage.UPDATE(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #4..6
              Item.SETFILTER("No.",ItemFilter);
              Item.FINDFIRST;
              IF (NOT Item.HasBOM) AND (Item."Routing No." = '') THEN
        #12..21
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "RefreshPage(PROCEDURE 2).HasBOM(Variable 1001)".

}

