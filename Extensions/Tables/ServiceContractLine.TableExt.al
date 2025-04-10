TableExtension 52193743 tableextension52193743 extends "Service Contract Line" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Service Contract Line"(Table 5964)".

    fields
    {

        //Unsupported feature: Code Modification on ""Line Value"(Field 22).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Line Value" < 0 THEN
              FIELDERROR("Line Value");

            VALIDATE("Line Discount %");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            VALIDATE("Line Discount %");
            */
        //end;
    }
}

