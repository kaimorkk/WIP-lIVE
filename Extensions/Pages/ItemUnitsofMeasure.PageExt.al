PageExtension 52193575 pageextension52193575 extends "Item Units of Measure" 
{

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Item.GET("Item No.") THEN
          ItemBaseUOM := Item."Base Unit of Measure";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        Item.GET("Item No.");
        ItemBaseUOM := Item."Base Unit of Measure";
        */
    //end;
}

