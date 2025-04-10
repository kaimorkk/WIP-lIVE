PageExtension 52193566 pageextension52193566 extends "Opportunity Card" 
{
    layout
    {

        //Unsupported feature: Code Modification on ""Contact No."(Control 8).OnValidate".

        //trigger "(Control 8)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Contact No." <> '' THEN
              IF Contact.GET("Contact No.") THEN
                Contact.CheckIfPrivacyBlockedGeneric;
            ContactNoOnAfterValidate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ContactNoOnAfterValidate;
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Contact No." <> '' THEN
          IF Contact.GET("Contact No.") THEN
            Contact.CheckIfPrivacyBlockedGeneric;
        IF "Contact Company No." <> '' THEN
          IF Contact.GET("Contact Company No.") THEN
            Contact.CheckIfPrivacyBlockedGeneric;
        UpdateEditable;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        UpdateEditable;
        */
    //end;
}

