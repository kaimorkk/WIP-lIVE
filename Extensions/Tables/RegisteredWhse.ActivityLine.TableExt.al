TableExtension 52193716 tableextension52193716 extends "Registered Whse. Activity Line" 
{

    //Unsupported feature: Code Modification on "ShowRegisteredActivityDoc(PROCEDURE 23)".

    //procedure ShowRegisteredActivityDoc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RegisteredWhseActivHeader.SETRANGE(Type,"Activity Type");
        RegisteredWhseActivHeader.SETRANGE("No.","No.");
        RegisteredWhseActivHeader.FINDFIRST;
        CASE "Activity Type" OF
          "Activity Type"::Pick:
            BEGIN
              RegisteredPickCard.SETRECORD(RegisteredWhseActivHeader);
              RegisteredPickCard.SETTABLEVIEW(RegisteredWhseActivHeader);
              RegisteredPickCard.RUNMODAL;
            END;
          "Activity Type"::"Put-away":
            BEGIN
              RegisteredPutAwayCard.SETRECORD(RegisteredWhseActivHeader);
              RegisteredPutAwayCard.SETTABLEVIEW(RegisteredWhseActivHeader);
              RegisteredPutAwayCard.RUNMODAL;
            END;
          "Activity Type"::Movement:
            BEGIN
              RegisteredMovCard.SETRECORD(RegisteredWhseActivHeader);
              RegisteredMovCard.SETTABLEVIEW(RegisteredWhseActivHeader);
              RegisteredMovCard.RUNMODAL;
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        RegisteredWhseActivHeader.SETRANGE(Type,"Activity Type");
        RegisteredWhseActivHeader.SETRANGE("No.","No.");
        #4..6
        #8..12
        #14..18
        #20..23
        */
    //end;


    //Unsupported feature: Code Modification on "ShowWhseDoc(PROCEDURE 22)".

    //procedure ShowWhseDoc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Whse. Document Type" OF
          "Whse. Document Type"::Shipment:
            BEGIN
        #4..13
          "Whse. Document Type"::"Internal Pick":
            BEGIN
              WhseInternalPickHeader.SETRANGE("No.","Whse. Document No.");
              WhseInternalPickHeader.FINDFIRST;
              WhseInternalPickCard.SETRECORD(WhseInternalPickHeader);
              WhseInternalPickCard.SETTABLEVIEW(WhseInternalPickHeader);
              WhseInternalPickCard.RUNMODAL;
            END;
          "Whse. Document Type"::"Internal Put-away":
            BEGIN
              WhseInternalPutawayHeader.SETRANGE("No.","Whse. Document No.");
              WhseInternalPutawayHeader.FINDFIRST;
              WhseInternalPutawayCard.SETRECORD(WhseInternalPutawayHeader);
              WhseInternalPutawayCard.SETTABLEVIEW(WhseInternalPutawayHeader);
              WhseInternalPutawayCard.RUNMODAL;
            END;
        #30..40
              PAGE.RUN(PAGE::"Assembly Order",AssemblyHeader);
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..16
        #19..24
        #27..43
        */
    //end;
}

