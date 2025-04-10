TableExtension 52193498 tableextension52193498 extends "VAT Entry" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 14)".

    }

    //Unsupported feature: Code Modification on "GetUnRealizedVATPart(PROCEDURE 2)".

    //procedure GetUnRealizedVATPart();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF (Type <> 0) AND
           (Amount = 0) AND
           (Base = 0)
        #4..16
              BEGIN
                IF ABS(Full) = ABS(Paid) - ABS(SettledAmount) THEN
                  EXIT(1);
                IF Full = 0 THEN
                  EXIT(ABS(SettledAmount) / (ABS(Paid) + ABS(SettledAmount)));
                EXIT(ABS(SettledAmount) / (ABS(Full) - (ABS(Paid) - ABS(SettledAmount))));
              END;
            UnrealizedVatType::First:
        #25..49
          END;
        END ELSE
          EXIT(0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..19
        #22..52
        */
    //end;
}

