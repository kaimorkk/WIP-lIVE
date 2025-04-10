TableExtension 52193801 tableextension52193801 extends Bin 
{

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TESTFIELD("Location Code");
        GetLocation("Location Code");
        IF Location."Directed Put-away and Pick" THEN BEGIN
          TESTFIELD("Zone Code");
          TESTFIELD("Bin Type Code");
        END ELSE BEGIN
          TESTFIELD("Zone Code",'');
          TESTFIELD("Bin Type Code",'');
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #2..9
        */
    //end;
}

