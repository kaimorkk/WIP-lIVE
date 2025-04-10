TableExtension 52193484 tableextension52193484 extends "Standard Customer Sales Code" 
{

    //Unsupported feature: Code Modification on "ApplyStdCodesToSalesLines(PROCEDURE 2)".

    //procedure ApplyStdCodesToSalesLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF SalesHeader."Currency Code" = '' THEN
          Currency.InitRoundingPrecision
        ELSE
        #4..52
            IF StdSalesLine.InsertLine THEN BEGIN
              SalesLine."Line No." := GetNextLineNo(SalesLine);
              SalesLine.INSERT(TRUE);
              SalesLine.AutoAsmToOrder;
              InsertExtendedText(SalesLine);
            END;
          UNTIL StdSalesLine.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..55
        #57..59
        */
    //end;
}

