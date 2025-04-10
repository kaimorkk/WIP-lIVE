PageExtension 52193601 pageextension52193601 extends "Sales Shipment Lines" 
{

    //Unsupported feature: Code Modification on "IsFirstLine(PROCEDURE 2)".

    //procedure IsFirstLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TempSalesShptLine.RESET;
        TempSalesShptLine.COPYFILTERS(Rec);
        TempSalesShptLine.SETRANGE("Document No.",DocNo);
        IF NOT TempSalesShptLine.FINDFIRST THEN BEGIN
          SalesShptLine.COPYFILTERS(Rec);
          SalesShptLine.SETRANGE("Document No.",DocNo);
          IF SalesShptLine.FINDFIRST THEN BEGIN
            TempSalesShptLine := SalesShptLine;
            TempSalesShptLine.INSERT;
          END;
        END;
        IF TempSalesShptLine."Line No." = LineNo THEN
          EXIT(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
          SalesShptLine.FINDFIRST;
          TempSalesShptLine := SalesShptLine;
          TempSalesShptLine.INSERT;
        #11..13
        */
    //end;
}

