PageExtension 52193568 pageextension52193568 extends "Vendor Link" 
{

    //Unsupported feature: Code Modification on "OnQueryClosePage".

    //trigger OnQueryClosePage(CloseAction: Action): Boolean
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ("No." <> '') AND (CloseAction = ACTION::LookupOK) THEN BEGIN
          TESTFIELD("No.");
          ContBusRel := Rec;
          ContBusRel.INSERT(TRUE);
        #5..14
              END;
          END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF ("No." <> '') AND (CloseAction = ACTION::OK) THEN BEGIN
        #2..17
        */
    //end;
}

