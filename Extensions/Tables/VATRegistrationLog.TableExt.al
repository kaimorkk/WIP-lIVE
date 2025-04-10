TableExtension 52193497 tableextension52193497 extends "VAT Registration Log" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 6)".

    }

    //Unsupported feature: Code Modification on "GetCountryCode(PROCEDURE 2)".

    //procedure GetCountryCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Country/Region Code" = '' THEN BEGIN
          IF NOT CompanyInformation.GET THEN
            EXIT('');
          EXIT(CompanyInformation."Country/Region Code");
        END;
        CountryRegion.GET("Country/Region Code");
        IF CountryRegion."EU Country/Region Code" = '' THEN
          EXIT("Country/Region Code");
        EXIT(CountryRegion."EU Country/Region Code");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        EXIT("Country/Region Code");
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "GetCountryCode(PROCEDURE 2).CountryRegion(Variable 1001)".

}

