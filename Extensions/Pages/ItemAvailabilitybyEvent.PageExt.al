PageExtension 52193576 pageextension52193576 extends "Item Availability by Event" 
{

    //Unsupported feature: Code Modification on "Initialize(PROCEDURE 1)".

    //procedure Initialize();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Item.SETRANGE("Drop Shipment Filter",FALSE);
        CalcInventoryPageData.Initialize(Item,ForecastName,IncludeBlanketOrders,0D,IncludePlanningSuggestions);
        LastUpdateTime := CURRENTDATETIME;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CalcInventoryPageData.Initialize(Item,ForecastName,IncludeBlanketOrders,0D,IncludePlanningSuggestions);
        LastUpdateTime := CURRENTDATETIME;
        */
    //end;
}

