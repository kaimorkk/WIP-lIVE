TableExtension 52193709 tableextension52193709 extends "Item Substitution" 
{

    //Unsupported feature: Code Modification on "SetDescription(PROCEDURE 8)".

    //procedure SetDescription();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Description := '';
        IF Type = 1 THEN BEGIN
          IF NonstockItem.GET(Number) THEN
            Description := NonstockItem.Description;
        END ELSE
          IF Item.GET(Number) THEN
            Description := Item.Description;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF Type = 1 THEN BEGIN
          NonstockItem.GET(Number);
          Description := NonstockItem.Description;
        END ELSE BEGIN
          Item.GET(Number);
          Description := Item.Description;
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "SetItemVariantDescription(PROCEDURE 11)".

    //procedure SetItemVariantDescription();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Description := '';
        IF Type = 1 THEN BEGIN
          IF NonstockItem.GET(Number) THEN
            Description := NonstockItem.Description;
        END ELSE BEGIN
          IF Variant <> '' THEN
            IF ItemVariant.GET(Number,Variant) THEN
              IF ItemVariant.Description <> '' THEN BEGIN
                Description := ItemVariant.Description;
                EXIT;
              END;
          IF Item.GET(Number) THEN
            Description := Item.Description;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF Type = 1 THEN BEGIN
          NonstockItem.GET(Number);
          Description := NonstockItem.Description;
        #5..11
          Item.GET(Number);
          Description := Item.Description;
        END;
        */
    //end;
}

